# nvim.config

## Introduction

This is my neovim configuration. It is based on a fork of [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
called [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim).

## Installation

### Install Neovim

Install the latest stable version of [neovim](https://github.com/neovim/neovim). I prefer to [build from source](https://github.com/neovim/neovim/blob/master/BUILD.md).

### Install External Dependencies

External Requirements:

- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If want to write Golang, you will need `go`
  - etc.

### Setup your neovim config

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

#### Recommended Step

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can modify, then install by cloning the
fork to your machine using one of the commands below, depending on your OS.

> **NOTE**
> Your fork's url will be something like this:
> `https://github.com/<your_github_username>/config.nvim.git`

#### Clone the repo

This command will clone the repo to your `~/.config/nvim` folder:

```sh
git clone git@github.com:lylekuykendall/nvim.config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Alternatively, you may wish to clone the repo elsewhere and create a symlink to `~/.config/nvim` as follows:

```sh
git clone git@github.com:lylekuykendall/nvim.config.git && sudo ln -s /path/to/cloned/repo ~/.config/nvim
```

## Usage

Start Neovim

```sh
nvim
```

Lazy will install all the default plugins the first time you open neovim. It will also automatically
install any new plugins you create files for in the `plugins` folder. `lazy-bootstrap.lua` is
the file that bootstraps the initial install of the config, and `lazy-plugins.lua` is
responsible for installing the plugins defined in the `plugins` folder.

### Learning keymaps

By default, `<space>` is the leader key. When you see `<leader>` in keymappings, it refers to the leader key.
Leader key can be changed by updating these two lines in `init.lua`

```lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
```

These two files have most of the keymaps and options being used:

- `options.lua` for global neovim options
- `keymaps.lua` for global neovim keymaps
- `telescope.lua` for telescope-specific (fuzzy file search & more) keymaps

#### Telescope keymaps

- `<leader>sf` for fuzzy file search
- `<leader>sn` for fuzzy file search within neovim config files
- `<leader>sg` for fuzzy grep for text
- `<leader>sw` for fuzzy grep for word under cursor
- `<leader>sk` for fuzzy keymap search

### Changing the color scheme

There are a variety of bundled themes. Try `:Telescope colorscheme` to open a picker and preview window.

### Plugins worth learning about

There are a few plugins worth learning a little more about:

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - configured in `lspconfig.lua`
  - There are several language servers installed by default using Mason (see `:h Mason`)
  - These default language servers are listed in the `ensure_installed` table on line 221 of `lspconfig.lua`.
    - Add additional servers as you see fit, see [available servers](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers).
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - configured in `telescope.lua`
- [nvim-cmp (completion)](https://github.com/hrsh7th/nvim-cmp) - configured in `cmp.lua`
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - configured in `treesitter.lua`
  - Treesitter has support for several languages installed by default, listed in `ensure_installed` on line 6 of `treesitter.lua`
  - Add additional languages to this table, or install manually with `:TSInstall <language>`

Use `:Lazy` to view current plugin status. Hit `q` to close the window.

### Plugins requiring additional configuration

#### TagBar

Tagbar is a sidebar you can toggle open/closed with `<F8>`. It requires that you 
have [ctags](https://github.com/universal-ctags/ctags?tab=readme-ov-file#how-to-build-and-install) 
intalled and on your path.

#### Codeium

[codeium.nvim](https://github.com/Exafunction/codeium.nvim) is an ai completion tool that you can use 
as a source for your completion suggestions. You'll need to run `:Codeium auth` and use the link to get an
api token to give to the plugin. Next, you'll need to find and uncomment the two locations in this config
where codeium can be used as a source. Try `fg` or `<leader>sg` and grepping for `codeium` to find these lines.
