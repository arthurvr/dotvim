# dotvim

> My personal Vim configuration

## Setup

Clone this repo (or your fork) and run the `dotvim` script.

```
$ ./dotvim
```

This script will link all configuration files and plugins. When running this, make sure you have a backup of your old configuration and **DON'T** run this script if you don't fully understand what it does!


## `~/.vimrc.local`

If the `~/.vimrc.local` file exists, it will be automatically sourced after `~/.vimrc`, thus, allowing its content to add or overwrite the settings from `~/.vimrc`. I use this for temporary changes or simply things I don't want in this repo.

