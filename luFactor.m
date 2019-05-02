% MICHAEL PEREZ - LU DECOMPOTION W/ PARTIAL PIVOTING - 03/31/19 %

% INPUT
% A = EITHER a maxtrix defined by A (A=[...]) OR the matrix itself ([...])
% OUTPUTS
% L = lower triangular matrix
% U = upper triangular matrix
% P = pivot matrix

function [L,U,P] = luFactor(A)

[r,c] = size(A);                                  %Establishing constants
column = 2;                                       %
L = eye(r); , pl = 1;                             %

%ERROR
%CHECKS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if r ~= c
    error('Matrix must have same number of rows as columns.')
end

%INITIAL PIVOT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

piv = eye(r);                                     %Define pivot matrix
col = A(:,1);                                     %Singling out first column
[~,colmax] = max(abs(col));                       %Search for largest value in first column
holder = piv(colmax,:);                           %Pivot the pivot matrix as needed
piv(colmax,:) = piv(1,:);                         %
piv(1,:) = holder;                                %
A = piv*A;                                        %Pivot [A]

%LU
%DECOMPOSITION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for z = 1:r-1                                     %Loops decomposition one less time than there are rows in [A]
    
%GAUSS
%ELIM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for row=column:r
    rat = A(row,column-1) / A(column-1,column-1); %Defining ratio
    A(row,:) = A(row,:) - (A(column-1,:)*rat);    %Subtraction
    L(row,column-1) = rat;                        %Putting ratio into [L]
    end

%PIVOT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
for k=column
        pivo=eye(r);                              %Define pivot matrix
        col = A(column:r,column);                 %Column to check values
        [~,colmax] = max(abs(col));               %Find row with greatest abs value
        pivpoint = colmax + (column-1);           %Define pivot point
    if pivpoint > column
        holder = pivo(pivpoint,:);                %Pivot as needed
        pivo(pivpoint,:) = pivo(k,:);             %
        pivo(k,:) = holder;                       %
        A = pivo*A;                               %[A] is redefined after pivot
        L = pivo*L;                               %[L] is pivoted as needed
        pl = pivo;                                %[P] is saved
    end
   column = column+1;
 end
end

for l=1:r                                         %Format [L] correctly
    L(l,l)=1;                                     %Gives [L] diagonal 1's
    zeros = triu(L,1) == 0;                       %Fills upper-right of [L] w/ 0's
end

A(A<10^-10) = 0;                                  %Sets roundoff errors to 0

L = L.*zeros;                                     %Displays final matricies
U = A;                                            %
LU = L*U;                                         % 
P = pl*piv;                                       %

end                                               

