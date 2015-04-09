THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/shsgC-1.shtml
THE_TITLE:shsgC
   NCL Home > Documentation > Functions > Spherical harmonic routines

shsgC

   Computes the spherical harmonic synthesis of a scalar quantity on a gaussian grid via spherical harmonics.

Prototype

        function shsgC (
                ab    : numeric,
                nlon  : byte, short, integer or long
        )

        return_val  :  float or double

Arguments

   ab

   Array containing spherical harmonic coefficients (input, array with multiple dimensions. The last two dimensions must be
   nlat x N, where N is determined as follows:

     N = minimum(nlat, (nlon+2)/2) if nlon is even
     N = minimum(nlat, (nlon+1)/2) if nlon is odd

   The first dimension of ab will be 2, which addresses the real and imaginary parts.

   Note:
     * input values must be in ascending latitude order
     * input array must be global

   In general, this array was created in the process of doing spherical harmonic analysis via shagC. nlon

   The longitude dimension of the array to be returned.

   As of version 6.0.0, this can be of type byte, short, integer or long.

Return value

   Note:
     * output values will be in ascending latitude order
     * output array is global

   If the last two dimensions of ab are nlat x N, then the last two dimensions of the return array g will be nlat x nlon.

   For example, if ab is a three dimensional array (2,nlat,N), then g will be dimensioned nlat x nlon.

   If ab is a four dimensional array (2,nt,nlat,N), then g will be dimensioned (nt,nlat,nlon).

   If ab is a five dimensional array (2,nt,nlvl,nlat,N), then g will be dimensioned (nt,nlvl,nlat,nlon).

   The return array will be double if the input is double, and float otherwise.

Description

   shsgC performs the spherical harmonic synthesis on the array ab. In general, shagC (performs spherical harmonic analysis)
   will have to be invoked prior to calling shsgC (performs spherical harmonic synthesis). Note that both shagC and shsgC
   operate on a gaussian grid.

   NOTE: This function does not allow for missing data (defined by the _FillValue attribute) to be present.

   Normalization: Let m be the Fourier wave number (rightmost dimension) and let n be the Legendre index (next-to-last
   dimension). Then ab = 0 for n < m.

   The associated Legendre functions are normalized such that:
    sum_lat sum_lon { [ Pmn(lat,lon)e^im lon ]^2 w(lat)/mlon } = 0.25  (m=0)

    sum_lat sum_lon {
          { [ Pmn(lat,lon)e^im lon ]^2
          + [ Pmn(lat,lon)e^i-m lon ]^2 } w(lat)/mlon } = 0.5  (m /= 0)

   where w represents the Gaussian weights:
  sum_lat { w(lat) } = 2.

   If the original input array is on a fixed grid, shseC should be used. Also, note that shsgC is the function version of
   shsgc.

See Also

   shsgc, shagC, shagc, shseC, shsec, shaec, shaeC, rhomb_trunC, tri_trunC

Examples

   In the following examples, g is on a gaussian grid and no cyclic points are included.

   Example 1

   g(nlat,nlon):
   ab = shagC (g)
     [do something with the coefficients]
   g  = shsgC (ab,nlon)

   Example 2

   g(nt,nlat,nlon):
   ab = shagC (g)
      [do something with the coefficients]
   g  = shsgC (ab,nlon)

   Example 3

   g(nt,nlvl,nlat,nlon):
   ab = shagC (g)
   ab = rhomb_trunC (ab,15)
   g  = shsgC (ab,nlon)

   Note: if g has dimensions, say, nlat = 64 and nlon = 129, where the "129" represents the cyclic points, then the user
   should pass the data to the function such that the cyclic points are not included. In the following examples, g is a
   gaussian grid that contains cyclic points. (Remember NCL subscripts start at zero.)

   Example 4

   g(nlat,nlon)
   nlon1 = nlon -1
   ab = shagC (g(:,0:nlon1-1))         ; only use the non-cyclic data
     [do something with the coefficients]
   g(:,0:nlon1-1) = shsgC (ab,nlon1)  ; reconstruct
   g(:,nlon1)     = g(:,0)           ; add new cyclic pt

   Example 5

   g(nt,nlat,nlon)
   nlon1 = nlon -1
   ab = shagC (g(:,:,0:nlon1-1))
     [do something with the coefficients]
   g(:,:,0:nlon1-1) = shsgC (ab,nlon1) ; reconstruct
   g(:,:,nlon1)   = g(:,:,0)          ; add new cyclic pt

   Example 6

   g(nt,nlvl,nlat,nlon)
   nlon1 = nlon-1
   ab = shagC (g(:,:,:,0:nlon1-1))
     [do something with the coefficients]
   g(:,:,:,0:nlon1-1) = shsgC (ab,nlon1)
   g(:,:,:,nlon1)   = g(:,:,:,0)  ; add new cyclic pt

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of nt (jer only)


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
