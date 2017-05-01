function [x2,obj_res]=opt_ss2(x1_cop,x2_cop, beta)

x0=[1];
options = optimset('Display', 'off') ;
[x_res,obj_res,exitflag, output]=fmincon(@objective,x0,[],[],[],[],[],[],@constraint,options);

x2=x_res(1);


    function obj=objective(x)

        obj=ss2_obj(x(1),x1_cop);

    end

    function [con,ceq]=constraint(x)
        
        con=ss2_con(x(1),x1_cop,beta);
        ceq=[];
    end

end
