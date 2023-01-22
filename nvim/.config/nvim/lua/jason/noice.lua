require("noice").setup({
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
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
})
