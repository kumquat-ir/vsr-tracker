function updateLayout()
  local layout = "layouts/tracker"

  if Tracker:FindObjectForCode("extra_decryptors").Active then
    layout = layout .. "_dec"
  end

  if Tracker:FindObjectForCode("requirebosscards").Active then
    layout = layout .. "_cards"
  end

  layout = layout .. ".json"
  Tracker:AddLayouts(layout)
end

ScriptHost:AddWatchForCode("decryptors", "extra_decryptors", updateLayout)
ScriptHost:AddWatchForCode("cards", "requirebosscards", updateLayout)
