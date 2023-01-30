vim.api.nvim_create_user_command("Browse", require("git_browse").browse, {})
vim.api.nvim_create_user_command("Blame", require("git_browse").blame, {})
