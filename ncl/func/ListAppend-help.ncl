THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/ListAppend.shtml
THE_TITLE:ListAppend
   NCL Home > Documentation > Functions > File IO

ListAppend

   Append a variable into the list.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        procedure ListAppend (
                f [1] : list,
                v [1] : variable
        )

        return_val [1] :  int

Arguments

   f

   Variable of type list.
   v

   Variable of an element (to be pushed into the list).

Description

   This procedure pushes one variable into the list. The last variable pushed into list will always at the end of the list.

See Also

   NewList ListPush ListPop ListGetType ListSetType

Examples

   Example 1

     x = (/1,2,3,4/)
     x@attr = "integer array"
     y = (/6.,7.,8.,9./)
     y@attr = "float array"
     s = (/"one","two","three"/)
     s@attr = "string array"

     my_list = NewList("lifo")

     ListAppend(my_list,x)
     ListAppend(my_list,y)
     ListAppend(my_list,s)

     print(my_list)

   The print procedure yields:
Variable: my_list
Type: list
Total Size: 4 bytes
            1 values
            Number of Dimensions: 1
            Dimensions and sizes:   [1]
            Coordinates:
            Type: list
            Total items: 3

List Item 0:    NclVarClass
Variable: x
Type: integer
Total Size: 16 bytes
            4 values
            Number of Dimensions: 1
            Dimensions and sizes:   [4]
            Coordinates:
            Number Of Attributes: 1
              attr :        integer array

List Item 1:    NclVarClass
Variable: y
Type: float
Total Size: 16 bytes
            4 values
            Number of Dimensions: 1
            Dimensions and sizes:   [4]
            Coordinates:
            Number Of Attributes: 1
              attr :        float array

List Item 2:    NclVarClass
Variable: s
Type: string
Total Size: 24 bytes
            3 values
            Number of Dimensions: 1
            Dimensions and sizes:   [3]
            Coordinates:
            Number Of Attributes: 1
              attr :        string array


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
