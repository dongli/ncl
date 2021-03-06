THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/wrf_virtual_temp.shtml
THE_TITLE:wrf_virtual_temp
   NCL Home > Documentation > Functions > WRF

wrf_virtual_temp

   Calculates virtual temperature, given temperature and mixing ratio from WRF model output.

   [new.gif] Available in version 6.2.0 and later.

Prototype

        function wrf_virtual_temp (
                t   : numeric,
                qv  : numeric
        )

        return_val  :  float or double

Arguments

   t

   Temperature in [K]. The rightmost dimensions are bottom_top x south_north x west_east.
   qv

   Water vapor mixing ratio in [kg/kg]. An array with the same dimensionality as t.

Return value

   Virtual temperature in [K]. The rightmost three dimensions will be bottom_top x south_north x west_east, and the leftmost
   dimensions, if any, will be the same as t's. The array will contain the same named dimensions as t; otherwise, the
   rightmost two dimensions will be named "south_north" and "west_east". The type will be double if any of the input is
   double, and float otherwise.

Description

   This function returns virtual temperature, given temperature and mixing ratio from WRF model output.

   You can use wrf_user_getvar with an argument of "tv" to calculate this diagnostic.

   The return variable will contain two attributes:

     return_val@description = "Virtual Temperature"
     return_val@units = "K"

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_omega, wrf_wetbulb, wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

  filename = "wrfout_d01_2008-09-29_20:00:00.nc"
  a = addfile(filename,"r")

  t  = wrf_user_getvar(a,"tk",0)
  qv = wrf_user_getvar(a,"QVAPOR",0)
  vt = wrf_virtual_temp(t,qv)

   You can see some other example scripts and their resultant images at:

     http://www2.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
