#Main feature#

This configure is specified for [NCL](http://www.ncl.ucar.edu/) users, which provide:

 - NCL syntax highlight(as discribed in the [official editor enhancement](http://www.ncl.ucar.edu/Applications/editor.shtml) pages)
 -  View the official [**function**](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml), [**precedure**](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml), [**resource**](http://www.ncl.ucar.edu/Document/Graphics/Resources/list_alpha_res.shtml) manual through tags jump(Shortcut: **g]**)! 
 
 - It can work in Uinx-Like System, I test it in mac OS X and Linux.The compatibility in Windows(Gvim) is unkonwn.

#Screen-Shot

 ![alt text][1]

#Installtion#
###Method.1 Vundle###
If you use [Vundle](https://github.com/gmarik/Vundle.vim) to manager your vim plugins,Please add the **`Plugin 'fanghuan/ncl'`** in **`~/.vimrc`**, and your **`~/.vimrc`** looks like

```
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fanghuan/ncl'
"" ---> Add you favorate vundle plugins here.
call vundle#end()
filetype plugin on

```
then Install Plugins:

Launch `vim` and run `:PluginInstall`

To install from command line: `vim +PluginInstall +qall`


###Method.2 Git##
  ```
 gti clone https://github.com/fanghuan/ncl ~/.vim/bundle/ncl
  ```

###Method.3 Manual##
 Download this package and unzip it into **`$HOME/.vim/bundle`**. After that, the floder tree is **`$HOME/.vim/bundle/ncl...`** 
### Set ~/.vimrc ##

Add those command lines in your **`.vimrc`** when you finished installtion.

```
set complete-=k complete+=k
set wildmode=list:full
set wildmenu
" Add dictionary search (as per dictionary option)
au Bufread,BufNewfile *.ncl set dictionary=$HOME/.vim/bundle/ncl/dict/ncl.dic

filetype on
syntax enable
au Bufread,BufNewfile *.ncl set filetype=ncl tags=tags  
au! Syntax newlang source $HOME/.vim/bundle/ncl/syntax/ncl.vim
au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/bundle/ncl/tags/nclstd.tags
au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/bundle/ncl/tags/ncl_func_help.tags
au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/bundle/ncl/tags/ncl_res_help.tags
```
 

#Useage#
- when typing [NCL functions,precedures](http://www.ncl.ucar.edu/Document/Functions/list_alpha.shtml),[resources](http://www.ncl.ucar.edu/Document/Graphics/Resources/list_alpha_res.shtml),press **`Ctrl + n `** or **`Ctrl + p `** will complete the word.
- when the cursor is located in **`NCL functions(precedures)`** or **`NCL resources`** text, press **`g ]`** in **normal model**, the cursor will jump to the document of the functions or resources. If the function(precedure) has more than one tag,you need to select it by typing the number of tags.
  ![alt text][3]
- press **`Ctrl + t`** in **normal model**, the cursor returns to the original file.
- example

  ![alt text][2]
#Bug Report#
 - If you have found any Bug, Please report it to <904139381@qq.com>.
 [1]: ./doc/screen-shot.png
 [2]: ./doc/useage.gif
 [3]: ./doc/tags-select.png
