local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('svelte', {
  s('tss', {
    t '<script lang="ts">',
    i(1),
    t '</script>',
  }),
})
