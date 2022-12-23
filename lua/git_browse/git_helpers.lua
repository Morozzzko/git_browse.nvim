local M = {}

M.parse_git_branch = function(raw_branch_data)
  local parsed_branch_data = vim.split(vim.trim(raw_branch_data), ":")

  return {
    name = parsed_branch_data[1],
    push_location = parsed_branch_data[2],
    upstream = parsed_branch_data[3],
    type = parsed_branch_data[4],
    current = (parsed_branch_data[5] == "*" and true or false)
  }
end

M.current_branch_info = function(git_branch_command)
  local git_branch_output = git_branch_command()

  local current_branch = nil

  for raw_branch_data in vim.gsplit(git_branch_output, "\n") do
    local parsed_branch = M.parse_git_branch(raw_branch_data)
    if parsed_branch.current then
      current_branch = parsed_branch
      break
    end
  end
  
  return current_branch
end

return M
