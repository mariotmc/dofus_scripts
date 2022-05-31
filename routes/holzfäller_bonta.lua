-- lvl 180
-- Charme, Orme

ELEMENTS_TO_GATHER = {32, 30}

MAX_MONSTERS = 1

MAX_PODS = 95

function move()
	return {
		{map = "-27,-36", changeMap = "left"},
		{map = "-28,-36", changeMap = "left"},
		{map = "-29,-36", changeMap = "left"},
		{map = "-30,-36", changeMap = "top"},
		{map = "-30,-37", changeMap = "top"},
		{map = "-30,-38", changeMap = "top"},
		{map = "-30,-39", changeMap = "top"},
		{map = "-30,-40", changeMap = "top"},
		{map = "-30,-41", changeMap = "top"},
		{map = "-30,-42", gather = true, custom = wait, changeMap = "left"},
		{map = "-31,-42", changeMap = "top"},
		{map = "-31,-43", gather = true, custom = wait, changeMap = "top"},
		{map = "-31,-44", gather = true, custom = wait, changeMap = "top"},
		{map = "-31,-45", changeMap = "right"},
		{map = "-30,-45", changeMap = "right"},
		{map = "-29,-45", changeMap = "right"},
		{map = "-28,-45", changeMap = "right"},
		{map = "-27,-45", gather = true, custom = wait, changeMap = "top"},
		{map = "-27,-46", changeMap = "left"},
		{map = "-28,-46", changeMap = "left"},
		{map = "-29,-46", changeMap = "left"},
		{map = "-30,-46", changeMap = "top"},
		{map = "-30,-47", changeMap = "top"},
		{map = "-30,-48", gather = true, custom = wait, changeMap = "right"},
		{map = "-29,-48", changeMap = "right"},
		{map = "-28,-48", changeMap = "right"},
		{map = "-27,-48", changeMap = "right"},
		{map = "-26,-48", changeMap = "right"},
		{map = "-25,-48", changeMap = "top"},
		{map = "-25,-49", gather = true, custom = wait, changeMap = "right"},
		{map = "-24,-49", changeMap = "right"},
		{map = "-23,-49", changeMap = "top"},
		{map = "-23,-50", changeMap = "top"},
		{map = "-23,-51", changeMap = "top"},
		{map = "-23,-52", changeMap = "top"},
		{map = "-23,-53", changeMap = "top"},
		{map = "-23,-54", changeMap = "top"},
		{map = "-23,-55", changeMap = "top"},
		{map = "-23,-56", changeMap = "top"},
		{map = "-23,-57", changeMap = "top"},
		{map = "-23,-58", gather = true, custom = wait, changeMap = "right"},
		{map = "-22,-58", changeMap = "top"},
		{map = "-22,-59", changeMap = "top"},
		{map = "-22,-60", changeMap = "top"},
		{map = "-22,-61", changeMap = "top"},
		{map = "-22,-62", gather = true, custom = wait, changeMap = "right"},
		{map = "-21,-62", changeMap = "right"},
		{map = "-20,-62", changeMap = "right"},
		{map = "-19,-62", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-19,-61", changeMap = "bottom"},
		{map = "-19,-60", changeMap = "bottom"},
		{map = "-19,-59", changeMap = "bottom"},
		{map = "-19,-58", changeMap = "right"},
		{map = "-18,-58", gather = true, custom = wait, changeMap = "right"},
		{map = "-17,-58", changeMap = "bottom"},
		{map = "-17,-57", gather = true, custom = wait, changeMap = "right"},
		{map = "-16,-57", changeMap = "right"},
		{map = "-15,-57", changeMap = "right"},
		{map = "-14,-57", changeMap = "right"},
		{map = "-13,-57", gather = true, custom = wait, changeMap = "top"},
		{map = "-13,-58", changeMap = "right"},
		{map = "-12,-58", changeMap = "bottom"},
		{map = "-12,-57", gather = true, custom = wait, changeMap = "right"},
		{map = "-11,-57", changeMap = "bottom"},
		{map = "-11,-56", changeMap = "left"},
		{map = "-12,-56", changeMap = "bottom"},
		{map = "-12,-55", changeMap = "bottom"},
		{map = "-12,-54", changeMap = "bottom"},
		{map = "-12,-53", changeMap = "bottom"},
		{map = "-12,-52", changeMap = "bottom"},
		{map = "-12,-51", changeMap = "bottom"},
		{map = "-12,-50", gather = true, custom = wait, changeMap = "left"},
		{map = "-13,-50", changeMap = "left"},
		{map = "-14,-50", changeMap = "left"},
		{map = "-15,-50", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-15,-49", changeMap = "bottom"},
		{map = "-15,-48", changeMap = "right"},
		{map = "-14,-48", changeMap = "right"},
		{map = "-13,-48", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-13,-47", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-13,-46", gather = true, custom = wait, changeMap = "right"},
		{map = "-12,-46", gather = true, custom = wait, changeMap = "right"},
		{map = "-11,-46", changeMap = "right"},
		{map = "-10,-46", gather = true, custom = wait, changeMap = "right"},
		{map = "-9,-46", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-9,-45", changeMap = "bottom"},
		{map = "-9,-44", gather = true, custom = wait, changeMap = "bottom"},
		{map = "-9,-43", changeMap = "bottom"},
		{map = "-9,-42", changeMap = "left"},
		{map = "-10,-42", gather = true, custom = wait, changeMap = "left"},
		{map = "-11,-42", changeMap = "left"},
		{map = "-12,-42", gather = true, custom = wait, changeMap = "left"},
		{map = "-13,-42", changeMap = "left"},
		{map = "-14,-42", changeMap = "left"},
		{map = "-15,-42", changeMap = "left"},
		{map = "-16,-42", changeMap = "left"},
		{map = "-17,-42", changeMap = "left"},
		{map = "-18,-42", changeMap = "left"},
		{map = "-19,-42", changeMap = "left"},
		{map = "-20,-42", changeMap = "left"},
		{map = "-21,-42", changeMap = "left"},
		{map = "-22,-42", changeMap = "left"},
		{map = "-23,-42", changeMap = "left"},
		{map = "-24,-42", changeMap = "left"},
		{map = "-25,-42", changeMap = "left"},
		{map = "-26,-42", changeMap = "left"},
		{map = "-27,-42", changeMap = "left"},
		{map = "-28,-42", changeMap = "left"},
		{map = "-29,-42", changeMap = "left"},
	}
end

function bank()
	return {

	}
	end

function emptyInventory()
    npc:npcBank(-1,-1)
    global:delay(2500)
    storage:putAllItems()
    global:leaveDialog()
end

function wait()
    map:waitMovementFinish(5000)
end


function phenix()
	return {
	}
end

function lost()
	return {
	}
end