function [J1_res]=opt_ss1(z)


func=@objective;
con=@constraint;
%variables considered at the subsystem: "local" b and znc, and relevant targets,
b0=1;
z1nc0=1;
z0=z;
x0=[b0, z1nc0, z0];

options = optimset('Display', 'off') ;
[b1_res,J1_res,exitflag, output]=fmincon(func,x0,[],[],[],[],[],[],con,options);

    function obj=objective(x1)
        %z1 is the system variables considered in this subsystem
        z1=x1(3:end);
        %objective is distance of those from targets
        obj=sum((z-z1).^2); 
    end
    function [con,ceq]=constraint(x1)
        %converting variable notation for clarity
        b1=x1(1);
        bc=x1(5);
        z2c=x1(4);
        z1nc=x1(2);
        z1c=x1(3);
        %constraints are equalities
        h1=(b1-2.5)+(bc-2.0)-0.4*z2c-z1nc;
        h2=(b1-2.5)+(bc-2.0)-0.5*z2c-z1c;
        
        con=[];
        ceq=[h1, h2];
    end

end