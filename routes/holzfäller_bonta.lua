-- lvl 180
-- Frêne, Chêne, If, Ebène, Charme, Orme, Châtaignier, Noyer, Bombu, Merisier, Erable, Noisetier

ELEMENTS_TO_GATHER = {1, 8, 28, 29, 32, 30, 33, 34, 98, 35, 31, 259 }

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
		{map = "-28,-36", changeMap = "left", gather = true},
		{map = "-29,-36", changeMap = "left", gather = true},
		{map = "-30,-36", changeMap = "top", gather = true},
		{map = "-30,-37", changeMap = "top", gather = true},
		{map = "-30,-38", changeMap = "top", gather = true},
		{map = "-30,-39", changeMap = "top", gather = true},
		{map = "-30,-40", changeMap = "top", gather = true},
		{map = "-30,-41", changeMap = "top", gather = true},
		{map = "-30,-42", changeMap = "left", gather = true},
		{map = "-31,-42", changeMap = "top", gather = true},
		{map = "-31,-43", changeMap = "top", gather = true},
		{map = "-31,-44", changeMap = "top", gather = true},
		{map = "-31,-45", changeMap = "right", gather = true},
		{map = "-30,-45", changeMap = "right", gather = true},
		{map = "-29,-45", changeMap = "right", gather = true},
		{map = "-28,-45", changeMap = "right", gather = true},
		{map = "-27,-45", changeMap = "top", gather = true},
		{map = "-27,-46", changeMap = "left", gather = true},
		{map = "-28,-46", changeMap = "left", gather = true},
		{map = "-29,-46", changeMap = "left", gather = true},
		{map = "-30,-46", changeMap = "top", gather = true},
		{map = "-30,-47", changeMap = "top", gather = true},
		{map = "-30,-48", changeMap = "right", gather = true},
		{map = "-29,-48", changeMap = "right", gather = true},
		{map = "-28,-48", changeMap = "right", gather = true},
		{map = "-27,-48", changeMap = "right", gather = true},
		{map = "-26,-48", changeMap = "right", gather = true},
		{map = "-25,-48", changeMap = "top", gather = true},
		{map = "-25,-49", changeMap = "right", gather = true},
		{map = "-24,-49", changeMap = "right", gather = true},
		{map = "-23,-49", changeMap = "top", gather = true},
		{map = "-23,-50", changeMap = "top", gather = true},
		{map = "-23,-51", changeMap = "top", gather = true},
		{map = "-23,-52", changeMap = "top", gather = true},
		{map = "-23,-53", changeMap = "top", gather = true},
		{map = "-23,-54", changeMap = "top", gather = true},
		{map = "-23,-55", changeMap = "top", gather = true},
		{map = "-23,-56", changeMap = "top", gather = true},
		{map = "-23,-57", changeMap = "top", gather = true},
		{map = "-23,-58", changeMap = "right", gather = true},
		{map = "-22,-58", changeMap = "top", gather = true},
		{map = "-22,-59", changeMap = "top", gather = true},
		{map = "-22,-60", changeMap = "top", gather = true},
		{map = "-22,-61", changeMap = "top", gather = true},
		{map = "-22,-62", changeMap = "right", gather = true},
		{map = "-21,-62", changeMap = "right", gather = true},
		{map = "-20,-62", changeMap = "right", gather = true},
		{map = "-19,-62", changeMap = "bottom", gather = true},
		{map = "-19,-61", changeMap = "bottom", gather = true},
		{map = "-19,-60", changeMap = "bottom", gather = true},
		{map = "-19,-59", changeMap = "bottom", gather = true},
		{map = "-19,-58", changeMap = "right", gather = true},
		{map = "-18,-58", changeMap = "right", gather = true},
		{map = "-17,-58", changeMap = "bottom", gather = true},
		{map = "-17,-57", changeMap = "right", gather = true},
		{map = "-16,-57", changeMap = "right", gather = true},
		{map = "-15,-57", changeMap = "right", gather = true},
		{map = "-14,-57", changeMap = "right", gather = true},
		{map = "-13,-57", changeMap = "top"},
		{map = "-13,-58", changeMap = "right", gather = true},
		{map = "-12,-58", changeMap = "bottom", gather = true},
		{map = "-12,-57", changeMap = "right", gather = true},
		{map = "-11,-57", changeMap = "bottom", gather = true},
		{map = "-11,-56", changeMap = "left", gather = true},
		{map = "-12,-56", changeMap = "bottom", gather = true},
		{map = "-12,-55", changeMap = "bottom", gather = true},
		{map = "-12,-54", changeMap = "bottom", gather = true},
		{map = "-12,-53", changeMap = "bottom", gather = true},
		{map = "-12,-52", changeMap = "bottom", gather = true},
		{map = "-12,-51", changeMap = "bottom", gather = true},
		{map = "-12,-50", changeMap = "left", gather = true},
		{map = "-13,-50", changeMap = "left", gather = true},
		{map = "-14,-50", changeMap = "left", gather = true},
		{map = "-15,-50", changeMap = "bottom", gather = true},
		{map = "-15,-49", changeMap = "bottom", gather = true},
		{map = "-15,-48", changeMap = "right", gather = true},
		{map = "-14,-48", changeMap = "right", gather = true},
		{map = "-13,-48", changeMap = "bottom", gather = true},
		{map = "-13,-47", changeMap = "bottom", gather = true},
		{map = "-13,-46", changeMap = "right", gather = true},
		{map = "-12,-46", changeMap = "right", gather = true},
		{map = "-11,-46", changeMap = "right", gather = true},
		{map = "-10,-46", changeMap = "right", gather = true},
		{map = "-9,-46", changeMap = "bottom", gather = true},
		{map = "-9,-45", changeMap = "bottom", gather = true},
		{map = "-9,-44", changeMap = "bottom", gather = true},
		{map = "-9,-43", changeMap = "bottom", gather = true},
		{map = "-9,-42", changeMap = "left", gather = true},
		{map = "-10,-42", changeMap = "left", gather = true},
		{map = "-11,-42", changeMap = "left", gather = true},
		{map = "-12,-42", changeMap = "left", gather = true},
		{map = "-13,-42", changeMap = "left", gather = true},
		{map = "-14,-42", changeMap = "left", gather = true},
		{map = "-15,-42", changeMap = "left", gather = true},
		{map = "-16,-42", changeMap = "left", gather = true},
		{map = "-17,-42", changeMap = "left", gather = true},
		{map = "-18,-42", changeMap = "left", gather = true},
		{map = "-19,-42", changeMap = "left", gather = true},
		{map = "-20,-42", changeMap = "left", gather = true},
		{map = "-21,-42", changeMap = "left", gather = true},
		{map = "-22,-42", changeMap = "left", gather = true},
		{map = "-23,-42", changeMap = "left", gather = true},
		{map = "-24,-42", changeMap = "left", gather = true},
		{map = "-25,-42", changeMap = "left", gather = true},
		{map = "-26,-42", changeMap = "left", gather = true},
		{map = "-27,-42", changeMap = "left", gather = true},
		{map = "-28,-42", changeMap = "left", gather = true},
		{map = "-29,-42", changeMap = "left", gather = true},
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