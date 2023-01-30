local git_helpers = require("git_browse.git_helpers")
local url_builder = require("git_browse.url_builder")

local M = {}

function location_from_current_buffer(git_repo_root_command)
  buffer_name = vim.api.nvim_buf_get_name(0)

  if buffer_name and buffer_name:len() > 0 then
    git_root = git_repo_root_command()

    return string.sub(buffer_name, git_root:len() + 1)
  else
    return nil
  end
end

M.browse = function(git_branch_command, git_remote_get_url_command, git_repo_root_command)
  local current_branch = git_helpers.current_branch_info(git_branch_command)
  local branch_name_to_open = git_helpers.branch_name_to_open(current_branch)
  local remote = git_remote_get_url_command("origin")
  local current_location = location_from_current_buffer(git_repo_root_command)
  local url = url_builder.build_url(remote, branch_name_to_open, current_location, "browse")
  return {
    cmd = "open",
    url = url,
  }
end

M.blame = function(git_branch_command, git_remote_get_url_command, git_repo_root_command)
  local current_branch = git_helpers.current_branch_info(git_branch_command)
  local branch_name_to_open = git_helpers.branch_name_to_open(current_branch)
  local remote = git_remote_get_url_command("origin")
  local current_location = location_from_current_buffer(git_repo_root_command)
  local url = url_builder.build_url(remote, branch_name_to_open, current_location, "blame")
  return {
    cmd = "open",
    url = url,
  }
end

return M
