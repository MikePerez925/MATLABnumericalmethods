#### Bisection Roots "bisect"
Uses the bisection bracketing method to approximate the root (zero) of a given function.

##### Inputs:
* f = the function to be evaluated
* NOTE: use ".^" for all exponentialion in the input funtion.
* (ex: f = @(x) 2*x.^2 + 3)
* xl = the lower bound
* *xu = the upper bound
* *es = the desired relative error (default is 0.0001%)

_*optional_

##### Outputs:
* root = the estimated root 
* fx = the function evaluated at the root location
* ea = the approximate relative error
* iter = how many iterations were performed
