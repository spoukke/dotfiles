" Install vim-plugged if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/plugged')

" Declare the list of plugins.

  Plug 'vim-airline/vim-airline'
  Plug 'joshdick/onedark.vim'
  Plug 'preservim/nerdtree'  |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'jiangmiao/auto-pairs'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
