Briefing(
  "2. Building a base",
  "- Follow the instructions.",
  nil,
  nil,
  nil
)

--Load("campaigns/orc/level03/level03o_ai.lua")

Triggers = [[
AddStandardTriggers()
]]

assert(loadstring(Triggers))()

Load("campaigns/training/map02/map02.sms")

