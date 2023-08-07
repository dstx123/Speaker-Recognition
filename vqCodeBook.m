function codebk = vqCodeBook(d, k)
%ʸ����������ƥ��   LBG-VQ�㷨
e = 0.001;                                 % ��ֵ
codebk = mean(d, 2);                        % ����
distortion = int32(inf);                    % ʧ���
numOfCentroids = int32(log2(k));            % ������

for i=1:numOfCentroids
    codebk = [codebk*(1+e), codebk*(1-e)];  % ����
    while(1==1)
        dis = disteu(d, codebk);            % ���������뻮�����ĵľ���
        [~,ind] = min(dis, [], 2);          % ȡ��С����
        t = 0;
        lim = 2^i;
        for j=1:lim
            codebk(:, j) = mean(d(:, ind==j), 2);    % �����Ż�׼�����
            x = disteu(d(:, ind==j), codebk(:, j));  
            len = length(x);                       
            for q = 1:len
                t = t + x(q);
            end
        end
        if (((distortion - t)/t) < e)       % ��������ֵ������ѭ��
            break;
        else
            distortion = t;
        end
    end
end