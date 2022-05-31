-- lvl 140
-- Malt, Seigle, Chanvre

ELEMENTS_TO_GATHER = {47, 44, 46}

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