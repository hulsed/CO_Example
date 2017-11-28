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

%in IDF, the functions are considered equality constraints, meaning each
%function value must also be initialized and optimized
z0=[2,1,20,1,1,0,0,1,1,1,1];
dvars=length(z0);
f0=zeros(1,11);
initpt=[z0,f0];
options=optimoptions('fmincon','Display','iter', 'TolX', 1e-10,'Algorithm','sqp','MaxFunEvals',100000);

%[z_opt,f_opt,exitflag,output]=ga(@sys_obj,length(initpt),[],[],[],[],LB,[],@sys_con);
[z_opt,f_opt,exitflag,output]=fmincon(@sys_obj,initpt,[],[],[],[],[],[],@sys_con, options);

    function obj=sys_obj(z)
        %translate variable from optimizer variable z to f for consistent notation
        f=z(dvars+1:end);
        
        obj=f(2)+f(6)+f(7)+f(9);
    end

    function [c_ineq, ceq]=sys_con(z)
        %translate variable from optimizer variable z to f for consistent notation
        f=z(dvars+1:end);
        
        %functions entered in as equality constraints
        h(1)=z(1)+z(4)-3-f(1);
        h(2)=2*z(1)+z(2)+z(4)+z(7)+z(8)+z(9)+2*z(10)-R-f(2);
        h(3)=2*z(2)+2*z(5)+z(6)+z(7)-8-f(3);
        h(4)=2*z(3)+z(9)-4*R-f(4);
        h(5)=K5*z(2)*z(4)-z(1)*z(5)-f(5);
        h(6)=K6*sqrt(z(2)*z(4))-sqrt(z(1))*z(6)*sqrt(P/z(11))-f(6);
        h(7)=K7*sqrt(z(1)*z(2))-sqrt(z(4))*z(7)*sqrt(P/z(11))-f(7);
        h(8)=K8*z(1)-z(4)*z(8)*P/z(11)-f(8);
        h(9)=K9*z(1)*sqrt(z(3))-z(4)*z(8)*sqrt(P/z(11))-f(9);
        h(10)=K10*z(1)^2-z(4)^2*z(10)*P/z(11)-f(10);
        h(11)=z(11)-(z(1)+z(2)+z(3)+z(4)+z(5)+z(6)+z(7)+z(8)+z(9)+z(10))-f(11);
        
        %given bound constraints
        LB=[0,0,0,0,0,0,0,0,0,0,0.001];
        bnd=LB-z(1:dvars);
        %inequality constraints: bounds and given inequalities
        c_ineq=[bnd,-f(2),-f(6),-f(7),-f(9)];
        %equality constraints: model and given equalities
        ceq=[h,f(1),f(5),f(8),f(10),f(3),f(4),f(11)];    
    end








end