
FREQUENCIES VARIABLES=uscitorres
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(uscitorres=1).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES= Race Gender Ethnicity
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(uscitorres=1 & TooFast<.1).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY SexualOrientationRecode.
SPLIT FILE LAYERED BY SexualOrientationRecode.

T-TEST PAIRS=StraightGayBIATGood WITH StraightGayBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

split file off.

SORT CASES  BY SexualOrientationRecode.
SPLIT FILE LAYERED BY SexualOrientationRecode.

DESCRIPTIVES VARIABLES=StraightGayExp
  /STATISTICS=MEAN STDDEV MIN MAX.

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=StraightGayExp
  /CRITERIA=CI(.95).

DESCRIPTIVES VARIABLES=ThermDiff
  /STATISTICS=MEAN STDDEV MIN MAX.

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=ThermDiff
  /CRITERIA=CI(.95).

split file off.

CORRELATIONS
  /VARIABLES=StraightGayExp ThermDiff StraightGayBIATGood StraightGayBIATBad 
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
COMPUTE filter_$=(uscitorres=1 & TooFast<.1 & StraightGayExp > -100 & StraightGayBIATGood > -100 & StraightGayBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=StraightGayExp StraightGayBIATGood StraightGayBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.407 0.251 0.383 888 
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
COMPUTE filter_$=(uscitorres=1 & TooFast<.1 & TempGay > -100 & StraightGayBIATGood > -100 & StraightGayBIATBad >-100).
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
-0.250 -0.161 0.384 887 
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
COMPUTE filter_$=(uscitorres=1 & TooFast<.1 & TempStraight > -100 & StraightGayBIATGood > -100 & StraightGayBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=TempStraight StraightGayBIATGood StraightGayBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.223 0.149 0.381 886 
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
COMPUTE filter_$=(uscitorres=1 & TooFast<.1 & Conservatism > -100 & StraightGayBIATGood > -100 & StraightGayBIATBad >-100).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=Conservatism StraightGayBIATGood StraightGayBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.345 0.254 0.374 860 
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

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER StraightGayBIATGood StraightGayBIATBad.

SORT CASES  BY SexualOrientationRecode.
SPLIT FILE LAYERED BY SexualOrientationRecode.

CORRELATIONS
  /VARIABLES=Conservatism StraightGayBIATGood StraightGayBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER StraightGayBIATGood StraightGayBIATBad.

split file off.

**** Anova Analysis

USE ALL.
COMPUTE filter_$=(uscitorres=1 & TooFast<.1 & (SexualOrientationRecode=1 OR SexualOrientationRecode=2)).
VARIABLE LABELS filter_$ 'us=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM StraightGayBIATGood StraightGayBIATBad BY SexualOrientation
  /WSFACTOR=BIATType 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(SexualOrientation*BIATType)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(SexualOrientation) 
  /EMMEANS=TABLES(BIATType) 
  /EMMEANS=TABLES(SexualOrientation*BIATType) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BIATType 
  /DESIGN=SexualOrientation.
