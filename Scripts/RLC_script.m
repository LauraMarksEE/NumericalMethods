ti = 0; qi = 500*10^-9; 
h = 0.000001; tf = 3*10^-3;
tau = 3*10^-3; freqin = 109; %5hz 

R = 250;
C = 3.5*10^-6;
L = 600*10^-3;

%Vin = @(t) 5;
 Vin = @(t) 5*exp(-t/tau);
%Vin = 5*square(1/sqfreq);
%Vin = 5*sin(2*pi/sqfreq);

%Original equation L*qc'' + R*qc' + (1/C)*qc = Vin

%Assign 
qc' = @(z) z; 
z'  = @(t, z, qc) (1/L)*(Vin(t) - R*z - (1/C)*qc);
%New equations 

[xx,yy,zz] = RK4(qc', z', ti, qi, 0, h, xf);  

qc = C*(Vin(t) - R*yy - L*zz);
Vout = R * yy;

plot(qc)
plot(Vout)