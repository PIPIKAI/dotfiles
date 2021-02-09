" 主题 
colorscheme desert
syntax on
filetype on
set cindent
set backspace=2     "设置退格键可用
set nu "行号
set tabstop=4
set autoread        "设置当文件在外部被修改，自动更新该文件
set shiftwidth=4
"字体
set guifont=Consolas:h17:b:cDEFAULT

map <F5> :call RunC() <CR>

" 运行c++
func! RunC()
	exec "w"
	exec "!g++ -Wall % -o %<.exe &&  %<.exe"
  exec "! del %<.exe"
endfunc

"编译单个
nnoremap <silent> <F9> :AsyncRun g++ -Wall % -o %<.exe &&  %<.exe <cr>

set history=500     "保留历史记录

"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
set incsearch "增量查找

"===========================
"状态栏的设置
"===========================
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行


"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"vim提示信息乱码的解决
language messages zh_CN.utf-8

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" map <C-A> ggVG"+y



" Mouse behavior (the Windows way)
" behave mswin

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


map <F11> :call SetTitle()<CR>
func SetTitle()
let l = 0
let l = l + 1 | call setline(l,'#include <iostream>')
let l = l + 1 | call setline(l,'#include <cstdio>')
let l = l + 1 | call setline(l,'#include <cstring>')
let l = l + 1 | call setline(l,'#include <algorithm>')
let l = l + 1 | call setline(l,'#include <string>')
let l = l + 1 | call setline(l,'#include <cmath>')
let l = l + 1 | call setline(l,'#include <cstdlib>')
let l = l + 1 | call setline(l,'#include <vector>')
let l = l + 1 | call setline(l,'#include <queue>')
let l = l + 1 | call setline(l,'#include <set>')
let l = l + 1 | call setline(l,'#include <map>')
let l = l + 1 | call setline(l,'')
let l = l + 1 | call setline(l,'using namespace std;')
let l = l + 1 | call setline(l,'')
let l = l + 1 | call setline(l,'int main()')
let l = l + 1 | call setline(l,'{')
let l = l + 1 | call setline(l,'    ')
let l = l + 1 | call setline(l,'    return 0;')
let l = l + 1 | call setline(l,'}')
endfunc


" 插件们 plugin

call plug#begin('~/.vim/plugged')
Plug 'skywind3000/quickmenu.vim'
Plug 'skywind3000/asyncrun.vim'
call plug#end()

