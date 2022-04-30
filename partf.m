function xdot = partf(t, x) %numerical Solution
    xdot = zeros (2, 1);
    xdot(1) = x(2);
    step = zeros(size(t));
    step(t>=0 + (3)) = 1;
    xdot(2) = -3*x(1)+step.*5+sin(t)+cos(t-2*pi);


    %analytical Solution

    m=1000;       
    k=3000;      
    c=0;       
    x0=2;        
    v0=0;    
    t=0:0.001:20;
    F = step + sin(t) + cos(t-2*pi);
    onet = zeros(size(t));
    onet(t>=0 + (3)) = 1;

    x1      = onet.*((5/3)-(5/3).*cos(sqrt(3).*(t-3)));
    x2      = (1/2).*(sin(t)-(1/sqrt(3)).*sin(sqrt(3).*t)+cos(t)-cos(sqrt(3).*t));
    x3      = 2*cos(sqrt(3).*t);
    x       = x1 + x2 + x3;

    plot(t,x,'b');
    hold on
    yline(0)

    %{
figure
t0 = 0;
tf = 20;
x0 = [2 0];
[t,x] = ode45('partf', [t0 tf], x0);
plot(t,x)
title('part f')
xlabel('time(t)')
ylabel('displacement(x)')
legend('displacement', 'velocity')
    %}

end
