THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/kolsm2_n.shtml
THE_TITLE:kolsm2_n
   NCL Home > Documentation > Functions > General applied math

kolsm2_n

   Use the Kolmogorov-Smirnov two-sample test to determine if two samples are from the same distribution.

   [new.gif] Available in version 6.2.0 and later.

Prototype

        function kolsm2_n (
                x        : numeric,
                y        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x
   y

   Arrays of any dimensionality. The rank of the arrays must be the same. However, the dimension(s) specified by dims may be
   of different sizes. (See Examples.) All other dimensions must match. At a minimum, the sample sizes should be greater
   than 100. Missing data are not allowed. It is the users responsibility to remove missing values prior to calling the
   function.
   dims

   The dimension(s) of x and y on which to calculate the statistic. They must be consecutive and increasing.

   The dimension sizes of x and y may be different but the rank must be the same.
   If dims=-1, then the entire arrays will be used.

Return value

   Probability that the distributions are the same. The return type will be double if either x or y, is type double, and
   float otherwise. In addition, two ancillary statistics used to calculate the probability are returned as attributes,
   dstat and zstat. These are used to compute the returned probability. For the kolsm2_n function, these are defined as

        dstat = abs(x-y)

        zstat = sqrt((M*N)/(M+N))*dstat)
    where
        M, N are the dimension sizes of x and y.


Description

   The Kolmogorov-Smirnov (KS) two-sample test determines if two samples are from the same parent distribution. The KS test
   is non-parametric and distribution free. IE: It makes no assumption about the distribution of data. The statistic
   compares cumulative distributions of two data samples. A large difference between the two cumulative sample distributions
   indicates that data are not drawn from the same distribution.

   From Wikipedia: "The two-sample KS test is one of the most useful and general nonparametric methods for comparing two
   samples, as it is sensitive to differences in both location and shape of the empirical cumulative distribution functions
   of the two samples."

   The null hypothesis is that both groups were sampled from populations with identical distributions. Hence, if the
   returned p-value is small (eg, < 0.05), the two data sets were likely sampled from populations with different
   distributions and the null hypothesis can be rejected.

   The kolsm2_n function does not test for 'ties'. This test should only be used when ties are a very small percent of the
   entire samples.

   This function sorts the x and y subsets before doing the calculation. As a result, large datasets will take time to
   perfom the required operations. The original input arrays are not changed.

   NOTE: Any time a distribution (here, two distributations) is/are tested, the user should realize that there is no
   substitute for large sample size(s). A minimum 'large' size would be at least 100 values.

See Also

   ftest, rtest, betainc

Examples

   As always, it is best if the sample sizes of X and Y are large.

   Example 1

   Consider two small arrays. The results match those obtained from R's ks.test.
   x = (/15.7, 16.1, 15.9, 16.2, 15.9, 16.0, 15.8, 16.1, 16.3, 16.5, 15.5/)
   y = (/15.4, 16.0, 15.6, 15.7, 16.6, 16.3, 16.4, 16.8, 15.2, 16.9, 15.1/)

   p = kolsm2_n(x,y,0)     ; p=0.808 ; p@dstat = 0.2727; p@zstat= 0.639
                                ; can not reject null hypothesis (H0)

   Example 2

   Assume X and Y are one-dimensional arrays (they need not be the same size). Note: the user may find some differences from
   the resuts here due the the nature of the random number generators. The results match those obtained from R's ks.test
   function.


; two normal distributions

  NX   =  100
  xavg =  0.0
  xstd = 10.0

  NY   =  200
  yavg =  0.0
  ystd = 10.0

  X    = random_normal (xavg, xstd, NX)
  Y    = random_normal (yavg, ystd, NY)
  pXY  = kolsm2_n(X, Y, 0) ; pXY= 0.395 ; p@dstat= 0.11; p@zstat= 0.898
                                               ; can not reject null hypothesis (H0)

; two different distributions: normal and uniform

  NZ   =  200
  zlow = -10.0
  zhi  =  10.0
  Z    = random_uniform (zlow, zhi, NZ)
  pXZ  = kolsm2_n(X, Z, 0)  ; pXZ=0.00 ; p@dstat = 0.265; p@zstat= 2.164
                                   ; reject null hypothesis (H0)

   Example 3

   Let x(ntim1,nlat1,mlon1) and y(ntim2,nlat2,mlon2). Are the distributions the same over the entire temporal and spatial
   domains? Here, the user may explicitly set the dimensions or set to -1 or convert to one-dimensional arrays.

    pxy  = kolsm2_n(x, y, (/0,1,2/)) ; Essentially, this makes one dimensional arrays for x and y.
                                            ; pxy, pxy@dstat, pxy@zstat
or

    pxy  = kolsm2_n(x, y,-1)


   Example 4

   Let x(ntim1,nlat,mlon) and y(ntim2,nlat,mlon). The 'ntim' may be different but the number of grid points must be the
   same.
    pxy  = kolsm2_n(x, y, 0)  ; pxy(nlat,mlon); p@dstat(nlat,mlon); p@zstat(nlat,mlon)

   Example 4

   Let x(ntim1,nlat,mlon) and y(ntim2,nlat,mlon). The 'ntim' may be different but the number of grid points must be the
   same.
    pxy  = kolsm2_n(x, y, 0)  ; pxy(nlat,mlon); p@dstat(nlat,mlon); p@zstat(nlat,mlon)

   Example 5

   Let x(N) and y(M) possibly contain missing data (_FillValue). Since kolsm2_n does not allow missing values, these must be
   removed by the user.
    if (num(ismissing(x)) .eq.0) then
        xx = x
    else
        xx = x(ind(ismissing(x)))
    end if

    if (num(ismissing(y)).eq.0) then
        yy = y
    else
        yy = y(ind(ismissing(y)))
    end if

    pxy  = kolsm2_n(xx, yy, 0)  ; pxy; pxy@dstat; pxy@zstat

    delete( [/xx,yy/] )   ; delete temporary arrays

   Example 6

   Let x(K1,N,M) and y(K2,N,M) contain missing data (_FillValue). Since kolsm2_n does not allow missing values, these must
   be removed by the user.
    if (num(ismissing(x)).eq.0) then
        xx   = x
    else
        x1d  = ndtooned(x)
        xx   = x1d(ind(ismissing(x1d)) )
        delete(x1d)
    end if

    if (num(ismissing(y)).eq.0) then
        yy   = y
    else
        y1d  = ndtooned(y)
        yy   = x1d(ind(ismissing(x1d)) )
        delete(y1d)
    end if


    pxy  = kolsm2_n(xx, yy, 0)  ; pxy; pxy@dstat; pxy@zstat

    delete( [/xx,yy/] )   ; delete temporary arrays

   Example 7

   Let x(K1,N,M) and y(K2,N,M) contain daily precipitation. This introduces the possibility of many values equal to 0.0.
   Further, these arrays may contain missing values. It is desired to test the distributions when it does precipitate.

    x1d = ndtooned(x)
    ix  = ind(.not.ismissing(x1d) .and. x1d.gt.0.0)

    y1d = ndtooned(y)
    iy  = ind(.not.ismissing(y1d) .and. y1d.gt.0.0)

    pxy = kolsm2_n(x1d(ix), y1d(iy), 0)  ; pxy; pxy@dstat; pxy@zstat

    delete( [/ix, iy/] )   ; delete temporary arrays


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
