# task_ChairCheck
* A team task in course. Chair Check is used to find some feedback in the chair pictures.
* 一个课堂上的小组作业。座椅检测程序用于找出图片中座椅的瑕疵。
---
## Basic Thought
* * 提取图像的深度信息
* * 合成近似的曲面
* * 而与曲面不拟合的部分为褶皱、鼓包、断裂等
* * 对图像进行颜色调整，使近似色在一定阈值上被放大，查出染色的问题
* 以上通过尝试，应该是失败了
* 新思路
* * 把褶皱切出来
* * 进行正负样本训练
* * 图片中标记
* * 把标记的各区域求和
* * 输出报告文件