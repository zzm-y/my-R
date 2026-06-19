*** Selecting US citizens or residents with less than 10% of trials as too fast

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us")).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=Gender Race Ethnicity
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=Religion
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & Religion="Jewish").
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewBIAT
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & Religion="Hindu").
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristHinduBIAT
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & Religion="Muslim").
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristIslamBIAT
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & Religion="Christian").
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewBIAT ChristHinduBIAT ChristIslamBIAT
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & Religion="Jewish").
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewExp
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & Religion="Hindu").
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristHinduExp
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & Religion="Muslim").
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristIslamExp
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & Religion="Christian").
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewExp ChristHinduExp ChristIslamExp
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY Religion.
SPLIT FILE LAYERED BY Religion.

DESCRIPTIVES VARIABLES=ChristJewExp ChristHinduExp ChristIslamExp JewIslamExp JewHinduExp IslamHinduExp.

split file OFF.

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY condition.
SPLIT FILE LAYERED BY condition.

CORRELATIONS
  /VARIABLES=ChristJewExp ChristJewBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=ChristHinduExp ChristHinduBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=ChristIslamExp ChristIslamBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

split file off.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER ConditionNumeric ChristJewBIAT CondxCJBIAT.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER ConditionNumeric ChristHinduBIAT CondxCHBIAT.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER ConditionNumeric ChristIslamBIAT CondxCIBIAT.

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY condition.
SPLIT FILE LAYERED BY condition.

CORRELATIONS
  /VARIABLES=ChristJewExp ChristJewBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=ChristHinduExp ChristHinduBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=ChristIslamExp ChristIslamBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

split file off.

compute z1 = .5*ln((1+.316)/(1-.316)). 
compute z2 = .5*ln((1+.130)/(1-.130)). 
compute sezdiff = sqrt(1/(674 - 3) + 1/(596-3)). 
compute ztest = (z1 - z2)/sezdiff. 
COMPUTE alpha = 2*(1 - cdf.normal(abs(ztest),0,1)). 
execute. 
formats z1 to alpha (f10.4). 
list. 

compute z1 = .5*ln((1+.357)/(1-.357)). 
compute z2 = .5*ln((1+.123)/(1-.123)). 
compute sezdiff = sqrt(1/(674 - 3) + 1/(601-3)). 
compute ztest = (z1 - z2)/sezdiff. 
COMPUTE alpha = 2*(1 - cdf.normal(abs(ztest),0,1)). 
execute. 
formats z1 to alpha (f10.4). 
list. 

compute z1 = .5*ln((1+.372)/(1-.372)). 
compute z2 = .5*ln((1+.151)/(1-.151)). 
compute sezdiff = sqrt(1/(669 - 3) + 1/(571-3)). 
compute ztest = (z1 - z2)/sezdiff. 
COMPUTE alpha = 2*(1 - cdf.normal(abs(ztest),0,1)). 
execute. 
formats z1 to alpha (f10.4). 
list. 

*** Conservatism Analysis

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SORT CASES  BY condition.
SPLIT FILE LAYERED BY condition.

CORRELATIONS
  /VARIABLES=Conservatism ChristJewBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=Conservatism ChristHinduBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=Conservatism ChristIslamBIAT
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

split file off.

**** ANOVA Analysis

STRING PartGroup (A20).
RECODE Religion ('Christian'='Christian') INTO PartGroup.
RECODE Religion ('Muslim'='Non-Christian') INTO PartGroup.
RECODE Religion ('Hindu'='Non-Christian') INTO PartGroup.
RECODE Religion ('Jewish'='Non-Christian') INTO PartGroup.
EXECUTE.

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & (Religion="Jewish" OR Religion="Christian")).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

UNIANOVA ChristJewBIAT BY Condition PartGroup
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(PartGroup*Condition)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Condition) 
  /EMMEANS=TABLES(PartGroup) 
  /EMMEANS=TABLES(Condition*PartGroup) 
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=Condition PartGroup Condition*PartGroup.

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & (Religion="Hindu" OR Religion="Christian")).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

UNIANOVA ChristHinduBIAT BY Condition PartGroup
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(PartGroup*Condition)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Condition) 
  /EMMEANS=TABLES(PartGroup) 
  /EMMEANS=TABLES(Condition*PartGroup) 
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=Condition PartGroup Condition*PartGroup.

USE ALL.
COMPUTE filter_$=((citizenship="us" OR residence="us") & TooFast<.1 & (Religion="Christian" OR Religion="Muslim")).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

UNIANOVA ChristIslamBIAT BY Condition PartGroup
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(PartGroup*Condition)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Condition) 
  /EMMEANS=TABLES(PartGroup) 
  /EMMEANS=TABLES(Condition*PartGroup) 
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=Condition PartGroup Condition*PartGroup.
