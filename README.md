# git_browse.nvim

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Morozzzko/git_browse.nvim/default?style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

A simple neovim plugin to open GitLab or GitHub and browse the current file.

It is basically like `:Gbrowse` and `:Gblame` from [vim-fugitive](https://github.com/tpope/vim-fugitive) + [vim-rhubarb](https://github.com/tpope/vim-rhubarb), but tailored to my specific use-case: sharing links to repos, files, and blames. Which means it is a bit smarter in edge-cases.

## Features

* Browse & blame even if the current branch is not pushed to origin
* Browse a directory 
* Generate GitLab links 
* Works with GitLab orgs/projects/namespaces

## Install 

Using Packer:

```lua
use { "Morozzzko/git_browse.nvim" }
```

## Commands

* `:Blame` – open blame
* `:Browse` – open tree for directory / blob for file


## Things to do 

There are a few things which are not implemented because I didn't have the specific need for it:

* Support for any OS besides macOS
* Support for complex origin names
* Thorough testing with custom GitLab setups
* Blame to specific line

PRs are welcome, though. Feel free to send one! I'll gladly accept it as long as it has a reasonable amount of tests and keeps backwards compatibility
