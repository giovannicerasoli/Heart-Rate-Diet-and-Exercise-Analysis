proc import out=pulse(rename=Var1=id rename=Var2=diet rename=Var3=exertype rename=Var4=pulse rename=Var5=time)
datafile = "C:/Users/giova/Giogiò/Universita/Modelli Lineari/pulse_diet_exertype.txt"
dbms=tab replace;
datarow=2; getnames=no;
run;

/*Dataset in formato multivariato*/
data pulse1;
set pulse;
if time = 1;
rename pulse = pulse1;
drop time;
run;

data pulse2;
set pulse;
if time = 2;
rename pulse = pulse2;
drop time;
run;

data pulse3;
set pulse;
if time = 3;
rename pulse = pulse3;
drop time;
run;

data pulse30;
merge pulse1 pulse2 pulse3;
by id;
run;

/*Frequenze di diet ed exertype*/
proc freq data = pulse30;
tables diet exertype;
run;

/*Scatterplot*/
symbol1 c=red v=dot; symbol2 c=blue v=dot;
proc gplot data = pulse30;
 plot pulse1*pulse2 = diet;
run;

proc gplot data = pulse30;
 plot pulse1*pulse3 = diet;
run;

proc gplot data = pulse30;
 plot pulse3*pulse2 = diet;
run;

symbol3 c=green v=dot;
proc gplot data = pulse30;
 plot pulse1*pulse2 = exertype;
run;

proc gplot data = pulse30;
 plot pulse1*pulse3 = exertype;
run;

proc gplot data = pulse30;
 plot pulse3*pulse2 = exertype;
run;

proc means data = pulse30;
 var pulse1 pulse2 pulse3; run;

/*Boxplot*/
ods graphics on;
axis2 order = (80 to 150 by 5) ;

proc sort data = pulse30;
by diet;
run;
proc boxplot data = pulse30;
plot pulse1*diet/boxstyle = schematicid vaxis=axis2;
plot pulse2*diet/boxstyle = schematicid vaxis=axis2;
plot pulse3*diet/boxstyle = schematicid vaxis=axis2;
run;

proc sort data = pulse30;
by exertype;
run;
proc boxplot data = pulse30;
plot pulse1*exertype/boxstyle = schematicid vaxis=axis2;
plot pulse2*exertype/boxstyle = schematicid vaxis=axis2;
plot pulse3*exertype/boxstyle = schematicid vaxis=axis2;
run;

/*Matrice di correlazione*/
proc corr data=pulse30 pearson nosimple noprob plots=none;
   var pulse1 pulse2 pulse3;
run;

/*Modelli lineari multivariati di misure ripetute*/
proc glm data=pulse30;
class diet exertype;
model pulse1 pulse2 pulse3 = diet exertype;
repeated pulse 3 profile / summary printm printh printe;
run; quit;

