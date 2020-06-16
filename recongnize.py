import cv2
import os

def classify(src,classifier):
    gray=cv2.cvtColor(src,cv2.COLOR_BGR2GRAY)
    obj = classifier.detectMultiScale(gray,scaleFactor = 1.15, minNeighbors = 5,minSize=(20,20),maxSize=(60,60)) 
    for (x,y,w,h) in obj:
        cv2.rectangle(src,(x,y),(x+w,y+w),(255,0,0),2) #画框，（x,y）为识别物体的左上角顶点，（w，h）为宽和高
    return src
def main(dir):
    global classer,rdir
    path = os.listdir(dir)
    for subpath in path:
        subpath = os.path.join(dir,subpath)
#        print(subpath)
        if os.path.isdir(subpath):
            main(subpath)
        if os.path.isfile(subpath):
            img = cv2.imread(subpath)
            res = classify(img,classer)
            cv2.imwrite(rdir+os.path.basename(subpath).split(".",2)[0]+".jpg",res)
classer = cv2.CascadeClassifier(":/DATA/Workspace/Python/task_ChairCheck/cascade.xml")
rdir = "D:/DATA/Workspace/Python/task_ChairCheck/result"
main("D:/DATA/Workspace/Python/task_ChairCheck/graph")
