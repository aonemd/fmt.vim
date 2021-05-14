let s:fmt_commands_local = {
      \ 'rust': 'rustfmt',
      \ 'go': 'gofmt -w',
      \ }

function! fmt#format#format() abort
  let current_filetype      = &filetype
  let fmt_command           = split(s:fmt_commands_local[current_filetype])
  let fmt_command_with_path = add(l:fmt_command, expand('%'))

  call job_start(l:fmt_command_with_path)
endfunction
