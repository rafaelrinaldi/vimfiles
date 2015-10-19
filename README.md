# vimfiles

> My Vim setup.

## Install

```sh
$ git clone --recursive git@github.com:rafaelrinaldi/vimfiles.git
$ cd vimfiles
$ ./install
```

## Setup

* Before doing anything it will create a backup at `/tmp/vim_backup` so you can restore from there if needed
* If [Homebrew](http://brew.sh) is available, will try to update Vim to the latest version
* Uses [Vundle](https://github.com/VundleVim/Vundle.vim) to manage plugins (including Vundle itself)
* Automatically download and installs Vundle plugins
* Read color scheme from the user after installing all plugins (default is `solarized`)

## License

MIT © [Rafael Rinaldi](http://rinaldi.io)
