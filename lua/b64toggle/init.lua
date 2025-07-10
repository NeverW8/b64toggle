local M = {}

function M.encode()
    local visual_selection = M.get_visual_selection()
    if visual_selection then
        local encoded = vim.fn.system('base64 -w 0', visual_selection)
        encoded = encoded:gsub('\n$', '')
        M.replace_visual_selection(encoded)
    end
end

function M.decode()
    local visual_selection = M.get_visual_selection()
    if visual_selection then
        local decoded = vim.fn.system('base64 -d -w 0', visual_selection)
        decoded = decoded:gsub('\n$', '')
        M.replace_visual_selection(decoded)
    end
end

function M.get_visual_selection()
    local reg_save = vim.fn.getreg('"')
    local regtype_save = vim.fn.getregtype('"')

    vim.cmd('normal! gvy')

    local selection = vim.fn.getreg('"')

    vim.fn.setreg('"', reg_save, regtype_save)

    return selection
end

function M.replace_visual_selection(text)
    local reg_save = vim.fn.getreg('"')
    local regtype_save = vim.fn.getregtype('"')

    vim.fn.setreg('"', text)

    vim.cmd('normal! gvp')

    vim.fn.setreg('"', reg_save, regtype_save)
end

function M.setup()
    vim.api.nvim_create_user_command('B64encode', function()
        M.encode()
    end, { range = true })

    vim.api.nvim_create_user_command('B64decode', function()
        M.decode()
    end, { range = true })
end

return M
