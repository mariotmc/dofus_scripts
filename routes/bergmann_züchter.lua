-- lvl 100
-- Pierre Cuivrée, Bronze, Etain, Pierre de Kobalte

ELEMENTS_TO_GATHER = {53, 55, 52, 37}

MAX_MONSTERS = 1

MAX_PODS = 95

function hiboux()
	global:clickPosition(384, 234, false)
	global:delay(1000)
	global:clickPosition(300, 383, false)
	storage:putAllItems()
	global:leaveDialog()
end

function tryHavenbag()
	global.sendKey(72) -- H key
	
	global.delay(5000)
	
	-- After the delay, if the script read here, it might be
	-- because the havenbag is not accessible.
	global.printMessage("[AVERTISSEMENT] Havre-sac inaccessible sur la carte [" .. map.currentPos() .. "].")
	
	-- So let's continue our work...
	return move()
end

function wait()
    map:waitMovementFinish(5000)
end

function enterCave()
    global:clickPosition(403,340)

	return move()
end

function enterBank()
	global:clickPosition(398,229)
end

function gatherLoop()
	-- Tant qu'on a moins de 90% de pods
	while inventory:podsP() < 95 do
	
		-- On récolte sur la carte courante
		gather()
		
		-- On attend 5 secondes
		-- Un délai est OBLIGATOIRE pour éviter que le trajet soit arrêté
		-- de force par FlatyBot, qui considère que le trajet est en boucle
		-- infinie. Pour rappel, sur chaque carte, vous ne pouvez faire qu'un
		-- certain nombre d'actions avant que le trajet considère qu'il est
		-- en boucle infinie.
		global:delay(5000)
		
	end
end

function move()
	return {
		{map = "130810369", custom = gatherLoop},
	}
end

function bank()
	return {
		{ havenbag = true, map = "0,0", changeMap = "zaap(121,217,73400320)" },
		{map = map.currentMapId(), changeMap = "bottom"},
		{map = "-16,2", changeMap = "bottom"},
		{map = "-16,3", changeMap = "bottom"},
		{map = "-16,4", custom = enterBank},
		{ map = "84935175", custom = hiboux, havenbag = true },
		{ map = map.currentMapId(), changeMap = "zaap(121,217,73400320)" },
		{map = map.currentMapId(), changeMap = "top"},
		{map = "-16,0", changeMap = "top"},
		{map = "-16,-1", changeMap = "top"},
		{map = "-16,-2", changeMap = "top"},
		{map = "-16,-3", changeMap = "top"},
		{map = "-16,-4", changeMap = "top"},
		{map = "-16,-5", changeMap = "top"},
		{map = "-16,-6", changeMap = "right"},
		{map = "-15,-6", changeMap = "top"},
		{map = "-15,-7", changeMap = "top"},
		{map = "-15,-8", changeMap = "top"},
		{map = "-15,-9", changeMap = "right"},
		{map = "-14,-9", custom = enterCave},
	}
	end

function phenix()
	return {
	}
end

function lost()
	return {
	}
end