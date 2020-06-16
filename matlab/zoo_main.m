%zoo_main.m
close all;clear all;clc;
 
im1=imread('C:\Users\10079\Desktop\test1.jpg');
im2=imread('C:\Users\10079\Desktop\test2.jpg');
im1=imresize(im1,0.25);
im2=imresize(im2,0.25);
gray1=zoo_x2gray(im1);
gray2=zoo_x2gray(im2);
 
[des1,loc1]=zoo_sift(gray1);
[des2,loc2]=zoo_sift(gray2);
 
figure;zoo_drawPoints(im1,loc1,im2,loc2);
 
Num=3;Thresh=0.85;
match=zoo_BidirectionalMatch(des1,des2,Num,Thresh);
clear des1 des2
loc1=loc1(match(:,1),:);
loc2=loc2(match(:,2),:);
 
figure;zoo_linePoints(im1,loc1,im2,loc2);
 
agl=zoo_getRotAgl(loc1,loc2);
 
figure;zoo_drawRotAglHist(agl);
 
opt=zoo_optIndex(agl);
loc1=loc1(opt,:);
loc2=loc2(opt,:);
 
figure;zoo_linePoints(im1,loc1,im2,loc2);
 
T=zoo_getTransMat(gray1,loc1,gray2,loc2);
im=zoo_imRegist(im1,im2,T);
 
figure,imshow(im);
title('½á¹û'); 
