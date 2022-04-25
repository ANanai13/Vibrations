function xdot = beating(t, x) %numerical Solution
    xdot = zeros (2, 1);
    xdot(1) = x(2);
    xdot(2) = cos(2*t)-3*x(1);

    %{
run in command window:

figure
t0 = 0;
tf = 100;
x0 = [2 0];
[t,x] = ode45('beating', [t0 tf], x0);
plot(t,x)
title('beating excitation')
xlabel('time(t)')
ylabel('displacement(x)')
legend('displacement', 'velocity')
    %}

end

