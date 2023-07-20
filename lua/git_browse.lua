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
    orig_head_output = shell_exec(
      'git branch --format "%(refname:short):%(push:short):%(upstream:short):%(objecttype):%(HEAD)" --contains ORIG_HEAD'
    )

    if orig_head_output:len() == 0 then -- there was an error
      return shell_exec('git branch --format "%(refname:short):%(push:short):%(upstream:short):%(objecttype):%(HEAD)"')
    else
      return orig_head_output
    end
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

M.browse_line = function()
  data =
    module.browse_line(M.config.git_branch_command, M.config.git_remote_get_url_command, M.config.git_repo_root_command)
  return os.execute(data.cmd .. " " .. data.url)
end

M.browse_selected = function()
  data =
    module.browse_selected(
      M.config.git_branch_command, M.config.git_remote_get_url_command, M.config.git_repo_root_command
  )
  return os.execute(data.cmd .. " " .. data.url)
end

M.blame = function()
  data = module.blame(M.config.git_branch_command, M.config.git_remote_get_url_command, M.config.git_repo_root_command)
  return os.execute(data.cmd .. " " .. data.url)
end

M.blame_line = function()
  data =
    module.blame_line(M.config.git_branch_command, M.config.git_remote_get_url_command, M.config.git_repo_root_command)
  return os.execute(data.cmd .. " " .. data.url)
end

M.blame_selected = function()
  data =
    module.blame_selected(
      M.config.git_branch_command, M.config.git_remote_get_url_command, M.config.git_repo_root_command
    )
  return os.execute(data.cmd .. " " .. data.url)
end

return M
