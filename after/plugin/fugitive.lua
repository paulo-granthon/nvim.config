
-- Git status
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);                 -- fugitive interface with status and interative staging

-- basic workflow
vim.keymap.set('n', '<leader>gf', ":G fetch<CR>")               -- fetch
vim.keymap.set('n', '<leader>gj', ":G pull<CR>")                -- pull
vim.keymap.set("n", "<leader>ga", ":G add ")                    -- opens git add command ready for parameters 
vim.keymap.set("n", "<leader>gc", ":G commit -m \"\"<left>")    -- opens git commit with the cursor between quotes
vim.keymap.set("n", "<leader>gk", ":G push")                    -- no <CR> at the end to prevent accidents
vim.keymap.set("n", "<leader>gd", ":G diff<CR>")

-- I'm gonna regret this later
vim.keymap.set('n', '<leader>grf', ':G restore ')
vim.keymap.set('n', '<leader>gra', ':G restore .')
vim.keymap.set('n', '<leader>grc', ':G restore --cached ')

-- Git Branch commands
vim.keymap.set('n', '<leader>gco', ":G checkout ")              -- Checkout
vim.keymap.set('n', '<leader>gcn', ":G checkout -b")            -- Checkout new
vim.keymap.set('n', '<leader>gm', ":G merge ")                  -- merge - requires argument


-- function to create and push new branch
function GitCheckoutAndSetUpstream(arg)
    if arg ~= nil and arg ~= '' then
        vim.cmd('echo "Checking out the new branch ' .. arg .. ' and setting upstream to origin."')
        vim.cmd('G checkout -b ' .. arg)
        vim.cmd('G push -u origin ' .. arg)
    else
       print('No argument provided!')
    end
end

-- add vim command for the function
vim.cmd([[
  command! -nargs=1 GitCheckoutAndSetUpstream lua GitCheckoutAndSetUpstream(<f-args>)
]])

-- Checkout to new branch and push to remote
vim.keymap.set('n', '<leader>gnp', ':GitCheckoutAndSetUpstream ', { noremap = true, silent = true })

-- craziness
vim.keymap.set('n', '<leader>gsmu', ':G submodule update --init --recursive', { noremap = true, silent = true })
