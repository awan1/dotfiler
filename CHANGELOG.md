0.3.0 (2014-11-25)
==================

* Fixed case when `~/Library` already exists and we need to symlink `~/.dotfiles/osx/Library/Keybinding` into it.
* Add [svetlyak40wt/dot-osx](https://github.com/svetlyak40wt/dot-osx) to the list of [available environments](https://github.com/svetlyak40wt/dotfiler#environments).

0.2.0 (2014-04-02)
==================

* Now command `update` have `--skip-pull` option which is able
  to make huge impact to the update speed.

0.1.0 (2014-01-31)
==================

First full featured release. Right now it is able to:

* create symlinks to configs, spreaded among different environments;
* track if symlink target has disappeared;
* add new environments by url, pointing to a repository, or by github
  shortcut;
* show status of environments (uncommited/unpushed files).