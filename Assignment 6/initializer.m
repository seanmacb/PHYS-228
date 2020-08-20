function [T,r,n] = initializer(dx,length)
n = length/dx;
T = zeros(n,n);
r = zeros(n,n);

T(1:end,1) = 20;
T(1:end,end) = 20;
T(1,1:end) = 20;
T(end,1:end) = 20;

for i=1:n
    for j=1:n
        if ((i-n/2)^2+(j-n/2)^2)<(n/4)^2
            T(i,j) = 100;
        end
    end
end
end

