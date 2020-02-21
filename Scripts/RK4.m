function [xx, yy, zz] = RK4(func_y, func_z, xi, yi, zi, h ,xf)

   N = round((xf-xi)/h);
   yy = zeros(1,N); 
   xx = zeros(1,N);
   zz = zeros(1,N);
 
   yy(1) = yi; xx(1) = xi; zz(1) = zi;
    
   for i=1:N-1
      k1 = feval(func_y, xx(i), yy(i), zz(i));
      l1 = feval(func_z, xx(i), yy(i), zz(i));
      
      k2 = feval(func_y, (xx(i)+(h/2)), (yy(i) + (k1*h/2)), (zz(i) + (1/2)*l1));
      l2 = feval(func_z, (xx(i)+(h/2)), (yy(i) + (k1*h/2)), (zz(i) + (1/2)*l1));
      
      k3 = feval(func_y, (xx(i)+(h/2)), (yy(i) + (k2*h/2)), (zz(i) + (1/2)*l2));
      l3 = feval(func_z, (xx(i)+(h/2)), (yy(i) + (k2*h/2)), (zz(i) + (1/2)*l2));
     
      k4 = feval(func_y,(xx(i)+h), (yy(i) +  k3*h), (zz(i) + h*l3);
      l4 = feval(func_z,(xx(i)+h), (yy(i) +  k3*h), (zz(i) + h*l3);
      
      yy(i+1) = yy(i) + h((1/6)*(k1 + k4) + (1/3)*(k2 + k3));
      zz(i+1) = zz(i) + h((1/6)*(l1 + l4) + (1/3)*(l2 + l3));
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      xx(i+1) = xx(i) + h;
   end
end
   