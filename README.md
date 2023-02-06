<!--toc:start-->

- [配置结构](#配置结构)
<!--toc:end-->

# 配置结构

```
lua
├── core
│   ├── autocmd.lua
│   ├── base.lua
│   ├── init.lua
│   └── map.lua
├── lsp
│   ├── conf
│   │   ├── clangd.lua
│   │   ├── gopls.lua
│   │   ├── grammarly.lua
│   │   └── sumneko_lua.lua
│   ├── handlers.lua
│   ├── init.lua
│   └── saga.lua
├── neovide
│   └── compiled.lua
├── plugins
│   ├── dap
│   │   └── init.lua
│   ├── lang
│   │   ├── cmp.lua
│   │   ├── init.lua
│   │   ├── textobjects.lua
│   │   ├── treesitter.lua
│   │   └── ufo.lua
│   ├── telescope
│   │   ├── base.lua
│   │   ├── harpoon.lua
│   │   ├── init.lua
│   │   └── refactor.lua
│   ├── tools
│   │   ├── backup.lua
│   │   ├── gitsigns.lua
│   │   ├── init.lua
│   │   ├── leap.lua
│   │   ├── session.lua
│   │   ├── todo-comments.lua
│   │   └── which-key.lua
│   └── ui
│       ├── alpha.lua
│       ├── init.lua
│       ├── lualine.lua
│       ├── noice.lua
│       ├── nvim_tree.lua
│       ├── smooth.lua
│       └── theme
│           ├── catp.lua
│           ├── dracula.lua
│           ├── everforest.lua
│           ├── github.lua
│           ├── kanagawa.lua
│           ├── nordic.lua
│           └── override.lua
├── snips
│   ├── all.lua
│   ├── c.lua
│   ├── cpp.lua
│   ├── go.lua
│   ├── init.lua
│   ├── lua.lua
│   ├── markdown.lua
│   ├── python.lua
│   └── sh.lua
├── template
│   ├── init.lua
│   └── src
│       ├── __all__.c
│       ├── __all__-component-__all__-__all__.lua
│       ├── __all__.gitignore
│       ├── __all__-lsp-conf-__all__.lua
│       ├── __all__.sh
│       ├── __all__-snips-__all__.lua
│       ├── __all__.zsh
│       └── test___all__.cpp
└── util
    ├── init.lua
    ├── map.lua
    ├── plugin.lua
    └── string.lua
```
