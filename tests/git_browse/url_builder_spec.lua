local module = require("git_browse.url_builder")

describe("URL builder", function()
  describe("GitHub URLs", function()
    it("generates a URL from SSH remote and current branch", function()
      assert.are.same(
        "https://github.com/Morozzzko/git-browse-nvim/tree/main",
        module.build_url("git@github.com:Morozzzko/git-browse-nvim.git", "main", nil)
      )
    end)

    it("generates a URL from SSH remote and current branch", function()
      assert.are.same(
        "https://github.com/Morozzzko/git-browse-nvim/tree/main",
        module.build_url("https://github.com/Morozzzko/git-browse-nvim.git", "main", nil)
      )
    end)

    it("generates a URL from SSH remote, current branch, and path", function()
      assert.are.same(
        "https://github.com/Morozzzko/git-browse-nvim/blob/main/README.md",
        module.build_url("https://github.com/Morozzzko/git-browse-nvim.git", "main", "README.md")
      )
    end)
  end)
end)
