local util = require 'lspconfig.util'

return function(on_attach)
    return {
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            client.server_capabilities.document_formatting = true
        end,
        cmd = { "pylsp" },
        filetypes = { "python" },
        root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt"),
        settings = {
            pylsp = {
                plugins = {
                    jedi_completion = { enabled = true },
                    jedi_hover = { enabled = true },
                    jedi_references = { enabled = true },
                    jedi_signature_help = { enabled = true },
                    jedi_symbols = { enabled = true },
                    mccabe = { enabled = true },
                    pyls_isort = { enabled = true },
                    pyls_mypy = { enabled = true },
                    pyls_black = { enabled = true },
                    pyls_flake8 = { enabled = true },
                    pyls_safety = { enabled = true },
                    rope_completion = { enabled = true },
                },
            },
        },
    }
end

