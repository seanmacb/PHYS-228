function [x2] = bisect(x0,x1,funcname,tol)
f0 = feval(funcname,x0);
f1 = feval(funcname,x1);
if f0*f1 < 1
    x2 = (x1+x0)/2;
    f2 = feval(funcname,x2);
    if f1*f2>0;
        x1 = x2;
    else;
        x0 = x2;
    end
    while abs(f2) > tol;
        x2 = (x1+x0)/2;
        f2 = feval(funcname,x2);
        if f1*f2>0;
            x1 = x2;
        else;
            x0 = x2;
        end
    end
else
    x2 = NaN;
end
end