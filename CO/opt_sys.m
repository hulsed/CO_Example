
z10=20;
z20=30;
x_com0=5;
initpt=[z10,z20,x_com0];

objective=@sys_obj;
constraint=@sys_con;

options=optimoptions('fmincon','Display','iter','Algorithm','interior-point')
%note: sqp and active-set approach do not seem to work as well farther from
%the min. interior point still stalls out close to the min, perhaps due to
%the inherent ill-conditioning of CO?

[z,fval,exitflag,output]=fmincon(objective,initpt,[],[],[],[],[],[],constraint, options)