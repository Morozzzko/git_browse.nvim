# A Neovim Plugin Template

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ellisonleao/nvim-plugin-template/default?style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

A template repository for Neovim plugins.

## Using it

Via `gh`:

```
$ gh repo create my-plugin -p ellisonleao/nvim-plugin-template
```

Via github web page:

Click on `Use this template`

![](https://docs.github.com/assets/cb-36544/images/help/repository/use-this-template-button.png)

## Features and structure

- 100% Lua
- Github actions to run tests and check for formatting errors (Stylua)
- Tests created with [busted](https://olivinelabs.com/busted/) + [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

### Plugin structure

```
.
├── lua
│   ├── git_browse
│   │   └── module.lua
│   └── git_browse.lua
├── Makefile
├── plugin
│   └── git_browse.lua
├── README.md
├── tests
│   ├── minimal_init.lua
│   └── git_browse
│       └── git_browse_spec.lua
```
