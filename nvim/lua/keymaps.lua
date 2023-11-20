vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})
-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", {noremap=false})
-- buffers
vim.api.nvim_set_keymap("n", "tk", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})
-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})
-- splits
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")

vim.api.nvim_set_keymap("n", '<C-a>', ":lua require('harpoon.mark').add_file()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-z>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>1", ":lua require('harpoon.ui')..nav_file(1)<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>2", ":lua require('harpoon.ui')..nav_file(2)<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>3", ":lua require('harpoon.ui')..nav_file(3)<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>4", ":lua require('harpoon.ui')..nav_file(4)<CR>", {noremap=true})
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move text up and down
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv")
vim.keymap.set('n', '<A-j>', ':move .+1<CR>')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

vim.keymap.set('n', '<leader>b', ":ToggleBlameLine<CR>")

-- Navigate buffers
vim.keymap.set('n', '<S-Right>', ":bnext<CR>")
vim.keymap.set('n', '<S-Left>', ":bprevious<CR>")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")


local api = require("nvim-tree.api")

local function opts(desc)
  return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end


vim.keymap.set('n', '<C-s>', api.node.open.vertical,                opts('Open: Vertical Split'))
vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
vim.keymap.set('n', 'gy',    api.fs.copy.relative_path,             opts('Copy Absolute Path'))
vim.keymap.set('n', 'cf',     api.fs.copy.node,                      opts('Copy'))
vim.keymap.set('n', 'pf',     api.fs.paste,                          opts('Paste'))


-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')


-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>ff", function()
  vim.lsp.buf.format()
end)
 
vim.keymap.set('n', '<C-p>', "<cmd>ChatGPTRun optimize_code<CR>",                opts('Open: Vertical Split'))


vim.cmd([[
  autocmd BufEnter * EnableBlameLine
]])