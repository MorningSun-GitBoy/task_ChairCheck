import cv2 as cv 
import matplotlib.pyplot as plt 

img_L = cv.imread("IMG_20171206_143323.jpg",0)
img_R = cv.imread("IMG_20171206_143323.jpg",0)
 
#stereo = cv.StereoBM(cv.STEREO_BM_BASIC_PRESET,ndisparities=16, SADWindowSize=15)
stereo = cv.createStereoBM(numDisparities=16, blockSize=15)  #OpenCV 3.0的函数
disparity = stereo.compute(img_L, img_R)
 
plt.subplot(121),plt.imshow(img_L,'gray'),plt.title('img_left'),plt.xticks([]),plt.yticks([])
plt.subplot(122),plt.imshow(disparity,'gray'),plt.title('disparity'),plt.xticks([]),plt.yticks([])
