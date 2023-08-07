function d = disteu(x, y)

[M1, N] = size(x);
[M2, P] = size(y); 
if (M1 ~= M2)
    error('音频维数不匹配！')
end

d = zeros(N, P);
if (N < P)
    copies = zeros(1,P);
    for n = 1:N
        d(n,:) = sum((x(:, n+copies) - y) .^2, 1);
    end
else
    copies = zeros(1,N);
    for p = 1:P
        d(:,p) = sum((x - y(:, p+copies)) .^2, 1)';
    end              %成对欧氏距离的两个矩阵的列之间的距离
end

d = d.^0.5;