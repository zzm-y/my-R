
DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=Ethnicity Race Gender SexualOrientation
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(TooFast < .1 & SexualOrientation=1).
VARIABLE LABELS filter_$ 'toofast<.1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=StraightGayBIATGood WITH StraightGayBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=StraightGayExp
  /CRITERIA=CI(.95).

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=ThermDiff
  /CRITERIA=CI(.95).


USE ALL.
COMPUTE filter_$=(TooFast<.1).
VARIABLE LABELS filter_$ 'toofast<.1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=StraightGayBIATGood StraightGayBIATBad StraightGayExp
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT StraightGayExp
  /METHOD=ENTER StraightGayBIATGood StraightGayBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT TempGay
  /METHOD=ENTER StraightGayBIATGood StraightGayBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT TempStraight
  /METHOD=ENTER StraightGayBIATGood StraightGayBIATBad.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & StraightGayExp > -100 & StraightGayBIATGood > -100 & StraightGayBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=StraightGayExp StraightGayBIATGood StraightGayBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

** Williams' T Calculation

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.372 0.148 0.342 233 
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
COMPUTE filter_$=(TooFast<.1 & TempGay > -100 & StraightGayBIATGood > -100 & StraightGayBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=TempGay StraightGayBIATGood StraightGayBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
-0.200 -0.13 0.342 233 
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
COMPUTE filter_$=(TooFast<.1 & TempStraight > -100 & StraightGayBIATGood > -100 & StraightGayBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=TempStraight StraightGayBIATGood StraightGayBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

** Williams' T Calculation

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.11 0.093 0.342 233 
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
COMPUTE filter_$=(TooFast < .1 & (SexualOrientation=2 OR SexualOrientation=3 OR SexualOrientation=4 OR SexualOrientation=5)).
VARIABLE LABELS filter_$ 'toofast<.1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=StraightGayBIATGood WITH StraightGayBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=StraightGayExp
  /CRITERIA=CI(.95).


