-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.SrrLoaded then
    return
end

_G.SrrLoaded = true

-- Useful if you want your plugin to be compatible with older (<0.7) neovim versions
if vim.fn.has("nvim-0.7") == 0 then
    vim.cmd("command! Srr lua require('srr').toggle()")
else
    vim.api.nvim_create_user_command("Srr", function()
        require("srr").toggle()
    end, {})
end
