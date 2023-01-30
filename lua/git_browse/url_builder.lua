local M = {}

M.build_github_url = function(repo, branch_name, path, url_type)
  if path then
    if url_type == "browse" then
      return "https://github.com/" .. repo .. "/blob/" .. branch_name .. "/" .. path
    elseif url_type == "blame" then 
      return "https://github.com/" .. repo .. "/blame/" .. branch_name .. "/" .. path
    else 
      error("Unknown URL type" .. browse)
    end
  else
    return "https://github.com/" .. repo .. "/tree/" .. branch_name
  end
end

M.build_gitlab_url = function(domain, repo, branch, path, url_type)
  error("GitLab is not implemented at the moment")
end

M.build_url = function(remote, current_branch_name, path_in_repo, url_type)
  local _, _, domain, repo = string.find(remote, "[htps:/@]+(.*)[/:](%a+/.+)%p.*")

  if domain and repo then
    if string.find(domain, "github.com") then
      return M.build_github_url(repo, current_branch_name, path_in_repo, url_type)
    else
      return M.build_gitlab_url(domain, repo, current_branch_name, path_in_repo, url_type)
    end
  else
    error("Error parsing remote ".. remote)
  end
end

return M
