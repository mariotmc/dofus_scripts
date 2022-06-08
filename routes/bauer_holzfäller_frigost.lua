-- lvl 200 (beide)
-- Noisetier, Ebène, Orme, Charme, Tremble, Frostiz

ELEMENTS_TO_GATHER = {259, 29, 30, 32, 133, 134}

MAX_PODS = 95

routen_zaap = "zaap(121,217,54172969)"

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
		{map = "-78,-41", gather = true, changeMap = "top"},
		{map = "-78,-42", gather = true, changeMap = "top"},
		{map = "-78,-43", gather = true, changeMap = "left"},
		{map = "-79,-43", gather = true, changeMap = "left"},
		{map = "-80,-43", gather = true, changeMap = "left"},
		{map = "-81,-43", gather = true, changeMap = "left"},
		{map = "-82,-43", gather = true, changeMap = "left"},
		{map = "-83,-43", gather = true, changeMap = "left"},
		{map = "-84,-43", gather = true, changeMap = "left"},
		{map = "-85,-43", gather = true, changeMap = "top"},
		{map = "-85,-44", gather = true, changeMap = "top"},
		{map = "-85,-45", gather = true, changeMap = "top"},
		{map = "-85,-46", gather = true, changeMap = "right"},
		{map = "-84,-46", gather = true, changeMap = "top"},
		{map = "-84,-47", gather = true, changeMap = "right"},
		{map = "-83,-47", gather = true, changeMap = "right"},
		{map = "-82,-47", gather = true, changeMap = "right"},
		{map = "-81,-47", gather = true, changeMap = "top"},
		{map = "-81,-48", gather = true, changeMap = "right"},
		{map = "-80,-48", gather = true, changeMap = "right"},
		{map = "-79,-48", gather = true, changeMap = "bottom"},
		{map = "-79,-47", gather = true, changeMap = "right"},
		{map = "-78,-47", gather = true, changeMap = "right"},
		{map = "-77,-47", gather = true, changeMap = "right"},
		{map = "-76,-47", gather = true, changeMap = "right"},
		{map = "-75,-47", gather = true, changeMap = "top"},
		{map = "-75,-48", gather = true, changeMap = "top"},
		{map = "-75,-49", gather = true, changeMap = "right"},
		{map = "-74,-49", gather = true, changeMap = "right"},
		{map = "-73,-49", gather = true, changeMap = "top"},
		{map = "-73,-50", gather = true, changeMap = "top"},
		{map = "-73,-51", gather = true, changeMap = "top"},
		{map = "-73,-52", gather = true, changeMap = "left"},
		{map = "-74,-52", gather = true, changeMap = "top"},
		{map = "-74,-53", gather = true, changeMap = "top"},
		{map = "-74,-54", gather = true, changeMap = "right"},
		{map = "-73,-54", gather = true, changeMap = "bottom"},
		{map = "-73,-53", gather = true, changeMap = "right"},
		{map = "-72,-53", gather = true, changeMap = "top"},
		{map = "-72,-54", gather = true, changeMap = "right"},
		{map = "-71,-54", gather = true, changeMap = "right"},
		{map = "-70,-54", gather = true, changeMap = "right"},
		{map = "-69,-54", gather = true, changeMap = "right"},
		{map = "-68,-54", gather = true, changeMap = "top"},
		{map = "-68,-55", gather = true, changeMap = "top"},
		{map = "-68,-56", gather = true, changeMap = "top"},
		{map = "-68,-57", gather = true, changeMap = "top"},
		{map = "-68,-58", gather = true, changeMap = "top"},
		{map = "-68,-59", gather = true, changeMap = "top"},
		{map = "-68,-60", gather = true, changeMap = "right"},
		{map = "-67,-60", gather = true, changeMap = "right"},
		{map = "-66,-60", gather = true, changeMap = "right"},
		{map = "-65,-60", gather = true, changeMap = "right"},
		{map = "-64,-60", gather = true, changeMap = "top"},
		{map = "-64,-61", gather = true, changeMap = "top"},
		{map = "-64,-62", gather = true, changeMap = "left"},
		{map = "-65,-62", gather = true, changeMap = "top"},
		{map = "-65,-63", gather = true, changeMap = "right"},
		{map = "-64,-63", gather = true, changeMap = "right"},
		{map = "-63,-63", gather = true, changeMap = "right"},
		{map = "-62,-63", gather = true, changeMap = "right"},
		{map = "-61,-63", gather = true, changeMap = "top"},
		{map = "-61,-64", gather = true, changeMap = "right"},
		{map = "-60,-64", gather = true, changeMap = "right"},
		{map = "-59,-64", gather = true, changeMap = "right"},
		{map = "-58,-64", gather = true, changeMap = "bottom"},
		{map = "-58,-63", gather = true, changeMap = "bottom"},
		{map = "-58,-62", gather = true, changeMap = "bottom"},
		{map = "-58,-61", gather = true, changeMap = "left"},
		{map = "-59,-61", gather = true, changeMap = "bottom"},
		{map = "-59,-60", gather = true, changeMap = "right"},
		{map = "-58,-60", gather = true, changeMap = "right"},
		{map = "-57,-60", gather = true, changeMap = "bottom"},
		{map = "-57,-59", gather = true, changeMap = "right"},
		{map = "-56,-59", gather = true, changeMap = "right"},
		{map = "-55,-59", gather = true, changeMap = "bottom"},
		{map = "-55,-58", gather = true, changeMap = "bottom"},
		{map = "-55,-57", gather = true, changeMap = "left"},
		{map = "-56,-57", gather = true, changeMap = "left"},
		{map = "-57,-57", gather = true, changeMap = "bottom"},
		{map = "-57,-56", gather = true, changeMap = "left"},
		{map = "-58,-56", gather = true, changeMap = "left"},
		{map = "-59,-56", gather = true, changeMap = "bottom"},
		{map = "-59,-55", gather = true, changeMap = "bottom"},
		{map = "-59,-54", gather = true, changeMap = "right"},
		{map = "-58,-54", gather = true, changeMap = "bottom"},
		{map = "-58,-53", gather = true, changeMap = "left"},
		{map = "-59,-53", gather = true, changeMap = "left"},
		{map = "-60,-53", gather = true, changeMap = "bottom"},
		{map = "-60,-52", gather = true, changeMap = "bottom"},
		{map = "-60,-51", gather = true, changeMap = "left"},
		{map = "-61,-51", gather = true, changeMap = "left"},
		{map = "-62,-51", gather = true, changeMap = "left"},
		{map = "-63,-51", gather = true, changeMap = "left"},
		{map = "-64,-51", gather = true, changeMap = "bottom"},
		{map = "-64,-50", gather = true, changeMap = "bottom"},
		{map = "-64,-49", gather = true, changeMap = "left"},
		{map = "-65,-49", gather = true, changeMap = "bottom"},
		{map = "-65,-48", gather = true, changeMap = "bottom"},
		{map = "-65,-47", gather = true, changeMap = "left"},
		{map = "-66,-47", gather = true, changeMap = "top"},
		{map = "-66,-48", gather = true, changeMap = "left"},
		{map = "-67,-48", gather = true, changeMap = "bottom"},
		{map = "-67,-47", gather = true, changeMap = "left"},
		{map = "-68,-47", gather = true, changeMap = "left"},
		{map = "-69,-47", gather = true, changeMap = "left"},
		{map = "-70,-47", gather = true, changeMap = "left"},
		{map = "-71,-47", gather = true, changeMap = "left"},
		{map = "-72,-47", gather = true, changeMap = "left"},
		{map = "-73,-47", gather = true, changeMap = "bottom"},
		{map = "-73,-46", gather = true, changeMap = "right"},
		{map = "-72,-46", gather = true, changeMap = "right"},
		{map = "-71,-46", gather = true, changeMap = "right"},
		{map = "-70,-46", gather = true, changeMap = "bottom"},
		{map = "-70,-45", gather = true, changeMap = "left"},
		{map = "-71,-45", gather = true, changeMap = "left"},
		{map = "-72,-45", gather = true, changeMap = "left"},
		{map = "-73,-45", gather = true, changeMap = "bottom"},
		{map = "-73,-44", gather = true, changeMap = "right"},
		{map = "-72,-44", gather = true, changeMap = "bottom"},
		{map = "-72,-43", gather = true, changeMap = "right"},
		{map = "-71,-43", gather = true, changeMap = "right"},
		{map = "-70,-43", gather = true, changeMap = "right"},
		{map = "-69,-43", gather = true, changeMap = "bottom"},
		{map = "-69,-42", gather = true, changeMap = "left"},
		{map = "-70,-42", gather = true, changeMap = "bottom"},
		{map = "-70,-41", gather = true, changeMap = "bottom"},
		{map = "-70,-40", gather = true, changeMap = "right"},
		{map = "-69,-40", gather = true, changeMap = "right"},
		{map = "-68,-40", gather = true, changeMap = "bottom"},
		{map = "-68,-39", gather = true, changeMap = "left"},
		{map = "-69,-39", gather = true, changeMap = "left"},
		{map = "-70,-39", gather = true, changeMap = "bottom"},
		{map = "-70,-38", gather = true, changeMap = "right"},
		{map = "-69,-38", gather = true, changeMap = "bottom"},
		{map = "-69,-37", gather = true, changeMap = "left"},
		{map = "-70,-37", gather = true, changeMap = "bottom"},
		{map = "-70,-36", gather = true, changeMap = "right"},
		{map = "-69,-36", gather = true, changeMap = "bottom"},
		{map = "-69,-35", gather = true, changeMap = "left"},
		{map = "-70,-35", gather = true, changeMap = "left"},
		{map = "-71,-35", gather = true, changeMap = "bottom"},
		{map = "-71,-34", gather = true, changeMap = "left"},
		{map = "-72,-34", gather = true, changeMap = "left"},
		{map = "-73,-34", gather = true, changeMap = "left"},
		{map = "-74,-34", gather = true, changeMap = "top"},
		{map = "-74,-35", gather = true, changeMap = "top"},
		{map = "-74,-36", gather = true, changeMap = "top"},
		{map = "-74,-37", gather = true, changeMap = "top"},
		{map = "-74,-38", gather = true, changeMap = "top"},
		{map = "-74,-39", gather = true, changeMap = "top"},
		{map = "-74,-40", gather = true, changeMap = "top"},
		{map = "-74,-41", gather = true, changeMap = "left"},
		{map = "-75,-41", gather = true, changeMap = "left"},
		{map = "-76,-41", gather = true, changeMap = "left"},
		{map = "-77,-41", gather = true, changeMap = "left"},
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