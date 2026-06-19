DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=Gender
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=RaceFocal
  /ORDER=ANALYSIS.

*** Selecting only eligible racial minority participants

USE ALL.
COMPUTE filter_$=(toofast<.1 & (RaceFocal="Hisp" OR RaceFocal="Asian" OR RaceFocal="Black")).
VARIABLE LABELS filter_$ 'toofast<.1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=ConditionNum(-1 1)
  /MISSING=ANALYSIS
  /VARIABLES=WhiteMinorityBIAT
  /CRITERIA=CI(.95).

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=WhiteMinorityExp
  /CRITERIA=CI(.95).


T-TEST GROUPS=ConditionNum(-1 1)
  /MISSING=ANALYSIS
  /VARIABLES=WhiteMinorityExp
  /CRITERIA=CI(.95).


** Selecting only eligible White participants

USE ALL.
COMPUTE filter_$=(toofast<.1 & RaceFocal="White").
VARIABLE LABELS filter_$ 'toofast<.1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

** Comparing good-focal vs bad-focal BIAT's

T-TEST GROUPS=ConditionNum(-1 1)
  /MISSING=ANALYSIS
  /VARIABLES=WhiteAsianBIAT WhiteBlackBIAT WhiteHispBIAT 
  /CRITERIA=CI(.95).

** Comparing explicit attitudes between conditions

T-TEST GROUPS=ConditionNum(-1 1)
  /MISSING=ANALYSIS
  /VARIABLES=WhiteAsianExp WhiteHispExp WhiteBlackExp
  /CRITERIA=CI(.95).

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=WhiteAsianExp WhiteBlackExp WhiteHispExp
  /CRITERIA=CI(.95).

** Correlational analyses

USE ALL.
COMPUTE filter_$=(toofast<.1).
VARIABLE LABELS filter_$ 'toofast<.1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY Condition.
SPLIT FILE LAYERED BY Condition.

CORRELATIONS
  /VARIABLES=WhiteAsianExp WhiteAsianBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=WhiteBlackExp WhiteBlackBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=WhiteHispExp WhiteHispBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

split file off.

** Simultaneous linear regressions

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteBlackExp
  /METHOD=ENTER WhiteBlackBIAT ConditionNum CondxImpWB.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteHispExp
  /METHOD=ENTER WhiteHispBIAT ConditionNum CondxImpWH.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT WhiteAsianExp
  /METHOD=ENTER WhiteAsianBIAT ConditionNum CondxImpWA.

*** Minority BIAT and explicit preference analysis

USE ALL.
COMPUTE filter_$=(toofast<.1).
VARIABLE LABELS filter_$ 'toofast<.1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=ConditionNum(-1 1)
  /MISSING=ANALYSIS
  /VARIABLES=WhiteMinorityBIAT
  /CRITERIA=CI(.95).

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=WhiteMinorityExp
  /CRITERIA=CI(.95).

T-TEST GROUPS=ConditionNum(-1 1)
  /MISSING=ANALYSIS
  /VARIABLES=WhiteMinorityExp
  /CRITERIA=CI(.95).

*** Fisher's Z analyses

USE ALL.
COMPUTE filter_$=(toofast<.1).
VARIABLE LABELS filter_$ 'toofast<.1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY Condition.
SPLIT FILE LAYERED BY Condition.

CORRELATIONS
  /VARIABLES=WhiteBlackExp WhiteBlackBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=WhiteHispExp WhiteHispBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=WhiteAsianExp WhiteAsianBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

split file off.



