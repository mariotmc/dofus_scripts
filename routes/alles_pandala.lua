-- lvl 180/180
-- Frêne, Chêne, If, Ebène, Charme, Orme, Châtaignier, Noyer, Bombu, Merisier, Erable, Noisetier, Millet

ELEMENTS_TO_GATHER = {1, 8, 28, 29, 32, 30, 33, 34, 98, 35, 31, 259, 261}

MAX_PODS = 95

routen_zaap = "zaap(121,217,207619076)"

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
        { map = "206307842", gather = true, changeMap = "bottom" }, 
        { map = "20,-28", gather = true, changeMap = "bottom" }, 
        { map = "20,-27", gather = true, changeMap = "bottom" }, 
        { map = "20,-26", gather = true, changeMap = "left" }, 
        { map = "19,-26", gather = true, changeMap = "right" },
        { map = "20,-26", gather = true, changeMap = "right" }, 
        { map = "21,-26", gather = true, changeMap = "bottom" }, 
        { map = "21,-25", gather = true, changeMap = "left" }, 
        { map = "20,-25", gather = true, changeMap = "left" }, 
        { map = "19,-25", gather = true, changeMap = "left" }, 
        { map = "18,-25", gather = true, changeMap = "right" },
        { map = "19,-25", gather = true, changeMap = "bottom" }, 
        { map = "19,-24", gather = true, changeMap = "left" }, 
        { map = "18,-24", gather = true, changeMap = "right" },
        { map = "19,-24", gather = true, changeMap = "right" }, 
        { map = "20,-24", gather = true, changeMap = "right" }, 
        { map = "21,-24", gather = true, changeMap = "right" }, 
        { map = "22,-24", gather = true, changeMap = "bottom" }, 
        { map = "22,-23", gather = true, changeMap = "right" }, 
        { map = "23,-23", gather = true, changeMap = "left" }, 
        { map = "22,-23", gather = true, changeMap = "left" }, 
        { map = "21,-23", gather = true, changeMap = "left" }, 
        { map = "20,-23", gather = true, changeMap = "left" }, 
        { map = "19,-23", gather = true, changeMap = "left" }, 
        { map = "18,-23", gather = true, changeMap = "bottom" }, 
        { map = "18,-22", gather = true, changeMap = "right" }, 
        { map = "19,-22", gather = true, changeMap = "right" }, 
        { map = "20,-22", gather = true, changeMap = "right" }, 
        { map = "21,-22", gather = true, changeMap = "right" }, 
        { map = "22,-22", gather = true, changeMap = "right" }, 
        { map = "23,-22", gather = true, changeMap = "left" },
        { map = "22,-22", gather = true, changeMap = "left" }, 
        { map = "21,-22", gather = true, changeMap = "bottom" }, 
        { map = "21,-21", gather = true, changeMap = "right" }, 
        { map = "22,-21", gather = true, changeMap = "bottom" }, 
        { map = "22,-20", gather = true, changeMap = "bottom" }, 
        { map = "22,-19", gather = true, changeMap = "left" }, 
        { map = "21,-19", gather = true, changeMap = "top" }, 
        { map = "21,-20", gather = true, changeMap = "left" }, 
        { map = "20,-20", gather = true, changeMap = "top" }, 
        { map = "20,-21", gather = true, changeMap = "left" }, 
        { map = "19,-21", gather = true, changeMap = "top" }, 
        { map = "19,-22", gather = true, changeMap = "top" }, 
        { map = "19,-23", gather = true, changeMap = "right" }, 
        { map = "20,-23", gather = true, changeMap = "right" }, 
        { map = "21,-23", gather = true, changeMap = "top" }, 
        { map = "21,-24", gather = true, changeMap = "top" }, 
        { map = "21,-25", gather = true, changeMap = "top" }, 
        { map = "21,-26", gather = true, changeMap = "top" }, 
        { map = "21,-27", gather = true, changeMap = "top" }, 
        { map = "21,-28", gather = true, changeMap = "left" },
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