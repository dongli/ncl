#Main feature#

This configure is specified for [NCL](http://www.ncl.ucar.edu/) users, which provide:

 - NCL syntax highlight(as discribed in the [official editor enhancement](http://http://www.ncl.ucar.edu/Applications/editor.shtml) pages)
 -  View the official [**function**](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml), [**precedure**](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml), [**resource**](http://www.ncl.ucar.edu/Document/Graphics/Resources/list_alpha_res.shtml) manual through tags jump(Shortcut: **g]**)! 
 
 - It can work in Uinx-Like System, I test it in mac OS X and Linux.The compatibility in Windows(Gvim) in unkonw.

***
#Screen-Shot
 ![alt text](https://github.com/fanghuan/ncl_help_res/screen-shot.png)
***
##Installation##

- Download this package and unzip it into $HOME/.vim

 - cd $HOME/.vim/
 - gti clone https://github.com/fanghuan/ncl\_help\_res

- After that, the flod tree is $HOME/.vim/ncl\_res\_help/bundle/... 

- Add those command lines in your .vimrc

 - au Bufread,BufNewfile *.ncl set filetype=ncl tags=tags
 - au! Syntax newlang source $HOME/.vim/ncl\_help\_res/bundle/ncl/syntax/ncl.vim
 - au Bufread,BufNewfile *.ncl set dictionary=$HOME/.vim/ncl\_help\_res/bundle/ncl/dict/ncl.dic.
 - au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/ncl\_help\_res/bundle/ncl/exec/nclstd.tags.
 - au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/ncl\_help\_res/bundle/ncl/exec/ncl\_func\_help.tags
 - au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/ncl\_help\_res/bundle/ncl/exec/ncl\_res\_help.tags 
***
#Useage#
 - when the cursor is located in [NCL functions(precedures)](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml) or [NCL resources](http://www.ncl.ucar.edu/Document/Graphics/Resources/list_alpha_res.shtml) text, press **g ]** in **normal model**, the cursor will jump to the document of the functions or resources
 - example

 ![alt text](https://github.com/fanghuan/ncl_help_res/useage.gif)
***
