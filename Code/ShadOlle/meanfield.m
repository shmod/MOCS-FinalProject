N = 100;
a = 0.5;
b = 4;
c = 1;
P = zeros(1,101);
for l = 0:1:100
    x = l/100;
    P(l+1) = x*(1-x)*(a*(b-c)*x-c*(1-x)-x*b)
    X(l+1) = x + P(l+1);

end
plot((0:1:100)/100,P, 'LineWidth', 2);
hold on