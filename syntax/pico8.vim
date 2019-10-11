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

let b:current_syntax = "pico8"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: et ts=8 sw=2
