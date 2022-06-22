function [y] = Recover(a,P)
    num = size(P,1);
    y = 0;
    if num<a(2)
        tip = "ÈËÊý²»×ã»Ö¸´"
    else
        syms x;
        for i = 1:num
            s = P(i,2);
            for j = 1:num               
                if(i ~= j)
                    s = s * (x - P(j,1))/ ( P(i,1) - P(j,1) );
                end            
            end
           y = y + s;
        end
%         y = add_s(1) * ( (x-P(2)) * (x-P(3)) ) / ( (P(1)-P(2)) * (P(1)-P(3)) ) + ...
%              add_s(3) * ( (x-P(1)) * (x-P(3)) ) / ( (P(2)-P(1)) * (P(2)-P(3)) ) + ...
%              add_s(5) * ( (x-P(1)) * (x-P(2)) ) / ( (P(3)-P(1)) * (P(3)-P(2)) )
    end
    y = expand(y);
end