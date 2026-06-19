USE ALL.
COMPUTE filter_$=(Religion="Christian").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=Race Gender
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & Religion ="Christian").
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=Condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewBIAT ChristHinduBIAT ChristIslamBIAT 
  /CRITERIA=CI(.95).

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewExp ChristHinduExp ChristIslamExp
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=ChristJewExp ChristIslamExp ChristHinduExp
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=(TooFast<.1).
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
  /DEPENDENT ChristJewExp
  /METHOD=ENTER ConditionNum ChristJewBIAT CondxCJBIAT.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ChristHinduExp
  /METHOD=ENTER ConditionNum ChristHinduBIAT CondxCHBIAT.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ChristIslamExp
  /METHOD=ENTER ConditionNum ChristIslamBIAT CondxCIBIAT.

USE ALL.
COMPUTE filter_$=(TooFast<.1).
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

** Fisher's Z Correlations

compute z1 = .5*ln((1+.248)/(1-.248)). 
compute z2 = .5*ln((1+.138)/(1-.138)). 
compute sezdiff = sqrt(1/(198 - 3) + 1/(172-3)). 
compute ztest = (z1 - z2)/sezdiff. 
COMPUTE alpha = 2*(1 - cdf.normal(abs(ztest),0,1)). 
execute. 
formats z1 to alpha (f10.4). 
list. 

compute z1 = .5*ln((1+.334)/(1-.334)). 
compute z2 = .5*ln((1+.201)/(1-.201)). 
compute sezdiff = sqrt(1/(198 - 3) + 1/(172-3)). 
compute ztest = (z1 - z2)/sezdiff. 
COMPUTE alpha = 2*(1 - cdf.normal(abs(ztest),0,1)). 
execute. 
formats z1 to alpha (f10.4). 
list. 

compute z1 = .5*ln((1+.234)/(1-.234)). 
compute z2 = .5*ln((1+.033)/(1-.033)). 
compute sezdiff = sqrt(1/(198 - 3) + 1/(172-3)). 
compute ztest = (z1 - z2)/sezdiff. 
COMPUTE alpha = 2*(1 - cdf.normal(abs(ztest),0,1)). 
execute. 
formats z1 to alpha (f10.4). 
list. 



USE ALL.
COMPUTE filter_$=(TooFast<.1 & RelMinority=1).
VARIABLE LABELS filter_$ 'trial_error<.3  & TooFast <.2 & tooslow <.2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=Condition('good' 'bad')
  /MISSING=ANALYSIS
  /VARIABLES=RelMinBIAT
  /CRITERIA=CI(.95).

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=RelMinExp
  /CRITERIA=CI(.95).


