function J1=opt_ss1(z)

K5=1;
initpt=[z];
LB=zeros(1,11);
options = optimset('Display', 'off') ;
LB=zeros(1,11);
[xopt,J1,exitflag,output]=fmincon(@ss1_obj,initpt,[],[],[],[],LB,[],@ss1_con,options);

    function obj=ss1_obj(x)
        obj=sum((z-x).^2);
        
    end

    function [cineq,ceq]=ss1_con(x)
        
        
        f1=x(1)+x(4)-3;
        f5=K5*x(2)*x(4)-x(1)*x(5);
        
        ceq=[f1,f5];
        cineq=[];
        
    end


end