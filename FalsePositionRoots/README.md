#### False Posistion Roots "False Position"
Uses the false position bracketing to approximate the root (zero) of a given function.

##### Input Variables
NOTE - use ".^" for all exponentiation in function
* f = the function being evaluated
* xl = the lower bound
* xu = the upper bound 
* *es = the desired relative error (default is 0.0001%)
* *maxiter = the number of iterations desired (default is 200)

 *optional variables

##### Output Variables
* root = the estimated root 
* fx = the function evaluated at the root location
* ea = the approximate relative error
* iter = how many iterations were performed

##### Reminder
The function evaluated at your inputted bound points MUST have different signs (one positive and one negative).
ex: f(xl) = 1       f(xu) = -1
