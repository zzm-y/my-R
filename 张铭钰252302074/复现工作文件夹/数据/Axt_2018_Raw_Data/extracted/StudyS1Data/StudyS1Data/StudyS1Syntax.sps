** Selecting Eligible Participants

USE ALL.
COMPUTE filter_$=(TooFastIAT<.1 & TooFastBIAT<.1).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*** Descriptives for main variables

DESCRIPTIVES VARIABLES=IATD BIATGood BIATBad ExpPref ATB
  /STATISTICS=MEAN STDDEV MIN MAX.

** Comparing between lab and online

T-TEST GROUPS=locationnum(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=IATD BIATGood BIATBad ExpPref ATB
  /CRITERIA=CI(.95).

** Correlations between IAT, Good-Focal, Bad-Focal, and Explicit Preference

CORRELATIONS
  /VARIABLES=IATD BIATGood BIATBad ExpPref
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

** Simultaneous regression predicting IAT from both BIATs

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT IATD
  /METHOD=ENTER BIATGood BIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ExpPref
  /METHOD=ENTER BIATGood BIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ATB
  /METHOD=ENTER BIATGood BIATBad.

*** Fisher's Z calculations

USE ALL.
COMPUTE filter_$=(TooFastIAT<.1 & TooFastBIAT<.1 & IATD>-100 & BIATGood>-100 & BIATBad>-100 & ExpPref>-100).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=IATD BIATGood BIATBad ExpPref
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.406 0.326 0.325 200 
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

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.259 0.284 0.325 200 
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
COMPUTE filter_$=(TooFastIAT<.1 & TooFastBIAT<.1 & IATD>-100 & BIATGood>-100 & BIATBad>-100 & ATB>-100).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=BIATGood BIATBad ATB
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
-0.348 -0.288 0.325 200 
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


