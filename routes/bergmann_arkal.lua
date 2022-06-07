-- lvl 200
-- Or, Obsidienne, Etain, Bauxite, Manganèse

ELEMENTS_TO_GATHER = {25, 135, 52, 26, 54}

MAX_PODS = 95

routen_zaap = "zaap(121,217,68419587)"

bank_zaap = "zaap(121,217,191105026)"

function hiboux()
	global:clickPosition(384, 234)
	global:delay(1000)
	global:clickPosition(300, 383)
	storage:putAllItems()
	global:leaveDialog()
end

function enterHavenbag()
	global:delay(1500)
    global:sendKey(72)
    global:delay(1500)
end

function travelToArkal()
	global:delay(1000)
    global:clickPosition(424, 220)
	global:delay(1000)
	global:clickPosition(262, 398)
	global:delay(1000)
	global:clickPosition(262, 398)
	global:delay(1000)
	global:clickPosition(262, 398)
	global:delay(1000)
end

function waitAfterHarvest()
    global:delay(600000)
end

function move()
    return MULTIPLE_MAP:Run({
        { map = "0,0", changeMap = routen_zaap },
        { map = "7,-4", changeMap = "bottom" },
        { map = "7,-3", changeMap = "right" },
        { map = "8,-3", changeMap = "right" },
        { map = "9,-3", changeMap = "right" },
        { map = "10,-3", changeMap = "right" },
        { map = "11,-3", changeMap = "right" },
        { map = "12,-3", custom = travelToArkal },
        { map = "-51,-38", changeMap = "left" },
        { map = "-52,-39", changeMap = "left" },
        { map = "-53,-40", changeMap = "top" },
        { map = "-53,-41", changeMap = "top" },
        { map = "-53,-42", changeMap = "right" },
        { map = "-52,-42", changeMap = "top" },
        { map = "-52,-43", changeMap = "top" },
        { map = "-52,-44", changeMap = "right" },
        { map = "54159148", changeMap = "159" },
        { map = "57017863", gather = true, changeMap = "429" },
        { map = "54159148", changeMap = "right" },
        { map = "-50,-44", changeMap = "top" },
        { map = "54158637", changeMap = "362" },
        { map = "57016839", gather = true, changeMap = "298" },
        { map = "56886791", gather = true, changeMap = "442" },
        { map = "57016839", gather = true, changeMap = "262" },
        { map = "56885767", gather = true, custom = waitAfterHarvest },
        { map = "56885767", gather = true, changeMap = "410" },
        { map = "57016839", gather = true, changeMap = "298" },
        { map = "56886791", gather = true, changeMap = "442" },
        { map = "57016839", gather = true, changeMap = "451" },
        { map = "54158637", changeMap = "left" },
        { map = "-51,-45", changeMap = "bottom" },
    })
end

function bank()
	return MULTIPLE_MAP:Run({
		{ map = "0,0", changeMap = bank_zaap },
		{ map = "5,-18", changeMap = "left" },
		{ map = "191104002", changeMap = "247" },
		{ map = "192415750", custom = hiboux},
	})
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