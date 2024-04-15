function cobweb(x0, tol, a, b, n)
    %function cobweb(x0,tol,a,b,n)
    %   x0: start value of Х
    %   tol: difference between neighbours values 
    %   a: left edge of Х
    %   b: right edge of Х
    %   n: count of intermediate values of Х between a and b
    %
    %  Example: cobweb(0.001,1e-20,0,1,100)
 
    format compact
    xx = linspace(a, b, n);
    cub = @(x) 4*x.*(1+x);     
    w = cub(xx);
    yy = xx;
    figure(1);
    hold on
    set(gca, 'DefaultLineLineWidth', 1)
    set(gca, 'FontSize', 13)
    xlabel('X(n)')
    ylabel('X(n+1)')
    plot(xx, w, xx, yy)
    plot(xx, xx*0, 'k')
    plot(xx*0, xx, 'k')
    i = 1;
    x(i) = x0;
    x(i+1) = cub(x(i));
    plot([x(i), x(i)], [0, x(i+1)], 'r')
    fprintf('x(%d)=%1.20f\n', i, x(i));
    while (((abs(x(i+1)-x(i))>tol && abs(x(i+1))<3) || i<5) && min(abs(x(end)-x(1:end-1)))>tol)
        i=i+1;
        x(i+1) = cub(x(i));
        plot([x(i-1), x(i)],[x(i), x(i)],'r')
        plot([x(i), x(i)], [x(i), x(i+1)], 'r')
        fprintf('x(%d)=%1.20f\n', i, x(i));
        axis auto
        break
    end
