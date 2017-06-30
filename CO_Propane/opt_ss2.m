function J2=opt_ss2(z)

K8=0.1;
K10=0.1;
P=40;
initpt=[z(8),z(10)];
options = optimset('Display', 'off') ;
[xopt,J2,exitflag,output]=fmincon(@ss2_obj,initpt,[],[],[],[],[],[],@ss2_con,options);

    function obj=ss2_obj(x)
        x8=x(1);
        x10=x(2);
        
        obj=(x8-z(8))^2+(x10-z(10))^2;
        
    end

    function [cineq,ceq]=ss2_con(x)
        x8=x(1);
        x10=x(2);
        
        f8=K8*z(1)-z(4)*x8*P/z(11);
        f10=K10*z(1)^2-z(4)^2*x10*P/z(11);
        
        ceq=[f8,f10];
        cineq=[];
        
    end

end