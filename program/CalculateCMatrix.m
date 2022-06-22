function [s] = CalculateCMatrix(a,coef_H)

% s = zeros(a(1),a(1));
% max = size(coef_H,2);
% for i = 1:a(1)
%     for j = 1:a(1)
%        for t = 0:max-1
%             s(i,j) = s(i,j) + coef_H(i,max-t) * j^t;
%        end 
%     end  
% end

M = zeros(a(2),a(1));
m = [1:1:a(1)];
for i = a(2):-1:1
    M(i,:) = m.^(a(2)-i);
end
s = coef_H * M;


end

