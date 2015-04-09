THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/determinant.shtml
THE_TITLE:determinant
   NCL Home > Documentation > Functions > General applied math

determinant

   Calculates the determinant of a square real matrix.

   [new.gif] Available in version 6.3.0 and later.

Prototype

        function determinant (
                x [*][*] : numeric
        )

        return_val [1] :  float or double

Arguments

   x

   A two-dimensional variable of numeric type. The dimension sizes must be the same (i.e. [N][N])

Return value

   A scalar of type double if x is type double; otherwise the returned value will be type float.

Description

   The determinant of the square (NxN) matrix is calculated using the partial-pivoting Gaussian elimination scheme.

See Also

   solve_linsys

Examples

   Example 1

   a = (/ (/ 1, 0, 2, -1/) \   ; N=4
        , (/ 3, 0, 0,  5/) \
        , (/ 2, 1, 4, -3/) \
        , (/ 1, 0, 5,  0/) /)

   d = determinant(a)          ; d=30.0


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
