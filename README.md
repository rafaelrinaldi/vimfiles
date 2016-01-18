# vimfiles

> My Vim setup.

<a href="https://dribbble.com/shots/1435854-Vim-Replacement-Icon"><img src="./vim.png" width="120" title="Vim logo by @jasonlong" /></a>

## Install

```sh
$ git clone --recursive git@github.com:rafaelrinaldi/vimfiles.git
$ cd vimfiles
$ ./install
```

## Setup

* Before doing anything it will create a backup at `/tmp/vim_backup` so you can restore from there if needed
* You have the option to use :sparkles: [Neovim](http://neovim.org) :dizzy: instead of Vim (it'll take care of making it work properly)
* If [Homebrew](http://brew.sh) is available, will try to update the editor to its latest version
* Uses [Vundle](https://github.com/VundleVim/Vundle.vim) to manage plugins (including Vundle itself)
* Automatically download and installs Vundle plugins
* Read color scheme from the user after installing all plugins (default is `solarized`)

## Options

### `--no-symbols`

Do not add symbols to install the output.

## License

MIT © [Rafael Rinaldi](http://rinaldi.io)
