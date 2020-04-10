"设置
set encoding=utf-8
set pyxversion=3
set number
set relativenumber
set colorcolumn=80,110 " 设置垂直标线
set termguicolors
" set guifont=Inconsolata\ h30
syntax on

"插件管理
call plug#begin('/.local/share/nvim/plugged')
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go',{'do': ':GoUpdateBinaries'}
Plug 'vim-scripts/mru.vim'
Plug 'majutsushi/tagbar'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Yggdroot/indentLine'
Plug 'w0ng/vim-hybrid'
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/pgmnt.vim'
Plug 'tpope/vim-surround'
Plug 'jszakmeister/markdown2ctags'
"Plug 'MattesGroeger/vim-bookmarks'
call plug#end()



"设置参数，开关自动补全等
let g:deoplete#enable_at_startup = 1
let g:airline_theme='kalisi'
let g:jedi#completions_enabled = 0 " disable autocompletion, cause we use deoplete for completion
let g:jedi#use_splits_not_buffers = "right" " open the go-to function in split, not another buffer
let g:neomake_python_enabled_makers = ['pylint'] "设置pylint为语言检查
let g:instant_markdown_slow = 1 " 设置 markdown 渲染延迟
let g:tagbar_ctags_bin='/usr/bin/ctags'  " 设置ctags所在路径
" let g:tagbar_width=30　" 设置tagbar的宽度
"
"按键映射
let mapleader = " " "将leader键映射到空格
map S :w<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sr :set splitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <up> :resize+5<CR>
map <down> :resize-5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
map ff :NERDTree<CR>
nmap <C-b> <C-B>
"nmap <F8> :TagbarToggle<CR>
nmap <Leader>tt :TagbarToggle<CR>  " 将开启tagbar的快捷键设置为　<Leader>tb
nmap <C-p>f :Leaderf file<CR>
nmap <C-p>ff :Leaderf function<CR>
"map <C-P> mp
"map <C-M> mn


"其他配置
call neomake#configure#automake('nrwi', 500) "自动代码检查
hi HighlightedyankRegion cterm=reverse gui=reverse "配置yarnk高亮
let g:highlightedyank_highlight_duration = 1000 " 高亮持续时间为 1000 毫秒
colorscheme gruvbox " 设置主题
" colorscheme hybrid " 设置主题
" set background=light " 或者 set background=light
" let g:gruvbox_contrast_dark="medium"
" set t_Co=256   " This is may or may not needed.
" set background=light
" colorscheme PaperColor
" let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

"COC
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 快速文件查看快捷键

nmap <C-e> :Leaderf mru<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"let g:airline_theme='papercolor'
"let g:PaperColor_Theme_Options = {
  "\   'theme': {
  "\     'default.dark': {
  "\       'override' : {
  "\         'color00' : ['#080808', '232'],
  "\         'linenumber_bg' : ['#080808', '232']
  "\       },
  "\       'allow_bold':1
  "\     }
  "\   }
  "\ }
