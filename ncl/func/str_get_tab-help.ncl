THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/str_get_tab.shtml
THE_TITLE:str_get_tab
   NCL Home > Documentation > Functions > String manipulation

str_get_tab

   Returns the tab ('\t' in C) character as a string.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function str_get_tab (
        )

        return_val [1] :  string

Description

   This function returns a one-character string containing the tab.

   NCL cannot generate a tab as string using normal string assignment. This function gives a quick/direct way to get a tab
   string.

   The result of str_get_tab() is same as tostring(tochar(9)).

See Also

   show_ascii, str_get_dq, str_get_sq, str_get_nl

Examples

   Example

 tab = str_get_tab()
 print("<" + tab + ">")
 print("the tab = <" + tostring(tochar(9)) + ">")

   Output:
(0)     <       >
(0)     the tab = <     >


   ©2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
