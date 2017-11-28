function J3=opt_ss3(z)

K8=0.1;
K10=0.1;
P=40;
R=10;
initpt=[z];
LB=zeros(1,11);
options = optimset('Display', 'off') ;
[xopt,J3,exitflag,output]=fmincon(@ss3_obj,initpt,[],[],[],[],LB,[],@ss3_con,options);

    function obj=ss3_obj(x)
        
        
        obj=sum((z-x).^2);
        
    end

    function [cineq,ceq]=ss3_con(x)
        x5=x(1);
        x9=x(2);
        x11=x(3);
        
        
        f3=2*x(2)+2*x(5)+x(6)+x(7)-8;
        f4=2*x(3)+x(9)-4*R;
        f11=x(11)-(x(1)+x(2)+x(3)+x(4)+x(5)+x(6)+x(7)+x(8)+x(9)+x(10));
        
        ceq=[f3,f4,f11];
        cineq=[];
        
    end


end