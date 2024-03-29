local wk = require("which-key")

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 20
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

wk.register({
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    n = { "<cmd>Telescope help_tags<cr>", "Help tags" },
  },
  i = { "<cmd>IndentBlanklineToggle<cr>", "Toggle IndentBlankline" },
  [" "] = { "<cmd>set hlsearch!<cr>", "Toggle search highlight" },
  s = "Strip whitespace",
  p = { "<cmd>set paste!<cr>", "Toggle paste" },
  P = { "<cmd>Prettier<cr>", "Prettier" },
  q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Diagnostics locations" },
  l = {
    name = "LSP",
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>" , "Go to implementation"},
    k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Add workspace folder" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Formatting" },
    I = { "<cmd>LspInfo<cr>", "Lsp Info" },
    S = { "<cmd>LspStart<cr>", "Lsp Start" },
    X = { "<cmd>LspStop<cr>", "Lsp Stop" },
    R = { "<cmd>LspRestart<cr>", "Lsp Restart" },
  },
  w = {
    name = "Workspace",
    a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
    r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
    l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "Remove workspace folder" },
  },
  D = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show type" }
}, { prefix = "<leader>" })

vim.opt.timeoutlen = 200
