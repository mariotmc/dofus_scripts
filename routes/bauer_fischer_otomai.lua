-- lvl 160 (bauer) 170 (fischer)
-- Maïs, Morue, Sardine Brillante, Poisson Pané

ELEMENTS_TO_GATHER = {260, 272, 81, 78}

MAX_PODS = 95

routen_zaap = "zaap(121,217,154642)"

bank_zaap = "zaap(121,217,191105026)"

function hiboux()
	global:clickPosition(329, 259, false)
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
		{map = "-46,18", changeMap = "right", gather = true},
		{map = "-45,18", changeMap = "top", gather = true},
		{map = "-45,17", changeMap = "top", gather = true},
		{map = "-45,16", changeMap = "top", gather = true},
		{map = "-45,15", changeMap = "left", gather = true},
		{map = "-46,15", changeMap = "left", gather = true},
		{map = "-47,15", changeMap = "top", gather = true},
		{map = "-47,14", changeMap = "right", gather = true},
		{map = "-46,14", changeMap = "top", gather = true},
		{map = "-46,13", changeMap = "left", gather = true},
		{map = "-47,13", changeMap = "top", gather = true},
		{map = "-47,12", changeMap = "top", gather = true},
		{map = "-47,11", changeMap = "left", gather = true},
		{map = "-48,11", changeMap = "left", gather = true},
		{map = "-49,11", changeMap = "left", gather = true},
		{map = "-50,11", changeMap = "left", gather = true},
		{map = "-51,11", changeMap = "top", gather = true},
		{map = "-51,10", changeMap = "top", gather = true},
		{map = "-51,9", changeMap = "left", gather = true},
		{map = "-52,9", changeMap = "top", gather = true},
		{map = "-52,8", changeMap = "top", gather = true},
		{map = "-52,7", changeMap = "right", gather = true},
		{map = "-51,7", changeMap = "top", gather = true},
		{map = "-51,6", changeMap = "top", gather = true},
		{map = "-51,5", changeMap = "top", gather = true},
		{map = "-51,4", changeMap = "left", gather = true},
		{map = "-52,4", changeMap = "top", gather = true},
		{map = "-52,3", changeMap = "top", gather = true},
		{map = "-52,2", changeMap = "top", gather = true},
		{map = "-52,1", changeMap = "top", gather = true},
		{map = "-52,0", changeMap = "top", gather = true},
		{map = "-52,-1", changeMap = "top", gather = true},
		{map = "-52,-2", changeMap = "left", gather = true},
		{map = "-53,-2", changeMap = "bottom", gather = true},
		{map = "-53,-1", changeMap = "left", gather = true},
		{map = "-54,-1", changeMap = "left", gather = true},
		{map = "-55,-1", changeMap = "bottom", gather = true},
		{map = "-55,0", changeMap = "bottom", gather = true},
		{map = "-55,1", changeMap = "bottom", gather = true},
		{map = "-55,2", changeMap = "bottom", gather = true},
		{map = "-55,3", changeMap = "bottom", gather = true},
		{map = "-55,4", changeMap = "left", gather = true},
		{map = "-56,4", changeMap = "left", gather = true},
		{map = "-57,4", changeMap = "left", gather = true},
		{map = "-58,4", changeMap = "left", gather = true},
		{map = "-59,4", changeMap = "top", gather = true},
		{map = "-59,3", changeMap = "top", gather = true},
		{map = "-59,2", changeMap = "left", gather = true},
		{map = "-60,2", changeMap = "bottom", gather = true},
		{map = "-60,3", changeMap = "bottom", gather = true},
		{map = "-60,4", changeMap = "bottom", gather = true},
		{map = "-60,5", changeMap = "right", gather = true},
		{map = "-59,5", changeMap = "bottom", gather = true},
		{map = "-59,6", changeMap = "bottom", gather = true},
		{map = "-59,7", changeMap = "bottom", gather = true},
		{map = "-59,8", changeMap = "bottom", gather = true},
		{map = "-59,9", changeMap = "right", gather = true},
		{map = "-58,9", changeMap = "right", gather = true},
		{map = "-57,9", changeMap = "right", gather = true},
		{map = "-56,9", changeMap = "bottom", gather = true},
		{map = "-56,10", changeMap = "bottom", gather = true},
		{map = "-56,11", changeMap = "bottom", gather = true},
		{map = "-56,12", changeMap = "right", gather = true},
		{map = "-55,12", changeMap = "right", gather = true},
		{map = "-54,12", changeMap = "bottom", gather = true},
		{map = "-54,13", changeMap = "right", gather = true},
		{map = "-53,13", changeMap = "top", gather = true},
		{map = "-53,12", changeMap = "right", gather = true},
		{map = "-52,12", changeMap = "right", gather = true},
		{map = "-51,12", changeMap = "right", gather = true},
		{map = "-50,12", changeMap = "right", gather = true},
		{map = "-49,12", changeMap = "right", gather = true},
		{map = "-48,12", changeMap = "bottom", gather = true},
		{map = "-48,13", changeMap = "bottom", gather = true},
		{map = "-48,14", changeMap = "bottom", gather = true},
		{map = "-48,15", changeMap = "bottom", gather = true},
		{map = "-48,16", changeMap = "bottom", gather = true},
		{map = "-48,17", changeMap = "bottom", gather = true},
		{map = "-48,18", changeMap = "bottom", gather = true},
		{map = "-48,19", changeMap = "right", gather = true},
		{map = "-47,19", changeMap = "right", gather = true},
		{map = "-46,19", changeMap = "top", gather = true},
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