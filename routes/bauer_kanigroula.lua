-- lvl 180
-- Millet

ELEMENTS_TO_GATHER = {261}

MAX_MONSTERS = 1

MAX_PODS = 95

routen_zaap = "zaap(121,217,156240386)"

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
		{map = "-3,-42", changeMap = "right"},
		{map = "-2,-42", changeMap = "top"},
		{map = "-2,-43", changeMap = "top"},
		{map = "-2,-44", changeMap = "top"},
		{map = "-2,-45", changeMap = "top"},
		{map = "-2,-46", changeMap = "top"},
		{map = "-2,-47", changeMap = "top"},
		{map = "-2,-48", changeMap = "top"},
		{map = "-2,-49", changeMap = "top"},
		{map = "-2,-50", changeMap = "top"},
		{map = "-2,-51", gather = true, custom = wait, changeMap = "left"},
		{map = "-3,-51", gather = true, custom = wait, changeMap = "top"},
		{map = "-3,-52", gather = true, custom = wait, changeMap = "left"},
		{map = "-4,-52", gather = true, custom = wait, changeMap = "top"},
		{map = "-4,-53", gather = true, custom = wait, changeMap = "left"},
		{map = "-5,-53", changeMap = "left"},
		{map = "-6,-53", gather = true, custom = wait, changeMap = "top"},
		{map = "-6,-54", gather = true, custom = wait, changeMap = "top"},
		{map = "-6,-55", gather = true, custom = wait, changeMap = "right"},
		{map = "-5,-55", gather = true, custom = wait, changeMap = "right"},
		{map = "-4,-55", gather = true, custom = wait, changeMap = "top"},
		{map = "-4,-56", gather = true, custom = wait, changeMap = "left"},
		{map = "-5,-56", gather = true, custom = wait, changeMap = "left"},
		{map = "-6,-56", gather = true, custom = wait, changeMap = "top"},
		{map = "-6,-57", gather = true, custom = wait, changeMap = "right"},
		{map = "-5,-57", gather = true, custom = wait, changeMap = "right"},
		{map = "-4,-57", gather = true, custom = wait, changeMap = "right"},
		{map = "-3,-57", gather = true, custom = wait, changeMap = "top"},
		{map = "-3,-58", gather = true, custom = wait, changeMap = "top"},
		{map = "-3,-59", changeMap = "left"},
		{map = "-4,-59", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-4,-58", gather = true, custom = wait, changeMap = "left"},
		{map = "-5,-58", gather = true, custom = wait, changeMap = "top"},
		{map = "-5,-59", gather = true, custom = wait, changeMap = "left"},
		{map = "-6,-59", changeMap = "bottom"},
		{map = "-6,-58", gather = true, custom = wait, changeMap = "left"},
		{map = "-7,-58", changeMap = "bottom"},
		{map = "-7,-57", changeMap = "bottom"},
		{map = "-7,-56", changeMap = "bottom"},
		{map = "-7,-55", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-7,-54", changeMap = "bottom"},
		{map = "-7,-53", changeMap = "bottom"},
		{map = "-7,-52", changeMap = "right"},
		{map = "-6,-52", gather = true, custom = wait, changeMap = "right"},
		{map = "-5,-52", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-5,-51", changeMap = "bottom"},
		{map = "-5,-50", changeMap = "right"},
		{map = "-4,-50", changeMap = "right"},
		{map = "-3,-50", changeMap = "right"},
	}
end

function bank()
	return {
		{map = "0,0", changeMap = bank_zaap},
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