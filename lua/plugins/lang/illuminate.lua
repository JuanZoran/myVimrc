-- default configuration
require('illuminate').configure {
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
    },
    delay = 100,
}
