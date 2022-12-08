-- Daniel changes
-- =================

-- echo "daniel"




-- relative number
vim.opt.relativenumber = true
-- whole word includes -
vim.opt.iskeyword:append("-")

-- blame line configs
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_formatter_opts.relative_time = true
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 100

-- git signs characters
lvim.builtin.gitsigns.opts.signs.add.text = '+'
lvim.builtin.gitsigns.opts.signs.change.text = '~'
lvim.builtin.gitsigns.opts.signs.delete.text = 'X'


-- Key bindings
-- =============
-- tabs
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<CR>"

-- Center screen when going throw search results
lvim.keys.normal_mode["n"] = "nzz"
lvim.keys.normal_mode["N"] = "Nzz"

-- Search and replace for selected text
lvim.keys.visual_mode["<C-s>"] = "y:%s/<C-r>\"//g<left><left>"

-- Run a macro in q regiester
lvim.keys.normal_mode["<S-q>"] = "@q"

-- Change text and don't use clipboard (copy to black hole)
lvim.keys.normal_mode["c"] = '"_c'

-- Add new line in noraml mode
lvim.keys.normal_mode["<CR>"] = "^i<cr><esc>"

-- Move in insert mode
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"

-- lsp
lvim.keys.insert_mode["<C-h>"] = "<esc>:lua vim.lsp.buf.signature_help()<CR>gi"

-- move line
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2 <CR>gv=gv"

-- Run fzf like vscode find files
local vscode_files = "call fzf#run({ 'window': { 'width': 0.6, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' }, 'sink': 'e', 'options': '--prompt FindFile:' })"

-- Add leader options
-- ======================
-- aoc
lvim.builtin.which_key.mappings["g"]["a"] = { " /const sample<cr>f`p0 h", "aoc" }

-- lazy git
lvim.builtin.which_key.mappings["l"]["g"] = { "<cmd>LazyGit<cr>", "Lazy Git" }

-- vscode_files
lvim.builtin.which_key.mappings["p"] = { "<CMD>" .. vscode_files .. "<CR>", "Find file" }

-- findText
-- lvim.builtin.which_key.mappings["f"] = { "<CMD>Rg<CR>", "Find text" }

-- new file
lvim.builtin.which_key.mappings["n"] = { "<CMD>ene!<CR>", "New File" }

-- Select All
lvim.builtin.which_key.mappings["s"]["a"] = { "ggVG", "Select All" }

-- lvim.builtin.which_key.mappings["g"]["b"] = { "<cmd>Git blame --date=relative<cr>", "Open blame" }
-- lvim.builtin.which_key.mappings["g"]["d"] = { "<cmd>DiffviewOpen<cr>", "Diff View Open" }
-- lvim.builtin.which_key.mappings["g"]["q"] = { "<cmd>DiffviewClose<cr>", "Diff View Close" }
-- lvim.builtin.which_key.mappings["g"]["h"] = { "<cmd>DiffviewFileHistory %%<cr>", "Diff View History" }
-- lvim.builtin.which_key.mappings["g"]["s"] = { "<cmd>GitFiles?<cr>", "GitFiles?" }


-- Add eslint linter
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "javascript", "typescript", "typescriptreact" } },
}

-- Add prettier
-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "typescript", "typescriptreact" },
  },
}

-- Do not change directories when open files
lvim.builtin.project.manual_mode = true

lvim.plugins = {
  -- { "sindrets/diffview.nvim" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  -- { "justinmk/vim-sneak" },
  { "kdheepak/lazygit.nvim" },
  { "catppuccin/nvim" },
  -- { "mg979/vim-visual-multi" },
  -- { "psliwka/vim-smoothie" },
  -- { "preservim/tagbar" },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  { "christoomey/vim-tmux-navigator" }
  -- { "yuki-yano/fzf-preview.vim" },
  -- { "christoomey/vim-tmux-navigator" },
  -- { "unblevable/quick-scope" },
  -- { "ellisonleao/glow.nvim" },
  -- { "ruanyl/vim-gh-line" },
  -- { "stsewd/fzf-checkout.vim" },
  -- { "junegunn/limelight.vim" },
  -- { "junegunn/goyo.vim" },
}

--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "catppuccin"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.project.manual_mode = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.terminal.direction = 'horizontal'
-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
