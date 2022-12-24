function gmcp_Kill()
	if(gmcp.Kill == nil) then return end
	local a = gmcp.Kill	
	scripts.windows:hideEnemyStatsFor(a.kogo.id)
	scripts.zabici:dodajZabitego(a.kto.nazwa, a.kogo.nazwa)
	raiseEvent("warlock.someoneDied", a.kto.nazwa, a.kogo.nazwa)	
end

if scripts.event_handlers["scripts/gmcp/GmcpKill"] then
    killAnonymousEventHandler(scripts.event_handlers["scripts/gmcp/GmcpKill"])
end

scripts.event_handlers["scripts/gmcp/GmcpKill"] = registerAnonymousEventHandler("gmcp.Kill", gmcp_Kill)