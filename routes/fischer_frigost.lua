-- lvl 200
-- Tanche, Poisskaille, Espadon, Sardine Brillante, kralamoure, bar rikain, carpe d'iem, perche, anguille, Poisson Pané, greuvette

ELEMENTS_TO_GATHER = {273, 132, 274, 81, 264, 271, 79, 267, 265, 78, 71}

MAX_PODS = 95

routen_zaap = "zaap(121,217, 54172969)"

bank_zaap = "zaap(121,217,191105026)"

function hiboux()
	global:clickPosition(384, 234, false)
	global:delay(1000)
	global:clickPosition(300, 383, false)
	storage:putAllItems()
	global:leaveDialog()
end

function enterHavenbag()
	global:delay(1500)
    global:sendKey(72)
    global:delay(1500)
end

function travelToWal()
	global:delay(1000)
	global:clickPosition(402, 252)
	global:delay(1000)
	global:clickPosition(298, 393)
	global:delay(1000)
	global:clickPosition(325, 398)
	global:delay(1000)
end

function travelToFrigost()
	global:delay(1000)
	global:clickPosition(425, 305)
	global:delay(1000)
	global:clickPosition(325, 395)
	global:delay(1000)
end

function move()
	return MULTIPLE_MAP:Run({
		{ map = "0,0", changeMap = routen_zaap },
		{map = "-78,-41", changeMap = "left", gather = true},
		{map = "-79,-41", changeMap = "left", gather = true},
		{map = "-80,-41", changeMap = "left", gather = true},
		{map = "-81,-41", changeMap = "left", gather = true},
		{map = "-82,-41", changeMap = "bottom", gather = true},
		{map = "-82,-40", changeMap = "bottom", gather = true},
		{map = "-82,-39", changeMap = "top", gather = true, },
		{map = "-82,-40", changeMap = "top", gather = true},
		{map = "-82,-41", changeMap = "left", gather = true},
		{map = "-83,-41", changeMap = "left", gather = true},
		{map = "-84,-41", changeMap = "bottom", gather = true},
		-- hier mit dem schiff wal insel fahren
		{map = "-84,-40", gather = true, custom = travelToWal},
		{map = "-83,-58", changeMap = "top", gather = true},
		{map = "-83,-59", changeMap = "left", gather = true},
		{map = "-84,-59", changeMap = "left", gather = true},
		{map = "-85,-59", changeMap = "right", gather = true },
		{map = "-84,-59", changeMap = "right", gather = true},
		{map = "-83,-59", changeMap = "bottom", gather = true},
		-- hier mit dem schiff nach frigost fahren
		{map = "-83,-58", gather = true, custom = travelToFrigost},
		{ map = "-84,-40", changeMap = "top", gather = true }, 
		{ map = "-84,-41", changeMap = "top", gather = true }, 
		{ map = "-84,-42", changeMap = "top", gather = true }, 
		{ map = "-84,-44", changeMap = "top", gather = true }, 
		{ map = "-84,-43", changeMap = "top", gather = true }, 
		{ map = "-84,-45", changeMap = "right", gather = true }, 
		{ map = "-83,-45", changeMap = "right", gather = true }, 
		{ map = "-82,-45", changeMap = "right", gather = true }, 
		{ map = "-81,-45", changeMap = "right", gather = true }, 
		{ map = "-80,-45", changeMap = "right", gather = true }, 
		{ map = "-79,-45", changeMap = "right", gather = true }, 
		{ map = "-78,-45", changeMap = "right", gather = true }, 
		{ map = "-77,-45", changeMap = "right", gather = true }, 
		{ map = "-76,-45", changeMap = "top", gather = true }, 
		{ map = "-76,-46", changeMap = "top", gather = true }, 
		{ map = "-76,-47", changeMap = "top", gather = true }, 
		{ map = "-76,-48", changeMap = "top", gather = true }, 
		{ map = "-76,-49", changeMap = "right", gather = true }, 
		{ map = "-75,-49", changeMap = "top", gather = true }, 
		{ map = "-75,-50", changeMap = "right", gather = true }, 
		{ map = "-74,-50", changeMap = "right", gather = true }, 
		{ map = "-73,-50", changeMap = "right", gather = true }, 
		{ map = "-72,-50", changeMap = "right", gather = true }, 
		{ map = "-71,-50", changeMap = "right", gather = true }, 
		{ map = "-70,-50", changeMap = "right", gather = true }, 
		{ map = "-69,-50", changeMap = "top", gather = true }, 
		{ map = "-69,-51", changeMap = "right", gather = true }, 
		{ map = "-68,-51", changeMap = "top", gather = true }, 
		{ map = "-68,-52", changeMap = "right", gather = true }, 
		{ map = "-67,-52", changeMap = "top", gather = true }, 
		{ map = "-65,-54", changeMap = "right", gather = true }, 
		{ map = "-64,-54", changeMap = "right", gather = true }, 
		{ map = "-63,-54", changeMap = "top", gather = true }, 
		{ map = "-63,-55", changeMap = "top", gather = true }, 
		{ map = "-63,-56", changeMap = "top", gather = true }, 
		{ map = "-63,-57", changeMap = "top", gather = true }, 
		{ map = "-63,-58", changeMap = "top", gather = true }, 
		{ map = "-63,-59", changeMap = "top", gather = true }, 
		{ map = "-63,-60", changeMap = "top", gather = true }, 
		{ map = "-63,-61", changeMap = "right", gather = true }, 
		{ map = "-62,-61", changeMap = "right", gather = true }, 
		{ map = "-61,-61", changeMap = "bottom", gather = true }, 
		{ map = "-61,-60", changeMap = "bottom", gather = true }, 
		{ map = "-61,-59", changeMap = "bottom", gather = true }, 
		{ map = "-61,-58", changeMap = "bottom", gather = true }, 
		{ map = "-61,-57", changeMap = "bottom", gather = true }, 
		{ map = "-61,-56", changeMap = "bottom", gather = true }, 
		{ map = "-61,-55", changeMap = "bottom", gather = true }, 
		{ map = "-61,-54", changeMap = "bottom", gather = true }, 
		{ map = "-61,-53", changeMap = "left", gather = true }, 
		{ map = "-62,-53", changeMap = "left", gather = true }, 
		{ map = "-63,-53", changeMap = "left", gather = true }, 
		{ map = "-64,-53", changeMap = "bottom", gather = true }, 
		{ map = "-67,-53", changeMap = "top", gather = true }, 
		{ map = "-67,-54", changeMap = "right", gather = true }, 
		{ map = "-66,-54", changeMap = "bottom", gather = true }, 
		{ map = "-66,-53", changeMap = "right", gather = true }, 
		{ map = "-65,-53", changeMap = "top", gather = true }, 
		{ map = "-64,-52", changeMap = "left", gather = true }, 
		{ map = "-65,-52", changeMap = "bottom", gather = true }, 
		{ map = "-65,-51", changeMap = "bottom", gather = true }, 
		{ map = "-65,-50", changeMap = "bottom", gather = true }, 
		{ map = "-65,-49", changeMap = "bottom", gather = true }, 
		{ map = "-65,-48", changeMap = "bottom", gather = true }, 
		{ map = "-65,-47", changeMap = "left", gather = true }, 
		{ map = "-66,-47", changeMap = "left", gather = true }, 
		{ map = "-67,-47", changeMap = "left", gather = true }, 
		{ map = "-68,-47", changeMap = "left", gather = true }, 
		{ map = "-69,-47", changeMap = "left", gather = true }, 
		{ map = "-70,-47", changeMap = "left", gather = true }, 
		{ map = "-71,-47", changeMap = "bottom", gather = true }, 
		{ map = "-71,-46", changeMap = "bottom", gather = true }, 
		{ map = "-71,-45", changeMap = "bottom", gather = true }, 
		{ map = "-71,-44", changeMap = "bottom", gather = true }, 
		{ map = "-71,-43", changeMap = "bottom", gather = true }, 
		{ map = "-71,-42", changeMap = "bottom", gather = true }, 
		{ map = "-71,-41", changeMap = "bottom", gather = true }, 
		{ map = "-71,-40", changeMap = "bottom", gather = true }, 
		{ map = "-71,-39", changeMap = "bottom", gather = true }, 
		{ map = "-71,-38", changeMap = "bottom", gather = true }, 
		{ map = "-71,-37", changeMap = "bottom", gather = true }, 
		{ map = "-71,-36", changeMap = "bottom", gather = true }, 
		{ map = "-71,-35", changeMap = "bottom", gather = true }, 
		{ map = "-71,-34", changeMap = "left", gather = true }, 
		{ map = "-72,-34", changeMap = "left", gather = true }, 
		{ map = "-73,-34", changeMap = "left", gather = true }, 
		{ map = "-74,-34", changeMap = "bottom", gather = true }, 
		{ map = "-74,-33", changeMap = "left", gather = true }, 
		{ map = "-75,-33", changeMap = "left", gather = true }, 
		{ map = "-76,-33", changeMap = "top", gather = true }, 
		{ map = "-76,-34", changeMap = "right", gather = true }, 
		{ map = "-75,-34", changeMap = "top", gather = true }, 
		{ map = "-75,-35", changeMap = "top", gather = true }, 
		{ map = "-75,-36", changeMap = "top", gather = true }, 
		{ map = "-75,-37", changeMap = "top", gather = true }, 
		{ map = "-75,-38", changeMap = "left", gather = true }, 
		{ map = "-76,-38", changeMap = "left", gather = true }, 
		{ map = "-77,-38", changeMap = "left", gather = true }, 
		{ map = "-78,-38", changeMap = "bottom", gather = true }, 
		{ map = "-78,-37", changeMap = "left", gather = true }, 
		{ map = "-79,-37", changeMap = "top", gather = true }, 
		{ map = "-79,-38", changeMap = "top", gather = true }, 
		{ map = "-79,-39", changeMap = "top", gather = true }, 
		{ map = "-79,-40", changeMap = "right", gather = true }, 
		{ map = "-78,-40", changeMap = "top", gather = true },
		{map = "-78,-41", changeMap = "left", gather = true, },
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