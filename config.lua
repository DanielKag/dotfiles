vim.opt.relativenumber = true
vim.opt.iskeyword:append("-")
vim.opt.expandtab = false

lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_formatter_opts.relative_time = true
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 100
lvim.builtin.gitsigns.opts.signs.add.text = '+'
lvim.builtin.gitsigns.opts.signs.change.text = '~'
lvim.builtin.gitsigns.opts.signs.delete.text = 'X'


lvim.builtin.project.manual_mode = true



vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

vim.g['sneak#label'] = 1



-- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs + 1] = { "lazygit", "<leader>tg", "LazyGit1", "float" }
-- local fzfLayout = {}
-- fzfLayout.down = '40%'



-- vim.g.fzf_layout = fzfLayout


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
-- lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping

-- Open search and replace in command line
lvim.keys.normal_mode["<C-s>"] = ":%s//g<left><left>"

-- Center screen when going throw search results
lvim.keys.normal_mode["n"] = "nzz"

lvim.keys.normal_mode["N"] = "Nzz"

-- Search and replace for selected text
lvim.keys.visual_mode["<C-s>"] = "y:%s/<C-r>\"//g<left><left>"

-- Find all occcurences for selected text
lvim.keys.visual_mode["<S-f>"] = "y/<C-r>\"<cr>"

-- Disable ex mode
-- lvim.keys.normal_mode["<S-q>"] = "<nop>"

-- Run a macro in q regiester
lvim.keys.normal_mode["<S-q>"] = "@q"

-- Tab jump between pairs
-- There's a bug here that it make C-I also be %
-- lvim.keys.normal_mode["<tab>"] = "%"

-- Change text and don't use clipboard (copy to black hole)
lvim.keys.normal_mode["c"] = '"_c'

-- Add new line in noraml mode
lvim.keys.normal_mode["<CR>"] = "^i<cr><esc>"

-- Delete char in noraml mode
-- lvim.keys.normal_mode["<BS>"] = "i<BS><Esc>`^"

lvim.keys.normal_mode["gk"] = "vim.lsp.buf.hover"


-- Move in insert mode
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
lvim.keys.insert_mode["<C-h>"] = "<Left>"

lvim.keys.insert_mode["<C-f>"] = "<esc><esc>:BLines!<CR>"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

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

-- Use which-key to add extra bindings with the leader-key prefix


-- lvim.builtin.which_key.mappings["g"]["d"] = { "<c>DiffviewOpen<cr>", "Diff view open" }


local vscode_files = "call fzf#run({ 'window': { 'width': 0.6, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' }, 'sink': 'e', 'options': '--prompt FindFile:' })"
lvim.builtin.which_key.mappings["l"]["g"] = { "<cmd>LazyGit<cr>", "Lazy Git" }
lvim.builtin.which_key.mappings["p"] = { "<CMD>" .. vscode_files .. "<CR>", "Find file" }

lvim.builtin.which_key.mappings["f"] = { "<CMD>Rg<CR>", "Find text" }
lvim.builtin.which_key.mappings["n"] = { "<CMD>ene!<CR>", "New File" }

lvim.builtin.which_key.mappings["g"]["b"] = { "<cmd>Git blame --date=relative<cr>", "Open blame" }
lvim.builtin.which_key.mappings["g"]["d"] = { "<cmd>DiffviewOpen<cr>", "Diff View Open" }
lvim.builtin.which_key.mappings["g"]["q"] = { "<cmd>DiffviewClose<cr>", "Diff View Close" }
lvim.builtin.which_key.mappings["g"]["h"] = { "<cmd>DiffviewFileHistory %%<cr>", "Diff View History" }
lvim.builtin.which_key.mappings["g"]["s"] = { "<cmd>GitFiles?<cr>", "GitFiles?" }

lvim.builtin.which_key.mappings["s"]["a"] = { "ggVG", "Select All" }


-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
lvim.builtin.notify.active = true
-- lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ command = "black", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
	-- { command = "eslint", filetypes = { "javascript", "typescript", "typescriptreact" } },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {

	{ command = "eslint", filetypes = { "javascript", "typescript", "typescriptreact" } },
}


-- Additional Plugins
lvim.plugins = {
	{ "sindrets/diffview.nvim" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-fugitive" },
	{ "justinmk/vim-sneak" },
	{ "kdheepak/lazygit.nvim" },
	{ "mg979/vim-visual-multi" },
	{ "psliwka/vim-smoothie" },
	{ "preservim/tagbar" },
	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },
	{ "yuki-yano/fzf-preview.vim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "unblevable/quick-scope" },
	{ "ellisonleao/glow.nvim" },
	{ "ruanyl/vim-gh-line" },
	{ "stsewd/fzf-checkout.vim" },
	{ "junegunn/limelight.vim" },
	{ "junegunn/goyo.vim" },
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local lsp_installer_servers = require "nvim-lsp-installer.servers"
			local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"
			require("rust-tools").setup({
				tools = {
					autoSetHints = true,
					hover_with_actions = true,
					runnables = {
						use_telescope = true,
					},
				},
				server = {
					cmd_env = requested_server._default_options.cmd_env,
					on_attach = require("lvim.lsp").common_on_attach,
					on_init = require("lvim.lsp").common_on_init,
				},
			})
		end,
		ft = { "rust", "rs" },
	},
	-- {
	--   'wfxr/minimap.vim',
	--   run = "cargo install --locked code-minimap",
	--   -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
	--   config = function()
	--     vim.cmd("let g:minimap_width = 10")
	--     vim.cmd("let g:minimap_auto_start = 1")
	--     vim.cmd("let g:minimap_auto_start_win_enter = 1")
	--   end,
	-- },
	-- { "folke/tokyonight.nvim" },
	-- {
	--   "folke/trouble.nvim",
	--   cmd = "TroubleToggle",
	-- },
}

-- show cursor line only in active window
-- local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
-- vim.api.nvim_create_autocmd(
--   { "InsertLeave", "WinEnter" },
--   { pattern = "*", command = "set cursorline", group = cursorGrp }
-- )
-- vim.api.nvim_create_autocmd(
--   { "InsertEnter", "WinLeave" },
--   { pattern = "*", command = "set nocursorline", group = cursorGrp }
-- )

-- vim.api.nvim_create_autocmd(
--   { "VimEnter" },
--   { pattern = "*", command = "sleep 1000m | NvimTreeToggle" }
-- )
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWin
-- }

lvim.autocommands.custom_groups = {
	{ "BufEnter", "*.ts", "setlocal noexpandtab tabstop=4" },
}
