function [con1,ceq]=ss1_con(x1,x2,beta)

con1=x1+beta*x2-4.0;
ceq=[];

end