local D = require("srr.util.debug")

local Srr = {}

--- Your plugin configuration with its default values.
---
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
Srr.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

---@private
local defaults = vim.deepcopy(Srr.options)

--- Defaults Srr options by merging user provided options with the default plugin values.
---
---@param options table Module config table. See |Srr.options|.
---
---@private
function Srr.defaults(options)
    local tde = function(t1, t2)
        return vim.deepcopy(vim.tbl_deep_extend("keep", t1 or {}, t2 or {}))
    end

    Srr.options = tde(options, defaults)

    -- let your user know that they provided a wrong value, this is reported when your plugin is executed.
    assert(
        type(Srr.options.debug) == "boolean",
        "`debug` must be a boolean (`true` or `false`)."
    )

    return Srr.options
end

--- Define your srr setup.
---
---@param options table Module config table. See |Srr.options|.
---
---@usage `require("srr").setup()` (add `{}` with your |Srr.options| table)
function Srr.setup(options)
    Srr.options = Srr.defaults(options or {})

    -- Useful for later checks that requires nvim 0.9 features at runtime.
    Srr.options.hasNvim9 = vim.fn.has("nvim-0.9") == 1

    D.warnDeprecation(Srr.options)

    return Srr.options
end

return Srr
