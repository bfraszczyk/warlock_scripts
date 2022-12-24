function gmcp_improve()
    local poziom = gmcp.Char.State.improve
    local total = gmcp.Char.State.improve
    if poziom == scripts.licznik_postepow.current_improve_level then
      return
    end
    
    scripts.licznik_postepow.current_improve_level = poziom
    
    if poziom > 17 then
      poziom = math.fmod(poziom,17)
    end
    
    local postep_opisowy = scripts.licznik_postepow.opisy_postepow[poziom]
    
    if poziom >= 17 then
      send("postepy zeruj")
    end
    
    local snapshot = {}
    snapshot["level"] = poziom
    snapshot["time"] = getTime(true, "dd/MM hh:mm:ss")
    snapshot["timestamp"] = getEpoch()
    local last_snapshot = nil
    if table.size(scripts.licznik_postepow["level_snapshots"]) > 0 then
            last_snapshot = scripts.licznik_postepow["level_snapshots"][#scripts.licznik_postepow["level_snapshots"]]
    end
    local seconds_passed = snapshot["timestamp"] - scripts.licznik_postepow["improve_start_timestamp"]
    scripts.licznik_postepow["improve_start_timestamp"] = getEpoch()
    snapshot["seconds_passed"] = seconds_passed
    snapshot["time_passed"] = scripts.licznik_postepow:seconds_to_formatted_string(seconds_passed)
    
    table.insert(scripts.licznik_postepow["level_snapshots"], snapshot)
    
    scripts.print_log("[" .. snapshot["time"] .. "] Wlasnie wbiles postepy: " .. scripts.licznik_postepow.opisy_postepow[poziom] .. " (czas: " .. snapshot["time_passed"] .. ")\n Wszystkich postepow w sesji: " .. total)
end

if scripts.event_handlers["scripts/gmcp/GmcpImprove"] then
    killAnonymousEventHandler(scripts.event_handlers["scripts/gmcp/GmcpImprove"])
end

scripts.event_handlers["scripts/gmcp/GmcpImprove"] = registerAnonymousEventHandler("gmcp.Char.State", gmcp_improve)
