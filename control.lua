local Events = require("utility/events")
local EntityHandling = require("scripts/entity_handling")

local function CreateGlobals()
    EntityHandling.CreateGlobals()
end

local function OnLoad()
    --Any Remote Interface registration calls can go in here or in root of control.lua
    EntityHandling.OnLoad()
end

local function OnSettingChanged(event)
    --if event == nil or event.setting == "xxxxx" then
    --	local x = tonumber(settings.global["xxxxx"].value)
    --end
end

local function OnStartup()
    CreateGlobals()
    OnLoad()
    OnSettingChanged(nil)
end

script.on_init(OnStartup)
script.on_configuration_changed(OnStartup)
script.on_event(defines.events.on_runtime_mod_setting_changed, OnSettingChanged)
script.on_load(OnLoad)

Events.RegisterEvent(defines.events.on_built_entity, "typeUndergroundBelt", {{filter = "type", type = "underground-belt"}})
Events.RegisterEvent(defines.events.on_robot_built_entity, "typeUndergroundBelt", {{filter = "type", type = "underground-belt"}})
Events.RegisterEvent(defines.events.script_raised_built)
Events.RegisterEvent(defines.events.on_player_mined_entity, "typeUndergroundBelt", {{filter = "type", type = "underground-belt"}})
Events.RegisterEvent(defines.events.on_robot_mined_entity, "typeUndergroundBelt", {{filter = "type", type = "underground-belt"}})
Events.RegisterEvent(defines.events.on_entity_died, "typeUndergroundBelt", {{filter = "type", type = "underground-belt"}})
Events.RegisterEvent(defines.events.script_raised_destroy)
Events.RegisterEvent(defines.events.on_player_rotated_entity)
