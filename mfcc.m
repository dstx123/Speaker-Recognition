function c = mfcc(s, fs)

M = 100;                        %帧间距离
N = 256;                        %256个采样点构成一帧
len = length(s);
numberOfFrames = 1 + floor((len - N)/double(M)); %沿-∞方向取整
mat = zeros(N, numberOfFrames); 

for i=1:numberOfFrames
    index = 100*(i-1) + 1;
    for j=1:N
        mat(j,i) = s(index);
        index = index + 1;
    end
end

hamW = hamming(N);              %加hamming窗，以增加音框左端和右端的连续性
afterWinMat = diag(hamW)*mat;   
freqDomMat = fft(afterWinMat);   %对信号进行快速傅里叶变换FFT

filterBankMat = melFilterBank(20, N, fs); %将上述线性频谱通过Mel频率滤波器组得到Mel频谱,下面在将其转化成对数频谱
nby2 = 1 + floor(N/2);
ms = filterBankMat*abs(freqDomMat(1:nby2,:)).^2; %梅尔倒谱
c = dct(log(ms));                                %梅尔倒谱系数
c(1,:) = [];                                     %排除0阶倒谱系数