function [J_ineq,J_eq]=sys_con(z)

z1=z(1);
z2=z(2);
x_com=z(3);

J1_res=opt_ss1(z1,z2, x_com);
J2_res=opt_ss2(z1,z2, x_com);

%J1=(z1_res-z1).^2;
%J2=(z2_res-z2).^2;

J_ineq=[J1_res,J2_res];
J_eq=[];

end