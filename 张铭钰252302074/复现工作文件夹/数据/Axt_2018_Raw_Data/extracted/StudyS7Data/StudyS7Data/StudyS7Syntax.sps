**Comparing BIAT Scores Against Zero And With Each Other

USE ALL.
COMPUTE filter_$=(TooFast<.1 & BabyAdultBIATGood > -100 & BabyAdultBIATBad> -100 & BabyAdultExp>-100).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

DESCRIPTIVES VARIABLES=BabyAdultBIATGood BabyAdultBIATBad
  /STATISTICS=MEAN STDDEV MIN MAX.

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=BabyAdultBIATGood BabyAdultBIATBad BabyAdultExp
  /CRITERIA=CI(.95).

T-TEST PAIRS=BabyAdultBIATGood WITH BabyAdultBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


***Comparing Correlations With Explicit Preferences

USE ALL.
COMPUTE filter_$=(TooFast<.1 & BabyAdultBIATGood > -100 & BabyAdultBIATBad> -100 & BabyAdultExp>-100).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=BabyAdultBIATGood BabyAdultBIATBad BabyAdultExp
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT BabyAdultExp
  /METHOD=ENTER BabyAdultBIATGood BabyAdultBIATBad.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.229 0.000 0.098 231 
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
