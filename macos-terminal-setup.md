Setting up new MacOS env:

- Install homebrew following instructions at: [https://brew.sh/](https://brew.sh/)
- Install zsh:

      brew install zsh

- Follow remaining instructions in `new-terminal-setup.md`, using `brew` instead of
  `apt-get` as necessary

- When installing `powerline-status`, need to ignore instructions about
  "externally managed environment" and do this:

      pip3 install --break-system-packages --user powerline-status

- Needed to adjust `.tmux.conf` to point to correct path of zsh on MacOS
