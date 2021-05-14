let s:fmt_commands_local = {
      \ 'rust': 'rustfmt',
      \ 'go': 'gofmt -w',
      \ 'c': 'clang-format -i -style=google',
      \ 'cpp': 'clang-format -i -style=google',
      \ 'javascript': 'prettier --write',
      \ 'typescript': 'prettier --write',
      \ 'ruby': 'rufo',
      \ }

let g:fmt_commands = get(g:, 'fmt_commands', {})
for i in keys(g:fmt_commands)
  let s:fmt_commands_local[i] = g:fmt_commands[i]
endfor

function! fmt#format#format() abort
  let current_filetype = &filetype

  if !has_key(s:fmt_commands_local, l:current_filetype)
    echoerr "Filetype " . current_filetype . " is not set!"
    return
  endif

  let fmt_command = split(s:fmt_commands_local[current_filetype])
  if !executable(fmt_command[0])
    echoerr "Command " . fmt_command[0] . " is not found!"
    return
  endif

  let fmt_command_with_path = add(l:fmt_command, expand('%'))

  call job_start(l:fmt_command_with_path)
endfunction
