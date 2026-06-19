*** Study 9 Analysis Syntax

*** Racial Minority Participants

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1 & (Race = 5 & EthnicityBinary~=1)).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=WhiteBlackBIATGood WITH WhiteBlackBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1 & Ethnicity = 1).
VARIABLE LABELS filter_$ 'TooFast<.1 & CountryCit=1 & Race = 5 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=WhiteHispanicBIATGood WITH WhiteHispanicBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1 & (Race = 2 & EthnicityBinary~=1)).
VARIABLE LABELS filter_$ 'TooFast<.1 & CountryCit=1 & Race = 5 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=WhiteAsianBIATGood WITH WhiteAsianBIATBad (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

**** White Participants

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1 & (Race = 6 & EthnicityBinary~=1)).
VARIABLE LABELS filter_$ 'TooFast<.1 & CountryCit=1 & Race = 5 (FILTER)'.
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

*** Correlational Analyses

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

** Explicit Preference

CORRELATIONS
  /VARIABLES=ExplicitPref WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=ExplicitPref WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=ExplicitPref WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

** Conservatism

CORRELATIONS
  /VARIABLES=Conservatism WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=Conservatism WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=Conservatism WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

** Group-Based Dominance

CORRELATIONS
  /VARIABLES=GBDAgg WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=GBDAgg WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=GBDAgg WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

** Power Distance

CORRELATIONS
  /VARIABLES=PDAgg WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=PDAgg WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=PDAgg WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

** Belief in a Just World

CORRELATIONS
  /VARIABLES=BJWAgg WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=BJWAgg WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=BJWAgg WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

*** Status-Legitimizing Beliefs

CORRELATIONS
  /VARIABLES=SLBAgg WhiteHispanicBIATGood WhiteHispanicBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=SLBAgg WhiteAsianBIATGood WhiteAsianBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

CORRELATIONS
  /VARIABLES=SLBAgg WhiteBlackBIATGood WhiteBlackBIATBad
  /PRINT=TWOTAIL NOSIG
  /MISSING=LISTWISE.

*** Linear Regression Analyses

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1).
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*** Explicit Preference

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ExplicitPref
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ExplicitPref
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ExplicitPref
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

*** Conservatism

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Conservatism
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

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
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

*** Group-Based Dominance

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT GBDAgg
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT GBDAgg
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT GBDAgg
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

*** Power Distance

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PDAgg
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PDAgg
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PDAgg
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

*** Belief in a Just World

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT BJWAgg
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT BJWAgg
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT BJWAgg
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

*** Status-Legitimizing Beliefs

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT SLBAgg
  /METHOD=ENTER WhiteHispanicBIATGood WhiteHispanicBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT SLBAgg
  /METHOD=ENTER WhiteAsianBIATGood WhiteAsianBIATBad.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT SLBAgg
  /METHOD=ENTER WhiteBlackBIATGood WhiteBlackBIATBad.

**** Reviewer 3 Analysis

STRING PartGroup (A10).
RECODE Race (5='Non-White') INTO PartGroup.
RECODE Race (2='Non-White') INTO PartGroup.
RECODE Race (6='White') INTO PartGroup.
RECODE Ethnicity (1='Non-White') INTO PartGroup.
EXECUTE.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1 & (PartGroup='White' OR PartGroup='Non-White')).
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

**** ANOVA Analysis

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1 & ((Race = 2 & EthnicityBinary~=1) OR (Race = 6 & EthnicityBinary~=1))).
VARIABLE LABELS filter_$ 'TooFast<.1 & CountryCit=1 & Race = 5 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM WhiteAsianBIATGood WhiteAsianBIATBad BY PartGroup
  /WSFACTOR=BIATType 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PartGroup*BIATType)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(PartGroup) 
  /EMMEANS=TABLES(BIATType) 
  /EMMEANS=TABLES(PartGroup*BIATType) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BIATType 
  /DESIGN=PartGroup.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1 & ((Race = 5 & EthnicityBinary~=1) OR (Race = 6 & EthnicityBinary~=1))).
VARIABLE LABELS filter_$ 'TooFast<.1 & CountryCit=1 & Race = 5 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM WhiteBlackBIATGood WhiteBlackBIATBad BY PartGroup
  /WSFACTOR=BIATType 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PartGroup*BIATType)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(PartGroup) 
  /EMMEANS=TABLES(BIATType) 
  /EMMEANS=TABLES(PartGroup*BIATType) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BIATType 
  /DESIGN=PartGroup.

USE ALL.
COMPUTE filter_$=(TooFast<.1 & CountryCit=1 & ((Ethnicity=1) OR (Race = 6 & EthnicityBinary~=1))).
VARIABLE LABELS filter_$ 'TooFast<.1 & CountryCit=1 & Race = 5 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM WhiteHispanicBIATGood WhiteHispanicBIATBad BY PartGroup
  /WSFACTOR=BIATType 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(PartGroup*BIATType)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(PartGroup) 
  /EMMEANS=TABLES(BIATType) 
  /EMMEANS=TABLES(PartGroup*BIATType) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=BIATType 
  /DESIGN=PartGroup.

GLM GoodFocal.Majority GoodFocal.Minority BadFocal.Majority BadFocal.Minority BY PartGroup
  /WSFACTOR=BlockValence 2 Polynomial BlockGroup 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(BlockValence*BlockGroup*PartGroup BlockValence*BlockGroup BlockValence*PartGroup 
    BlockGroup*PartGroup)
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
