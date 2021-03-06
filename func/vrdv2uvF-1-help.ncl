THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/vrdv2uvF-1.shtml
THE_TITLE:vrdv2uvF
   NCL Home > Documentation > Functions > Spherical harmonic routines

vrdv2uvF

   Computes the wind components via spherical harmonics, given vorticity and divergence on a fixed grid.

Prototype

        function vrdv2uvF (
                vr  : numeric,
                dv  : numeric
        )

        return_val [2,dimsizes(vr)] :  float or double

Arguments

   vr

   vorticity array (input, array with two or more dimensions, last two dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * input array must be on a global grid

   dv

   divergence array (input, same dimensions as vr)
     * values will be in ascending latitude order
     * input array must be on a global grid

Return value

   The returned array will be dimensioned 2 x dimsizes (vr), where the leftmost 0-th dimension contains the u component and
   the leftmost 1-th dimension contains the v component (both in ascending latitude order). The returned array will be of
   type double if the input is double, and float otherwise.

Description

   vrdv2uvF computes the wind components given the vorticity and divergent arrays vr and dv. vrdv2uvF operates on a fixed
   grid.

   This function does not handle missing values (defined by the _FillValue attribute). If any missing values are encountered
   in a particular 2D input grid, then all of the values in the corresponding output grids will be set to the missing value
   defined by the output grids' _FillValue attributes.

   Input arrays should not include the cyclic (wraparound) points when invoking this function, or any procedure or function
   which uses spherical harmonics (Spherepack).

   If the input arrays vr and dv are on a gaussian grid, vrdv2uvG should be used. Also, note that vrdv2uvF is the function
   version of vrdv2uvf.

See Also

   vrdv2uvG, vrdv2uvf, vrdv2uvg, uv2vrdvF, uv2vrdvG, uv2dvF, uv2dvG, uv2vrF, uv2vrG, uv2vr_cfd

Examples

   Example 1

   Given the wind components u and v (on a fixed grid), compute the relative vorticity and divergence, and then reconstruct
   the wind components from the vorticity and divergence fields.

begin
  nlat  =  73                                       ; dimensions
  mlon  = 144
  mlon1 = mlon+1
  fbfile = "uv300.hs"
                                        ; Generic Workstation setup
  nrec  = fbinnumrec(fbfile)       ; total number of records in the file
  ntim  = nrec/2                       ; number of time steps in dataset

  uvmsg = 1e+36

  work  = new ( (/nlat,mlon1/), float, uvmsg )
  u     = new ( (/nlat,mlon /), float, uvmsg )  ; source u
  v     = new ( (/nlat,mlon /), float, uvmsg )  ; source v

  do i = 0,nrec-1,2
   month = 1                         ; january
   if (i .ge. 2) then
       month = 7                     ; july
   end if

   work = fbinrecread(fbfile,i  ,(/nlat,mlon1/),"float")
   u    = work(:,0:mlon-1)
   work = fbinrecread(fbfile,i+1,(/nlat,mlon1/),"float")
   v    = work(:,0:mlon-1)

   vrdvx = uv2vrdvF (u,v)              ; u,v ==> div and vort
   uvx   = vrdv2uvF (vrdvx(0,:,:), \   ; vr,dv > reconstruct original wind
                     vrdvx(1,:,:))
  end do
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
