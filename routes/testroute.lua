-- lvl 140
-- Malt, Seigle, Chanvre

ELEMENTS_TO_GATHER = {47, 44, 46}

MAX_MONSTERS = 1

MAX_PODS = 95


function move()
    -- variable to determine position change on overlap
    -- if/else statement to determine direction on overlap
    direction = "left"

	return {
        {map = "-27,-36", changeMap = direction},
        {map = "-27,-36", changeMap = "right"},
		{map = "-28,-36", changeMap = "top"},
		{map = "-28,-37", changeMap = "right"},
		{map = "-27,-37", changeMap = "bottom"},
		{map = "-27,-36", changeMap = direction},
	}
end

function changeDirection()
    if direction == "left"
    then
        direction = "right"
    else
        direction = "left"
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