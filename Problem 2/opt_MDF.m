function [z_opt,f_opt]=opt_MDF()

K8=0.1;
K10=0.1;
P=40;
R=10;
K5=1;
R=10;
P=40;
K5=1;
K6=1;
K7=1;
K9=1;
K8=0.1;
K10=0.1;

LB=[0,0,0,0,0,0,0,0,0,0,0.001];
initpt=[2,1,20,1,1,0,0,1,1,1,1]
options=optimoptions('fmincon','Display','iter', 'TolX', 1e-10,'Algorithm','sqp','MaxFunEvals',100000);

[z_opt,f_opt,exitflag,output]=fmincon(@sys_obj,initpt,[],[],[],[],LB,[],@sys_con, options);

    function obj=sys_obj(z)
        
        f2=2*z(1)+z(2)+z(4)+z(7)+z(8)+z(9)+2*z(10)-R;
        f6=K6*sqrt(z(2)*z(4))-sqrt(z(1))*z(6)*sqrt(P/z(11));
        f7=K7*sqrt(z(1)*z(2))-sqrt(z(4))*z(7)*sqrt(P/z(11));
        f9=K9*z(1)*sqrt(z(3))-z(4)*z(8)*sqrt(P/z(11));
        
        obj=f2+f6+f7+f9;
    end

    function [c_ineq, ceq]=sys_con(z)
        f3=2*z(2)+2*z(5)+z(6)+z(7)-8;
        f4=2*z(3)+z(9)-4*R;
        f11=z(11)-(z(1)+z(2)+z(3)+z(4)+z(5)+z(6)+z(7)+z(8)+z(9)+z(10));
        
        f8=K8*z(1)-z(4)*z(8)*P/z(11);
        f10=K10*z(1)^2-z(4)^2*z(10)*P/z(11);
        f1=z(1)+z(4)-3;
        f5=K5*z(2)*z(4)-z(1)*z(5);
        
        f2=2*z(1)+z(2)+z(4)+z(7)+z(8)+z(9)+2*z(10)-R;
        f6=K6*sqrt(z(2)*z(4))-sqrt(z(1))*z(6)*sqrt(P/z(11));
        f7=K7*sqrt(z(1)*z(2))-sqrt(z(4))*z(7)*sqrt(P/z(11));
        f9=K9*z(1)*sqrt(z(3))-z(4)*z(8)*sqrt(P/z(11));
        
        c_ineq(1)=-f2;
        c_ineq(2)=-f6;
        c_ineq(3)=-f7;
        c_ineq(4)=-f9;
        
        ceq=[f1,f5,f8,f10,f3,f4,f11];
        
    end


end