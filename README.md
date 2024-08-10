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

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim. Individual plugins and
their configurations can be found in the `plugins` folder.
