function [C] = CalculateCMatrix(a,coef_H)
C = zeros(a(1),a(1));
for i = 1:a(1)
    for j = 1:a(1)
        C(i,j) = coef_H(i,1) * j^2 + coef_H(i,2) * j + coef_H(i,3);
    end
end
end

