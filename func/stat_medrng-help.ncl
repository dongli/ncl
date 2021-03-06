THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/stat_medrng.shtml
THE_TITLE:stat_medrng
   NCL Home > Documentation > Functions > General applied math

stat_medrng

   Calculates median, range, and mid-range of the given input.

Prototype

        procedure stat_medrng (
                x        : numeric,
                xmedian  : float,    ; or double
                xmrange  : float,    ; or double
                xrange   : float,    ; or double
                nptused  : integer
        )

Arguments

   x

   An array of any dimensionality. Missing values should be indicated by x@_FillValue. If x@_FillValue is not set, then the
   NCL default missing value will be assumed.
   xmedian
   xmrange
   xrange

   (output)
   Variables that will contain the median value, mid-range value, and range of x. The dimensions should be the same as x,
   with the rightmost dimension omitted (or a scalar if x is one-dimensional). Space for these variables must be explicitly
   allocated by the user.
   nptused

   (output)
   Variable that will contain the number of points used. It must have the same dimensionality as xmedian, and space for it
   must be explicitly allocated by the user.

Description

   stat_medrng calculates median, range, and mid-range of the rightmost dimension of x containing missing data.

   If ndims represents the number of dimensions in x, then for the leftmost dimensions 0 to ndims-2, the calculations are
   done on the rightmost dimension (ndims-1^th dimension) of the input array.

   This function will be updated in V5.0.0 so that if a subarray of x contains all missing values, stat_medrng will return
   missing values in the appropriate locations rather than quitting with a fatal error.

See Also

   stat2, stat4, stat_trim

Examples

   Run the following example, and then print out the various variables to see how stat2, stat4, stat_medrng, and stat_trim
   work:

begin
;
; Define a 3 x 2 x 2 array
;
   x = (/(/(/1.,2./),(/3.,4./)/),(/(/5.,6./),(/-999,8./)/),\
         (/(/9.,10./),(/11.,-999/)/)/)
   x@_FillValue = -999

   xmean   = new((/3,2/),float)
   xvar    = new((/3,2/),float)
   xskew   = new((/3,2/),float)
   xkurt   = new((/3,2/),float)
   xmed    = new((/3,2/),float)
   xmrng   = new((/3,2/),float)
   xrng    = new((/3,2/),float)
   xmeant  = new((/3,2/),float)
   xsdt    = new((/3,2/),float)
   npts    = new((/3,2/),integer)

   stat2(x,xmean,xvar,npts)
   print(xmean)
   print(xvar)
   print(npts)

   stat4(x,xmean,xvar,xskew,xkurt,npts)
   print(xmean)
   print(xvar)
   print(xskew)
   print(xkurt)
   print(npts)

   stat_medrng(x,xmed,xmrng,xrng,npts)
   print(xmed)
   print(xmrng)
   print(xrng)
   print(npts)

   stat_trim(x,0.0,xmeant,xsdt,npts)
   print(xmeant)
   print(xsdt)
   print(npts)
end


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
