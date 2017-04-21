
z10=4;
z20=2;
x_com0=5;
initpt=[z10,z20,x_com0];

objective=@sys_obj;
constraint=@sys_con;

options=optimoptions('fmincon','Display','iter','Algorithm','active-set')

[z,fval,exitflag,output]=fmincon(objective,initpt,[],[],[],[],[],[],constraint, options)