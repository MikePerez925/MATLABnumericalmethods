%Mike Perez - MECH 105 - FEB 2019 %
%Determining elapsed days in the year.


function [dayst] = days(mo,day,leap)
% Establishing the months as an array
Months = [31 28 31 30 31 30 31 31 30 31 30 31];
% Errors for if inputs don't make sense
if leap ~= 1 && leap ~= 0
    error('Please input 1 or 0 for leap')
    elseif leap == 0 && mo == 2 && day == 29
    error('This day of the year does not exist')

end
% Summing up days of the months leading up to previous month with the days
% in the month input for normal calendar year
if leap == 0
   d1 = sum(Months(1:(mo-1)));
   dayst = d1 + day;
% Same as last step but giving February 29 days instead of 28.
elseif leap == 1
    Months(2) = 29;
     d1 = sum(Months(1:(mo-1)));
     dayst = d1 + day;
end
% Displaying answer as a sentence
fprintf(' The inputed date is the %dth day of the year. \n  ', dayst)