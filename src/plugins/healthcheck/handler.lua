local BasePlugin = require "kong.plugins.base_plugin"
local init_worker = require "kong.plugins.healthcheck.init_worker"

local HealthcheckHandler = BasePlugin:extend()

function HealthcheckHandler:new()
  HealthcheckHandler.super.new(self, "healthcheck")
end

function HealthcheckHandler:init_worker(conf)
  HealthcheckHandler.super.init_worker(self)
  init_worker.execute(conf)
end

HealthcheckHandler.PRIORITY = 1000

return HealthcheckHandler
