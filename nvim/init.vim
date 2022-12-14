if exists('g:vscode')

else
	call plug#begin()
	Plug 'preservim/nerdtree'

	Plug 'google/vim-maktaba'
	Plug 'google/vim-codefmt'
	Plug 'google/vim-glaive'

	Plug 'ctrlpvim/ctrlp.vim'

	" Plug 'wincent/command-t'
	Plug 'rafi/awesome-vim-colorschemes'

	" Plug 'OmniSharp/omnisharp-vim'
	Plug 'dense-analysis/ale'

	call plug#end()

	colorscheme sonokai
	set number
	set relativenumber
	set cmdheight=1

	set noswapfile

	" disable ctrl-z suspending vim by adding remapping it to nop
	nnoremap <C-z> <nop>

	set noexpandtab
	set softtabstop=0
	set tabstop=4
	set shiftwidth=0 "> and < moves same distance as tab key (tabstop)

	"" Split navigation
	set splitbelow
	set splitright
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

	"" Search clear
	nnoremap <F3> :noh<CR>

	"" Reset commandline height
	nnoremap <F4> :set cmdheight=0<CR>

	"" Quick fix list navigation
	nnoremap <F7> :cp<CR>
	nnoremap <F8> :cn<CR>



	"" NERDTree config
	" nnoremap <leader>n :NERDTreeFocus<CR>
	" nnoremap <C-n> :NERDTree<CR>
	nnoremap <C-t> :NERDTreeToggle<CR>
	" nnoremap <C-f> :NERDTreeFind<CR>

	" autocmd VimEnter * NERDTree
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
				\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

	let NERDTreeIgnore = ['\.meta$']
	nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

	"" Formatters
	augroup autoformat_settings
		autocmd FileType bzl AutoFormatBuffer buildifier
		autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
		autocmd FileType dart AutoFormatBuffer dartfmt
		autocmd FileType go AutoFormatBuffer gofmt
		autocmd FileType gn AutoFormatBuffer gn
		autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
		autocmd FileType java AutoFormatBuffer google-java-format
		autocmd FileType python AutoFormatBuffer yapf
		" Alternative: autocmd FileType python AutoFormatBuffer autopep8
		autocmd FileType rust AutoFormatBuffer rustfmt
		autocmd FileType vue AutoFormatBuffer prettier
		autocmd FileType swift AutoFormatBuffer swift-format
	augroup END

	" let g:ale_linters = {
	" \ 'cs': ['OmniSharp']
	" \}
	"
	let g:ale_fixers = {
				\ '*': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
				\ 'cs': ['dotnet-format'],
				\}
	let g:ale_fix_on_save = 1




	let g:markdown_folding = 1
	au BufRead,BufNewFile *.rmd setfiletype markdown

	" autocmd FileType markdown nnoremap <F9> :!


	" ctrlp-vim
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlPLastMode'
	let g:ctrlp_working_path_mode = '0'
	set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.meta
	" let g:ctrlp_custom_ignore = {
	" 			\ 'dir': '\v[\/]\(.git|.hg|svn)$',
	"  			\ 'file': '\v\.(exe|so|dll|meta)$',
	" }
	" 			\ 'file': '\v\.(exe|so|dll|meta)$',
	" 			\}
	" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

endif
