function [xx, yy] = RK2(func, xi, yi, h, xf)

    N = round((xf-xi)/h);
    yy = zeros(1,N); xx = zeros(1,N);
    
    a=1; b=0; q=1; p=1; %heun
    %a=1/2; b=1/2; p=1; q=1; %Midpoint
    %a=0; b=1; p=1/2; q=1/2; %The other one
    
    yy(1) = yi; xx(1) = xi;
    
    for i=1:N-1
        k1 = feval(func, xx(i), yy(i));
        k2 = feval(func, (xx(i)+p*h), (yy(i)+q*k1*h));
        yy(i+1) = yy(i) + h*(a*k1 + b*k2);
        xx(i+1) = xx(i) + h;
    end
end