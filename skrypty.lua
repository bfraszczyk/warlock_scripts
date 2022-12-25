scripts = scripts or { ver = "4.0.2" }
scripts["event_handlers"] = scripts["event_handlers"] or {}
scripts.character_name = ""
scripts.character_id = ""
function scripts:print_log(msg, new_line)
    if msg then
        if new_line then
            cecho("\n<CadetBlue>(skrypty)<purple>: " .. msg .. "\n")
        else
            cecho("<CadetBlue>(skrypty)<purple>: " .. msg .. "\n")
        end
    end
end