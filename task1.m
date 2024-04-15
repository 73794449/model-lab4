X = [1:6];
L = [1:6];
L(1) = 0.001;
for i = 2:6;
    L(i) = 4.*L(i-1).*(1.+L(i-1));
end;
plot(X, L, 'X', X, L, 'R');
grid on;
