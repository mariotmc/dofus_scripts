-- lvl 140
-- Malt, Seigle, Chanvre, Lin

ELEMENTS_TO_GATHER = {47, 44, 46, 42}

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
	global:delay(1500)
    global:sendKey(72)
    global:delay(1500)
end

function move()
	return MULTIPLE_MAP:Run({
		{map = "0,0", changeMap = routen_zaap},
		{map = "-27,-36", changeMap = "left"},
		{map = "-28,-36", changeMap = "left"},
		{map = "-29,-36", changeMap = "left"},
		{map = "-30,-36", changeMap = "top"},
		{map = "-30,-37", changeMap = "top"},
		{map = "-30,-38", changeMap = "top"},
		{map = "-30,-39", gather = true, changeMap = "top"},
		{map = "-30,-40", changeMap = "top"},
		{map = "-30,-41", gather = true, changeMap = "top"},
		{map = "-30,-42", changeMap = "right"},
		{map = "-30,-42", changeMap = "right"},
		{map = "-29,-42", changeMap = "right"},
		{map = "-28,-42", gather = true, changeMap = "right"},
		{map = "-27,-42", gather = true, changeMap = "right"},
		{map = "-26,-42", gather = true, changeMap = "right"},
		{map = "-25,-42", gather = true, changeMap = "right"},
		{map = "-24,-42", gather = true, changeMap = "right"},
		{map = "-23,-42", gather = true, changeMap = "bottom"},
		{map = "-23,-41", changeMap = "bottom"},
		{map = "-23,-40", gather = true, changeMap = "bottom"},
		{map = "-23,-39", gather = true, changeMap = "right"},
		{map = "-22,-39", gather = true, changeMap = "bottom"},
		{map = "-22,-38", changeMap = "left"},
		{map = "-23,-38", changeMap = "left"},
		{map = "-24,-38", changeMap = "left"},
		{map = "-25,-38", changeMap = "left"},
		{map = "-26,-38", gather = true, changeMap = "bottom"},
		{map = "-26,-37", changeMap = "bottom"},
		{map = "-26,-36", changeMap = "left"},
	})
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