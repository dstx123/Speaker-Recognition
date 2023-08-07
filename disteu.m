function d = disteu(x, y)

[M1, N] = size(x);
[M2, P] = size(y); 
if (M1 ~= M2)
    error('��Ƶά����ƥ�䣡')
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
    end              %�ɶ�ŷ�Ͼ���������������֮��ľ���
end

d = d.^0.5;