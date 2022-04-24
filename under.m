function xdot = under(t, x) %numerical Solution
    xdot = zeros (2, 1);
    xdot(1) = x(2);
    xdot(2) = -1*x(2)-3*x(1);


    %analytical Solution
    m=1000;       
    k=3000;      
    c=1000;       
    x0=2;        
    v0=0;    
    t=0:0.001:20;

    % since zeta < 1, use underdamped equation
    omega_n = sqrt(k/m); 
    zeta    = c/(2*m*omega_n); 
    omega_d = omega_n*sqrt(1-zeta^2); 
    A       = sqrt(((v0+zeta*omega_n*x0)^2+(x0*omega_d)^2)/omega_d^2); 
    phi     = atan(x0*omega_d/(v0+zeta*omega_n*x0)); 
    x       = A*exp(-zeta.*omega_n.*t).*sin(omega_d.*t+phi); 

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
[t,x] = ode45('under', [t0 tf], x0);
plot(t,x)
title('underdamped')
xlabel('time(t)')
ylabel('displacement(x)')
legend('displacement', 'velocity')
    %}

end


