function [x2] = secmet(x0,x1,funcname,tol)
    f0 = feval(funcname,x0);
    f1 = feval(funcname,x1);
    x2 = (x0*f1-x1*f0)/(f1-f0);
    f2 = feval(funcname,x2);
    x0=x1;
    f0=f1;
    x1=x2;
    f1=f2;
    while abs(f1)>tol
        x2 = (x0*f1-x1*f0)/(f1-f0);
        f2 = feval(funcname,x2);
        x0=x1;
        f0=f1;
        x1=x2;
        f1=f2;
    end
end

