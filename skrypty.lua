scripts = scripts or { ver = "4.00" }
scripts["event_handlers"] = scripts["event_handlers"] or {}
scripts.character_name = ""
scripts.character_id = ""
function scripts.print_log(msg, new_line)
    if msg then
        if new_line then
            cecho("\n<CadetBlue>(skrypty)<tomato>: " .. msg .. "\n")
        else
            cecho("<CadetBlue>(skrypty)<tomato>: " .. msg .. "\n")
        end
    end
end