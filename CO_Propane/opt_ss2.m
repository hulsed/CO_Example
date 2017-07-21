function J2=opt_ss2(z)

K8=0.1;
K10=0.1;
P=40;
initpt=[z];
LB=zeros(1,11);
options = optimset('Display', 'off') ;
[xopt,J2,exitflag,output]=fmincon(@ss2_obj,initpt,[],[],[],[],LB,[],@ss2_con,options);

    function obj=ss2_obj(x)
        obj=sum((z-x).^2);
        
    end

    function [cineq,ceq]=ss2_con(x)
        x8=x(1);
        x10=x(2);
        
        f8=K8*x(1)-x(4)*x(8)*P/x(11);
        f10=K10*x(1)^2-x(4)^2*x(10)*P/x(11);
        
        ceq=[f8,f10];
        cineq=[];
        
    end

end