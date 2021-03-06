THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/rhomb_trunC-1.shtml
THE_TITLE:rhomb_trunC
   NCL Home > Documentation > Functions > Spherical harmonic routines

rhomb_trunC

   Performs rhomboidal truncation on spherical harmonic coefficients.

Prototype

        function rhomb_trunC (
                ab  : numeric,
                T   : integer
        )

        return_val [dimsizes(ab)] :  float or double

Arguments

   ab

   Spherical harmonic coefficients returned to user by the NCL functions shagC/shaeC. The first dimension must be 2, which
   addresses the real and imaginary parts.

   T

   Rhomboidal truncation parameter. T is the constant number of total wave numbers to keep.

Return value

   A double array is returned if the input is double; otherwise a float array is returned. The returned array will be of
   size dimsizes(ab).

Description

   rhomb_trunC performs rhomboidal truncation on coefficients returned by the Spherepack analysis routines shagC or shaeC.

   rhomb_trunC is the function version of rhomb_trunc.

See Also

   rhomb_trunc, tri_trunC, tri_trunc, shagC, shsgC shaeC, shseC

Examples

   Example 1

   g(nlat,nlon)
  T  = 15
  ab = shagC (g)
  ab = rhomb_trunC (ab,T)
  g  = shsgC (ab,nlon)


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
