clear
X1=imread('C:\Users\10079\Desktop\EA3206BF3D7FDDFD6A4ACB2B4AA0AE99.jpg'); 
%X1=im2bw(X1);
  X1=rgb2gray(X1);

X2=imread('C:\Users\10079\Desktop\EA3206BF3D7FDDFD6A4ACB2B4AA0AE99 - ����.jpg'); 
 X2=rgb2gray(X2);
%X2=im2bw(X2);

% PQ=X1-X2;

%subplot(1,3,3)
% figure;imshow(PQ);
% title('����');
%X1=im2bw(I_reverse2);  %ת���ɶ�ֵͼ

%X1=im2bw(X1);
%��ȡͼ��ߴ�
 [m,n]=size(X1);
 figure;
 imshow(X1);
 title('ԭʼ1');
%��ͼ�����
 Xnoised1=imnoise(X1,'speckle',0.01); 
%�������ͼ��
 subplot(121); 
 imshow(Xnoised1);
 title('�����1');
%DCT�任
Y1=dct2(Xnoised1); 
I1=zeros(m,n);
%��Ƶ����
I1(1:m/3,1:n/3)=1; 
Ydct1=Y1.*I1;
%��DCT�任
Y1=uint8(idct2(Ydct1)); 
%������
subplot(122);
imshow(Y1);
title('�����1');
% image = imread('1.jpg');%��ȡָ��λ�õ�ͼ��
% image = rgb2gray(image);%��ԭͼת��Ϊ�Ҷ�ͼ
% figure,imshow(image);%��ʾͼƬ
 
[row,col] = size(Y1);%������image���и�ֵΪrow,�и�ֵΪcol
 
grayNum = zeros(1,256); %����1��256�е��������ڴ��[0;255]�����ظ���
  
% ��¼�Ҷ�ֵΪimage(i,j)���ظ���
for i=1:row
    for j=1:col
            grayNum(Y1(i,j)+1) = grayNum(Y1(i,j)+1)+1;%��������Ǵ�1��256����image(i,j)�ķ�Χ��0��255����Ҫ+1
    end
end
 
%���Ҷ�ֱ��ͼ�������±�[1,256]���Ҷ�ֵ��ӳ�䵽[0,255]
figure,
bar(0:255,grayNum,'grouped');%��һ������Ϊ���ᣨ���Ҷ�ֵ�����ڶ�������Ϊ���ᣨ��������������Ϊֱ��ͼ����

[ G,gabout ] = gaborfilter(Y1,2,4,6,pi/10);
J = fft2(gabout);  %���˲����ͼ����fft�任�����ٸ���Ҷ�����任��Ƶ��
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
for i=1:256   %ͼ��ľ�ֵ���ԱȶȺ���
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
title('ԭʼprewitt1 Edge');

sobelBW21=edge(Y1,'sobel');
figure;
imshow(sobelBW21);
title('�����Sobel1 Edge');

prewittBW31=edge(Y1,'prewitt');
figure;
imshow(prewittBW31);
title('�����prewitt1 Edge');

%  X2=imread('C:\Users\10079\Desktop\EA3206BF3D7FDDFD6A4ACB2B4AA0AE99 - ����.jpg'); 
%  X2=rgb2gray(X2);

%��ȡͼ��ߴ�
% [m,n]=size(X2);
% figure;
% imshow(X2);
% % title('ԭʼ2');
%��ͼ�����
% Xnoised2=imnoise(X2,'speckle',0.01);
%�������ͼ��
% subplot(121); 
% imshow(Xnoised2);
% title('�����2');
%DCT�任
% Y2=dct2(Xnoised2); 
% I2=zeros(m,n);
%��Ƶ����
% I2(1:m/3,1:n/3)=1; 
% Ydct2=Y2.*I2;
%��DCT�任
% Y2=uint8(idct2(Ydct2)); 
%������
% subplot(122);
% imshow(Y2);
% title('�����2');


% I_reverse22 = 255 - Y2;
% figure, imshow(I_reverse22);
% %  Y2=im2bw(I_reverse22);
% imshow(Y2);

% prewittBW12=edge(X2,'prewitt');
% figure;
% imshow(prewittBW12);
% title('ԭʼprewitt2 Edge');

%sobelBW22=edge(Y2,'sobel');
%figure;
%imshow(sobelBW22);
%title('�����Sobel2 Edge');

% prewittBW32=edge(Y2,'prewitt');
% figure;
% imshow(prewittBW32);
% title('�����prewitt2 Edge');

% prewittBW32=edge(Y2,'prewitt');
% figure;
% imshow(prewittBW32);
% title('�����prewitt2 Edge');
%PQ=imlincomb(1,prewittBW12,-1,prewittBW11,0);
%subplot(1,3,3),imshow(PQ);
% PQ=Y1-Y2;
%subplot(1,3,3),
% figure;imshow(PQ);
% % title('����');




