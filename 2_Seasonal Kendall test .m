
% The overall Seannaual Kendall at one region, based on results of running the test on each season seperatly 
S=306;     % from excell sheet, this is the result of each month "S" Sum (we call it S')
VarS=4899.9996;    % the sum of the variations Var(S)
StdS=sqrt(VarS);
alpha = 0.01

% for the dust case S is always greater than 0, and I can calculate Z using
% Excel 
if S>0 
    Z=(S-1)/StdS 
elseif S<0
    Z=(S+1)/StdS
else      %S=0 
    Z=0 
end 

P2=norminv(1-(alpha/2))

if Z> P2      
    disp ('H0 is rejected, there is an upward trend')
elseif Z<0 & abs(Z)> P2 
    disp ('Decision =      H0 is rejected, there is a downward trend')
else Z=0
    disp ('Decision =      H0 is accepted, there is no trend')
end
return 

    
