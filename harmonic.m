function xdot = harmonic(t, x) %numerical Solution
    xdot = zeros (2, 1);
    xdot(1) = x(2);
    xdot(2) = cos(sqrt(3).*t)-3*x(1);

    %{
run in command window:

figure
t0 = 0;
tf = 20;
x0 = [2 0];
[t,x] = ode45('harmonic', [t0 tf], x0);
plot(t,x)
title('harmonic excitation')
xlabel('time(t)')
ylabel('displacement(x)')
legend('displacement', 'velocity')
    %}

end