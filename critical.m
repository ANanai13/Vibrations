function xdot = critical(t, x) %numerical Solution
    xdot = zeros (2, 1);
    xdot(1) = x(2);
    xdot(2) = -2*x(2)-x(1);


    %analytical Solution
    m=500;       
    k=500;      
    c=1000;       
    x0=2;        
    v0=0;    
    t=0:0.001:20;

    % since zeta = 1, use critically damped equation
    omega_n = sqrt(k/m); 
    zeta    = c/(2*m*omega_n); 
    omega_d = omega_n*sqrt(1-zeta^2); 
    A       = sqrt(((v0+zeta*omega_n*x0)^2+(x0*omega_d)^2)/omega_d^2); 
    phi     = atan(x0*omega_d/(v0+zeta*omega_n*x0)); 
    x       = (x0+t*(v0+omega_n*x0)).*exp(-omega_n*t); 

    plot(t,x,'b','Linewidth',2);
    hold on
    yline(0)
    xlabel('Time (s)') 
    ylabel('Displacement (x)') 


        %{
figure
t0 = 0;
tf = 20;
x0 = [2 0];
[t,x] = ode45('critical', [t0 tf], x0);
plot(t,x)
title('critical damping')
xlabel('time(t)')
ylabel('displacement(x)')
legend('displacement', 'velocity')
    %}

end


