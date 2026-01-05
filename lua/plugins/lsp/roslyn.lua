return {
    'seblj/roslyn.nvim',
    ft = 'cs',
    cond = function() -- only load if roslyn is installed via mason
        return vim.fn.executable(vim.fn.stdpath('data') .. '/mason/bin/roslyn') == 1
    end,
    opts = {
        config = {
            settings = {
                ["csharp|inlay_hints"] = {
                    csharp_enable_inlay_hints_for_implicit_object_creation = true,
                    csharp_enable_inlay_hints_for_implicit_variable_types = true,
                },
                ["csharp|code_lens"] = {
                    dotnet_enable_references_code_lens = true,
                },
            },
        },
    },
}
