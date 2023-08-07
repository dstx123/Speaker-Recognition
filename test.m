%�ɵ�����
testdir = 'C:\Users\user\Desktop\����÷��Ƶ�ʵ���ϵ��������ʶ��\test\';  %����������·��
traindir = 'C:\Users\user\Desktop\����÷��Ƶ�ʵ���ϵ��������ʶ��\train\';  %ѵ��������·��  
n = 7;                   %��ѵ����������
distmin = 4;  %��ֵ
%------------------------------------------------------
%��ȡ������Ƶ
file = sprintf('%s1.m4a', traindir); 
[s, fs] = audioread(file);        
feature = mfcc(s, fs);            %���������Ƶ��MFCC����ֵ
%ѵ������
code = train(traindir, n);        

num = 0;
for len = 1:length(code)      % ����ÿ������ʧ���
    d = disteu(feature, code{len}); 
    dist = sum(min(d,[],2)) / size(d,1);
    
    msg = sprintf("�Ա�ѵ����Ƶ%d��������Ƶʧ���Ϊ%f",len,dist);
    disp(msg);
    
    if dist < distmin %����ʧ����С��VQ�뱾��Ӧ����Ƶʶ��Ϊ������Ƶ
        distmin = dist;
        num = len;
    end      
end
if num == 0
    msg = sprintf('û��������������ϵ�������');
    disp(msg);
else
    msg = sprintf('�����������%d����������', num);
    disp(msg);
end