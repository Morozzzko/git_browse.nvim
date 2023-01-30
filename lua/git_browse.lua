-- main module file
local module = require("git_browse.module")

function shell_exec(command)
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return result
end

local M = {}
M.config = {
  -- Function which gets the git branch in specific format:
  -- name, push location, upstream, type and whether or not the branch is current
  git_branch_command = function()
    return shell_exec('git branch --format "%(refname:short):%(push:short):%(upstream:short):%(objecttype):%(HEAD)" --contains ORIG_HEAD')
  end,
  git_remote_get_url_command = function(remote_name)
    return shell_exec("git remote get-url " .. remote_name)
  end,
  git_repo_root_command = function()
    return shell_exec("git rev-parse --show-toplevel")
  end,
}

-- setup is the public method to setup your plugin
M.setup = function(args)
  -- you can define your setup function here. Usually configurations can be merged, accepting outside params and
  -- you can also put some validation here for those.
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.browse = function()
  data = module.browse(M.config.git_branch_command, M.config.git_remote_get_url_command, M.config.git_repo_root_command)
  return os.execute(data.cmd .. " " .. data.url)
end

M.blame = function()
  data = module.blame(M.config.git_branch_command, M.config.git_remote_get_url_command, M.config.git_repo_root_command)
  return os.execute(data.cmd .. " " .. data.url)
end

return M
