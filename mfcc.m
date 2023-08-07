function c = mfcc(s, fs)

M = 100;                        %֡�����
N = 256;                        %256�������㹹��һ֡
len = length(s);
numberOfFrames = 1 + floor((len - N)/double(M)); %��-�޷���ȡ��
mat = zeros(N, numberOfFrames); 

for i=1:numberOfFrames
    index = 100*(i-1) + 1;
    for j=1:N
        mat(j,i) = s(index);
        index = index + 1;
    end
end

hamW = hamming(N);              %��hamming����������������˺��Ҷ˵�������
afterWinMat = diag(hamW)*mat;   
freqDomMat = fft(afterWinMat);   %���źŽ��п��ٸ���Ҷ�任FFT

filterBankMat = melFilterBank(20, N, fs); %����������Ƶ��ͨ��MelƵ���˲�����õ�MelƵ��,�����ڽ���ת���ɶ���Ƶ��
nby2 = 1 + floor(N/2);
ms = filterBankMat*abs(freqDomMat(1:nby2,:)).^2; %÷������
c = dct(log(ms));                                %÷������ϵ��
c(1,:) = [];                                     %�ų�0�׵���ϵ��