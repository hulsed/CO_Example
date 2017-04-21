
z10=0;
z20=0;
x_com0=-1;
initpt=[z10,z20,x_com0];

objective=@sys_obj;
constraint=@sys_con;


[z,fval,exitflag,output]=fmincon(objective,initpt,[],[],[],[],[],[],constraint)