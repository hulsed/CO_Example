function obj=ss1_obj(b1, z1,z2, x_com)


z1_nc_res=(b1(1)-2.5)+(b1(2)-2.0)-0.4*z2;
z1_res=(b1(1)-2.5)+(b1(2)-2.0)-0.5*z2;

obj=(z1_res-z1).^2+(b1(2)-x_com).^2;

end