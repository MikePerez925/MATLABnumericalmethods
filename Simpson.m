% MICHAEL PEREZ - SIMPSON'S 1/3 W/ TRAP RULE - 04/14/19 %

% INPUT
% x = an array of equally spaced values for estimating area (more values =
% more accuracy).
% y = EITHER an array of data or a function in terms of x.
% OUTPUTS
% I = the estimated integral of the inputed data or function over the given
% range.

function I = Simpson(x,y)

%DEFINING CONSTANTS
a = x(1); sections = length(x)-1; 
b = x(sections+1); ly = length(y); 

%CHECKING FOR EQUAL SPACING OF "x"
x1 = range(x(1:end-1));
x2 = range(x(2:end));
L = x1/x2;                                                                      %if spacing is equal, x1 and x2 should be equal
if (0.999 < L) && (L< 1.11)
    L = 1;
    if L ~= 1
        error('The values of [x] must be EQUALLY SPACED.')
    end
end

%CHECKING THAT x AND y ARE THE SAME LENGTH
if length(x) ~= length(y)
    error('x and y MUST be arrays of the same length.')
end

%CHECKING IF THERE ARE AN EVEN OR ODD NUMBER OF SECTIONS
if mod(sections,2) == 0
    %IF EVEN, SOLVES WITH PURE 1/3 RULE
    if length(y) > 3                                                            %composite 1/3 simpson's rule
    i = y(2 : 2 : ly);
    y_i = sum(i);
    j = y(3 : 2 : ly-1);
    y_j = sum(j);
    sums = y(1) + (4*y_i) + (2*y_j) + y(ly);
        else
        sums = y(1) + 4*y(2) + y(ly);d                                          %regular 1/3 simpson's rule
    end
    I = ((b-a) * sums ) / (3*sections)                                          %solves for I
    
    %IF ODD, SOLVES WITH 1/3 AND ONE APPLICATION OF TRAP RULE
else
    disp('NOTE: Given your input of x, one application of the trapazoidal rule will be used on the last section.')                
    i = y(2 : 2 : ly-2);                                                        %uses 1/3 simpson's rule on all sections but the last
    y_i = sum(i);
    j = y(3 : 2 : ly-2);
    y_j = sum(j);
    sums = y(1) + (4*y_i) + (2*y_j) + y(ly);
    simpsonA = ((b-a) * sums ) / (3*sections);
    
    at = x(length(x)-1);  bt = x(length(x));                                    %defining domain for trap rule
    trapA = ((bt-at)*(y(ly-1)+y(ly))) / 2;                                      %one use of trap rule for last segment of the region
    %ADDING AREA OF 1/3 RULE AND TRAP RULE TO FIND TOTAL AREA
    I = simpsonA + trapA
    
end
end

