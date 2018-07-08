
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle - Package manager
Plugin 'VundleVim/Vundle.vim'               

"Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'

"Search
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'

"Snippets pugins
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'

"Surround text with '," and tag
Plugin 'tpope/vim-surround'


Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
"Plugin 'ervandew/supertab'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
"Plugin 'msanders/snipmate.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lambdalisue/vim-fullscreen'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'mhinz/vim-signify'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'simeji/winresizer'
"Plugin 'ryanoasis/vim-devicons'
Plugin 'dkarter/bullets.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
