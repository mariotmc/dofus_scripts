MAX_PODS = 90
--lost puis havresac

function havresac()
    global:delay(1001)
    global:sendKey(72)
    global:delay(1002)
end

function lost()
	return
	{
        {map = map:currentPos(), havenbag = true},
    }
end

function hiboux()
    npc:npcBank(-1,-1)
    global:delay(2500)
    storage:putAllItems()
    global:leaveDialog()
end

function astrub()
	global:delay(2500)
	map:changeMap("zaap(125,196,191105026)")
	global:delay(2500)
end


function lacDeCania()
	global:delay(2500)
	map:changeMap("zaap(125,196,156240386)")
	global:delay(2500)
end

function coin()
	global:delay(2500)
	map:changeMap("zaap(125,196,88082704)")
	global:delay(2500)
end

function champs()
	global:delay(2500)
	map:changeMap("zaap(125,196,142087694)")
	global:delay(2500)
end

function scarafeuille()
	global:delay(2500)
	map:changeMap("zaap(125,196,88212481)")
	global:delay(2500)
end

function otomai()
	global:delay(2500)
	map:changeMap("zaap(125,196,154642)")
	global:delay(2500)
end

function frigost()
	global:delay(2500)
	map:changeMap("zaap(125,196,54172969)")
	global:delay(2500)
end

function move()
	if (job:level(28) < 20) then
        ELEMENTS_TO_GATHER = {38}
	return {
		{map = "0,0", custom = astrub},
		{map = "5,-18", changeMap = "left", gather = true},
		{map = "4,-18", changeMap = "top", gather = true},
		{map = "4,-19", changeMap = "top", gather = true},
		{map = "4,-20", changeMap = "top", gather = true},
		{map = "4,-21", changeMap = "right", gather = true},
		{map = "5,-21", changeMap = "right", gather = true},
		{map = "6,-21", changeMap = "right", gather = true},
		{map = "7,-21", changeMap = "top", gather = true},
		{map = "6,-22", changeMap = "left", gather = true},
		{map = "5,-22", changeMap = "left", gather = true},
		{map = "4,-22", changeMap = "left", gather = true},
		{map = "3,-22", changeMap = "top", gather = true},
		{map = "3,-23", changeMap = "right", gather = true},
		{map = "4,-23", changeMap = "right", gather = true},
		{map = "5,-23", changeMap = "right", gather = true},
		{map = "6,-23", changeMap = "right", gather = true},
		{map = "7,-23", changeMap = "right", gather = true},
		{map = "8,-23", changeMap = "right", gather = true},
		{map = "9,-23", changeMap = "top", gather = true},
		{map = "7,-24", changeMap = "top", gather = true},
		{map = "6,-25", changeMap = "left", gather = true},
		{map = "5,-25", changeMap = "left", gather = true},
		{map = "3,-25", changeMap = "top", gather = true},
		{map = "3,-26", changeMap = "right", gather = true},
		{map = "4,-26", changeMap = "top", gather = true},
		{map = "4,-27", changeMap = "top", gather = true},
		{map = "5,-28", changeMap = "right", gather = true},
		{map = "27,-29", changeMap = "right", gather = true},
		{map = "6,-28", changeMap = "top", gather = true},
		{map = "6,-29", changeMap = "left", gather = true},
		{map = "5,-29", changeMap = "left", gather = true},
		{map = "4,-29", changeMap = "left", gather = true},
		{map = "3,-29", changeMap = "top", gather = true},
		{map = "4,-30", changeMap = "right", gather = true},
		{map = "3,-30", changeMap = "right", gather = true},
		{map = "5,-30", changeMap = "right", gather = true},
		{map = "7,-22", changeMap = "left", gather = true},
		{map = "9,-24", changeMap = "left", gather = true},
		{map = "8,-24", changeMap = "left", gather = true},
		{map = "7,-25", changeMap = "left", gather = true},
		{map = "4,-25", changeMap = "left", gather = true},
		{map = "4,-28", changeMap = "right", gather = true},
	}
	elseif (job:level(28) >= 20) and (job:level(28) < 40) then
		ELEMENTS_TO_GATHER = {43,38}
	return {
		{map = "0,0", custom = champs},
		{map = "-27,-36", changeMap = "left", gather = true},
		{map = "-28,-36", changeMap = "left", gather = true},
		{map = "-29,-36", changeMap = "top", gather = true},
		{map = "-29,-37", changeMap = "right", gather = true},
		{map = "-28,-37", changeMap = "right", gather = true},
		{map = "-27,-37", changeMap = "right", gather = true},
		{map = "-26,-37", changeMap = "top", gather = true},
		{map = "-26,-38", changeMap = "left", gather = true},
		{map = "-27,-38", changeMap = "left", gather = true},
		{map = "-28,-38", changeMap = "left", gather = true},
		{map = "-29,-38", changeMap = "top", gather = true},
		{map = "-29,-39", changeMap = "right", gather = true},
		{map = "-28,-39", changeMap = "right", gather = true},
		{map = "-27,-39", changeMap = "right", gather = true},
		{map = "-26,-39", changeMap = "right", gather = true},
		{map = "-25,-39", changeMap = "right", gather = true},
		{map = "-24,-39", changeMap = "top", gather = true},
		{map = "-24,-40", changeMap = "left", gather = true},
		{map = "-25,-40", changeMap = "left", gather = true},
		{map = "-26,-40", changeMap = "left", gather = true},
		{map = "-27,-40", changeMap = "top", gather = true},
		{map = "-27,-41", changeMap = "top", gather = true},
		{map = "-27,-42", changeMap = "right", gather = true},
		{map = "-25,-42", changeMap = "right", gather = true},
		{map = "-26,-42", changeMap = "right", gather = true},
		{map = "-24,-42", changeMap = "right", gather = true},
		{map = "-23,-42", changeMap = "right", gather = true},
		{map = "-22,-42", changeMap = "top", gather = true},
		{map = "-22,-43", changeMap = "left", gather = true},
		{map = "-23,-43", changeMap = "left", gather = true},
		{map = "-24,-43", changeMap = "left", gather = true},
		{map = "-25,-43", changeMap = "left", gather = true},
		{map = "-26,-43", changeMap = "left", gather = true},
		{map = "-27,-43", changeMap = "left", gather = true},
		{map = "-28,-43", changeMap = "top", gather = true},
		{map = "-28,-44", changeMap = "top", gather = true},
		{map = "-28,-45", changeMap = "right", gather = true},
		{map = "-27,-45", changeMap = "bottom", gather = true},
		{map = "-27,-44", changeMap = "right", gather = true},
		{map = "-26,-44", changeMap = "right", gather = true},
		{map = "-25,-44", changeMap= "right", gather = true},
	}
	elseif (job:level(28) >= 40) and (job:level(28) < 60) then
		ELEMENTS_TO_GATHER = {43,38,45}
	return 
	{
		{map="0,0",custom=champs},
		{map = "-27,-36", changeMap = "left", gather = true},
		{map = "-28,-36", changeMap = "left", gather = true},
		{map = "-29,-36", changeMap = "top", gather = true},
		{map = "-29,-37", changeMap = "right", gather = true},
		{map = "-28,-37", changeMap = "right", gather = true},
		{map = "-27,-37", changeMap = "right", gather = true},
		{map = "-26,-37", changeMap = "top", gather = true},
		{map = "-26,-38", changeMap = "left", gather = true},
		{map = "-27,-38", changeMap = "left", gather = true},
		{map = "-28,-38", changeMap = "left", gather = true},
		{map = "-29,-38", changeMap = "top", gather = true},
		{map = "-29,-39", changeMap = "right", gather = true},
		{map = "-28,-39", changeMap = "right", gather = true},
		{map = "-27,-39", changeMap = "top", gather = true},
		{map = "-27,-40", changeMap = "top", gather = true},
		{map = "-27,-41", changeMap = "right", gather = true},
		{map = "-26,-41", changeMap = "right", gather = true},
		{map = "-25,-41", changeMap = "top", gather = true},
		{map = "-25,-42", changeMap = "left", gather = true},
		{map = "-26,-42", changeMap = "left", gather = true},
		{map = "-27,-42", changeMap = "top", gather = true},
		{map = "-27,-43", changeMap = "top", gather = true},
		{map = "-27,-44", changeMap = "left", gather = true},
		{map = "-28,-44", changeMap = "left", gather = true},
		{map = "-29,-44", changeMap = "left", gather = true},
		{map = "-30,-44", changeMap = "left", gather = true},
	}
	elseif (job:level(28) >= 60) and (job:level(28) < 80) then
		ELEMENTS_TO_GATHER = {38,43,45,39}
	return {
		{map = "0,0", custom = astrub},
		{map = "5,-18", changeMap = "left", gather = true},
		{map = "4,-18", changeMap = "top", gather = true},
		{map = "4,-19", changeMap = "top", gather = true},
		{map = "4,-20", changeMap = "top", gather = true},
		{map = "4,-21", changeMap = "top", gather = true},
		{map = "4,-22", changeMap = "right", gather = true},
		{map = "5,-22", changeMap = "right", gather = true},
		{map = "6,-22", changeMap = "right", gather = true},
		{map = "7,-22", changeMap = "right", gather = true},
		{map = "8,-22", changeMap = "top", gather = true},
		{map = "8,-23", changeMap = "left", gather = true},
		{map = "7,-23", changeMap = "left", gather = true},
		{map = "6,-23", changeMap = "left", gather = true},
		{map = "5,-23", changeMap = "top", gather = true},
		{map = "5,-24", changeMap = "top", gather = true},
		{map = "5,-25", changeMap = "top", gather = true},
		{map = "5,-26", changeMap = "left", gather = true},
		{map = "4,-26", changeMap = "top", gather = true},
		{map = "4,-27", changeMap = "right", gather = true},
		{map = "5,-27", changeMap = "top", gather = true},
		{map = "5,-28", changeMap = "left", gather = true},
		{map = "4,-28", changeMap = "left", gather = true},
		{map = "3,-28", changeMap = "top", gather = true},
		{map = "3,-29", changeMap = "top", gather = true},
		{map = "3,-30", changeMap = "top", gather = true},
	}
	elseif (job:level(28) >= 80) and (job:level(28) < 100) then
		ELEMENTS_TO_GATHER = {38,43,45,39,42}
	return 
	{
		{map="0,0",custom = scarafeuille},
		{map = "-1,24", changeMap = "right", gather = true},
		{map = "0,24", changeMap = "right", gather = true},
		{map = "1,24", changeMap = "right", gather = true},
		{map = "2,24", changeMap = "top", gather = true},
		{map = "2,23", changeMap = "top", gather = true},
		{map = "2,22", changeMap = "right", gather = true},
		{map = "3,22", changeMap = "bottom", gather = true},
		{map = "3,23", changeMap = "bottom", gather = true},
		{map = "3,24", changeMap = "bottom", gather = true},
		{map = "3,25", changeMap = "left", gather = true},
		{map = "2,25", changeMap = "left", gather = true},
		{map = "1,25", changeMap = "left", gather = true},
		{map = "0,25", changeMap = "bottom", gather = true},
		{map = "0,26", changeMap = "right", gather = true},
		{map = "1,26", changeMap = "right", gather = true},
		{map = "2,26", changeMap = "right", gather = true},
		{map = "3,26", changeMap = "right", gather = true},
		{map = "4,26", changeMap = "bottom", gather = true},
		{map = "4,27", changeMap = "bottom", gather = true},
		{map = "4,28", changeMap = "bottom", gather = true},
	}
	elseif (job:level(28) >= 100) and (job:level(28) < 120) then
		ELEMENTS_TO_GATHER = {38,43,45,39,42,44}
	return {
		{map = "0,0", custom = champs},
		{map = "-27,-36", changeMap = "top"},
		{map = "-27,-37", changeMap = "top"},
		{map = "-27,-38", changeMap = "right", gather = true},
		{map = "-26,-38", changeMap = "right", gather = true},
		{map = "-24,-38", changeMap = "right", gather = true},
		{map = "-25,-38", changeMap = "right", gather = true},
		{map = "-23,-38", changeMap = "top", gather = true},
		{map = "-23,-39", changeMap = "left", gather = true},
		{map = "-24,-39", changeMap = "left", gather = true},
		{map = "-25,-39", changeMap = "left", gather = true},
		{map = "-26,-39", changeMap = "left", gather = true},
		{map = "-27,-39", changeMap = "left", gather = true},
		{map = "-28,-39", changeMap = "left", gather = true},
		{map = "-29,-39", changeMap = "left", gather = true},
		{map = "-30,-39", changeMap = "top", gather = true},
		{map = "-30,-40", changeMap = "right", gather = true},
		{map = "-29,-40", changeMap = "right", gather = true},
		{map = "-28,-40", changeMap = "right", gather = true},
		{map = "-27,-40", changeMap = "right", gather = true},
		{map = "-26,-40", changeMap = "right", gather = true},
		{map = "-25,-40", changeMap = "right", gather = true},
		{map = "-24,-40", changeMap = "right", gather = true},
		{map = "-23,-40", changeMap = "top", gather = true},
		{map = "-23,-41", changeMap = "left", gather = true},
		{map = "-24,-41", changeMap = "left", gather = true},
		{map = "-25,-41", changeMap = "left", gather = true},
		{map = "-26,-41", changeMap = "left", gather = true},
		{map = "-27,-41", changeMap = "left", gather = true},
		{map = "-28,-41", changeMap = "left", gather = true},
		{map = "-29,-41", changeMap = "left", gather = true},
		{map = "-30,-41", changeMap = "top", gather = true},
		{map = "-30,-42", changeMap = "right", gather = true},
		{map = "-29,-42", changeMap = "right", gather = true},
		{map = "-28,-42", changeMap = "right", gather = true},
		{map = "-27,-42", changeMap = "right", gather = true},
		{map = "-26,-42", changeMap = "right", gather = true},
		{map = "-25,-42", changeMap = "right", gather = true},
		{map = "-24,-42", changeMap = "top", gather = true},
		{map = "-24,-43", changeMap = "left", gather = true},
		{map = "-25,-43", changeMap = "top", gather = true},
		{map = "-25,-44", changeMap = "left", gather = true},
		{map = "-26,-44", changeMap = "left", gather = true},
		{map = "-27,-44", changeMap = "left", gather = true},
		{map = "-28,-44", changeMap = "left", gather = true},
	}
	elseif (job:level(28) >= 120) and (job:level(28) < 140) then
		ELEMENTS_TO_GATHER = {38,43,45,39,42,44,47}
	return {
		{map = "0,0", custom = coin},
		{map = "5,7", changeMap = "right", gather = true},
		{map = "6,7", changeMap = "right", gather = true},
		{map = "7,7", changeMap = "right", gather = true},
		{map = "8,7", changeMap = "top", gather = true},
		{map = "8,6", changeMap = "top", gather = true},
		{map = "8,5", changeMap = "right", gather = true},
		{map = "9,5", changeMap = "right", gather = true},
		{map = "10,5", changeMap = "bottom", gather = true},
		{map = "10,6", changeMap = "bottom", gather = true},
		{map = "10,7", changeMap = "bottom", gather = true},
		{map = "10,8", changeMap = "left", gather = true},
		{map = "9,8", changeMap = "left", gather = true},
	}
	elseif (job:level(28) >= 140) and (job:level(28) < 160) then
		ELEMENTS_TO_GATHER = {38,43,45,39,42,44,47,46}
	return {
		{map= "0,0",custom=champs},
		{map = "-27,-36", changeMap = "top", gather = true},
		{map = "-27,-37", changeMap = "top", gather = true},
		{map = "-27,-38", changeMap = "top", gather = true},
		{map = "-27,-39", changeMap = "right", gather = true},
		{map = "-26,-39", changeMap = "right", gather = true},
		{map = "-25,-39", changeMap = "right", gather = true},
		{map = "-24,-39", changeMap = "right", gather = true},
		{map = "-23,-39", changeMap = "right", gather = true},
		{map = "-22,-39", changeMap = "top", gather = true},
		{map = "-22,-40", changeMap = "top", gather = true},
		{map = "-22,-41", changeMap = "top", gather = true},
		{map = "-22,-42", changeMap = "left", gather = true},
		{map = "-23,-42", changeMap = "left", gather = true},
		{map = "-25,-42", changeMap = "left", gather = true},
		{map = "-24,-42", changeMap = "left", gather = true},
		{map = "-26,-42", changeMap = "top", gather = true},
		{map = "-26,-43", changeMap = "left", gather = true},
		{map = "-27,-43", changeMap = "left", gather = true},
		{map = "-28,-43", changeMap = "bottom", gather = true},
		{map = "-28,-42", changeMap = "bottom", gather = true},
	}
	elseif (job:level(28) >= 160) and (job:level(28) < 180) then
		ELEMENTS_TO_GATHER = {38,43,45,39,42,44,47,46,260}
	return {
		{map = "0,0", custom = otomai},
		{map = "-46,18", changeMap = "bottom", gather = true},
		{map = "-46,19", changeMap = "left", gather = true},
		{map = "-47,19", changeMap = "left", gather = true},
		{map = "-48,19", changeMap = "left", gather = true},
		{map = "-49,19", changeMap = "top", gather = true},
		{map = "-49,18", changeMap = "top", gather = true},
		{map = "-49,17", changeMap = "top", gather = true},
		{map = "-49,16", changeMap = "top", gather = true},
		{map = "-49,15", changeMap = "top", gather = true},
		{map = "-49,14", changeMap = "top", gather = true},
		{map = "-49,13", changeMap = "top", gather = true},
		{map = "-49,12", changeMap = "top", gather = true},
		{map = "-49,11", changeMap = "left", gather = true},
		{map = "-50,11", changeMap = "top", gather = true},
		{map = "-50,10", changeMap = "left", gather = true},
		{map = "-51,10", changeMap = "top", gather = true},
		{map = "-51,9", changeMap = "top", gather = true},
		{map = "-51,8", changeMap = "left", gather = true},
		{map = "-52,8", changeMap = "top", gather = true},
		{map = "-52,7", changeMap = "top", gather = true},
		{map = "-52,6", changeMap = "top", gather = true},
		{map = "-52,5", changeMap = "top", gather = true},
		{map = "-52,4", changeMap = "left", gather = true},
		{map = "-53,4", changeMap = "left", gather = true},
		{map = "-54,4", changeMap = "left", gather = true},
		{map = "-55,4", changeMap = "top", gather = true},
		{map = "-55,3", changeMap = "top", gather = true},
	}
	elseif (job:level(28) >= 180) and (job:level(28) < 200) then
		ELEMENTS_TO_GATHER = {38,43,45,39,42,44,47,46,260,261}
	return {
		{map = "0,0", custom = lacDeCania},
		{map = "-3,-42", changeMap = "top", gather = true},
		{map = "-3,-43", changeMap = "top", gather = true},
		{map = "-3,-44", changeMap = "top", gather = true},
		{map = "-3,-45", changeMap = "top", gather = true},
		{map = "-3,-46", changeMap = "top", gather = true},
		{map = "-3,-47", changeMap = "top", gather = true},
		{map = "-3,-48", changeMap = "top", gather = true},
		{map = "-3,-49", changeMap = "top", gather = true},
		{map = "-3,-50", changeMap = "top", gather = true},
		{map = "-3,-51", changeMap = "right", gather = true},
		{map = "-2,-51", changeMap = "top", gather = true},
		{map = "-2,-52", changeMap = "top", gather = true},
		{map = "-2,-53", changeMap = "left", gather = true},
		{map = "-3,-53", changeMap = "bottom", gather = true},
		{map = "-3,-52", changeMap = "left", gather = true},
		{map = "-4,-52", changeMap = "bottom", gather = true},
		{map = "-4,-51", changeMap = "left", gather = true},
		{map = "-5,-51", changeMap = "top", gather = true},
		{map = "-5,-52", changeMap = "left", gather = true},
		{map = "-6,-52", changeMap = "top", gather = true},
		{map = "-6,-53", changeMap = "top", gather = true},
		{map = "-6,-54", changeMap = "left", gather = true},
		{map = "-7,-54", changeMap = "top", gather = true},
		{map = "-7,-55", changeMap = "right", gather = true},
		{map = "-6,-55", changeMap = "right", gather = true},
		{map = "-5,-55", changeMap = "right", gather = true},
		{map = "-4,-55", changeMap = "top", gather = true},
		{map = "-4,-56", changeMap = "left", gather = true},
		{map = "-5,-56", changeMap = "left", gather = true},
		{map = "-6,-56", changeMap = "top", gather = true},
		{map = "-6,-57", changeMap = "right", gather = true},
		{map = "-5,-57", changeMap = "right", gather = true},
		{map = "-4,-57", changeMap = "top", gather = true},
		{map = "-4,-58", changeMap = "left", gather = true},
		{map = "-5,-58", changeMap = "left", gather = true},
		{map = "-6,-58", changeMap = "top", gather = true},
		{map = "-6,-59", changeMap = "right", gather = true},
		{map = "-5,-59", changeMap = "right", gather = true},
		{map = "-4,-59", changeMap = "right", gather = true},
		{map = "-3,-59", changeMap = "bottom", gather = true},
		{map = "-3,-58", changeMap = "bottom", gather = true},
		{map = "-3,-57", changeMap = "right", gather = true},
		{map = "-2,-57", changeMap = "right", gather = true},
		{map = "-1,-57", changeMap = "bottom", gather = true},
		{map = "-1,-56", changeMap = "left", gather = true},
		{map = "-2,-56", changeMap = "left", gather = true},
		{map = "-3,-56", changeMap = "bottom", gather = true},
		{map = "-3,-55", changeMap = "bottom", gather = true},
		{map = "-3,-54", changeMap = "left", gather = true},
		{map = "-4,-54",custom=lost, gather = true},
	}
end
end

function bank()
	return {
		{map="0,0",custom=astrub},
		{map="5,-18",changeMap="left"},
		{map="191104002",changeMap="289"},
		{map="192415750",custom=hiboux,changeMap="424"},
	}
end