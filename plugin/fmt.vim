if exists('g:loaded_fmt') | finish | endif
let g:loaded_fmt = 1

command! Fmt call fmt#format#format()
