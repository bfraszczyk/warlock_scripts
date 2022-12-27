scripts["help"] = scripts["help"] or {}

function scripts.help:makeHelpLink(tekst, description)
    selectString(tekst, 1);
    fg("white");
    setUnderline(true);
    setLink([[send("?]] .. tekst .. [[")]], description);
    resetFormat();
    deselect()
end

function scripts.help:makeHelpLinksFromSeeAlso(linia)
    local tematy = linia:gsub(" ", ""):gsub("\t", ""):split(",")
    for i, v in pairs(tematy) do
        scripts.help:makeHelpLink(v, v);
    end
end

function scripts.help.handleHelpCommands(eventName, cmd)
    if (cmd:sub(1, 1) == "?") then
        -- zadanie pomocy!
        local temat = cmd:sub(2)
        local trigs = {}
        if (temat == "ogolne") then
            table.insert(trigs, tempRegexTrigger("([a-z]+)[ ]+-[ ]+([a-zA-Z]+.*)", [[
       makeHelpLink(matches[2], matches[3]);
      ]]));
        end
        table.insert(trigs, tempRegexTrigger("(ZOBACZ TEZ|PATRZ TEZ|ZOBACZ TAKZE)", [[
      tempLineTrigger(1, 1, "scripts.help:makeHelpLinksFromSeeAlso(line)");
     ]]));
        local s = ""
        for i, v in pairs(trigs) do
            s = s .. "killTrigger(" .. v .. ");\n"
        end
        s = s .. [[ killTrigger(trigKoniecPomocy); ]]
        trigKoniecPomocy = tempRegexTrigger("^(EOF|Nie ma pomocy na ten temat.)", s);
    end
end

function scripts.help:displayHelp()
    echo("    Aliasy:\n")
    echo("/version - informacja o wersji skryptow (" .. scripts.ver .. ")\n")
    echo("/paste <komenda> - wklejanie tekstu uzywajac komendy\n")
    echo("/eval <skrypt> - wykonanie skryptu LUA z linii komend\n")
    echo("/zabici - pokazanie statystyk zabitych wrogow\n")
    echo("/zabici_reset - resetowanie statystyk zabitych\n")
    echo("/zabici2 - globalny licznik zabitych (od resetu).\n")
    echo("/zabici2! - globalny licznik zabitych z uwzglednieniem zabitych/dzien.\n")
    cecho("/zabici2 [data] - log zabitych z dnia o <light_slate_blue>[data]<grey>. \n")
    cecho("| Data musi byc w takiej formie: <light_slate_blue>[rok]/[miesiac]/[dzien]<grey>,                        |\n")
    cecho("| np. <light_slate_blue>/zabici2 2017/1/22<grey>, <light_slate_blue>/zabici2 2017/1<grey> lub <light_slate_blue>/zabici2 2017<grey>\n")    
    echo("/zabici2_reset - reset globalnego licznika zabitych.\n")
    echo("/postepy - ilosc postepow w sesji\n")
    echo("/postepy2 - ilosc postepow globalnych\n")
    echo("/drzwi (n|e|s|w|ne|...) (0|1|2|3) - dodaje drzwi w danym kierunku\n")    
    echo("/kolory - pokazuje tablice nazwanych kolorow\n")
    echo("/akcja (przeciwnik|druzyna|inni) komenda - ustawianie akcji dodatkowych (pod literka S)\n")
    echo("/statsfix - usuwa zagubione statystyki\n")
    echo("/opoz (ilosc_opoznienia) - opoznienie automatycznego chodzika mapy domyslnie 2 sekundy\n")
    echo("/stop - zastopowanie chodzika mapy (to samo co klawisz F12)\n")
    echo("/idzdo numer_lokacji - wykonuje sekwencje chodzika do numeru lokacji\n")
    echo("/findlok <short> - wyszukuje lokacje z podanym shortem\n")
    echo("/pokazruny - pokazuje ilosc zdobytych run w sesji\n")
    echo("/resetujruny - resetuje ilosc zdobytych run\n")
    echo("/pobierzmape - pobiera ogolnodostepna mape muda\n")
    echo("\n")
    echo("    Klawisze:\n")
    echo("Klawiatura numeryczna:\n")
    echo("  0..9 - chodzenie (+ctrl - przemykanie, +ctrl+alt - przemykanie z druzyna\n")
    echo("  - - wyjscie\n")
    echo("  + - wyjscie specjalne lub jedno z (schody, wejscie)\n")
    echo("  * - lazik traktowy\n")
    echo("Klawisze funkcyjne:\n")
    echo("  F5 - kondycja\n")
    echo("  F6 - kondycja przeciwnika\n")
    echo("  F8 - stan\n")
    echo("  F12- przerwanie auto-chodzika\n")
    echo("\n")
    echo("Obsluga mapy:\n")
    echo("  kolko myszy - przyblizanie/oddalanie\n")
    echo("  ALT + przycisk myszy - przesuwanie mapy\n")
    echo("  lewy przycisk myszy - zaznaczanie lokacji (pojedynczo lub wiele naraz)\n")
    echo("  CTRL + lewy przycisk - dodawanie/odejmowanie lokacji z zaznaczenia\n")
    echo("  prawy przycisk myszy - menu kontekstowe do zaznaczonych wczesniej lokacji\n")
    echo("\n")
    echo("Okienka:\n")
    echo("  Domyslnie okienka rozmow, mapy oraz kondycji sa zablokowane. Pod prawym klawiszem myszy\n")
    echo("  na okienku pojawia sie menu kontekstowe gdzie mozna modyfikowac stan okienka, ukrywac, odblokowac.\n")
    echo("  Odblokowane okienka mozna przesuwac i zmieniac ich wielkosc.\n")
end
registerAnonymousEventHandler("sysDataSendRequest", scripts.help.handleHelpCommands)

tempTimer(4, [[ scripts:print_start_message() ]])

function scripts:print_start_message()
    scripts:print_log("Uzywasz Warlock Skrypty, ver. " .. scripts.ver .. ". Pomoc dostepna w '/pomoc'")
    scripts.latest:is_latest(function(release_info) scripts:print_log("Dostepna jest nowa wersja (" .. release_info.tag_name .. "). Wpisz /aktualizuj_skrypty zeby zaktualizowac") cecho("\n<SlateGray>" .. release_info.body .."\n<reset>") end)
    scripts.mapper.map_update:check_for_update()   
end