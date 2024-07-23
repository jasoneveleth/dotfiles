require("noice").setup({
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
    {
      filter = { event = "msg_show", kind = "", find = "written", },
      opts = {skip = true}
    },
    {
      filter = { event = "msg_show", kind = "echomsg", find = "AutoSave", },
      opts = {skip = true}
    }
  },
  cmdline = {
    view = "cmdline_popup",
    opts = { buf_options = { filetype = "vim" } },
    icons = {
      ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
      ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
      [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
    },
  },
  commands = {
    history = {
      -- options for the message history that you get with `:Noice`
      -- https://github.com/folke/noice.nvim/blob/0fbbcb4ac680c5f7266ece47902923bfc42718df/lua/noice/config/views.lua#L67
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
    },
  },
})
