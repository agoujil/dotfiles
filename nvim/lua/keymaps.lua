vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>k', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>Q', ':bufdo bdelete<CR>')

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Move text up and down
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv")
vim.keymap.set('n', '<A-j>', ':move .+1<CR>')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>')


vim.keymap.set('n', '<leader>h', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>f', require('telescope.builtin').git_files, { desc = 'Search Git [F]iles' })
vim.keymap.set('n', '<leader>F', require('telescope.builtin').find_files, { desc = 'Search All [F]iles' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').grep_string, { desc = 'Search current word' })
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)



vim.keymap.set('n', '<leader>b', ":ToggleBlameLine<CR>")

-- Navigate buffers
vim.keymap.set('n', '<S-Right>', ":bnext<CR>")
vim.keymap.set('n', '<S-Left>', ":bprevious<CR>")


vim.keymap.set('n', '<F9>', ':!docker-compose up -d<CR>')


vim.keymap.set('n', '<F5>', ':!docker-compose down<CR>')


vim.cmd([[
  autocmd BufEnter * EnableBlameLine
]])