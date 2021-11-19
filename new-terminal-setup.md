Setting up new Linux env:

- Set up colors using https://github.com/Mayccoll/Gogh
- Install zsh:

      sudo apt-get install zsh

- Install oh-my-zsh. Do this first since dotfiles repo will overwrite .zsh
  stuff:

      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  (If it complains that "user does not exist in /etc/passwd", ignore it - we'll
  set the default command later which will automatically run zsh)
- Set up GitHub SSH key: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent  
- Clone dotfiles repo:

      git clone git@github.com:awan1/dotfiler.git ~/.dotfiles

  then switch to correct branch, add `~/.dotfiles/bin` to path, and run
  `dot update`.
  This gets the dotfiles that I care about.
- Add gitignore file: `git config --global core.excludesfile ~/.gitignore_global`
- Install tmux. Set terminal default command to `tmux`. Restart shell.
  This should automatically start tmux + zsh (thanks to dotfiles).
- Install powerline for tmux and vim:

      pip install powerline-status

- Install tmux plugin manager:

      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  then `tmux source ~/.tmux.conf` to start tpm,
  then prefix-I(nstall) to install the plugins specified in .tmux.conf.
- Install Hack font: https://sourcefoundry.org/hack/. Then set Terminal to use
  it.
- Vim stuff:
  - Install Vundle:

        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    then launch vim and run `:PluginInstall`
  - Install Pathogen:

        mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  - Get Zenburn colors: copy colors folder from https://github.com/jnurmine/Zenburn
    to ~/.vim/colors

