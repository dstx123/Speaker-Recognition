function codebk = vqCodeBook(d, k)
%矢量量化特征匹配   LBG-VQ算法
e = 0.001;                                 % 阈值
codebk = mean(d, 2);                        % 码书
distortion = int32(inf);                    % 失真度
numOfCentroids = int32(log2(k));            % 质心数

for i=1:numOfCentroids
    codebk = [codebk*(1+e), codebk*(1-e)];  % 划分
    while(1==1)
        dis = disteu(d, codebk);            % 计算数据离划分质心的距离
        [~,ind] = min(dis, [], 2);          % 取最小距离
        t = 0;
        lim = 2^i;
        for j=1:lim
            codebk(:, j) = mean(d(:, ind==j), 2);    % 根据优化准则计算
            x = disteu(d(:, ind==j), codebk(:, j));  
            len = length(x);                       
            for q = 1:len
                t = t + x(q);
            end
        end
        if (((distortion - t)/t) < e)       % 迭代至阈值后跳出循环
            break;
        else
            distortion = t;
        end
    end
end