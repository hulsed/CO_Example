function obj=ss2_obj(b2, z1,z2, x_com)

z2_nc_res=(b2(1)-3.0)+(b2(2)-2.0)-0.6*z1;
z2_res=(b2(1)-3.0)+(b2(2)-2.0)-0.7*z2;

obj=(z2_res-z2).^2+(x_com-b2(2)).^2;

end