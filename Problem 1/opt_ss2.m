function [J2_res]=opt_ss1(z)

func=@objective;
con=@constraint;
%variables considered at the subsystem: "local" b and znc, and relevant targets,
b0=1;
z2nc0=1;
z0=z;
x0=[b0, z2nc0, z0];

options = optimset('Display', 'off') ;
[b2_res,J2_res,exitflag, output]=fmincon(func,x0,[],[],[],[],[],[],con,options);

    function obj=objective(x2)
        %z2 is the system variables considered in this subsystem
        z2=x2(3:end);
        %objective is distance of those from targets
        obj=sum((z-z2).^2);       
    end
    function [con,ceq]=constraint(x2)
        %converting variable notation for clarity
        b2=x2(1);
        bc=x2(5);
        z1c=x2(3);
        z2nc=x2(2);
        z2c=x2(4);
        %constraints are equalities
        h1=(b2-3.0)+(bc-2.0)-0.6*z1c-z2nc;
        h2=(b2-3.0)+(bc-2.0)-0.7*z1c-z2c;
        
        con=[];
        ceq=[h1,h2];
    end
end