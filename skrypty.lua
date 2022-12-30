scripts = scripts or { ver = "4.0.5" }
scripts["event_handlers"] = scripts["event_handlers"] or {}
scripts["utils"] = {}
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
function scripts:print_log_nobr(msg, new_line, color)
    local color = color or "purple"
    if msg then
        if new_line then
            echo("\n")
        end
        cecho(string.format("<CadetBlue>(skrypty)<%s>: %s", color, msg))
    end
    resetFormat()
end