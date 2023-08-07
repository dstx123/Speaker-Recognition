function code = train(traindir, n)

k = 16;                         %�趨VQ������

for i=1:n                       
    file = sprintf('%s%d.m4a', traindir, i);           
    disp(file);
    [s, fs] = audioread(file);
    
    v = mfcc(s, fs);            %����MFCC����ֵ
   
    code{i} = vqCodeBook(v, k);      %ѵ��VQ����
end