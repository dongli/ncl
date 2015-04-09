THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/ListCount.shtml
THE_TITLE:ListCount
   NCL Home > Documentation > Functions > File IO

ListCount

   Queries the number of element(s) in a list.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function ListCount (
                f [1] : list
        )

        return_val [1] :  int

Arguments

   f

   Variable of type list.

Return value

   Returns a variable of type int.

Description

   This function returns the number of element(s) in a list.

See Also

   NewList ListPush ListPop ListIndex ListGetType ListSetType

Examples

   Example 1

   x = 1234 ; a integer
   y = 5.67 ; a float
   z = "ab" ; a string
   lst  = [/x, y, z/]    ; note of square bracket, NOT round bracket.

   n = ListCount (lst)
   print(n)

   The print procedure yields:
Variable: n
Type: integer
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     3


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
