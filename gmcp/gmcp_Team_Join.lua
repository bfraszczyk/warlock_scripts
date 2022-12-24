function gmcp_Team_Join()
	local v = gmcp.Team.Join
	if(v == nil) then return end	
	scripts.windows:showStatsFor(v.id, v.nazwa, v.self == 1, false, v.szereg)	
end

if scripts.event_handlers["scripts/gmcp/GmcpTeamJoin"] then
    killAnonymousEventHandler(scripts.event_handlers["scripts/gmcp/GmcpTeamJoin"])
end

scripts.event_handlers["scripts/gmcp/GmcpTeamJoin"] = registerAnonymousEventHandler("gmcp.Team.Join", gmcp_Team_Join)