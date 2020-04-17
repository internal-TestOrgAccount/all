/*Only execute this code when Status_Change table has included all the period desired*/
%let sDate = "31dec2014"d;
%let eDate = "31dec2019"d;

%macro general();
	proc sql noprint;
		create table Map_EntryOrigin as
		select *, input(LocalValue,20.) as Nlocalvalue
		from DWH_BDR.MAP_EntryOrigin
	;quit;
	proc sql noprint;
		create table Map_EntryOriааgin_RIA6 as
		select localvalue, encodercode, input(LocalValue,20.) as Nlocalvalue
		from DWH_BDR.MAP_EntryOrigin
		where LocalValue in ('10001','10002','10003','10005','10006','90005','90006');
	quit;
	