-- lvl 140
-- Malt, Seigle, Chanvre

ELEMENTS_TO_GATHER = {47, 44, 46}

MAX_MONSTERS = 1

MAX_PODS = 95

direction = "right"

function emptyInventory()
    npc:npcBank(-1,-1)
    global:delay(2500)
    storage:putAllItems()
    global:leaveDialog()
end

function wait()
    map:waitMovementFinish(5000)
end

function changeDirection()
	if direction == "right" then
		direction = "left"
	else
		direction = "right"
	end
end

function changeLeftToTop()
	if direction == "left" then
		direction = "top"
	end
end

function changeRightToTop()
	if direction == "right" then
		direction = "top"
	end
end

function changeBottomToTop()
	if direction == "bottom" then
		direction = "top"
	end
end

function changeLeftToBottom()
	if direction == "left" then
		direction = "bottom"
	end
end

function changeRightToBottom()
	if direction == "right" then
		direction = "bottom"
	end
end

function changeTopToBottom()
	if direction == "top" then
		direction = "bottom"
	end
end

function changeTopToLeft()
	if direction == "top" then
		direction = "left"
	end
end

function changeRightToLeft()
	if direction == "right" then
		direction = "left"
	end
end

function changeBottomToLeft()
	if direction == "bottom" then
		direction = "left"
	end
end

function changeTopToRight()
	if direction == "top" then
		direction = "right"
	end
end

function changeLeftToRight()
	if direction == "left" then
		direction = "right"
	end
end

function changeBottomToRight()
	if direction == "bottom" then
		direction = "right"
	end
end

function move()
	return {
		{map = "5,-18", changeMap = "bottom"},
		{map = "5,-19", changeMap = "top"},
		{map = "5,-18", changeMap = "right"},
	}
end

function bank()
	return {
	}
end

function phenix()
	return {
	}
end