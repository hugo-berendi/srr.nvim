local D = {}

---prints only if debug is true.
---
---@param scope string: the scope from where this function is called.
---@param str string: the formatted string.
---@param ... any: the arguments of the formatted string.
---@private
function D.log(scope, str, ...)
    if _G.Srr.config ~= nil and not _G.Srr.config.debug then
        return
    end

    print(
        string.format(
            "[srr@%s in '%s'] > %s",
            os.date("%X"),
            scope,
            string.format(str, ...)
        )
    )
end

---analyzes the user provided `setup` parameters and sends a message if they use a deprecated option, then gives the new option to use.
---
---@param options table: the options provided by the user.
---@private
function D.warnDeprecation(options)
    local usesDeprecatedOption = false

    local notice = "is now deprecated, use `%s` instead."
    local rootDeprecated = {
        foo = "bar",
        bar = "baz",
    }

    for name, warning in pairs(rootDeprecated) do
        if options[name] ~= nil then
            usesDeprecatedOption = true
            print(
                string.format(
                    "[srr.nvim] `%s` %s",
                    name,
                    string.format(notice, warning)
                )
            )
        end
    end

    if usesDeprecatedOption then
        print("[srr.nvim]     sorry to bother you with the breaking changes :(")
        print("[srr.nvim]     use `:h Srr.options` to read more.")
    end
end

return D
