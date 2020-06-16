function [ G,gabout ] = gaborfilter(I,Sx,Sy,f,theta)
% gaborfilter���壬IΪ����ͼ��Sx��Sy�Ǳ�����x��y��仯�ķ�Χ����ѡ����gaborС�����ڵĴ�С
% fΪ���Һ�����Ƶ�ʣ�thetaΪgabor�˲����ķ���GΪgabor�˲�����g(x,y)��gaboutΪgabor�˲����ͼ��
if isa(I,'double')~=1
    I = double(I);
end
for x = -fix(Sx):fix(Sx)
    for y=-fix(Sy):fix(Sy)
        xp = x * cos(theta) + y * sin(theta);
        yp = y * cos(theta) - x*sin(theta);
        G(fix(Sx)+x+1,fix(Sy)+y+1) = exp(-.5*((xp/Sx)^2+(yp/Sy)^2))*cos(2*pi*f*xp);
    end
end
Imgabout = conv2(I,double(imag(G)),'same');
Regabout = conv2(I,double(real(G)),'same');
gabout = sqrt(Imgabout.*Imgabout+Regabout.*Regabout);  %gaborС���任���ͼ��gabout
end

