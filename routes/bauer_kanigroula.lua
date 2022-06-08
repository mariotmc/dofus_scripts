-- lvl 180
-- Millet

ELEMENTS_TO_GATHER = {261}

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
	global:delay(1500)
    global:sendKey(72)
    global:delay(1500)
end

function move()
	return MULTIPLE_MAP:Run({
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
		{map = "-2,-51", gather = true, changeMap = "left"},
		{map = "-3,-51", gather = true, changeMap = "top"},
		{map = "-3,-52", gather = true, changeMap = "left"},
		{map = "-4,-52", gather = true, changeMap = "top"},
		{map = "-4,-53", gather = true, changeMap = "left"},
		{map = "-5,-53", changeMap = "left"},
		{map = "-6,-53", gather = true, changeMap = "top"},
		{map = "-6,-54", gather = true, changeMap = "top"},
		{map = "-6,-55", gather = true, changeMap = "right"},
		{map = "-5,-55", gather = true, changeMap = "right"},
		{map = "-4,-55", gather = true, changeMap = "top"},
		{map = "-4,-56", gather = true, changeMap = "left"},
		{map = "-5,-56", gather = true, changeMap = "left"},
		{map = "-6,-56", gather = true, changeMap = "top"},
		{map = "-6,-57", gather = true, changeMap = "right"},
		{map = "-5,-57", gather = true, changeMap = "right"},
		{map = "-4,-57", gather = true, changeMap = "right"},
		{map = "-3,-57", gather = true, changeMap = "top"},
		{map = "-3,-58", gather = true, changeMap = "top"},
		{map = "-3,-59", changeMap = "left"},
		{map = "-4,-59", gather = true, changeMap = "bottom"},
		{map = "-4,-58", gather = true, changeMap = "left"},
		{map = "-5,-58", gather = true, changeMap = "top"},
		{map = "-5,-59", gather = true, changeMap = "left"},
		{map = "-6,-59", changeMap = "bottom"},
		{map = "-6,-58", gather = true, changeMap = "left"},
		{map = "-7,-58", changeMap = "bottom"},
		{map = "-7,-57", changeMap = "bottom"},
		{map = "-7,-56", changeMap = "bottom"},
		{map = "-7,-55", gather = true, changeMap = "bottom"},
		{map = "-7,-54", changeMap = "bottom"},
		{map = "-7,-53", changeMap = "bottom"},
		{map = "-7,-52", changeMap = "right"},
		{map = "-6,-52", gather = true, changeMap = "right"},
		{map = "-5,-52", gather = true, changeMap = "bottom"},
		{map = "-5,-51", changeMap = "bottom"},
		{map = "-5,-50", changeMap = "right"},
		{map = "-4,-50", changeMap = "right"},
		{map = "-3,-50", changeMap = "right"},
	})
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
	return {}
end

function lost()
	enterHavenbag()
end

--[[---------------------------------------------------------
	How to use:
		Replace in your move, bank, lost or phenix functions
			return {}
		by
			return MULTIPLE_MAP:Run({})
		You are not forced to add it on all functions.
-----------------------------------------------------------]]

-- Global variable of the library
MULTIPLE_MAP = {}

-- Store on this table which step we are on each map
MULTIPLE_MAP.CurrentSteps = {}

--[[---------------------------------------------------------
   Name: MULTIPLE_MAP:Run(table tab)
   Desc: Run the algorithm on an action table.
-----------------------------------------------------------]]
function MULTIPLE_MAP:Run(tab)
	-- Cache the datas to avoid Lua <=> C# performance issues
	currentPos = map.currentPos()
	currentMapId = tostring(map.currentMapId())

	-- Set the step to 0 if not existing
	if not self.CurrentSteps[currentMapId] then
		self.CurrentSteps[currentMapId] = 0
	end

	-- Add one to the step
	self.CurrentSteps[currentMapId] = self.CurrentSteps[currentMapId] + 1

	-- Search for action on the map
	action = nil
	firstAction = nil
	count = 0
	for _, v in pairs(tab) do
		if v.map == currentPos or v.map == currentMapId then
			count = count + 1
			if count == self.CurrentSteps[currentMapId] then
				action = v
				break
			elseif count == 1 then
				-- Retain the first action, if there is no additional step
				firstAction = v
			end
		end
	end

	if not action then
		if firstAction then
			-- No additional step, let's back to the first one
			action = firstAction
			self.CurrentSteps[currentMapId] = 1
		else
			global.printMessage("[AVERTISSEMENT] Aucune action ne donne d'indications pour la carte " .. currentPos .. " (" .. currentMapId .. ").")
			return lost()
		end
	end

	-- Function in changeMap
	if type(action.changeMap) == "function" then
		action.custom = action.changeMap
		action.changeMap = nil
	end

	return { action }
end

--[[---------------------------------------------------------
   Name: MULTIPLE_MAP:Reset()
   Desc: Delete the saved steps to force a new start from
   scratch. To be called after using the bank for example.
-----------------------------------------------------------]]
function MULTIPLE_MAP:Reset(tab)
	self.CurrentSteps = {}
end