
% testing the time series of each month seperatly
% this code is to test for either upward or downward trend (a two-tailed test) at "alpha" level of significance
% norminv function is used to find Z statiscts at alpha level of significance. The value out of function is compared with the examples
% in Gilbert book and the one reported in litirature. 

% Kendall Trend testing on each season seperatly with Z value fixed
% import the data (values of the same month over the years)
M=Feb;   
n=length(M)
% set the significant level 
alpha = 0.01    %99 comfidence
%alpha = 0.05   %95 comfidence
%alpha=0.1      %90 comfidence
%alpha=0.2      %80 confidence
i=0; j=0; S=0;
for i=1:n-1
for j=i+1:n
S=S+sign(M(j)-M(i));
end 
end 
VarS=(n*(n-1)*(2*n+5))/18
StdS=sqrt(VarS)

if S>0 
    Z=(S-1)/StdS 
elseif S<0
    Z=(S+1)/StdS
else      %S=0 
    Z=0 
end 

% the Gilberts book table value can be found using "normcdf" function which is the normal comulitive distribution.
% here I'm using the Normal Inverse distribution function  "norminv". 
%P1=norminv(1-alpha)      %for one tailed test we compare with Z(1-alpha)                
P2=norminv(1-(alpha/2))   %for two tailed test we campare with Z(1-alpha/2) 

if Z> P2     %Z>Z(1-alpha/2) 
    disp ('Decision = H0 is rejected, there is an upward trend')
elseif Z<0 & abs(Z)> P2 % abs(Z)>Z(1-alpha/2) 
    disp ('Decision = H0 is rejected, there is a downward trend')
else Z=0
    disp ('Decision = H0 is accepted, there is no trend')
end
return 

    
