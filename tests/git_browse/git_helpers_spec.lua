local git_helpers = require("git_browse.git_helpers")

describe("parse_git_branch", function()
  describe("parsing current branch", function()
    it("parses current if there's an asterisk after fourth :", function()
      assert.are.same({
        name = "main",
        type = "commit",
        push_location = "origin/main",
        upstream = "origin/main",
        current = true,
      }, git_helpers.parse_git_branch("main:origin/main:origin/main:commit:*"))
    end)

    it("does not mark non-asterisked branches as current", function()
      assert.are.same({
        name = "main",
        type = "commit",
        push_location = "origin/main",
        upstream = "origin/main",
        current = false,
      }, git_helpers.parse_git_branch("main:origin/main:origin/main:commit:"))
    end)
  end)

  describe("parsing detached head", function()
    it("parses detached head properly", function()
      assert.are.same({
        name = "(HEAD detached at c5676f1)",
        type = "commit",
        push_location = "",
        upstream = "",
        current = true,
      }, git_helpers.parse_git_branch("(HEAD detached at c5676f1):::commit:*"))
    end)
  end)

  describe("parsing remote", function()
    it("has empty push_location if branch has not been pushed", function()
      assert.are.same({
        name = "main",
        type = "commit",
        push_location = "",
        upstream = "",
        current = true,
      }, git_helpers.parse_git_branch("main:::commit:*"))
    end)

    it("parses remote name", function()
      assert.are.same({
        name = "main",
        type = "commit",
        push_location = "origin/main",
        upstream = "origin/main",
        current = false,
      }, git_helpers.parse_git_branch("main:origin/main:origin/main:commit:"))
    end)
  end)
end)

describe("branch_name_to_open", function()
  current_branch = {
    name = "main",
    type = "commit",
    push_location = "origin/main",
    upstream = "origin/some-main",
    current = true,
  }
  it("returns current branch upstream without the origin/ part", function()
    assert.are.same("some-main", git_helpers.branch_name_to_open(current_branch))
  end)
end)

describe("current_branch_info", function()
  describe("when current branch contains ORIG_HEAD", function()
    git_branch_command = function()
      return [[
  main:origin/main:origin/main:commit:
  rebrand:origin/rebrand:origin/rebrand:commit:
  test-no-remote::origin/main:commit:*
      ]]
    end

    it("returns current branch info", function()
      current_branch_info = {
        name = "test-no-remote",
        upstream = "origin/main",
        type = "commit",
        push_location = "",
        current = true,
      }
      assert.are.same(current_branch_info, git_helpers.current_branch_info(git_branch_command))
    end)
  end)

  describe("when current branch does not contain ORIG_HEAD", function()
    git_branch_command = function()
      return [[
  test-no-remote:::commit:
  main:origin/main:origin/main:commit:
  rebrand:origin/rebrand:origin/rebrand:commit:
      ]]
    end

    it("returns first branch which contains upstream", function()
      current_branch_info = {
        name = "main",
        type = "commit",
        push_location = "origin/main",
        upstream = "origin/main",
        current = false,
      }
      assert.are.same(current_branch_info, git_helpers.current_branch_info(git_branch_command))
    end)
  end)
end)
