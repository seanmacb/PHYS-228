function [Tnew,R] = Jacobi(T,R,n,dx,length)
Told = initializer(dx,length);
Tnew = Told;
while true
    for i=2:n-1
        for j = 2:n-1
            R(i,j) = (Told(i-1,j)+Told(i+1,j)+Told(i,j-1)+Told(i,j+1)-4*Told(i,j))/dx^2;
            if Told(i,j) ~=100
                Tnew(i,j) = (Told(i-1,j)+Told(i+1,j)+Told(i,j-1)+Told(i,j+1))/4;
            end
        end
    end
    
    Told = Tnew;
    
    error = 0;
    for k=1:n
        for l=1:n
            if abs(R(k,l))<0.002
                error = error+1;
            end
        end 
    end
if error>n^2-1
    break
end

end