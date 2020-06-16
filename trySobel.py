import cv2
import numpy as np
 
 
# step1：加载图片，转成灰度图
image = cv2.imread("D:/DATA/Workspace/Python/task_ChairCheck/graph/IMG_20171206_143323.jpg")
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
 
# step2:用Sobel算子计算x，y方向上的梯度，之后在x方向上减去y方向上的梯度，通过这个减法，我们留下具有高水平梯度和低垂直梯度的图像区域。
gradX = cv2.Sobel(gray, cv2.CV_32F, dx=1, dy=0, ksize=-1)
gradY = cv2.Sobel(gray, cv2.CV_32F, dx=0, dy=1, ksize=-1)
 
# subtract the y-gradient from the x-gradient
gradient = cv2.subtract(gradX, gradY)
gradient = cv2.convertScaleAbs(gradient)
# show image
cv2.namedWindow("first",cv2.WINDOW_KEEPRATIO)
cv2.imshow("first", gradient)
cv2.waitKey()