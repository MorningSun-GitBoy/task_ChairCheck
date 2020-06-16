clear
X1=imread('C:\Users\10079\Desktop\EA3206BF3D7FDDFD6A4ACB2B4AA0AE99.jpg'); 
%X1=im2bw(X1);
  X1=rgb2gray(X1);

X2=imread('C:\Users\10079\Desktop\EA3206BF3D7FDDFD6A4ACB2B4AA0AE99 - 副本.jpg'); 
 X2=rgb2gray(X2);
%X2=im2bw(X2);

% PQ=X1-X2;

%subplot(1,3,3)
% figure;imshow(PQ);
% title('做差');
%X1=im2bw(I_reverse2);  %转化成二值图

%X1=im2bw(X1);
%读取图像尺寸
 [m,n]=size(X1);
 figure;
 imshow(X1);
 title('原始1');
%给图像加噪
 Xnoised1=imnoise(X1,'speckle',0.01); 
%输出加噪图像
 subplot(121); 
 imshow(Xnoised1);
 title('加噪后1');
%DCT变换
Y1=dct2(Xnoised1); 
I1=zeros(m,n);
%高频屏蔽
I1(1:m/3,1:n/3)=1; 
Ydct1=Y1.*I1;
%逆DCT变换
Y1=uint8(idct2(Ydct1)); 
%结果输出
subplot(122);
imshow(Y1);
title('降噪后1');
% image = imread('1.jpg');%读取指定位置的图像
% image = rgb2gray(image);%将原图转化为灰度图
% figure,imshow(image);%显示图片
 
[row,col] = size(Y1);%将矩阵image的行赋值为row,列赋值为col
 
grayNum = zeros(1,256); %申明1行256列的数组用于存放[0;255]的像素个数
  
% 记录灰度值为image(i,j)像素个数
for i=1:row
    for j=1:col
            grayNum(Y1(i,j)+1) = grayNum(Y1(i,j)+1)+1;%数组的列是从1到256。而image(i,j)的范围是0到255，故要+1
    end
end
 
%画灰度直方图，将列下标[1,256]即灰度值，映射到[0,255]
figure,
bar(0:255,grayNum,'grouped');%第一个参数为横轴（即灰度值），第二个参数为纵轴（个数），第三个为直方图类型

[ G,gabout ] = gaborfilter(Y1,2,4,6,pi/10);
J = fft2(gabout);  %对滤波后的图像做fft变换（快速傅里叶），变换到频域
A = double(J);
[m,n] = size(A);
B = A;
C = zeros(m,n);
for i=1:m-1
    for j=1:n-1
        B(i,j) = A(i+1,j+1);
        C(i,j) = abs(round(A(i,j)-B(i,j)));
    end
end
h = imhist(mat2gray(C))/(m*n);
mean = 0;con=0;ent=0;
for i=1:256   %图像的均值，对比度和熵
    mean = mean+(i*h(i))/256;
    con = con+i*i*h(i);
    if(h(i)>0)
        ent = ent-h(i)*log2(h(i));
    end
end
figure;
subplot(121);imshow(Y1);
subplot(122);imshow(uint8(gabout));
mean,con,ent

figure;
subplot(221);imhist(Y1,2);
subplot(222);imhist(Y1,5);
subplot(223);imhist(Y1,10);
subplot(224);imhist(Y1);
% I_reverse21 = 255 - Y1;
% figure, imshow(I_reverse21);
% Y1=im2bw(I_reverse21);
% imshow(Y1);

prewittBW11=edge(X1,'prewitt');
figure;
imshow(prewittBW11);
title('原始prewitt1 Edge');

sobelBW21=edge(Y1,'sobel');
figure;
imshow(sobelBW21);
title('降噪后Sobel1 Edge');

prewittBW31=edge(Y1,'prewitt');
figure;
imshow(prewittBW31);
title('降噪后prewitt1 Edge');

%  X2=imread('C:\Users\10079\Desktop\EA3206BF3D7FDDFD6A4ACB2B4AA0AE99 - 副本.jpg'); 
%  X2=rgb2gray(X2);

%读取图像尺寸
% [m,n]=size(X2);
% figure;
% imshow(X2);
% % title('原始2');
%给图像加噪
% Xnoised2=imnoise(X2,'speckle',0.01);
%输出加噪图像
% subplot(121); 
% imshow(Xnoised2);
% title('加噪后2');
%DCT变换
% Y2=dct2(Xnoised2); 
% I2=zeros(m,n);
%高频屏蔽
% I2(1:m/3,1:n/3)=1; 
% Ydct2=Y2.*I2;
%逆DCT变换
% Y2=uint8(idct2(Ydct2)); 
%结果输出
% subplot(122);
% imshow(Y2);
% title('降噪后2');


% I_reverse22 = 255 - Y2;
% figure, imshow(I_reverse22);
% %  Y2=im2bw(I_reverse22);
% imshow(Y2);

% prewittBW12=edge(X2,'prewitt');
% figure;
% imshow(prewittBW12);
% title('原始prewitt2 Edge');

%sobelBW22=edge(Y2,'sobel');
%figure;
%imshow(sobelBW22);
%title('降噪后Sobel2 Edge');

% prewittBW32=edge(Y2,'prewitt');
% figure;
% imshow(prewittBW32);
% title('降噪后prewitt2 Edge');

% prewittBW32=edge(Y2,'prewitt');
% figure;
% imshow(prewittBW32);
% title('降噪后prewitt2 Edge');
%PQ=imlincomb(1,prewittBW12,-1,prewittBW11,0);
%subplot(1,3,3),imshow(PQ);
% PQ=Y1-Y2;
%subplot(1,3,3),
% figure;imshow(PQ);
% % title('做差');




