THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/vhseC-1.shtml
THE_TITLE:vhseC
   NCL Home > Documentation > Functions > Spherical harmonic routines

vhseC

   Computes vector spherical harmonic syntheses of vector fields on a fixed grid via spherical harmonics.

Prototype

        function vhseC (
                bc    : numeric,
                nlon  : byte, short, integer or long
        )

        return_val  :  float or double

Arguments

   bc

   vector spherical harmonic coefficients (input). Under normal conditions the bc array was produced by the vhaeC function.
   These coefficients must be in mathematical coordinates. see:

     http://www.scd.ucar.edu/css/software/spherepack/vhsec.txt

   nlon

   The size of the rightmost dimension of the original u and v arrays

   As of version 6.0.0, this can be of type byte, short, integer or long.

Return value

   (For the arrays whose last two dimensions are nlat x nlon, the rest of the dimensions (if any) are collectively referred
   to as N. If the input/output arrays are just two dimensions, then N can either be considered equal to 1 or nothing at
   all.)

   An array dimensioned 2 x N x nlat x nlon will be returned. The 0-th component contains the reconstructed u array and the
   1-th component contains the reconstructed v array.

   The return array will be double if the input array is double, otherwise it will be float.

Description

   vhseC performs the vector spherical harmonic syntheses using the coefficients in the multi-dimensional array bc generated
   by vhaeC. Note that both vhaeC and vhseC operate on a fixed grid.

   NOTE: This function does not allow for missing data (defined by the _FillValue attribute) to be present.

   If the original input arrays are on a gaussian grid, vhsgC should be used. Also, note that vhseC is the function version
   of vhsec.

See Also

   vhsec, vhaeC, vhaec, vhsgC, vhsgc, vhagc, vhagC

Examples

   In the examples below, u and v are on a fixed grid.

   Example 1

   u(nlat,nlon), v(nlat,nlon)

bc = vhaeC (u,v)
     [do something with the coefficients]
UV = vhseC (bc,nlon)

   Example 2

   u(nt,nlat,nlon), v(nt,nlat,nlon)

bc = vhaeC (u,v)
     [do something with the coefficients]
UV = vhseC (bc,nlon)

   Example 3

   u(nt,nlvl,nlat,nlon), v(nt,nlvl,nlat,nlon)

bc = vhaeC (u,v)
     [do something with the coefficients]
UV = vhseC (bc,nlon)


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
