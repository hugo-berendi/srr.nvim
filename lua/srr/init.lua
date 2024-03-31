local M = require("srr.main")
local C = require("srr.config")

local Srr = {}

--- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function Srr.toggle()
    if _G.Srr.config == nil then
        _G.Srr.config = C.options
    end

    M.toggle("publicAPI_toggle")
end

--- Initializes the plugin, sets event listeners and internal state.
function Srr.enable()
    if _G.Srr.config == nil then
        _G.Srr.config = C.options
    end

    M.enable("publicAPI_enable")
end

--- Disables the plugin, clear highlight groups and autocmds, closes side buffers and resets the internal state.
function Srr.disable()
    M.disable("publicAPI_disable")
end

-- setup Srr options and merge them with user provided ones.
function Srr.setup(opts)
    _G.Srr.config = C.setup(opts)
end

_G.Srr = Srr

return _G.Srr
