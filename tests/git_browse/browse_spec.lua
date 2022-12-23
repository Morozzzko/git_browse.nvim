local plugin = require("git_browse")

describe("browse", function()
  describe("when current branch is pushed to upstream", function()
    it("launches open with", function()
      plugin.setup({ 
        git_branch_command = function()
          return "main:origin/main:origin/main:commit:*"
        end
      })
      -- assert.are.same({ 'open', 'https://github.com/Morozzzko/git-browse-nvim/blob/main'}, plugin.browse())
    end)
  end)
end)
