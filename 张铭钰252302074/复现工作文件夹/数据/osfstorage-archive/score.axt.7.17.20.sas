
libname score 'C:\Users\Smith-User\Downloads\colin.axtreplicationscore(1)'; run;

PROC IMPORT OUT= score.EXPLICIT
            DATAFILE= "C:\Users\Smith-User\Downloads\colin.axtreplicationscore(1)\TEST.[explicit].txt"
                        DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

PROC IMPORT OUT= score.IAT
            DATAFILE= "C:\Users\Smith-User\Downloads\colin.axtreplicationscore(1)\TEST.[iat].txt"
                        DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

PROC IMPORT OUT= score.COND
            DATAFILE= "C:\Users\Smith-User\Downloads\colin.axtreplicationscore(1)\TEST.[sessionTasks].txt"
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

PROC IMPORT OUT= score.ID
            DATAFILE= "C:\Users\Smith-User\Downloads\colin.axtreplicationscore(1)\TEST.[sessions].txt"
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

PROC IMPORT OUT= score.DEMOS
            DATAFILE= "C:\Users\Smith-User\Downloads\colin.axtreplicationscore(1)\TEST.[demographics].txt"
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

proc sort data = score.iat; by _session_id; run;
proc sort data = score.explicit; by _session_id; run;
proc sort data = score.cond; by session_id; run;
proc sort data = score.ID; by _user_id; run;
proc sort data = score.demos; by _user_id; run;

data score.cond; set score.cond;
_session_id = session_id * 1; drop session_id; run; 

data score.id; set score.id;
_session_id = session_id; drop session_id; keep _session_id _user_id _session_status; run;

data score.raw; set score.iat;
if _task_name notin ('mciatgood','mciatbad') then delete; run;

proc sort data = score.raw; by block_number; run;

/*This drops the practice blocks*/
data score.raw; set score.raw;
if block_number in ('1', '2') then delete; run;

/*This flags latencies that are too fast*/
/*I found a discrepancy between the paper and the SPSS file in that the paper says <300ms is too fast, whereas the SPSS file uses <400ms*/
/*We preregistered based on the paper; here we do it both ways*/
data score.raw; set score.raw; if _trial_latency < 400 then toofast400 = 1; else toofast400 = 0; run;
data score.raw; set score.raw; if _trial_latency < 300 then toofast300 = 1; else toofast300 = 0; run;
data score.raw; set score.raw; if _trial_latency < 400 then setlat = 400; else if _trial_latency > 2000 then setlat = 2000; else setlat = _trial_latency; run; 

proc sort data=score.raw; by _session_id; run;

data score.raw; set score.raw;
trial_error = _trial_error * 1; run;

/*This part selects only the central claim*/
data score.mciatblack; set score.raw; if _block_pairing_definition notin ('White people+Good<>Black People', 'Black People+Good<>White people',
'White people+Bad<>Black People', 'Black People+Bad<>White people') then delete; run;

data score.mciatblackgood; set score.mciatblack; 
if _block_pairing_definition notin ('Black People+Good<>White people') then delete; run;
proc means data=score.mciatblackgood noprint; by _session_id; var setlat;
        output out=score.blackgoodmean (drop=_TYPE_ _FREQ_) mean=blackgoodmean; run;	

data score.mciatwhitegood; set score.mciatblack; 
if _block_pairing_definition notin ('White people+Good<>Black People') then delete; run;
proc means data=score.mciatwhitegood noprint; by _session_id; var setlat;
        output out=score.whitegoodmean (drop=_TYPE_ _FREQ_) mean=whitegoodmean; run;	

data score.mciatwhitebad; set score.mciatblack; 
if _block_pairing_definition notin ('White people+Bad<>Black People') then delete; run;
proc means data=score.mciatwhitebad noprint; by _session_id; var setlat;
        output out=score.whitebadmean (drop=_TYPE_ _FREQ_) mean=whitebadmean; run;	

data score.mciatblackbad; set score.mciatblack; 
if _block_pairing_definition notin ('Black People+Bad<>White people') then delete; run;
proc means data=score.mciatblackbad noprint; by _session_id; var setlat;
        output out=score.blackbadmean (drop=_TYPE_ _FREQ_) mean=blackbadmean; run;	

proc means data=score.mciatblack noprint; by _session_id; var setlat;
        output out=score.devs (drop=_TYPE_ _FREQ_) std=allstd; run;	

proc sort data = score.mciat; by _session_id _block_pairing_definition; run;

proc means data=score.mciatblack noprint; by _session_id; var toofast300;
        output out=score.droptoofast300 (drop=_TYPE_ _FREQ_) mean=fastmean300; run;	
proc means data=score.mciatblack noprint; by _session_id; var toofast400;
        output out=score.droptoofast400 (drop=_TYPE_ _FREQ_) mean=fastmean400; run;	

data score.mciatscores; merge score.devs score.blackgoodmean score.whitegoodmean score.blackbadmean score.whitebadmean 
score.droptoofast300 score.droptoofast400; by _session_id; run;

/*Need to score the two IATs (direction indicated in paper)
Then need to get explicit atts (find info from Dashboard materials)
Then set up tests and label them*/
/*Need to download new data after actually doing one (especially giving answers to explicit*/

data score.mciatscores; set score.mciatscores; 
mciatgood = (blackgoodmean - whitegoodmean)/allstd;
mciatbad = (whitebadmean - blackbadmean)/allstd; run;

data score.exp; set score.explicit; if _question_name notin ('explicit2') then delete; run;

data score.exp; set score.exp; if _question_response in ('-999') then _question_response = ''; run;
data score.exp; set score.exp; if _question_response in ('null') then _question_response = ''; run;
data score.exp; set score.exp; response = _question_response * 1; drop _question_response _questionnaire_name; run;

/*Bringing in DEMOS*/
proc sort data = score.demos; by _user_id; run;
proc transpose data=score.demos out=score.demostranspose; by _user_id; id characteristic; var _value; run;

proc sort data = score.id; by _user_id; run;
data score.demostranspose; merge score.id score.demostranspose; by _user_id; run;

proc sort data = score.demostranspose; by _session_id; run;

data score.demostranspose; set score.demostranspose;
if _session_id in ('.') then delete; run;

data score.all; merge score.mciatscores score.exp score.demostranpose; run;
data score.all; set score.all; drop task_number _attempt _question_name _study_name _question_number zipcode; run;

/*This scales explicit from 1 to 7 to -3 to +3*/
data score.all; set score.all; bwexplicit = response - 4; drop response; run;

/*This drop data for people who made more than 10% of responses too fast - according to two different rule; see above*/
data score.all; set score.all; if fastmean300 > .1 then mciatbad = .; run;
data score.all; set score.all; if fastmean300 > .1 then mciatgood = .; run;
data score.all; set score.all; if fastmean400 > .1 then mciatbad = .; run;
data score.all; set score.all; if fastmean400 > .1 then mciatgood = .; run;

/*Deletes participants who are underage*/
data score.keep; set score.all; age = 2020 - birthyear; run;
data score.keep; set score.all; if age < 18 then delete; run;


