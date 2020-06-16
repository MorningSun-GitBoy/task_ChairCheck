function [ G,gabout ] = gaborfilter(I,Sx,Sy,f,theta)
% gaborfilter定义，I为输入图像，Sx、Sy是变量在x，y轴变化的范围，即选定的gabor小波窗口的大小
% f为正弦函数的频率，theta为gabor滤波器的方向。G为gabor滤波函数g(x,y)，gabout为gabor滤波后的图像
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
gabout = sqrt(Imgabout.*Imgabout+Regabout.*Regabout);  %gabor小波变换后的图像gabout
end

