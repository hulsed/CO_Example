function J2_res=opt_ss1(z1,z2, x_com)

func=@objective;
con=@constraint;
b0=[1,x_com];
options = optimset('Display', 'off') ;
[b2_res,J2_res,exitflag, output]=fmincon(func,b0,[],[],[],[],[],[],con,options);


    function obj=objective(b2)
        obj=ss2_obj(b2, z1,z2, x_com);       
    end
    function [con,ceq]=constraint(b2)
        con=ss2_con(b2, z1);
        ceq=[];
    end
end