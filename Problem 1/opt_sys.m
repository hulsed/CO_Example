%initial points for system variables. 
%in this problem these variables are z1c, z2c, and bc
z1c0=10;
z2c0=5;
bc0=5;
initpt=[z1c0,z2c0,bc0];

objective=@sys_obj;
constraint=@sys_con;

options=optimoptions('fmincon','Display','iter','Algorithm','interior-point')

[z,fval,exitflag,output]=fmincon(objective,initpt,[],[],[],[],[],[],constraint, options)