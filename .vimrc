set nocompatible

filetype off                                                    "required

so ~/.vim/plugins.vim

set encoding=utf-8
set ttimeoutlen=50
syntax enable
set backspace=indent,eol,start		                        "Make backspace behave like every other editor.
let mapleader = ','		                                "The default is \, but a comma is much better.
set relativenumber				                "Let's activate line numbers.
set noerrorbells visualbell t_vb=	                        "No damn bells!	
set autowriteall			                        "Automatically write the file when switching buffers.
set complete=.,w,b,u			                        "Set our desired autocompletion matching.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

"-------------Visuals--------------"

set t_Co=256                                                    "Use 256 Colors. This is useful for Terminal Vim."
colorscheme atom-dark

if has('gui_running')			                        "Set the default font family and size.
    set guifont=Fira\ Code\ Medium\ 17
    "set macligatures			                        "MacVim-specific. Use pretty symbols, when available.
    set guioptions-=e			                        "We don't want Gui tabs.
    set linespace=8   		                                "GVim-specific line-height.
    set columns=999
    set lines=999
    set guioptions-=l                                           "Disable Gui scrollbars.
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    
    set guioptions-=m                                           "Hide menubar and toolbar
    set guioptions-=M
    set guioptions-=T
else 

    "Get rid of ugly split borders
    hi VertSplit ctermfg=bg		                        
    hi LineNr ctermbg=bg 
    "set foldcolumn=1                                           "We'll fake a custom left padding for each window
    hi foldcolumn ctermbg=bg

set cursorline
hi CursorLine ctermbg=235 guibg=Grey
endif






"-------------Search--------------"

set hlsearch				                        "Highlight all matched terms.
set incsearch				                        "Incrementally highlight, as we type.



"-------------Split Management--------------"

set splitbelow 				                        "Make splits default to below...
set splitright				                        "And to the right. This feels more natural.




"-------------Mappings--------------"

"Make GVim fullscreen
if has('gui_running')                                           
    nmap <Leader>0 :FullscreenToggle<cr>
endif

"open split easily
nmap <Leader>v :vsp<cr>		            
nmap <Leader>h :sp<cr>                      

"Simpler split switching
nmap <C-J> <C-W><C-J>                                           
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

if bufwinnr(1)
  "Incease split size
  map + <C-W>+       

  "Descrease split sise  
  map - <C-W>-         

  "Maximise width of the split
  map <Bar> <c-w>_<c-w><Bar>            


  "Restore all split
  map = <C-W>=                                 
endif

"Insert date in mornal and insert mode
imap <C-D> <C-R>=strftime("Date : %a,%d %b %H:%M")<CR>
map <C-D> :put =strftime(\"Date : %a,%d %b %H:%M\")<CR>

"Close the split
nmap <C-C> :q<cr>			    

"Save buffer
nmap <C-S> :w<CR>
imap <C-S> <Esc>:w<cr>a

"Save and close tab 
nmap <C-X> :w<cr> :tabclose<cr>		

"Edit Vimrc quickly
nmap <Leader>ev :tabedit $MYVIMRC<cr>	

nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>es :tabedit ~/.vim/snippets/php.snippets<cr>

"Toggle line numbers
nmap <Leader>l :set invnumber<cr>	

"Simpler highlight removal
nmap <Leader><space> :nohlsearch<cr>		

"Quickly open vim plugin file
nmap <Leader>pi : PluginInstall<cr>	

"Browse tag/symbol in project. Run ctags-R to generate the index
nmap <Leader>f :tag<space>

nmap <Leader>et :tabedit ~/sandbox/galaveneer/app/classes/sw_request.php<cr>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>





"-------------Plugins--------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'vendor\logs\might_needed\uploads\node_modules\|git'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Install sudo apt install ctags for tag searching
nmap <Leader>p :CtrlP<cr>
nmap <Leader>r :CtrlPBufTag<cr>
nmap <Leader>e :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

nmap <Leader>1 :NERDTreeToggle<cr>

"/
"/ Greplace.vim
"/
"We want to use Ag for the search.
set grepprg=ag				

let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"  
let g:PHP_vintage_case_default_indent = 1


nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/
"/airline-themes
"/

"enable nice symbols. install power fonts. 
"also set powerfonts comapatible font in the terminal
let g:airline_powerline_fonts = 1                       
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#tab_min_count = 2
"let g:airline#extensions#tabline#buffer_min_count =1           "show tabs if > 1 tab is open
let g:airline#extensions#tabline#fnamemod = ':t'                "disaply only file name (remove FQP) in tabs
let airline#extensions#tabline#tabs_label = '»'                 "change tabs text from tab area
let airline#extensions#tabline#show_splits = 0                  "remove top right redundant area
"let g:airline#extensions#tabline#buf_label_first = 0
"let g:airline#extensions#tabline#tab_nr_type = 0               "for proper tab numbering
let g:airline#extensions#tabline#enabled = 1                    "enable theme in buffer tabs
let g:airline#extensions#tabline#show_tab_nr = ''
"let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

"let g:airline#extensions#tabline#fnamemod = ':.'                "Show fully qualified filename :.
"let g:airline#extensions#tabline#fnamecollapse = 1              "Show only first character of directory
let g:airline_section_c = '%t'                                   "display only file name in status line
"select tagline formatter
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_section_y = ''                                    "remove file-encoding
"let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0  "remove file format symbol
let g:airline_section_x=''                                      "remove the filetype part
let g:airline_skip_empty_sections = 1                           "remove separator for empty sections
let g:airline_section_z = '%l/%L:%c'                            "current_line/total_line:char


"remove whitespace error checking for vim files
let g:airline#extensions#whitespace#skip_indent_check_ft = {'vim': ['mixed-indent-file','trailing'],'tmux':['midex-indent-file','trailing']}

"color CtrlP in visual mode (default is insert mode)
let g:airline#extensions#ctrlp#color_template = 'visual'


"for flat tab separtor instead of > powerfont symbol
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

"let g:gitgutter_enabled = 0                                     "hide gitgutter on startup
"let g:airline#extensions#hunks#enabled = 0                      "display git hunks
"let g:airline#extensions#branch#enabled = 0                     "display git branch
"let g:airline#extensions#hunks#non_zero_only = 1                "showing only non-zero hunks
""let g:airline#extensions#branch#displayed_head_limit = 7       "limit branch name
"let g:signify_realtime = 0
"let g:signify_vcs_list = [ 'git']

let g:airline_theme='dark'                                      "set theme for airline
"let g:airline_theme='base16_default'
"let g:airline_theme='powerlineish'
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
"let g:solarized_termtrans = 1                                                   
"let g:solarized_termcolors=256                

"let airline#extensions#tabline#disable_refresh = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

set noshowmode                                                  "remove duplicate mode text from status line


"--------------Bullets--------------"
" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]





"-------------Project-Specific--------------"
nmap <Leader>am :tabedit ~/sandbox/galaveneer/app/includes/menu_data.php<cr>
nmap <Leader>ad :tabedit ~/sandbox/galaveneer/app/classes_common/_database.php<cr>
nmap <Leader>ap:tabedit ~/sandbox/galaveneer/app/classes_common/_pdf.php<cr>
nmap <Leader>ae :tabedit ~/sandbox/galaveneer/app/classes_common/_excel.php<cr>
nmap <Leader>ag :tabedit ~/sandbox/galaveneer/app/classes_common/_gui.php<cr>

nmap <Leader>ac :tabedit ~/sandbox/galaveneer/app/classes/
nmap <Leader>ap :tabedit ~/sandbox/galaveneer/app/public/
nmap <Leader>aj :tabedit ~/sandbox/galaveneer/assets/js/
nmap <Leader>as :tabedit ~/sandbox/galaveneer/assets/css/
"nmap <Leader><Leader>ap :CtrlP<cr>app/
"nmap <Leader><Leader>ad :e resources/views/<cr>




"-------------Auto-Commands--------------"

hi CursorLineNR ctermbg=236
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

"Hide Signify diff signs on startup
autocmd User Signify call sy#sign#remove_all_signs(bufnr(''))

"Autosourcing the Vimrc file on save
augroup autosourcing
        autocmd!
	autocmd BufWritePost .vimrc source %
        "!cp ~/.vimrc ~/sandbox/dotfiles/.vimrc && cp ~/.vim/plugins.vim ~/sandbox/dotfiles/plugins.vim
augroup END




"-------------Functions--------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>





"-------------Tips and Reminders--------------"
" when theme is not displaying properly minimize and maximize the terminal
" zz        -center the line where the cursor is located.
" zt        -puts current line to top of screen
" zb        -puts current line to bottom of screen
" gg        -go to top of the page
" Ctrl+g    -go to end of the page
" yy        -copy line under the cursor
" p         -paste copied line below the cursor
" P         -paset copied line above the cursor
" dd        -delete line under the cursor
" dw        -delete word from cursor position
" u         -undo last operation
" U         -Undo line operations
