% Kendall Trend testing on each season seperatly 
M=PureGroudwater;
n=length(M) % this is the number of time periods, needed to calculate N (the number of data pairs= the number of slop estimates).   
% Since we have only one point in each time period, the total number of observations(n) = the total number of time periods

i=0; j=0; Q=0; 

for i=1:n-1
for j=i+1:n
Q=((M(j)-M(i))/(j-i));
valueofQ(i,j)=Q;
end 
end 
% since there is only one datanum in each time period then ,
N= n*(n-1)/2
 if mod(N,2) % if N mod 2 (the reminder of N/2) is nonzero, i.e. A is odd
    disp (' N is odd, Sens estimator=Q[the number below] find it from excel and calculate it manually')
    Qrank= (N+1)/2 
 else 
      disp (' N is even, Sens estimator= 0.5(Q1 + Q2)  find it from excel and calculate it manually ') 
      Q1=N/2 
      Q2=(N+2)/2      
 end
 return 
 
 % Copy "ValuesofQ" to excel sheet, replace 0 with empty cells. then find the median either:
 % 1) using median() function directly
 % 2) rearrange data from smallest to largest and find th Qrank 
 % these two should match 
 % note that if the number of N is equal in diffrent data then Qrank will
 % be the same. 