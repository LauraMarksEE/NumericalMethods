%Differential eqtn
R = 1000;
C = 100E-9;
%vin = @(t) 2.5; %Voltage definition
f = @(t, qc)(2.5-(qc*(1/C)))/R; %ODE
%Runge-Kutta methods
%Heun's Method
h = 0.1; %step size
t = 0:h:3; %time interval
n = 30;
z = zeros(n,2); %nx2 vector
z(1,2) = 500e-9; %initial condition

for i = 1:(n-1)
    z(i+1,1) = z(i, 1) + h;
    
    k1 = f(z(i,1), z(i,2));
    k2 = f(z(i,1)+h, z(i,2)+k1*h);
    qc = z(i,2) + (h/2)*(k2);
    z(i+1,2) = qc;
end
%Midpoint Method
%Choice Method(Ralston?)

plot(z);