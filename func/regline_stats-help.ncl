THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Contributed/regline_stats.shtml
THE_TITLE:regline_stats
   NCL Home > Documentation > Functions > General applied math

regline_stats

   Performs simple linear regression including confidence estimates and creates an ANOVA table.

   [new.gif] Available in version 6.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function regline_stats (
                x [*] : numeric,
                y [*] : numeric
        )

        return_val [1] :  float or double

Arguments

   x

   A one dimensional array of size N containing the independent variable. Missing values, indicated by _FillValue, are
   allowed but are ignored.
   y

   A one-dimensional array of length N containing the dependent variable. Missing values, indicated by _FillValue, are
   allowed but are ignored.

Return value

   A scalar containing the calculated linear regression coefficient. In addition, many statistical quantities are returned
   as attributes of b.

   The return value will be of type double if x or y is double, and float otherwise.

Description

   regline_stats performs a simple linear regression. The calculated regresssion coefficient represents the rate of change
   in the dependent variable for a unit change in the independent variable. This coefficient is sometimes referred to as the
   slope or trend.

   The user may wish to take into account the uncertainty associated with each estimated parameter and the overall
   uncertainty. This information is returned as the attributes stderr, tval and pval. In addition, an ANalysis Of VAriance
   [ANOVA] table is returned.

   Any missing values are ignored., Missing values should be indicated by the _FillValue attribute.

   Chad Hermann created a function linreg which derived many of the same statistics. It is written entirely in NCL and is
   here.

See Also

   regline, reg_multlin, reg_multlin_stats

Examples

   Example 1

   The following example was taken from:

    Brownlee
    Statistical Theory and Methodology
    J Wiley 1965   pgs: 342-346     QA276  .B77


   The regression line information for the example below is: (a) rc=0.9746, (b) tval=38.7, (c) nptxy=18 which yields 16
   degrees of freedom (df=nptxy-2). To test the null hypothesis (i.e., rc=0) at the two-tailed 95% level, we note that t(16)
   is 2.120 (table look-up: 0.975). Clearly, the calculated t-statistic greatly exceeds 2.120 so the null hypothesis is
   rejected at the 5% level.

   load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   x  = (/ 41.9,  43.4,  43.9,  44.5,  47.3,  47.5,  47.9,  50.2,  52.8 \
           , 53.2,  56.7,  57.0,  63.5,  65.3,  71.1,  77.0,  77.8 /)

   y  = (/251.3, 251.3, 248.3, 267.5, 273.0, 276.5, 270.3, 274.9, 285.0 \
          , 290.0, 297.0, 302.5, 304.5, 309.3, 321.7, 330.7, 349.0 /)

   rc =  regline_stats(x,y) ; linear regression coef
   print(rc)


   The print(rc) yielded the following (edited) output. All the comments were manually added.

        Variable: rc
        Type: float
        Total Size: 4 bytes
                    1 values
        Number of Dimensions: 1
        Dimensions and sizes:   [1]
        Coordinates:
        Number Of Attributes: 38
          _FillValue :  9.96921e+36

          long_name :   simple linear regression
          model :       Yest = b(0) + b(1)*X

          N :   18                              ; # of observations
          NP :  1                               ; # of predictor variables
          M :   2                               ; # of returned coefficients
          bstd :        (  0, 0.9947125 )       ; standardized regression coefficient
                                                ; [ignore 1st element]

                                                ; ANOVA information: SS=>Sum of Squares
          SST : 4823324                         ; Total SS:      sum((Y-Yavg)^2)
          SSE : 50871.91                        ; Residual SS:   sum((Yest-Y)^2)
          SSR : 4772452                         ; sum((Yest-Yavg)^2)

          MST : 283724.9
          MSE : 3179.494
          MSE_dof :     16
          MSR : 4772452

          RSE : 56.387                          ; residual standard error; sqrt(MSE)
          RSE_dof :     15

          F :   1501.01                         ; MSR/MSE
          F_dof :       ( 1, 16 )
          F_pval :      1.51066e-17

          r2 :  0.989453                        ; square of the Pearson correlation coefficient
          r :   0.9947125                       ; multiple (overall) correlation: sqrt(r2)
          r2a : 0.9887938                       ; adjusted r2... better for small N

          fuv : 0.01054698                      ; (1-r2): fraction of variance of the regressand
                                                ; (dependent variable) Y which cannot be explained
                                                ;  i.e., which is not correctly predicted, by the
                                                ; explanatory variables X.

          Yest :        (ARRAY of 18 elements)  ; Yest = b(0) + b(1)*x
          Yavg :        2125.278                ; avg(y)
          Ystd :        532.6583                ; stddev(y)
          Xavg :        2165                    ; avg(x)
          Xstd :        543.6721                ; stddev(x)

          stderr :      ( 56.05802, 0.02515461 )     ; std. error of each b
          tval :        ( 0.2738642, 38.74285 )      ; t-value
          pval :        ( 0.7874895, 5.017699e-18 )  ; p-value

                                                ; Original regline attributes
          nptxy :       18
          xave :        2165
          yave :        2125.278
          rstd :        56.387
          yintercept :  15.35228

          b :   ( 15.35228, 0.9745615 )         ; b(0) + b(1)*x

        (0)     0.9745615                       ; regression coefficient



   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
