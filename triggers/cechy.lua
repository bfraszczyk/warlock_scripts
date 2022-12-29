function policz_cechy(sila, zrecznosc, wytrzymalosc, inteligencja, madrosc, odwaga)
  selectCurrentLine()
  replace("")
  cechy_liczby(sila,zrecznosc,wytrzymalosc,inteligencja,madrosc,odwaga)
end

function cechy_liczby(sila,zrecznosc,wytrzymalosc,inteligencja,madrosc,odwaga)
  s = "<red>[cos poszlo nie tak]<reset>"
  z = "<red>[cos poszlo nie tak]<reset>"
  w = "<red>[cos poszlo nie tak]<reset>"
  i = "<red>[cos poszlo nie tak]<reset>"
  m = "<red>[cos poszlo nie tak]<reset>"
  o = "<red>[cos poszlo nie tak]<reset>"

--sila
--uciecie "jak na..."

  if string.find(sila, " ") then

    str = string.match(sila, '(.*) (.*) (.*) (.*)')
    str = string.sub(str, 0, string.len(str)-1)
  else
    str = string.sub(sila, 0, string.len(sila)-1)
  end

  if silaall[str] then
    s_l = silaall[str]
    if string.find(sila, "jak na legende") then
      s_l = s_l + 13
    elseif string.find(sila, "jak na polboga") or string.find(sila, "jak na polboginie")then
      s_l = s_l + 26
    elseif string.find(sila, "jak na boga") then
      s_l = s_l + 39
    end
    s = sila.."<yellow_green> ("..s_l..")<reset>"
  end


--zrecznosc
--uciecie "jak na..."
  if string.find(zrecznosc, " ") then
    str = string.match(zrecznosc, '(.*) (.*) (.*) (.*)')
    str = string.sub(str, 0, string.len(str)-1)
  else
    str = string.sub(zrecznosc, 0, string.len(zrecznosc)-1)
  end

  if zrecznoscall[str] then
    z_l = zrecznoscall[str]
    if string.find(zrecznosc, "jak na legende") then
      z_l = z_l + 13
    elseif string.find(zrecznosc, "jak na polboga") or string.find(zrecznosc, "jak na polboginie") then
      z_l = z_l + 26
    elseif string.find(zrecznosc, "jak na boga") then
      z_l = z_l + 39
    end
  z = zrecznosc.."<yellow_green> ("..z_l..")<reset>"
  end
  

  --wytka
  --uciecie "jak na..."
  if string.find(wytrzymalosc, " ") then
    str = string.match(wytrzymalosc, '(.*) (.*) (.*) (.*)')
    str = string.sub(str, 0, string.len(str)-1)
  else
    str = string.sub(wytrzymalosc, 0, string.len(wytrzymalosc)-1)
  end
  if wytkaall[str] then
    w_l = wytkaall[str]
    if string.find(wytrzymalosc, "jak na legende") then
      w_l = w_l + 13
    elseif string.find(wytrzymalosc, "jak na polboga") or string.find(wytrzymalosc, "jak na polboginie") then
      w_l = w_l + 26
    elseif string.find(wytrzymalosc, "jak na boga") then
      w_l = w_l + 39
    end
  w = wytrzymalosc.."<yellow_green> ("..w_l..")<reset>"
  end
  
  --inteligencja
    --uciecie "jak na..."
  if string.find(inteligencja, " ") then
    str = string.match(inteligencja, '(.*) (.*) (.*) (.*)')
    str = string.sub(str, 0, string.len(str)-1)
  else
    str = string.sub(inteligencja, 0, string.len(inteligencja)-1)
  end
  
  if intall[str] then
    i_l = intall[str]
    if string.find(inteligencja, "jak na legende") then
      i_l = i_l + 13
    elseif string.find(inteligencja, "jak na polboga") then
      i_l = i_l + 26
    elseif string.find(inteligencja, "jak na boga") then
      i_l = i_l + 39
    end
  i = inteligencja.."<yellow_green> ("..i_l..")<reset>"
  end
  
  --madrosc
  --uciecie "jak na..."
  if string.find(madrosc, " ") then
    str = string.match(madrosc, '(.*) (.*) (.*) (.*)')
    str = string.sub(str, 0, string.len(str)-1)
  else
    str = string.sub(madrosc, 0, string.len(madrosc)-1)
  end
  
  if madroscall[str] then
    m_l = madroscall[str]
    if string.find(madrosc, "jak na legende") then
      m_l = m_l + 13
    elseif string.find(madrosc, "jak na polboga") then
      m_l = m_l + 26
    elseif string.find(madrosc, "jak na boga") then
      m_l = m_l + 39
    end
  m = madrosc.."<yellow_green> ("..m_l..")<reset>"
  end

  --odwaga
  --uciecie "jak na..."
  if string.find(odwaga, " ") then
    str = string.match(odwaga, '(.*) (.*) (.*) (.*)')
    str = string.sub(str, 0, string.len(str)-1)
  else
    str = string.sub(odwaga, 0, string.len(odwaga)-1)
  end
  
  str = string.sub(odwaga, 0, string.len(odwaga)-1)
  if odwagaall[str] then
    o_l = odwagaall[str]
    if string.find(odwaga, "jak na legende") then
      o_l = o_l + 13
    elseif string.find(odwaga, "jak na polboga") then
      o_l = o_l + 26
    elseif string.find(odwaga, "jak na boga") then
      o_l = o_l + 39
    end
  o = odwaga.."<yellow_green> ("..o_l..")<reset>"
  end
  cecho("Jestes "..s..", "..z..", "..w..", "..i..", "..m.." i "..o..".")
  cechy_policz_lvl(s_l,z_l,w_l,i_l,m_l,o_l)
end

function cechy_policz_lvl(sila,zrecznosc,wytrzymalosc,inteligencja,madrosc,odwaga)
  local level = sila+zrecznosc+wytrzymalosc+inteligencja+madrosc+odwaga
  local bojowe = sila+zrecznosc+wytrzymalosc
  local mentalne = inteligencja+madrosc
  local procentbojowych = bojowe/level*100
  local procentmentalnych = mentalne/level*100
  cecho("\n<dark_goldenrod>Masz "..level.."/312 cech. Bojowe: "..bojowe.." ("..math.floor(procentbojowych).."%), mentalne: "..mentalne.." ("..math.floor(procentmentalnych).."%).")
end