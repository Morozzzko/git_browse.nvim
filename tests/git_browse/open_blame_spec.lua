local plugin = require("git_browse")

describe("open_browse", function()
  it("works with default", function()
    assert("my first function with param = Hello!", plugin.open_blame())
  end)

  it("works with custom var", function()
    plugin.setup({ opt = "custom" })
    assert("my first function with param = custom", plugin.open_blame())
  end)
end)
