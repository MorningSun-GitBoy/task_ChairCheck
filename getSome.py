import os   
import cv2 
 
"""
# 遍历指定目录，显示目录下的所有文件名
def CropImage4File(filepath,destpath):
    pathDir =  os.listdir(filepath)    # 列出文件路径中的所有路径或文件
    for allDir in pathDir:
        child = os.path.join(filepath, allDir)
        dest = os.path.join(destpath,allDir)
        if os.path.isfile(child):
        	image = cv2.imread(child) 
            sp = image.shape            #获取图像形状：返回【行数值，列数值】列表
            sz1 = sp[0]                 #图像的高度（行 范围）
            sz2 = sp[1]                 #图像的宽度（列 范围）
            #sz3 = sp[2]                #像素值由【RGB】三原色组成
            
            #你想对文件的操作
            a=int(sz1/2-25) # x start
            b=int(sz1/2+25) # x end
            c=int(sz2/2-25) # y start
            d=int(sz2/2+25) # y end
            cropImg = image[a:b,c:d]   #裁剪图像
            cv2.imwrite(dest,cropImg)"""
def CropImage50(image,lX,lY,out):
    a=int(X) # x start
    b=int(lX+50) # x end
    c=int(lY) # y start
    d=int(lY+50) # y end
    cropImg = image[a:b,c:d]   #裁剪图像
    cv2.imwrite(out,cropImg)
def onmouse(event, x, y, flags, param):   #标准鼠标交互函数
    global X,Y
    if event==cv2.EVENT_MOUSEMOVE:      #当鼠标移动时
    #print(img[y,x])           #显示鼠标所在像素的数值，注意像素表示方法和坐标位置的不同
        X = y
        Y = x
def main():
    global X,Y
    src = input("请输入文件位置")
    img= cv2.imread(src)          #定义图片位置
    img= cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)  #转化为灰度图
    src = src.split(".",2)[0]
    cv2.namedWindow("img",0)          #构建窗口
    cv2.resizeWindow("img", 400, 480)
    cv2.setMouseCallback("img", onmouse)   #回调绑定窗口
    count = 0
    while True:               #无限循环
        cv2.imshow("img",img)        #显示图像
        if cv2.waitKey() == ord('q'):
            break  #按下‘q'键，退出
        if cv2.waitKey() == ord('s'):
            print(count)
            count = int(count)
            count += 1
            print(count)
            CropImage50(img,X,Y,src+str(count)+".jpg")
    cv2.destroyAllWindows()         #关闭窗口
X = 0
Y = 0
if __name__ == '__main__':          #运行
  main()