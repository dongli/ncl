THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Contributed/getVarDimNames.shtml
THE_TITLE:getVarDimNames
   NCL Home > Documentation > Functions > Metadata routines

getVarDimNames

   Retrieves dimension names for a variable in memory (deprecated version).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure getVarDimNames (
                x  : numeric
        )

        return_val [*] :  string

Arguments

   x

   An numeric array of any dimensionality.

Description

   Retrieves dimension names for a variable in memory just as getfilevardims does for file variables.
   Deprecated, please use getvardims.

See Also

   Deprecated, please use getvardims.


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
