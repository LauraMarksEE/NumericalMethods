ti = 0; qi = 500*10^-9;
h = 0.000001; tf = 1*10^-3;

R = 1000;
C = 100*10^-9;
tau = 100*10^-6;
tp = 100*10^-2; %Vin time period

% Vin = @(t) 2.5;
% Vin = @(t) 2.5*exp(-(t^2)/tau); %exp
% Vin = @(t) 5*sin((2*pi*t)/tp); %sine
% Vin = @(t) 5*sign(cos((2*pi*t)/tp)); %square
Vin = @(t) 10*(2*floor(t/tp)-floor(2*t/tp))+5; %square
% Vin = @(t) 5*2*((t/tp)-floor(0.5+(t/tp))); %sawtooth

func = @(t, q) (1/R)*(Vin(t) - (1/C)*q);

[tt, qq] = RK2_func(func, ti, qi, h, tf);

qq;

% EXACT SOLUTIONS:------------------------
% syms q(t);
% ode = R*diff(q,t) + q/C == Vin(t);
% cond = q(0) == qi;
% qSol(t) = dsolve(ode, cond);

syms t;
f = exp(t/(R*C))*5*sin((2*pi*t)/tp)
F = int(f, t)
exact = 1/(exp(t/R*C)) * F
%------------------------------------------

% PLOTTING --------------------------------
fplot(Vin, [0 tf], '-');
hold on;

plot(tt,qq/C, 'r-');
hold on;

plot(tt, exact(tt)/C, 'r-.');

title('Vin');
xlabel('Time/s')
ylabel('V_o/V')
legend('Vin', 'Runge-Kutta Method', 'Exact Values');

%print -depsc VinH7
% --------------------------------------------
