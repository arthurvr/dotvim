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

## Contributing

Improvements are welcome! You're welcome to make suggestions for new things too, however, I'm going to decline if it's not of personal value to me. [Dotfiles are meant to be forked](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).


## Credits

This repo is basically a collection of things I stole from other people. Namely:

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
* [Pascal Hartig](https://github.com/passy/dotvim)
* [Cătălin Mariș](https://github.com/alrra/dotfiles)
* [Nicolas Gallagher](https://github.com/necolas/dotfiles)
* [Janus](https://github.com/carlhuda/janus)
* ...
