vim.api.nvim_create_user_command("Browse", require("git_browse").browse, {})
vim.api.nvim_create_user_command("Blame", require("git_browse").blame, {})
vim.api.nvim_create_user_command("BrowseLine", require("git_browse").browse_line, {})
vim.api.nvim_create_user_command("BlameLine", require("git_browse").blame_line, {})
