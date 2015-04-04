local stringy = require "stringy"
local HTTP = "http"

local function check_path(value, t)
  if t and t.protocol == HTTP then
    if not value or stringy.strip(value) == "" then
      return false, "Specify a ping path, like '/' or '/hello'"
    end
  end
  return true
end

return {
  protocol = { required = true, type = "string", enum = { "tcp", HTTP } },
  path = { required = true, type = "string", enum = { "tcp", "http" }, func = check_path },
  response_timeout = { required = true, type = "number", default = 5 },
  interval = { required = true, type = "number", default = 30 },
  hide_credentials = { type = "boolean", default = false },
  webhook_url = { required = true, type = "string" }
}
