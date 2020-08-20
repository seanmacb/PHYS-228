function [A,B,A0] = fourier(data,N)
A0 = 0;
for k = 1:N/2
    A(k) = 0;
    B(k) = 0;
    for i = 1:N
        A(k) = A(k)+(2/N).*data(i)*cos(2*pi*k*i/N);
        B(k) = B(k)+(2/N).*data(i)*sin(2*pi*k*i/N);
        A0 = A0+(1/N)*data(i);
    end
end
end

