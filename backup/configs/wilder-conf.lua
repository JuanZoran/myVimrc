local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})


wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
  }),
  ['/'] = wilder.wildmenu_renderer({
    highlighter = wilder.basic_highlighter(),
  }),
}))

    wilder.set_option('renderer', wilder.popupmenu_renderer({
  pumblend = 20,
}))

wilder.set_option('renderer', wilder.popupmenu_renderer({
--    highlighter = wilder.lua_fzy_highlighter(),

--  highlighter = {
--     wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
--    wilder.lua_fzy_highlighter(),   -- requires fzy-lua-native vim plugin found
                                    -- at https://github.com/romgrk/fzy-lua-native
--   },
  highlights = {
    accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
  },
}))

