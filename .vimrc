set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'a.vim'
Plugin 'Mark'
Plugin 'The-NERD-tree'
"Plugin 'The-NERD-Commenter'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'tpope/vim-surround'
Plugin 'Junevimer/c.vim'
Plugin 'UltiSnips'
Plugin 'honza/vim-snippets'
Plugin 'Tagbar'
Plugin 'Tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'ack.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kana/vim-smartinput.git'
Plugin 'thinca/vim-quickrun.git'
"Display Plugins
Plugin 'Lokaltog/vim-distinguished'
Plugin 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required

 """"""""""YouCompleteMe""""""""
nnoremap <C-S-F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_confirm_extra_conf = 0
autocmd FileType c let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf_c.py'
autocmd FileType cpp let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf_cpp.py'
" preview window:
let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_completion = 1 " close preview window after select a completion string
let g:ycm_autoclose_preview_window_after_insertion = 1 " close preview window after leaving insert mode

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" let g:ycm_semantic_triggers = {'haskell' : ['.']}

autocmd Filetype c,cpp,objc,objcpp,python nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'pandoc' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \}
"}}}
"
" Syntastic
let g:loaded_html_syntax_checker = 1

let g:syntastic_auto_loc_list=2         "open/close location-list automatically
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php'],
                           \ 'passive_filetypes': ['puppet','python'] } "python:use checkers@python-mode

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"

" ===================  Tag bar ============================={{{
nmap <F8> :TagbarToggle<CR>
"let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 28
let g:tagbar_sort = 0       " just keep the same order as in file
let g:tagbar_compact = 1    " display in a more compact way
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
    \ }
" ===================  NerdTree ============================{{{
" 设置NerdTree的快捷键为F2
 map <silent><F2> :NERDTreeToggle<CR>
 let NERDTreeWinSize=24 "NERD_tree 窗口尺寸

"set color
colorscheme distinguished
"
"air line
let g:airline#extensions#tabline#enabled = 1

