t = 0:0.00001:5;
q0 = 500*10^-9;
R = 1000;
C = 100*10^-9;
tau = 100*10^-6;
tp = 100*10^-6; %Vin time period

%  Vin = @(t) 2.5;
% Vin = @(t) 2.5*exp(-(t^2)/tau); %exp
% Vin = @(t) 5*sin((2*pi*t)/tp); %sine
% Vin = @(t) 5*sign(cos((2*pi*t)/tp)); %square
Vin = @(t) 10*(2*floor(t/tp)-floor(2*t/tp))+5; %square
% Vin = @(t) 5*2*((t/tp)-floor(0.5+(t/tp))); %sawtooth

[t,q]=ode45(@rhs, t, q0);

plot(t,q);
xlabel('t'); ylabel('q');

    function dxdt=rhs(t,q)
        dxdt = ((10*(2*floor(t/100*10^-6)-floor(2*t/100*10^-6))+5) - q/100*10^-9)/1000;
    end