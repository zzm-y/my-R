Power Analysis for Axt et al. 2018
==================================

This is the power analysis used to calculate the sample size for
verification attempts made on Axt\_JournExpSocPsych\_2018\_zK2.

The following is the brief description of the statistical analysis for
the focal inferential test in SCORE and the results of that test. See
the paper itself for additional background.

-   tested for differences between good-focal and bad-focal
    multi-category implicit association tests (MC-IATs) using a series
    of independent samples t-tests

-   MC-IAT White-Black associations among black participants: good N =
    856, bad N = 751, Good-focal = −0.12 (0.60), Bad-focal = 0.16
    (0.64), t = 9.01, p &lt; .001, d \[95% CI\] = 0.45 \[0.35, 0.55\]

Effect size calculation
-----------------------

Many papers do not report an effect size, and where they are present,
there may be ambiguity about which effect size is being reported, or
conflictings between the reported test statistic and effect size. We
therefore re-calculate all effect sizes, and resolve any disagreements
in favor of the reported test statistic (e.g. ‘trusting’ the papers
report of `t` over `d`, if both were reported.)

    ###
    #### Script 1 ####
    #### between subjects t-test, homogenous variance, replication will use equal Ns; ####
    ### DO NOT use for t-tests from regressions or follow-up contrasts from ANOVAs where the error and dfs from the ANOVA are used###

    #---> RECALCULATE EFFECT SIZE

    # if you have the t-value (which is the ncp input for the ci.smd function below) - if don't have n per group, just the total N, then assume equal ns
    library(MBESS)

    d_sample <- ci.smd(ncp = 9.01, n.1 = 856, n.2 = 751, conf.level = .95)$smd

    # if you only have means and sds
    # m1 <-  
    # m2 <- 
    # sd1 <- 
    # sd2 <- 
    # n1 <- 
    # n2 <- 
    # 
    # d_sample <- (m1 - m2)/sqrt((((n1 - 1) * sd1^2) + ((n2 - 1) * sd2^2))/(n1 + n2 -2))

    original_recalculated_effect_size_type = 'd_sample'
    original_recalculated_effect_size_numeric = d_sample

    ###

Power analysis calculation
--------------------------

For all papers in SCORE, there are two power calculations used to derive
the sample sizes that will be used for RR attempts. The first is 90%
power, assuming that the true effect size is 75% of that reported in the
original study. The second is 90% power, assuming that the true effect
size is 50% of that reported in the original study.

For this paper, these calculations were conducted following the method
in `SCORE power scripts.R` for \[STATE WHICH CASE YOU ARE USING\], shown
below:

    # Remember to use set-seed if this involves any bootstrapping or other processes with randomization!
    ###
    #---> CALCULATE SAMPLE SIZES

    library(pwr)

    rr_stage1_sample_size <- ceiling(pwr.t.test(d = d_sample * .75, n = NULL, sig.level = .05, power = .9, type = 'two.sample', alternative = 'two.sided')$n) * 2 #total required sample size

    rr_stage2_sample_size <- ceiling(pwr.t.test(d = d_sample * .50, n = NULL, sig.level = .05, power = .9, type = 'two.sample', alternative = 'two.sided')$n) * 2 #total required sample size

    ###

Sample size report
------------------

For this paper, replication/reproduction will use **a sample of 372 for
stage 1 data collection**, collecting an additional 460 to reach **a
total of 832** if stage 2 data collection is conducted.

This is based on an effect size of d\_sample = 0.4504804.
