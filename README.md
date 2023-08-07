# 基于梅尔频率倒谱系数的声纹识别

运行前请先将test脚本中，如下测试集路径与训练集路径改为当前文件夹所在目录

```matlab
testdir = 'C:\Users\user\Desktop\基于梅尔频率倒谱系数的声纹识别\test\';  %测试样本的路径
traindir = 'C:\Users\user\Desktop\基于梅尔频率倒谱系数的声纹识别\train\';  %训练样本的路径
```


然后直接在命令行中执行test即可运行

注：

1. 可调参数中distmin为检测阈值，当前计算对比样本失真度低于4且最小的即为识别到的音频

2. 如需添加训练样本，请仿照train中命名规则将样本文件名改为数字并放入train文件夹中，并将test脚本中的待训练样本数量n改为相应数量

3. 另外，train函数中的质心数k与vqCodeBook函数中的阈值e也可根据需求调整