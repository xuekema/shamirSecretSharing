function [s] = Sharing(a,b)
%����ַ���ÿ���˵���Կ
poly_num = size(b,1);%����ʽ����
s = zeros(a(1),poly_num);
max = size(b,2);%ÿ������ʽ����
for x = 1:a(1)
    for i = 1:poly_num
        for j = 0:max-1
            s(x,i) = s(x,i) + b(i,max-j) * x^j;
        end
%     s(x,1) = b(1,1) * x^2 + b(1,2) * x + b(1,3);
%     s(x,2) = b(2,1) * x^2 + b(2,2) * x + b(2,3);
    end
end
