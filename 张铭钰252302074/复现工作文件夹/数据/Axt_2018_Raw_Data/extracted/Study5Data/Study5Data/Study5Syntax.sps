
USE ALL.
COMPUTE filter_$=(Location="IS" & Sample="BGU").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=Gender
  /ORDER=ANALYSIS.


USE ALL.
COMPUTE filter_$=(Location="US" & Sample="UVA").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=Gender
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(Location="US" & Sample="PI").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=Gender
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Religion<7).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=Sample('PI' 'UVA')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewBIATGood ChristJewBIATBad ChristJewExp ChristianNeg ChristianPos JewishNeg 
    JewishPos ChristianCultWarmth JewishCultWarmth ChristJewCultPref
  /CRITERIA=CI(.95).

T-TEST GROUPS=Location('US' 'IS')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewExp ChristJewCultPref CultWarmthDifference
  /CRITERIA=CI(.95).

GLM ChristJewBIATGood ChristJewBIATBad BY Location
  /WSFACTOR=BIAT 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Location*BIAT)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Location) 
  /EMMEANS=TABLES(BIAT) 
  /EMMEANS=TABLES(Location*BIAT) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BIAT 
  /DESIGN=Location.

SORT CASES  BY Location.
SPLIT FILE LAYERED BY Location.

T-TEST PAIRS=ChristJewBIATGood WITH ChristJewBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

split file off.

T-TEST GROUPS=Location('US' 'IS')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewBIATGood ChristJewBIATBad
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Location="US" & Religion<7).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=ChristJewCultPref ChristJewBIATGood ChristJewBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Location="IS" & Religion<7).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=ChristJewCultPref ChristJewBIATGood ChristJewBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

*** Implicit-Explicit Correlations

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Religion<7).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

** Distinct Sources account

CORRELATIONS
  /VARIABLES=ChristJewExp ChristJewCultPref ChristJewBIATGood ChristJewBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ChristJewExp
  /METHOD=ENTER ChristJewBIATGood ChristJewBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ChristJewCultPref
  /METHOD=ENTER ChristJewBIATGood ChristJewBIATBad.

** Regressions within America and Israel Separately

SORT CASES  BY Location.
SPLIT FILE LAYERED BY Location.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ChristJewExp
  /METHOD=ENTER ChristJewBIATGood ChristJewBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ChristJewCultPref
  /METHOD=ENTER ChristJewBIATGood ChristJewBIATBad.

Split file off.


*** Williams' Test

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Religion<7 & ChristJewExp> -100 & ChristJewBIATGood >-100 & ChristJewBIATBad >-100).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=ChristJewExp ChristJewBIATGood ChristJewBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.330 0.169 0.351 198 
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
COMPUTE filter_$=(TooFast<.1 & Religion<7 & ChristJewCultPref > -100 & ChristJewBIATGood >-100 & ChristJewBIATBad >-100).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=ChristJewCultPref ChristJewBIATGood ChristJewBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

data list list / r12 r13 r23 (3f5.3) n (f5.0). 
begin data 
0.245 0.174 0.351 198 
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

** Re-Creatings Table 2

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Religion<7).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY Location.
SPLIT FILE LAYERED BY Location.

DESCRIPTIVES VARIABLES=ChristJewExp ChristJewCultPref JewishPos ChristianPos JewishNeg ChristianNeg 
    JewishCultWarmth ChristianCultWarmth
  /STATISTICS=MEAN STDDEV MIN MAX.

split file off.


** Re-creating online supplement table

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Religion<7).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=ChristJewBIATGood ChristJewBIATBad ChristJewExp PrefChristPos PrefChristNeg 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


