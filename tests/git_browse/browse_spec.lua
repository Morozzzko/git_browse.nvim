local plugin = require("git_browse")

describe("browse", function()
  it("works with default", function()
    assert("my first function with param = Hello!", plugin.browse())
  end)

  it("works with custom var", function()
    plugin.setup({ opt = "custom" })
    assert("my first function with param = custom", plugin.browse())
  end)
end)
