function [J_ineq,J_eq]=sys_con(z)

%constraints are evaluated as the ability of subsystem optimizers to meet
%targets
J1_res=opt_ss1(z);
J2_res=opt_ss2(z);

%system-level constraints are also considered:
g1=1.0-z(1);
g2=1.0-z(2);


J_ineq=[J1_res,J2_res,g1,g2];
J_eq=[];

end