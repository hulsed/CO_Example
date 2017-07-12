function J1=opt_ss1(z)

K5=1;
initpt=[z(2),z(4)];
options = optimset('Display', 'off') ;
LB=[0,0];
[xopt,J1,exitflag,output]=fmincon(@ss1_obj,initpt,[],[],[],[],LB,[],@ss1_con,options);

    function obj=ss1_obj(x)
        x2=x(1);
        x4=x(2);
        
        obj=(x2-z(2))^2+(x4-z(4))^2;
        
    end

    function [cineq,ceq]=ss1_con(x)
        x2=x(1);
        x4=x(2);
        
        f1=z(1)+x4-3;
        f5=K5*x2*x4-z(1)*z(5);
        
        ceq=[f1,f5];
        cineq=[];
        
    end


end