#Main feature#

This configure is specified for [NCL](http://www.ncl.ucar.edu/) users, which provide:

 - NCL syntax highlight(as discribed in the [official editor enhancement](http://www.ncl.ucar.edu/Applications/editor.shtml) pages)
 -  View the official [**function**](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml), [**precedure**](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml), [**resource**](http://www.ncl.ucar.edu/Document/Graphics/Resources/list_alpha_res.shtml) manual through tags jump(Shortcut: **g]**)! 
 
 - It can work in Uinx-Like System, I test it in mac OS X and Linux.The compatibility in Windows(Gvim) is unkonwn.

#Screen-Shot

 ![alt text][1]

#Installation#

- Download this package and unzip it into $HOME/.vim
- Only the bundle folder is necessary,the others are just for explaination in Website

  ```
  cd $HOME/.vim/
  gti clone https://github.com/fanghuan/bundle
  ```
- After that, the floder tree is $HOME/.vim/bundle/... 

- Add those command lines in your .vimrc

  ```
   set complete-=k complete+=k " Add dictionary search (as per dictionary option)
   set wildmode=list:full
   set wildmenu
   au Bufread,BufNewfile *.ncl set dictionary=$HOME/.vim/bundle/ncl/dict/ncl.dic
   au Bufread,BufNewfile *.ncl set filetype=ncl tags=tags  
   au! Syntax newlang source $HOME/.vim/bundle/ncl/syntax/ncl.vim
   au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/bundle/ncl/exec/nclstd.tags
   au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/bundle/ncl/exec/ncl_func_help.tags
   au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/bundle/ncl/exec/ncl_res_help.tags
  ```
 

#Useage#
- when the cursor is located in [NCL functions(precedures)](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml) or [NCL resources](http://www.ncl.ucar.edu/Document/Graphics/Resources/list_alpha_res.shtml) text, press **g ]** in **normal model**, the cursor will jump to the document of the functions or resources.If the function(precedure) has more than one tag,you need to select it by typing the number of tags.
  ![alt text][3]
- press **Ctrl** + **t** in **normal model**, the cursor returns to the original file.
- example

  ![alt text][2]
#Bug Report#
 - If you have found any Bug, Please report it to <904139381@qq.com>.
 [1]: ./screen-shot.png
 [2]: ./useage.gif
 [3]: ./tags-select.png
