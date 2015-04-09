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
