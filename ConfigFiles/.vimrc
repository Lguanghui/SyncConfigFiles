" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" 设置大小写不敏感
set ignorecase
" 设置语言
let $LANG='en'
set langmenu=en
" 显示行号
set nu
" 设置高亮当前行
set cursorline		
" 设置语法高亮
syntax on
" 设置制表符所占空格数
set tabstop=4 
" 设置将连续数量的空格视为一个制表符
set softtabstop=4
" 设置自动缩进所使用的空格数
set shiftwidth=4
" 开启真彩色
set termguicolors
" 去除vi的一致性
set nocompatible
" 设置高亮括号匹配
set showmatch
" 设置缓存路径
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.
" 设置编码格式
set encoding=UTF-8
" 拷贝到系统剪切板
set clipboard=unnamed

" 主题色
" colorscheme molokai
colorscheme gruvbox

" vundle 环境设置
" 文件类型侦测
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" vundle管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

" themes
"  https://github.com/morhetz/gruvbox
Plugin 'morhetz/gruvbox'
" https://github.com/rakr/vim-one
" Plugin 'rakr/vim-one'
" https://github.com/sonph/onehalf/tree/master/vim
" Plugin 'sonph/onehalf' 

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'preservim/nerdtree'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'jiangmiao/auto-pairs'

" Markdown Plugins https://github.com/preservim/vim-markdown#basic-usage
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
" Markdown Preview https://github.com/iamcco/markdown-preview.nvim
Plugin 'iamcco/markdown-preview.nvim'
" 便捷表格插件
Plugin 'dhruvasagar/vim-table-mode'

" 侧边栏显示 markdown 目录以及程序变量等的插件
Plugin 'liuchengxu/vista.vim'

" Jekyll
Plugin 'parkr/vim-jekyll'
Plugin 'tpope/vim-liquid'

" 悬浮终端插件
Plugin 'voldikss/vim-floaterm'

" 调试工具
Plugin 'puremourning/vimspector'

" 图标
Plugin 'ryanoasis/vim-devicons'

" 文件查找插件
Plugin 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" 启动时长插件。命令：StartupTime
Plugin 'dstein64/vim-startuptime'

" Plugin 'alpertuna/vim-header'
Plugin 'Lguanghui/vim-header'

" 自动切换输入法插件
Plugin 'ybian/smartim'

" cmake 工具
" Plugin 'cdelledonne/vim-cmake'
Plugin 'ilyachur/cmake4vim'

" 代码注释插件
" gcc 注释当前行（不需要 leader 键）
" gc 注释选中行
" gcap 注释段落
" 251,254Commentary 注释 251 行到 254 行
Plugin 'tpope/vim-commentary'

" 插件列表结束
call vundle#end()

" 适应不同语言的智能缩进
filetype plugin indent on

" vim-powerline设置
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
" let g:airline_theme='luna'
set laststatus=2

" 设置 python 解释器路径（全局）
let g:ycm_python_interpreter_path = '/opt/homebrew/bin/python3'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = ['g:ycm_python_interpreter_path', 'g:ycm_python_sys_path']
let g:ycm_global_ycm_extra_conf = '/Users/liangguanghui/.vim/configs/global_extra_conf.py'

" YCM 配置。参考：http://howiefh.github.io/2015/05/22/vim-install-youcompleteme-plugin/
" 关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_filetype_whitelist = {
" 			\ "c":1,
" 			\ "cpp":1,
" 			\ "objc":1,
" 			\ "sh":1,
" 			\ "zsh":1,
" 			\ "zimbu":1,
" 			\ "python":1,
" 			\ "py":1,
" 			\ }

" leaderf 配置
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
" 快捷键绑定
" <leader> 键默认为 '\'。按完 '\' 要快速按后面的按键
" 可以通过重新设置改成其他的键位:
" let mapleader=","   "将前缀键定义为逗号
" let mapleader = "\<space>"   "利用转义符“\”将前缀键设置为空格键
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShortcutB = "<leader>fb"
" 排除搜索的文件夹和文件
let g:Lf_WildIgnore = {
       \ 'dir': ['.svn', '.git', '.hg', 'venv', '.vscode', '.SpaceVim.d', '.DS_Store', '__pycache__'],
       \ 'file': ['*.sw?', '~$*', '*.bak', '*.exe', '*.o', '*.so', '*.py[co]', '*.bin', '*.tmp']
       \}
" 显示隐藏文件
let g:Lf_ShowHidden = 1

" Jekyll 配置
let g:jekyll_post_extension = '.md'
let g:jekyll_post_template = [
      \ '---',
      \ 'title: "JEKYLL_TITLE"',
      \ 'layout: post',
      \ 'categories: []',
      \ 'tags: []',
      \ 'date: "JEKYLL_DATE"',
      \ 'typora-root-url: ..',
      \ '---',
      \ '']
let g:jekyll_serve_command = 'jekyll serve -w'

" vim-spector 配置
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_base_dir = '~/.vim/bundle/vimspector'

" Markdown Settings
" 设置自动调整目录窗口大小
let g:vim_markdown_toc_autofit = 1
" 设置在新 tab 中打开另一个文件
let g:vim_markdown_edit_url_in = 'tab'
" 设置禁止自动折叠
let g:vim_markdown_folding_disabled = 1
" 设置从第几级标题开始折叠(从 1 开始)
let g:vim_markdown_folding_level = 5
" Highlight YAML front matter
let g:vim_markdown_frontmatter = 1

" file header 配置
let g:header_field_author = 'Guanghui Liang'
let g:header_field_author_email = 'meetguanghuiliang@gmail.com'
let g:header_blank_line = 1

" 自动切换输入法插件
let g:smartim_default = 'com.apple.keylayout.ABC'

" 代码注释插件
" 为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
" 修改注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s

" 设置 NERDTree 快捷键
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" 和翻页快捷键冲突
" nnoremap <C-f> :NERDTreeFind<CR>

" 当前 F 键功能：
"	F2：一键运行代码（自己写的）
"	F5：vimspector 运行代码（用于 debug）

" 一键运行代码
map <F2> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
elseif &filetype == 'sh'
    :!time bash %
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!firefox % &"
elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
endif
	endfunc



"""""""""""""""""""""""
" 一些常用指令
"""""""""""""""""""""""

" 左/右缩紧
" << / >>
"
" 整行大写
" gUU
"
" 整行小写
" guu
