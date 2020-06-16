init=imread('C:\Users\10079\Desktop\EA3206BF3D7FDDFD6A4ACB2B4AA0AE99.jpg');  %����ͼƬ
G=rgb2gray(init);%ת���ɻҶ�ͼ
subplot(521) ,  imshow(init),  title('ԭͼ');
subplot(522) ,  imshow(G),  title('ԭ�Ҷ�ͼ');
%radon�任ʵ��ͼ�����  
E=edge(G);  
theta=1:180;  
[R,xp]=radon(E,theta);  
[E,J]=find(R>=max(max(R)));%��¼�Ƕ�  
Q=90-J;  %�����б��
I=imrotate(G,Q,'bilinear','crop');  %��ת����
subplot(512) ,  imshow(I),  title('�������ͼ��');
%otsu��ֵ�ָ�
bw=graythresh(I); %�Զ���ȡ������ֵ
new=im2bw(I,bw);%������ֵ�ָ�
subplot(513) ,  imshow(new),  title('�ָ������ͼ��')
%�����㽵��
newI = bwmorph(new,'close');
subplot(514) ,imshow(newI),title('�����㽵����ͼ��');
%ͼ�����&�������
newII = I;
I3(:,:,1)=I;
I3(:,:,2)=I;
I3(:,:,3)=I;
count=0;
for i = 1:400
    for j = 1:800
        if(newI(i,j)==0)
            newII(i,j) = 0; %���м��ȱ���ֱ�ɴ���ɫ
        end
        if(I(i,j)-newII(i,j)~=0) %�ı�ֵ�Ĳ��־����м��ȱ
            count=count+1;    %�Բ�ȱ���м���������ͱ��Ϊ��ɫ
            I3(i,j,1)=255;
            I3(i,j,2)=0;
            I3(i,j,3)=0;
        end
    end
end
mianji =count ;
subplot(515),imshow(I3),title('�ָ����ӵ�ԭͼ');
%����ȱ�����
%���ͼ��
imwrite(newI,'�ָ�.jpg');
imwrite(I3,'�ָ����ӵ�ԭͼ.jpg');