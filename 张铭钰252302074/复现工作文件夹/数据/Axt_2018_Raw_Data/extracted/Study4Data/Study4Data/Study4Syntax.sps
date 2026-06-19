
FREQUENCIES VARIABLES=Gender Race
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(TooFast<.1).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & RaceEthCategory="Black").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=WhiteBlackBIATGood WITH WhiteBlackBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & RaceEthCategory="Hispanic").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=WhiteHispanicBIATGood WITH WhiteHispanicBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & RaceEthCategory="Asian").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=WhiteAsianBIATGood WITH WhiteAsianBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & RaceEthCategory="White").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=WhiteBlackBIATGood WITH WhiteBlackBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=WhiteHispanicBIATGood WITH WhiteHispanicBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=WhiteAsianBIATGood WITH WhiteAsianBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

**Implicit-Explicit Analyses
** Attitude Ambivalence Tests

USE ALL.
COMPUTE filter_$=(TooFast<.1 & (RaceEthCategory="Asian" OR WhiteCondition="Asian")).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhitePos PrefWhiteNeg WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PrefWhitePos
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PrefWhiteNeg
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & (RaceEthCategory="Black" OR WhiteCondition="Black")).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhitePos PrefWhiteNeg WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PrefWhitePos
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PrefWhiteNeg
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & (RaceEthCategory="Hispanic" OR WhiteCondition="Hispanic")).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhitePos PrefWhiteNeg WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PrefWhitePos
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PrefWhiteNeg
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

** Distinct Sources Tests

USE ALL.
COMPUTE filter_$=(TooFast<.1).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteAsianExp WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=WhiteBlackExp WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=WhiteHispExp WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteAsianExp
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteHispExp
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteBlackExp
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

CORRELATIONS
  /VARIABLES=WhiteAsianCultPref WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=WhiteBlackCultPref WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=WhiteHispCultPref WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteAsianCultPref
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteHispCultPref 
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteBlackCultPref 
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

*** William's T Analyses

USE ALL.
COMPUTE filter_$=(TooFast<.1 & PrefWhitePos > -100 & WhiteAsianBIATGood > -100 & WhiteAsianBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhitePos WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.276 0.069 0.203 404 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & PrefWhitePos > -100 & WhiteBlackBIATGood > -100 & WhiteBlackBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhitePos WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.283 0.278 0.351 465 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & PrefWhitePos > -100 & WhiteHispanicBIATGood > -100 & WhiteHispanicBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhitePos WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.283 0.237 0.337 438 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & PrefWhiteNeg > -100 & WhiteAsianBIATGood > -100 & WhiteAsianBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhiteNeg WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.117 0.053 0.200 405 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & PrefWhiteNeg > -100 & WhiteBlackBIATGood > -100 & WhiteBlackBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhiteNeg WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.284 0.277 0.351 465 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & PrefWhiteNeg > -100 & WhiteHispanicBIATGood > -100 & WhiteHispanicBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=PrefWhiteNeg WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.16 0.102 0.341 438 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & WhiteAsianExp > -100 & WhiteAsianBIATGood > -100 & WhiteAsianBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteAsianExp WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.293 0.204 0.207 402 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & WhiteBlackExp > -100 & WhiteBlackBIATGood > -100 & WhiteBlackBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteBlackExp WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.313 0.361 0.358 462 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & WhiteHispExp > -100 & WhiteHispanicBIATGood > -100 & WhiteHispanicBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteHispExp WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.325 0.313 0.333 436 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & WhiteAsianCultPref > -100 & WhiteAsianBIATGood > -100 & WhiteAsianBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteAsianCultPref WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
-0.104 -0.102 0.204 404 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & WhiteBlackCultPref > -100 & WhiteBlackBIATGood > -100 & WhiteBlackBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteBlackCultPref WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
-0.252 -0.233 0.354 466 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & WhiteHispCultPref > -100 & WhiteHispanicBIATGood > -100 & WhiteHispanicBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteHispCultPref WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
-0.16 -0.07 0.332 436 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.


*** Conservatism Analysis 

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Conservatism > -100 & WhiteHispanicBIATGood > -100 & WhiteHispanicBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=Conservatism WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.266 0.092 0.317 429 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Conservatism > -100 & WhiteAsianBIATGood > -100 & WhiteAsianBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=Conservatism WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.164 0.144 0.216 397 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Conservatism > -100 & WhiteBlackBIATGood > -100 & WhiteBlackBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=Conservatism WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.194 0.120 0.343 452 
end data. 
compute #R = (1 - r12**2 - r13**2 - r23**2) + 
              2*r12*r13*r23. 
compute diff = r12 - r13. 
compute t = diff * 
            SQRT( ((n-1)*(1+r23)) / 
                   (2*((n-1)/(n-3))*#R + 
                  ((r12+r13)**2/4)* 
                   (1-r23)**3) ). 
compute df = n-3. 
compute p = cdf.t(abs(t)*-1,df)*2. 
formats t p diff (f5.3) / df (f5.0). 
list r12 r13 diff t df p.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Conservatism > -100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

** Recreating Table 2

USE ALL.
COMPUTE filter_$=(TooFast<.1 & RaceEthCategory~="White").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY RaceEthCategory.
SPLIT FILE LAYERED BY RaceEthCategory.

DESCRIPTIVES VARIABLES=AsianNeg AsianPos BlackNeg BlackPos HispNeg HispPos WhiteNeg WhitePos 
    AsianCulturalWarmth BlackCulturalWarmth HispCulturalWarmth WhiteCulturalWarmth WhiteAsianCultPref 
    WhiteBlackCultPref WhiteHispCultPref WhiteAsianExp WhiteBlackExp WhiteHispExp
  /STATISTICS=MEAN STDDEV MIN MAX.

split file off.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & RaceEthCategory="White").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY WhiteCondition.
SPLIT FILE LAYERED BY WhiteCondition.

DESCRIPTIVES VARIABLES=AsianNeg AsianPos BlackNeg BlackPos HispNeg HispPos WhiteNeg WhitePos 
    AsianCulturalWarmth BlackCulturalWarmth HispCulturalWarmth WhiteCulturalWarmth WhiteAsianCultPref 
    WhiteBlackCultPref WhiteHispCultPref WhiteAsianExp WhiteBlackExp WhiteHispExp
  /STATISTICS=MEAN STDDEV MIN MAX.

** Recreating Table 3

USE ALL.
COMPUTE filter_$=(TooFast<.1 & (RaceEthCategory="Asian" OR RaceEthCategory="White")).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteAsianBIATGood WhiteAsianBIATBad WhiteAsianExp WhiteAsianCultPref 
    PrefWhitePos PrefWhiteNeg
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

split file off.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & (RaceEthCategory="Black" OR RaceEthCategory="White")).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteBlackBIATGood WhiteBlackBIATBad WhiteBlackExp WhiteBlackCultPref 
   PrefWhitePos PrefWhiteNeg
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

split file off.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & (RaceEthCategory="Hispanic" OR RaceEthCategory="White")).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=WhiteHispanicBIATGood WhiteHispanicBIATBad WhiteHispExp WhiteHispCultPref 
   PrefWhitePos PrefWhiteNeg
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

split file off.


**** Reviewer 3 Syntax***

STRING PartGroup (A10).
RECODE RaceEthCategory ('White'='White') INTO PartGroup.
RECODE RaceEthCategory ('Asian'='Non-White') INTO PartGroup.
RECODE RaceEthCategory ('Black'='Non-White') INTO PartGroup.
RECODE RaceEthCategory ('Hispanic'='Non-White') INTO PartGroup.
EXECUTE.

USE ALL.
COMPUTE filter_$=(TooFast<.1).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM GoodFocal.Majority GoodFocal.Minority BadFocal.Majority BadFocal.Minority BY PartGroup
  /WSFACTOR=BlockValence 2 Polynomial BlockGroup 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(BlockValence*BlockGroup*PartGroup BlockValence*BlockGroup)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(PartGroup) 
  /EMMEANS=TABLES(BlockValence) 
  /EMMEANS=TABLES(BlockGroup) 
  /EMMEANS=TABLES(PartGroup*BlockValence) 
  /EMMEANS=TABLES(PartGroup*BlockGroup) 
  /EMMEANS=TABLES(BlockValence*BlockGroup) 
  /EMMEANS=TABLES(PartGroup*BlockValence*BlockGroup) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BlockValence BlockGroup BlockValence*BlockGroup
  /DESIGN=PartGroup.
