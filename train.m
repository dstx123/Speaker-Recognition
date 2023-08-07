function code = train(traindir, n)

k = 16;                         %设定VQ质心数

for i=1:n                       
    file = sprintf('%s%d.m4a', traindir, i);           
    disp(file);
    [s, fs] = audioread(file);
    
    v = mfcc(s, fs);            %计算MFCC特征值
   
    code{i} = vqCodeBook(v, k);      %训练VQ码书
end