function [x1,obj_res]=opt_ss1(x1_cop,x2_cop, beta)

x0=[1];
options = optimset('Display', 'off') ;
[x_res,obj_res,exitflag, output]=fmincon(@objective,x0,[],[],[],[],[],[],@constraint,options);

x1=x_res(1);


    function obj=objective(x)
        obj=ss1_obj(x(1),x2_cop);

    end

    function [con,ceq]=constraint(x)
        
        con=ss1_con(x(1),x2_cop,x1_cop,beta);
        ceq=[];
    end

end

