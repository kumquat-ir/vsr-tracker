function option(name, value)
  return tostring(Tracker:FindObjectForCode(name).Active) == value
end
