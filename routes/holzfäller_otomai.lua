-- lvl 200 (beide)
-- Noisetier, Ebène, Orme, Charme

ELEMENTS_TO_GATHER = {259, 29, 30, 32}

MAX_PODS = 95

routen_zaap = "zaap(121,217,154642)"

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
		{ map = "0,0", changeMap = routen_zaap },
		{map = "-51,20", gather = true, changeMap = "left"},
		{map = "-52,20", gather = true, changeMap = "left"},
		{map = "-53,20", gather = true, changeMap = "bottom"},
		{map = "-53,21", gather = true, changeMap = "left"},
		{map = "-54,21", gather = true, changeMap = "top"},
		{map = "-54,20", gather = true, changeMap = "left"},
		{map = "-55,20", gather = true, changeMap = "left"},
		{map = "-56,20", gather = true, changeMap = "top"},
		{map = "-56,19", gather = true, changeMap = "top"},
		{map = "-56,18", gather = true, changeMap = "right"},
		{map = "-55,18", gather = true, changeMap = "top"},
		{map = "-55,17", gather = true, changeMap = "right"},
		{map = "-54,17", gather = true, changeMap = "top"},
		{map = "-54,16", gather = true, changeMap = "left"},
		{map = "-55,16", gather = true, changeMap = "left"},
		{map = "-56,16", gather = true, changeMap = "top"},
		{map = "-56,15", gather = true, changeMap = "top"},
		{map = "-56,14", gather = true, changeMap = "right"},
		{map = "-55,14", gather = true, changeMap = "top"},
		{map = "-55,13", changeMap = "top"},
		{map = "-55,12", gather = true, changeMap = "top"},
		{map = "-55,11", gather = true, changeMap = "top"},
		{map = "-55,10", gather = true, changeMap = "top"},
		{map = "-55,9", gather = true, changeMap = "right"},
		{map = "-54,9", gather = true, changeMap = "right"},
		{map = "-53,9", gather = true, changeMap = "bottom"},
		{map = "-53,10", gather = true, changeMap = "left"},
		{map = "-54,10", gather = true, changeMap = "bottom"},
		{map = "-54,11", changeMap = "right"},
		{map = "-53,11", gather = true, changeMap = "right"},
		{map = "-52,11", gather = true, changeMap = "bottom"},
		{map = "-52,12", gather = true, changeMap = "right"},
		{map = "-51,12", gather = true, changeMap = "bottom"},
		{map = "-51,13", gather = true, changeMap = "left"},
		{map = "-52,13", gather = true, changeMap = "bottom"},
		{map = "-52,14", gather = true, changeMap = "bottom"},
		{map = "-52,15", gather = true, changeMap = "right"},
		{map = "-51,15", gather = true, changeMap = "top"},
		{map = "-51,14", gather = true, changeMap = "right"},
		{map = "-50,14", changeMap = "bottom"},
		{map = "-50,15", gather = true, changeMap = "bottom"},
		{map = "-50,16", gather = true, changeMap = "left"},
		{map = "-51,16", gather = true, changeMap = "bottom"},
		{map = "-51,17", gather = true, changeMap = "bottom"},
		{map = "-51,18", gather = true, changeMap = "bottom"},
		{map = "-51,19", gather = true, changeMap = "bottom"},
	})
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