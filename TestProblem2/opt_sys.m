beta=1;

x1_cop=10;
x2_cop=10;



[x1_res1,obj_res1]=opt_ss1(x1_cop,x2_cop, beta);

[x2_res2,obj_res2]=opt_ss2(x1_cop,x2_cop, beta);


%ss1 constraint cases
counter(1)=ss1_con(x1_cop,x2_cop,beta);
both(1)=ss1_con(x1_res1,x2_res2,beta);
ss1(1)=ss1_con(x1_res1,x2_cop,beta);
ss2(1)=ss1_con(x1_cop,x1_res2,beta);

%ss2 constraint cases
counter(2)=ss2_con(x1_cop,x2_cop,beta);
both(2)=ss2_con(x1_res1,x2_res2,beta);
ss1(2)=ss2_con(x1_res1,x2_cop,beta);
ss2(2)=ss2_con(x1_cop,x1_res2,beta);

%objectives
counter(3)=x1_cop^2+x2_cop^2;
both(3)=x1_res1^2+x2_res2^2;
ss1(3)=x1_res1^2+x2_cop^2;
ss2(3)=x1_cop^2+x1_res2^2;


counter
both
ss1
ss2

