-- lvl 160 (bauer) 170 (fischer)
-- Maïs, Morue

ELEMENTS_TO_GATHER = {260, 272}

MAX_MONSTERS = 1

MAX_PODS = 95

routen_zaap = "zaap(121,217,154642)"

bank_zaap = "zaap(121,217,154642)"

function hiboux()
	global:clickPosition(329, 259, false)
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

function enterBank()
	global:clickPosition(299,245)
end

function wait()
    map:waitMovementFinish(5000)
end

function move()
	return {
		{map = "0,0", changeMap = routen_zaap},
		{map = "-46,18", changeMap = "right"},
		{map = "-45,18", changeMap = "top"},
		{map = "-45,17", changeMap = "top"},
		{map = "-45,16", changeMap = "top"},
		{map = "-45,15", gather = true, custom = wait, changeMap = "left"},
		{map = "-46,15", changeMap = "left"},
		{map = "-47,15", changeMap = "top"},
		{map = "-47,14", changeMap = "right"},
		{map = "-46,14", gather = true, custom = wait, changeMap = "top"},
		{map = "-46,13", gather = true, custom = wait, changeMap = "left"},
		{map = "-47,13", changeMap = "top"},
		{map = "-47,12", changeMap = "top"},
		{map = "-47,11", gather = true, custom = wait, changeMap = "left"},
		{map = "-48,11", changeMap = "left"},
		{map = "-49,11", changeMap = "left"},
		{map = "-50,11", gather = true, custom = wait, changeMap = "left"},
		{map = "-51,11", changeMap = "top"},
		{map = "-51,10", gather = true, custom = wait, changeMap = "top"},
		{map = "-51,9", gather = true, custom = wait, changeMap = "left"},
		{map = "-52,9", changeMap = "top"},
		{map = "-52,8", gather = true, custom = wait, changeMap = "top"},
		{map = "-52,7", gather = true, custom = wait, changeMap = "right"},
		{map = "-51,7", changeMap = "top"},
		{map = "-51,6", changeMap = "top"},
		{map = "-51,5", changeMap = "top"},
		{map = "-51,4", gather = true, custom = wait, changeMap = "left"},
		{map = "-52,4", changeMap = "top"},
		{map = "-52,3", changeMap = "top"},
		{map = "-52,2", changeMap = "top"},
		{map = "-52,1", changeMap = "top"},
		{map = "-52,0", changeMap = "top"},
		{map = "-52,-1", gather = true, custom = wait, changeMap = "top"},
		{map = "-52,-2", gather = true, custom = wait, changeMap = "left"},
		{map = "-53,-2", changeMap = "bottom"},
		{map = "-53,-1", changeMap = "left"},
		{map = "-54,-1", changeMap = "left"},
		{map = "-55,-1", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-55,0", changeMap = "bottom"},
		{map = "-55,1", changeMap = "bottom"},
		{map = "-55,2", changeMap = "bottom"},
		{map = "-55,3", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-55,4", gather = true, custom = wait, changeMap = "left"},
		{map = "-56,4", changeMap = "left"},
		{map = "-57,4", changeMap = "left"},
		{map = "-58,4", changeMap = "left"},
		{map = "-59,4", changeMap = "top"},
		{map = "-59,3", changeMap = "top"},
		{map = "-59,2", changeMap = "left"},
		{map = "-60,2", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-60,3", changeMap = "bottom"},
		{map = "-60,4", changeMap = "bottom"},
		{map = "-60,5", gather = true, custom = wait, changeMap = "right"},
		{map = "-59,5", changeMap = "bottom"},
		{map = "-59,6", changeMap = "bottom"},
		{map = "-59,7", changeMap = "bottom"},
		{map = "-59,8", changeMap = "bottom"},
		{map = "-59,9", gather = true, custom = wait, changeMap = "right"},
		{map = "-58,9", changeMap = "right"},
		{map = "-57,9", changeMap = "right"},
		{map = "-56,9", changeMap = "bottom"},
		{map = "-56,10", changeMap = "bottom"},
		{map = "-56,11", changeMap = "bottom"},
		{map = "-56,12", changeMap = "right"},
		{map = "-55,12", changeMap = "right"},
		{map = "-54,12", changeMap = "bottom"},
		{map = "-54,13", changeMap = "right"},
		{map = "-53,13", changeMap = "top"},
		{map = "-53,12", changeMap = "right"},
		{map = "-52,12", changeMap = "right"},
		{map = "-51,12", changeMap = "right"},
		{map = "-50,12", changeMap = "right"},
		{map = "-49,12", changeMap = "right"},
		{map = "-48,12", changeMap = "bottom"},
		{map = "-48,13", changeMap = "bottom"},
		{map = "-48,14", changeMap = "bottom"},
		{map = "-48,15", changeMap = "bottom"},
		{map = "-48,16", changeMap = "bottom"},
		{map = "-48,17", changeMap = "bottom"},
		{map = "-48,18", changeMap = "bottom"},
		{map = "-48,19", changeMap = "right"},
		{map = "-47,19", changeMap = "right"},
		{map = "-46,19", changeMap = "top"},
	}
end

function bank()
	return {
		{ map = "0,0", changeMap = bank_zaap },
		{map = "-46,18", changeMap = "left"},
		{map = "-46,18", changeMap = "left"},
		{map = "-47,18", changeMap = "bottom"},
		{map = "-47,19", changeMap = "bottom"},
		{map = "-47,20", changeMap = "bottom"},
		{map = "155157", custom = enterBank},
		{map = "86511105", custom = hiboux},
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