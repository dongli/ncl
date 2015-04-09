THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/vhsgC-1.shtml
THE_TITLE:vhsgC
   NCL Home > Documentation > Functions > Spherical harmonic routines

vhsgC

   Computes vector spherical harmonic syntheses of vector fields on a gaussian grid via spherical harmonics.

Prototype

        function vhsgC (
                bc    : numeric,
                nlon  : byte, short, integer or long
        )

        return_val  :  float or double

Arguments

   bc

   vector spherical harmonic coefficients (input). Under normal conditions the bc array was produced by the vhagC function.
   These coefficients must be in mathematical coordinates. see:

     http://www.scd.ucar.edu/css/software/spherepack/vhsgc.txt

   nlon

   The size of the rightmost dimension of the original u and v arrays.

   As of version 6.0.0, this can be of type byte, short, integer or long.

Return value

   (For the arrays whose last two dimensions are nlat x nlon, the rest of the dimensions (if any) are collectively referred
   to as N. If the input/output arrays are just two dimensions, then N can either be considered equal to 1 or nothing at
   all.)

   An array dimensioned 2 x N x nlat x nlon will be returned. The 0-th component contains the reconstructed u array and the
   1-th component contains the reconstructed v array.

   The return array will be double if the input array is double, otherwise it will be float.

Description

   vhsgC performs the vector spherical harmonic syntheses using the coefficients in the multi-dimensional array bc generated
   by vhagC. Note that both vhagC and vhsgC operate on a gaussian grid.

   NOTE: This function does not allow for missing data (defined by the _FillValue attribute) to be present.

   If the original input arrays are on a fixed grid, vhseC should be used. Also, note that vhsgC is the function version of
   vhsgc.

See Also

   vhsgc, vhagC, vhagc, vhseC, vhsec, vhaec, vhaeC

Examples

   In the examples below, u and v are on a gaussian grid.

   Example 1

   u(nlat,nlon), v(nlat,nlon)

bc = vhagC (u,v)
     [do something with the coefficients]
UV = vhsgC (bc,nlon)

   Example 2

   u(nt,nlat,nlon), v(nt,nlat,nlon)

bc = vhagC (u,v)
     [do something with the coefficients]
UV = vhsgC (bc,nlon)

   Example 3

   u(nt,nlvl,nlat,nlon), v(nt,nlvl,nlat,nlon)

bc = vhagC (u,v)
     [do something with the coefficients]
UV = vhsgC (bc,nlon)


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
