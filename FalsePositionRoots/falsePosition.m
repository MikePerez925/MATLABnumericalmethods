% Michael Perez - 02/28/19 

% NOTE - use ".^" for all exponentiation in function
% func = the function being evaluated
% xl = the lower bound
% xu = the upper bound 
% *es = the desired relative error (default is 0.0001%)
% *maxiter = the number of iterations desired (default is 200)
%[ * optional ]

%OUTPUT VARIABLES 
% root = the estimated root 
% fx = the function evaluated at the root location
% ea = the approximate relative error
% iter = how many iterations were performed
function [root,fx,ea,iter] = falsePosition(f,xl,xu,es,maxiter)

syms x
y = @(x) x;

%Test to make sure there is a root in the interval.
test = f(xl) * f(xu);
if test > 0, error('There is no sign change in this interval.'),end

%Make sure there are enough inputs and sets defult es & maxiter.
if nargin < 4 || isempty(es), es = 0.0001; end
if nargin < 5 || isempty(maxiter), maxiter = 200; end

%Defining xr as x-intercept of line between xl and xu
xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));

%Establish number of iterations
for iter = 1:1:maxiter-1
    
%Decides whether xl or xu replaces xr. 
if f(xr) * f(xl) > 0 
    xl = xr;
  elseif f(xr) * f(xu) > 0
    xu = xr;
end

%Sets up variables for next iteration.
iter = iter + 1;
xrold = xr;
xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));

%Establishing stopping criterion - ends function when reached.
if iter > 0
    ea = abs(((xr - xrold) / xr) * 100);
    if ea <= es
        break
    end
end

end

root = xr;
fx = f(xr);

%Checking to make sure root isnt an asymptote.
if f(xr) > 1000
    error('No root was found, check your interval or the root might be extraneous.')
end

%Display approximate answer, f(xr), relative error, and iterations.
fprintf(' The root of the function in this interval is %.4g. \n f(%.4g)=%g. \n The final approximate relative error was %e after %i iterations.',root,root,fx,ea,iter)

%Plot of Function
fplot(f,'r'), hold on, fplot(y(0),'c-.','LineWidth',1.5),plot(xr,f(xr),'go','MarkerSize',7),set(gca,'color',[.25,.25,.25])
xlim([xl-5 xu+5]), ylim([-2 2])
title('Root of Function'), xlabel('x'), ylabel('y'),legend('f(x)','y=0','root estimation')
end


