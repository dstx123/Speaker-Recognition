%可调参数
testdir = 'C:\Users\user\Desktop\基于梅尔频率倒谱系数的声纹识别\test\';  %测试样本的路径
traindir = 'C:\Users\user\Desktop\基于梅尔频率倒谱系数的声纹识别\train\';  %训练样本的路径  
n = 7;                   %待训练样本数量
distmin = 4;  %阈值
%------------------------------------------------------
%读取待测音频
file = sprintf('%s1.m4a', traindir); 
[s, fs] = audioread(file);        
feature = mfcc(s, fs);            %计算待测音频的MFCC特征值
%训练样本
code = train(traindir, n);        

num = 0;
for len = 1:length(code)      % 计算每个样本失真度
    d = disteu(feature, code{len}); 
    dist = sum(min(d,[],2)) / size(d,1);
    
    msg = sprintf("对比训练音频%d，待测音频失真度为%f",len,dist);
    disp(msg);
    
    if dist < distmin %将总失真最小的VQ码本对应的音频识别为输入音频
        distmin = dist;
        num = len;
    end      
end
if num == 0
    msg = sprintf('没有与测试样本符合的语音！');
    disp(msg);
else
    msg = sprintf('测试样本与第%d个语音符合', num);
    disp(msg);
end