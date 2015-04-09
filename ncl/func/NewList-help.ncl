THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/NewList.shtml
THE_TITLE:NewList
   NCL Home > Documentation > Functions > File IO

NewList

   Create a list (type variable).

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function NewList (
                s [1] : string
        )

        return_val [1] :  list

Arguments

   s

   String of list type (can only be one of "fifo"(First In, First Out) or "lifo" (List In, First Out)).

Return value

   Returns a variable of type list.

Description

   This function returns a list.

See Also

   ListPush ListPop ListCount ListIndex ListGetType ListSetType

Examples

   Example 1

     my_list = NewList("lifo")

     print(my_list)

   The print procedure yields:
Variable: my_list
Type: list
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
