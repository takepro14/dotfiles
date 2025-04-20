" Options
syntax on

set number
set confirm
set laststatus=2
set statusline=%f\ %m\ %r\ %=%l:\%c\ (%p%%)
set clipboard=unnamed,unnamedplus
set belloff=all
set whichwrap=b,s,<,>,[,],h,l
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set path=.,**
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
set wildignore+=*/.git/*,*/node_modules/*

" Keymaps
nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$
nnoremap <C-l> :nohlsearch<CR>
nnoremap <C-j> J
vnoremap <C-j> J
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k
nnoremap Y y$
xnoremap * y:let @/ = '\V' . escape(@", '\')<CR>n

" Utilities
autocmd BufWritePre * %s/\s\+$//e
autocmd VimResized * wincmd =

" Plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'airblade/vim-gitgutter'
Plug 'sbdchd/neoformat'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" GitGutter
autocmd VimEnter * GitGutterEnable
autocmd BufWritePost * GitGutter
let g:gitgutter_sign_added    = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed  = '-'
highlight GitGutterAdd    guifg=Green      guibg=NONE ctermfg=Green      ctermbg=NONE
highlight GitGutterChange guifg=DarkYellow guibg=NONE ctermfg=Yellow     ctermbg=NONE
highlight GitGutterDelete guifg=Red        guibg=NONE ctermfg=Red        ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE

" Formatters
let g:neoformat_enabled_html = ['prettierd']
let g:neoformat_enabled_css = ['prettierd']
let g:neoformat_enabled_javascript = ['prettierd']
let g:neoformat_enabled_typescript = ['prettierd']
let g:neoformat_enabled_json = ['jq']
let g:neoformat_enabled_markdown = ['prettierd']
let g:neoformat_enabled_ruby = ['rubocop']
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_go = ['goimports']
let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_java = ['clangformat']
autocmd BufWritePre * undojoin | Neoformat

" LSP
augroup MyLspServers
    autocmd!
    if executable('vscode-html-language-server')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'vscode-html',
            \ 'cmd': {server_info->['vscode-html-language-server', '--stdio']},
            \ 'whitelist': ['html', 'xhtml', 'xml'] })
    endif

    if executable('vscode-css-language-server')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'vscode-css',
            \ 'cmd': {server_info->['vscode-css-language-server', '--stdio']},
            \ 'whitelist': ['css', 'scss', 'less'] })
    endif

    if executable('typescript-language-server')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'tsserver',
            \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
            \ 'whitelist': ['javascript', 'typescript', 'javascript.jsx', 'typescript.tsx'] })
    endif

    if executable('vscode-json-language-server')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'vscode-json',
            \ 'cmd': {server_info->['vscode-json-language-server', '--stdio']},
            \ 'whitelist': ['json'] })
    endif

    if executable('marksman')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'marksman',
            \ 'cmd': {server_info->['marksman', 'server']},
            \ 'whitelist': ['markdown'] })
    endif

    if executable('solargraph')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'solargraph',
            \ 'cmd': {server_info->['solargraph', 'stdio']},
            \ 'whitelist': ['ruby'] })
    endif

    if executable('pyright-langserver')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'pyright',
            \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
            \ 'whitelist': ['python'] })
    endif

    if executable('gopls')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'gopls',
            \ 'cmd': {server_info->['gopls']},
            \ 'whitelist': ['go'] })
    endif

    if executable('rust-analyzer')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'rust-analyzer',
            \ 'cmd': {server_info->['rust-analyzer']},
            \ 'whitelist': ['rust'] })
    endif

    if executable('clangd')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd']},
            \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'] })
    endif

    if executable('jdtls')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'jdtls',
            \ 'cmd': {server_info->['jdtls']},
            \ 'whitelist': ['java'] })
    endif
augroup END

augroup MyLspMappings
    autocmd!
    autocmd User lsp_attach_buffers call s:SetupLspBufferMaps()
augroup END

function! s:SetupLspBufferMaps() abort
    nnoremap <buffer> gd          <Plug>(lsp-definition)
    nnoremap <buffer> gr          <Plug>(lsp-references)
    nnoremap <buffer> K           <Plug>(lsp-hover)
    nnoremap <buffer> <C-]>       <Plug>(lsp-definition)
    nnoremap <buffer> g0          <Plug>(lsp-document-symbol-search)
    nnoremap <buffer> gW          <Plug>(lsp-workspace-symbol-search)
    nnoremap <buffer> ga          <Plug>(lsp-code-action)
    nnoremap <buffer> <Leader>rn  <Plug>(lsp-rename)
    nnoremap <buffer> [g          <Plug>(lsp-previous-diagnostic)
    nnoremap <buffer> ]g          <Plug>(lsp-next-diagnostic)
endfunction

