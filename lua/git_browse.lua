-- main module file
local module = require("git_browse.module")

local M = {}
M.config = {
  -- default config
  opt = "Hello!",
}

-- setup is the public method to setup your plugin
M.setup = function(args)
  -- you can define your setup function here. Usually configurations can be merged, accepting outside params and
  -- you can also put some validation here for those.
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.open_blame = function()
  module.my_first_function()
end

M.browse = function()
  module.my_first_function()
end

return M
