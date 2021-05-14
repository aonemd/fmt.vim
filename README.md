<div align="center">
  <h1>
    fmt.vim
  </h1>

  Generic code formatting interface for Vim
</div>

## Installation

Install `aonemd/fmt.vim` using a plugin manger such as:
[vim-plug](https://github.com/junegunn/vim-plug),
[NeoBundle](https://github.com/Shougo/neobundle.vim),
[Vundle](https://github.com/gmarik/Vundle.vim), or
[Pathogen](https://github.com/tpope/vim-pathogen).

## Usage

The plugin provides the command: `Fmt` that delegates the auto-formatting to a
formatter. Currently, these formatters are used:

| Language      | Formatter     | Command used  |
| ------------- |:-------------:| :-----        |
| Rust          | [rustfmt](https://github.com/rust-lang/rustfmt)  | `rustfmt`         |
| Go            | [gofmt](https://pkg.go.dev/cmd/gofmt)    |   `gofmt -w`         |
| C             | [clang-format](https://clang.llvm.org/docs/ClangFormat.html) |    `clang-format -i -style=google`         |
| C++           | [clang-format](https://clang.llvm.org/docs/ClangFormat.html) | `clang-format -i -style=google`         |
| JavaScript    | [prettier](https://prettier.io/)      |   `prettier --write`         |
| TypeScript    | [prettier](https://prettier.io/)      |    `prettier --write`         |
| Ruby          | [rufo](https://github.com/ruby-formatter/rufo)      |    `rufo`         |

User-defined commands can be used through the global variable `g:fmt_commands`
which overwrites the default commands above.

In order to use auto-formatting on buffer saving, you can add the following to
`~/.vimrc`:

```viml
autocmd! BufWrite * Fmt
```

## License

See [LICENSE](https://github.com/aonemd/fmt.vim/blob/master/LICENSE).
