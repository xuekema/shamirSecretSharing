%%%�˷�
%%һ������ȷ����������ֵ
 a = [5,3];
% �������ʽ�Ĳ���������ÿ������Ӧ����Կ
%coef1 = ceil(rand(2,a(2))*10)%������ɾ���ֵ
 coef1 = [2,-3,4;
          1,5,-6];%�����Զ������
 s = Sharing(a, coef1);
 mul_s = prod(s,2);
 
%%����ÿ��P�����Լ��õ���d�����Լ���n-1�ζ���ʽ�����ַ���ÿ��������
%coef_H = [ceil(rand(a(1),a(2)-1)*100),mul_s]%������ɶ���ʽϵ������
coef_H = [1,-1,mul_s(1);
          1,-10,mul_s(2);
          1,-100,mul_s(3);
          1,-200,mul_s(4);
         1,-300,mul_s(5)];%�����Զ������ʽϵ������
%����C����
CMatrix = CalculateCMatrix1(a,coef_H)

%%��������˾���ÿ����Pi�����Լ��õ���5��cji(1 <= j <= 5)
lamda = zeros(1,a(1));
M = zeros(a(1),a(1));
m = [1:1:a(1)]';
for i = 1:a(1)
    M(:,i) = m.^(i-1)
end
% M = [1,1,1,1,1; 
%     1,2,2^2,2^3,2^4; 
%     1,3,3^2,3^3,3^4; 
%     1,4,4^2,4^3,4^4; 
%     1,5,5^2,5^3,5^4];
lamda = [1,0,0,0,0] * inv(M);
%ÿ���˸����Լ��õ���Cji����Cֵ
C = lamda * CMatrix;

%%�ġ����лָ�����������1,3,5�ˣ�,�����⼸���˼���õ���Cֵ���лָ�
P = [1,3,5];
ab=0;
ab = C(P(1)) * ( (0-P(2)) * (0-P(3)) ) / ( (P(1)-P(2)) * (P(1)-P(3)) ) + ...
     C(P(2)) * ( (0-P(1)) * (0-P(3)) ) / ( (P(2)-P(1)) * (P(2)-P(3)) ) + ...
     C(P(3)) * ( (0-P(1)) * (0-P(2)) ) / ( (P(3)-P(1)) * (P(3)-P(2)) )
%�ָ�����ʽ
syms x;
y = C(P(1)) * ( (x-P(2)) * (x-P(3)) ) / ( (P(1)-P(2)) * (P(1)-P(3)) ) + ...
     C(P(2)) * ( (x-P(1)) * (x-P(3)) ) / ( (P(2)-P(1)) * (P(2)-P(3)) ) + ...
     C(P(3)) * ( (x-P(1)) * (x-P(2)) ) / ( (P(3)-P(1)) * (P(3)-P(2)) );
y = expand(y)

       