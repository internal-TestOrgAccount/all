ods graphics off;
/* regression analysis by using dummy variables */
 
/* same analysis by using the CLASS statement */
proc glm data=Patients;
   class sex BP_Status;              /* generates dummy variables internally */
   model Cholesterol = Sex BP_Status / solution;
   ods select ParameterEstimates;
quit;

data Patients;
   keep Cholesterol Sex BP_Status;
   set sashelp.heart;
   if 18 <= _N_ <= 28;
run;

proc print;  var Cholesterol Sex BP_Status;  run;

proc print;  var Cholesterol Sex BP_Status;  run;

proc glmmod data=Patients outdesign=GLMDesign outparm=GLMParm NOPRINT;
   class sex BP_Status;
   model Cholesterol = Sex BP_Status;
run;
 
proc print data=GLMDesign1; run;
proc print data=GLMParm; run;