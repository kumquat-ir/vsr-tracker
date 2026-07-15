ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CURRENT_INDEX = -1

function onClear(slot_data)
  CURRENT_INDEX = -1

  local options = slot_data.options
  Tracker:FindObjectForCode("hardlogic").Active = options.hard_logic
  Tracker:FindObjectForCode("extra_decryptors").Active = options.extra_decryptors
  Tracker:FindObjectForCode("requirebosscards").Active = options.require_boss_cards
  Tracker:FindObjectForCode("add_ambushes").Active = options.add_ambushes
  Tracker:FindObjectForCode("add_physical").Active = options.add_physical

  for _, v in pairs(LOCATION_MAPPING) do
    local location = Tracker:FindObjectForCode(v[1])
    if location then
      location.AvailableChestCount = location.ChestCount
    end
  end

  for _, v in pairs(ITEM_MAPPING) do
    local item = Tracker:FindObjectForCode(v[1])
    if item and v[2] == "toggle" then
      item.Active = false
    end
  end
end

function onItem(index, item_id, item_name, player_number)
  if index <= CURRENT_INDEX then
    return
  end

  local item_data = ITEM_MAPPING[item_id]
  if not item_data then
    return
  end

  local item = Tracker:FindObjectForCode(item_data[1])
  if not item then
    return
  end

  if item_data[2] == "toggle" then
    item.Active = true
  end
end

function onLocation(location_id, location_name)
  local location_data = LOCATION_MAPPING[location_id]
  if not location_data then
    return
  end

  local location = Tracker:FindObjectForCode(location_data[1])
  if not location then
    return
  end

  location.AvailableChestCount = location.AvailableChestCount - 1
end

Archipelago:AddClearHandler("clear", onClear)
Archipelago:AddItemHandler("item", onItem)
Archipelago:AddLocationHandler("location", onLocation)
