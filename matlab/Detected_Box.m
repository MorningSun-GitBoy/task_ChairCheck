I=imread('C:\Users\10079\Desktop\EA3206BF3D7FDDFD6A4ACB2B4AA0AE99.jpg');
I= rgb2gray(I);
I_reverse2 = 255 - I;
figure, imshow(I_reverse2);
I=im2bw(I_reverse2);  %转化成二值图
B=medfilt2(I);
BWfilt=medfilt2(BWfill) ;  %滤波
BWfilt2=medfilt2(BWfilt) ;
BWfilt3=medfilt2(BWfilt2) ;
BWfilt4=medfilt2(BWfilt3) ;
BWfilt5=medfilt2(BWfilt4) ; 
imshow(I) ;
title('二值图');
figure,subplot(1,3,1),imshow(B) ;
title('边缘检测');
subplot(1,3,2),imshow(BWfill) ;
title('填充后');
subplot(1,3,3),imshow(BWfilt5) ;
title('滤波后');