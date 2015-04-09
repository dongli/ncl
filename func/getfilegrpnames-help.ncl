THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/getfilegrpnames.shtml
THE_TITLE:getfilegrpnames
   NCL Home > Documentation > Functions > Group query, File IO

getfilegrpnames

   Returns an array of file group names in the specified supported file.

   [new.gif] Available in version 6.1.1 and later.

Prototype

        function getfilegrpnames (
                the_file [1] : file
        )

        return_val [*] :  string

Arguments

   the_file

   reference to a file. It is created using addfile or addfiles. Thus, it must be a supported file format.

Return value

   This function returns an array of strings with each element containing the name of a group. The length of this array is
   equal to the number of group in the file.

Description

   This function is useful when accessing file groups by string name. (See Files.)

See Also

   filegrpdef

Examples

   The following example gets all the group names from a netCDF file but it will also work for any file referenced by
   addfile. The dollar sign syntax used in this example is described at "NCL Variables".
    f = addfile ("X.nc" , "r")   ; could also have ccm, grb or hdf suffux
    gNames = getfilegrpnames (f) ; get names of all groups on file

    nNames = dimsizes (gNames)   ; number of groups on the file

    print (nNames)               ; print all group names on file

    do n=0,nNames-1              ; loop thru each group
       g = f=>$gNames(n)$        ; read the group to memory

       [SNIP]

       delete (g)
   end do


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
