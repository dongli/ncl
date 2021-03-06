THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/vrdv2uvg.shtml
THE_TITLE:vrdv2uvg
   NCL Home > Documentation > Functions > Spherical harmonic routines

vrdv2uvg

   Computes the wind components via spherical harmonics, given vorticity and divergence on a gaussian grid.

Prototype

        procedure vrdv2uvg (
                vr  : numeric,
                dv  : numeric,
                u   : float,    ; or double
                v   : float     ; or double
        )

Arguments

   vr

   vorticity array (input, array with two or more dimensions, last two dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * input array must be on a global grid

   dv

   divergence array (input, same dimensions as vr)
     * values will be in ascending latitude order
     * input array must be on a global grid

   u
   v

   wind components (output, same dimensions as vr and dv, values will be in ascending latitude order)

Description

   vrdv2uvg computes the wind components given vorticity and divergent arrays vr and dv and store the results in the arrays
   u and v. vrdv2uvg operates on a gaussian grid.

   This procedure does not handle missing values (defined by the _FillValue attribute). If any missing values are
   encountered in a particular 2D input grid, then all of the values in the corresponding output grids will be set to the
   missing value defined by the output grids' _FillValue attributes.

   Input arrays should not include the cyclic (wraparound) points when invoking this procedure, or any procedure or function
   which uses spherical harmonics (Spherepack).

   If the input arrays vr and dv are on a fixed grid, vrdv2uvf should be used. Also, note that vrdv2uvg is the procedural
   version of vrdv2uvG.

See Also

   vrdv2uvf, vrdv2uvG, vrdv2uvF, uv2vrdvg, uv2vrdvf, uv2dvg, uv2dvf, uv2vrg, uv2vrf, uv2vr_cfd

Examples

   Example 1

   Given the wind components u and v (on a gaussian grid), compute the relative vorticity and divergence, and then
   reconstruct the wind components from the vorticity and divergence fields.

begin
  nlat  = 128                                       ; dimensions
  mlon  = 256
  mlon1 = mlon+1
  fbfile = "uv300.hs"
                                       ; Generic Workstation setup
  nrec  = fbinnumrec(fbfile)           ; total number of records in the file
  ntim  = nrec/2                       ; number of time steps in dataset

  uvmsg = 1e+36

  dv    = new ( (/nlat,mlon /), float, uvmsg )  ; divergence
  vort  = new ( (/nlat,mlon /), float, uvmsg )  ; vorticity  (relative)
  ur    = new ( (/nlat,mlon /), float, uvmsg )
  vr    = new ( (/nlat,mlon /), float, uvmsg )

  do i = 0,nrec-1,2
   month = 1                         ; january
   if (i .ge. 2) then
       month = 7                     ; july
   end if

   work = fbinrecread(fbfile,i  ,(/nlat,mlon1/),"float")
   u    = work(:,0:mlon-1)
   work = fbinrecread(fbfile,i+1,(/nlat,mlon1/),"float")
   v    = work(:,0:mlon-1)

   uv2vrdvg (u,v, vort,dv)           ; u,v ==> div and vort
   vrdv2uvg (vort,dv, uu,vv)         ; vr,dv > reconstruct original wind
  end do
end

   Example 2

   Read ECMWF complex coefficients associated with vorticity and divergence. Compute the wind components.

   Note: the procedure vrdv2uvg can handle all times, levels with one call. However, it will use lots of temporary memory.
   This example illustrates processing one time and level at a time. It is abit less efficient but it reduces memory
   considerable.

;***************************************************
; read DIV and VORT; complex
; ( initial_time0, lv_HYBL4,real_imaginary, g50_lat_2, g50_lon_3)
; calculate wind components
;***************************************************
  U  = new ( (/ntim,klev,nlat,mlon/), "float", "No_FillValue")
  V  = new ( (/ntim,klev,nlat,mlon/), "float", "No_FillValue")

  do nt=0,ntim-1
    do kl=0,klev-1
       ab     = f->D_GDS50_HYBL(nt,kl,:,:,:)
       DIV    = shsgC(ab, mlon)
       ab     = f->VO_GDS50_HYBL(nt,kl,:,:,:)
       VORT   = shsgC(ab, mlon)

       vrdv2uvg(VORT,DIV,U(nt,kl,:,:),V(nt,kl,:,:))
    end do
  end do


Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
