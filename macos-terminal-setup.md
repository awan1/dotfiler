Setting up new MacOS env:

- Install homebrew following instructions at: [https://brew.sh/](https://brew.sh/)
- Install zsh:

      brew install zsh

- Follow remaining instructions in `new-terminal-setup.md`, using `brew` instead of
  `apt-get` as necessary

- When installing `powerline-status`, following the instructions about the error
  of "externally managed environment", do `brew install pipx` then use `pipx` to
  install powerline?
- Needed to adjust `.tmux.conf` to point to correct path of zsh on MacOS
