# devops-configs

Configs for tools our developers and operators use

## Getting started

1. Clone this repo:
   `git clone https://github.com/naturalis/devops-configs`

## Neovim

1. Install neovim:
   ```sh
   sudo apt install neovim
   ```
2. Install vim-plug:
   ```sh
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. Add a link to the nvim configuration:
   ```sh
   ln -s ~/code/devops-configs/nvim ~/.config/
   ```

4. Start neovim:
   `nvim`

5. Install plugins:
   ```sh
   :PlugInstall
   ```
