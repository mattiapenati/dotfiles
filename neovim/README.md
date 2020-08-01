## Configuring Neovim

### Install vim-plug

Download plug.vim and put it in the “autoload” directory.

### Unix

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Configure vim-plug

Add a vim-plug section to your `stdpath('config') . '/init.vim'` file

1. edit `init.vim` file `:exe 'edit '.stdpath('config').'/init.vim'`
2. begin the section wit `call plug#begin()`
3. list the plugins with `Plug` commands
4. call `plug#end()`` to update ``&runtimepath` and initialize plugin system 

Reload `.vimrc` (`:so %`) and `:PlugInstall` to install plugins.

*Note: to save the file use `:!mkdir -p %:h` then `:w`.*

#### Example

```vim
call plug#begin(stdpath('data').'/plugged')
Plug '...'
call plug#end()
```

### Setting up the color scheme

```vim
Plug 'morhetz/gruvbox'
...
set termguicolors
colorscheme gruvbox
```

### Using coc.nvim

`coc.nvim` is an intellisense engine for Vim8 & Neovim, full language server
protocol support as VSCode.

`coc.nvim` uses jsonc as configuration file format, the same as VSCode, to get
correct comment correct comment highlighting, you can install `vim-jsonc`.

There're two types of user configuration files.

* The user configuration is named as `coc-settings.json`. Run the command
  `:CocConfig` to open your user configuration file.
* The workspace configuration should be named `coc-settings.json` and be in the
  directory `.vim`. Run the command `:CocLocalConfig` to open your workspace
  configuration file.

The active configuration is the merged result of the 'default', 'user' and
'workspace' configuration files, the later one has the highest priority.

To enable intellisense for `coc-settings.json`, install the json language
extension coc-json with `:CocInstall coc-json'.
