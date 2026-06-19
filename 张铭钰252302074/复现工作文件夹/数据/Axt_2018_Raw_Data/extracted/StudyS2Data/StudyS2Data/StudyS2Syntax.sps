
USE ALL.
COMPUTE filter_$=(ExcludeGood=0 AND ExcludeBad=0).
VARIABLE LABELS filter_$ 'ExcludeGood=0 AND ExcludeBad=0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM BIATGood BIATBad BY Condition
  /WSFACTOR=BIATType 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BIATType 
  /DESIGN=Condition.

SORT CASES  BY Condition.
SPLIT FILE LAYERED BY Condition.

T-TEST PAIRS=BIATGood WITH BIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

split file off.

CORRELATIONS
  /VARIABLES=BIATGood BIATBad FeelPref
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.
