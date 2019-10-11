" Vim syntax file
" For the Pico-8 - inherits from  the builtin VIM lua 5.2 syntax

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let lua_version = 5
let lua_subversion = 2

" inherit lua syntax
" according to https://stackoverflow.com/a/16230190
runtime! syntax/lua.vim syntax/lua/*.vim

" override function block to use matchgroup pico8FuncDef instead of luaFunction
syn region luaFunctionBlock transparent matchgroup=pico8FuncDef start="\<function\>" end="\<end\>" contains=ALLBUT,luaTodo,luaSpecial,luaElseifThen,luaElse,luaThenEnd,luaIn

" pico-8 functions
syn keyword pico8Func clip pget pset sget
syn keyword pico8Func sset fget fset print
syn keyword pico8Func cursor color cls camera
syn keyword pico8Func circ circfill line rect
syn keyword pico8Func rectfill pal palt spr
syn keyword pico8Func sspr add del foreach
syn keyword pico8Func btn btnp sfx music
syn keyword pico8Func mget mset map peek
syn keyword pico8Func poke memcpy reload cstore
syn keyword pico8Func memset max min mid
syn keyword pico8Func flr cos sin atan2
syn keyword pico8Func sqrt abs rnd srand
syn keyword pico8Func band bor bxor bnot
syn keyword pico8Func shl shr sub all pairs
syn keyword pico8Func assert type setmetatable
syn keyword pico8Func cocreate coresume costatus yield
syn keyword pico8Func sgn stat cartdata dget dset

syn region pico8NonCode matchgroup=pico8Section start="__gfx__" end="notmatch"
syn region pico8NonCode matchgroup=pico8Section start="__sfx__" end="notmatch"
syn region pico8Header matchgroup=pico8Section start="^pico-8 cartridge" end="__lua__"

hi def link pico8Func Type
hi def link pico8FuncDef PreProc
hi def link pico8NonCode Folded
hi def link pico8Header Folded
hi def link pico8Section Folded

let b:current_syntax = "pico8"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: et ts=8 sw=2
