# Vim Cheatsheet

> My personal reference of Vim useful tricks

| Command | Description |
| --- | --- |
| `gf` | Open file under cursor |
| `Ctrl+w gf` | Open file under cursor in a new tab |
| `:ccl` | Close quickfix window |
| `f[pattern]` | Jump to pattern |
| `xp` | Swap letters |
| `Ctrl+a` | Increase number under cursor |
| `Ctrl+x` | Decrease number under cursor |
| `:e!` | Read updated file content from disk to active buffer |
| `Ctrl+n` | Toggle omni completion |
| `Ctrl+r=[equation]` | Evaluate a math equation (insert mode only) |
| `:wa` | Save all buffers |
| `:xa` | Save all buffers and exit |
| `:r file.txt` | Print the contents of `file.txt` into the current buffer |
| `:r !ls` | Print the list of all files of current directory into the current buffer |
| `:% s/word//gn` | Count the number of occurrences of `word` |
| `:noh` | Remove highlighted search results |
| `:ls` | List active buffers |
| `:buf n` | Open buffer `n` into the current panel |
| `:only` | Close all panels but the current one |
| `z1=` | Fix word typos automatically |

## Share yours

Know more useful tricks that are not listed here? Please, [let me know](/issues/new?title=Vim trick:) :v:
