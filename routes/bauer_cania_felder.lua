-- lvl 140
-- Malt, Seigle, Chanvre, Lin

ELEMENTS_TO_GATHER = {47, 44, 46, 42}

MAX_MONSTERS = 1

MAX_PODS = 95

routen_zaap = "zaap(121,217,142087694)"

bank_zaap = "zaap(121,217,191105026)"

function hiboux()
	global:clickPosition(408, 228, false)
	global:delay(1000)
	global:clickPosition(300, 383, false)
	storage:putAllItems()
	global:leaveDialog()
	global:delay(2000)
end

function enterHavenbag()
	global:delay(2500)
    global:sendKey(72)
    global:delay(2500)
end

function wait()
    map:waitMovementFinish(5000)
end

function move()
	return {
		{map = "0,0", changeMap = routen_zaap},
		{map = "-27,-36", changeMap = "left"},
		{map = "-28,-36", changeMap = "left"},
		{map = "-29,-36", changeMap = "left"},
		{map = "-30,-36", changeMap = "top"},
		{map = "-30,-37", changeMap = "top"},
		{map = "-30,-38", changeMap = "top"},
		{map = "-30,-39", gather = true, custom = wait, changeMap = "top"},
		{map = "-30,-40", changeMap = "top"},
		{map = "-30,-41", gather = true, custom = wait, changeMap = "top"},
		{map = "-30,-42", changeMap = "right"},
		{map = "-30,-42", changeMap = "right"},
		{map = "-29,-42", changeMap = "right"},
		{map = "-28,-42", gather = true, custom = wait, changeMap = "right"},
		{map = "-27,-42", gather = true, custom = wait, changeMap = "right"},
		{map = "-26,-42", gather = true, custom = wait, changeMap = "right"},
		{map = "-25,-42", gather = true, custom = wait, changeMap = "right"},
		{map = "-24,-42", gather = true, custom = wait, changeMap = "right"},
		{map = "-23,-42", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-23,-41", changeMap = "bottom"},
		{map = "-23,-40", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-23,-39", gather = true, custom = wait, changeMap = "right"},
		{map = "-22,-39", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-22,-38", changeMap = "left"},
		{map = "-23,-38", changeMap = "left"},
		{map = "-24,-38", changeMap = "left"},
		{map = "-25,-38", changeMap = "left"},
		{map = "-26,-38", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-26,-37", changeMap = "bottom"},
		{map = "-26,-36", changeMap = "left"},
	}
end

function bank()
	return {
		{ map = "0,0", changeMap = bank_zaap },
		{ map = "5,-18", changeMap = "left" },
		{ map = "191104002", changeMap = "247" },
		{ map = "192415750", custom = hiboux},
	}	
end

function phenix()
	return {
	}
end

function lost()
	return {
		enterHavenbag()
	}
end