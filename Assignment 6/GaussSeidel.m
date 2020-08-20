function [T,R] = GaussSeidel(n,T,R,dx)
while true
    for i=2:n-1
        for j=2:n-1
            R(i,j) = (T(i-1,j)+T(i+1,j)+T(i,j-1)+T(i,j+1)-4*T(i,j))/dx^2;
            if T(i,j) ~= 100
                T(i,j) = (T(i-1,j)+T(i+1,j)+T(i,j-1)+T(i,j+1))/4;
            end
        end
    end
    error = 0;
    for k=1:n
        for l=1:n
            if abs(R(k,l))<0.002
                error = error+1;
            end
        end 
    end
if error>(n^2-1)
    break
end
end