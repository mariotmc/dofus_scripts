-- lvl 180/180
-- Frêne, Chêne, If, Ebène, Charme, Orme, Châtaignier, Noyer, Bombu, Merisier, Erable, Noisetier, Millet

ELEMENTS_TO_GATHER = {1, 8, 28, 29, 32, 30, 33, 34, 98, 35, 31, 259, 261}

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
        { map = "-27,-36", gather = true, changeMap = "left" }, 
        { map = "-28,-36", gather = true, changeMap = "left" }, 
        { map = "-29,-36", gather = true, changeMap = "left" }, 
        { map = "-30,-36", gather = true, changeMap = "top" }, 
        { map = "-30,-37", gather = true, changeMap = "top" }, 
        { map = "-30,-38", gather = true, changeMap = "top" }, 
        { map = "-30,-39", gather = true, changeMap = "top" }, 
        { map = "-30,-40", gather = true, changeMap = "top" }, 
        { map = "-31,-42", gather = true, changeMap = "top" }, 
        { map = "-31,-43", gather = true, changeMap = "top" }, 
        { map = "-31,-44", gather = true, changeMap = "top" }, 
        { map = "-31,-45", gather = true, changeMap = "right" }, 
        { map = "-30,-45", gather = true, changeMap = "right" }, 
        { map = "-29,-45", gather = true, changeMap = "right" }, 
        { map = "-28,-45", gather = true, changeMap = "right" }, 
        { map = "-27,-45", gather = true, changeMap = "top" }, 
        { map = "-27,-46", gather = true, changeMap = "left" }, 
        { map = "-28,-46", gather = true, changeMap = "left" }, 
        { map = "-29,-46", gather = true, changeMap = "left" }, 
        { map = "-30,-46", gather = true, changeMap = "top" }, 
        { map = "-30,-47", gather = true, changeMap = "top" }, 
        { map = "-30,-48", gather = true, changeMap = "right" }, 
        { map = "-29,-48", gather = true, changeMap = "right" }, 
        { map = "-28,-48", gather = true, changeMap = "right" }, 
        { map = "-27,-48", gather = true, changeMap = "right" }, 
        { map = "-26,-48", gather = true, changeMap = "right" }, 
        { map = "-25,-48", gather = true, changeMap = "top" }, 
        { map = "-25,-49", gather = true, changeMap = "right" }, 
        { map = "-24,-49", gather = true, changeMap = "right" }, 
        { map = "-23,-49", gather = true, changeMap = "top" }, 
        { map = "-23,-50", gather = true, changeMap = "top" }, 
        { map = "-23,-51", gather = true, changeMap = "top" }, 
        { map = "-23,-52", gather = true, changeMap = "top" }, 
        { map = "-23,-53", gather = true, changeMap = "top" }, 
        { map = "-23,-54", gather = true, changeMap = "top" }, 
        { map = "-23,-55", gather = true, changeMap = "top" }, 
        { map = "-23,-56", gather = true, changeMap = "top" }, 
        { map = "-23,-57", gather = true, changeMap = "top" }, 
        { map = "-21,-62", gather = true, changeMap = "right" }, 
        { map = "-20,-62", gather = true, changeMap = "right" }, 
        { map = "-19,-62", gather = true, changeMap = "bottom" }, 
        { map = "-19,-61", gather = true, changeMap = "bottom" }, 
        { map = "-19,-60", gather = true, changeMap = "bottom" }, 
        { map = "-19,-59", gather = true, changeMap = "bottom" }, 
        { map = "-19,-58", gather = true, changeMap = "right" }, 
        { map = "-18,-58", gather = true, changeMap = "right" }, 
        { map = "-17,-58", gather = true, changeMap = "bottom" }, 
        { map = "-23,-58", gather = true, changeMap = "right" }, 
        { map = "-22,-58", gather = true, changeMap = "top" }, 
        { map = "-22,-59", gather = true, changeMap = "top" }, 
        { map = "-22,-60", gather = true, changeMap = "top" }, 
        { map = "-22,-61", gather = true, changeMap = "top" }, 
        { map = "-22,-62", gather = true, changeMap = "right" }, 
        { map = "-17,-57", gather = true, changeMap = "right" }, 
        { map = "-16,-57", gather = true, changeMap = "right" }, 
        { map = "-15,-57", gather = true, changeMap = "right" }, 
        { map = "-14,-57", gather = true, changeMap = "right" }, 
        { map = "-13,-57", gather = true, changeMap = "top" }, 
        { map = "-13,-58", gather = true, changeMap = "right" }, 
        { map = "-12,-58", gather = true, changeMap = "bottom" }, 
        { map = "-12,-57", gather = true, changeMap = "right" }, 
        { map = "-10,-57", gather = true, changeMap = "right" }, 
        { map = "-9,-57", gather = true, changeMap = "right" }, 
        { map = "-8,-57", gather = true, changeMap = "right" },
        { map = "-7,-57", gather = true, changeMap = "top" },
        { map = "-7,-58", gather = true, changeMap = "left" },
        { map = "-8,-58", gather = true, changeMap = "top" }, 
        { map = "-8,-59", gather = true, changeMap = "right" }, 
        { map = "-7,-59", gather = true, changeMap = "right" }, 
        { map = "-6,-59", gather = true, changeMap = "right" }, 
        { map = "-5,-59", gather = true, changeMap = "right" }, 
        { map = "-4,-59", gather = true, changeMap = "right" }, 
        { map = "-3,-59", gather = true, changeMap = "bottom" }, 
        { map = "-3,-58", gather = true, changeMap = "left" }, 
        { map = "-4,-58", gather = true, changeMap = "left" }, 
        { map = "-5,-58", gather = true, changeMap = "left" }, 
        { map = "-6,-58", gather = true, changeMap = "bottom" }, 
        { map = "-6,-57", gather = true, changeMap = "right" }, 
        { map = "-5,-57", gather = true, changeMap = "right" }, 
        { map = "-4,-57", gather = true, changeMap = "right" }, 
        { map = "-3,-57", gather = true, changeMap = "bottom" }, 
        { map = "-3,-56", gather = true, changeMap = "left" }, 
        { map = "-4,-56", gather = true, changeMap = "left" }, 
        { map = "-5,-56", gather = true, changeMap = "left" }, 
        { map = "-6,-56", gather = true, changeMap = "bottom" }, 
        { map = "-6,-55", gather = true, changeMap = "left" }, 
        { map = "-7,-55", gather = true, changeMap = "bottom" }, 
        { map = "-7,-54", gather = true, changeMap = "right" }, 
        { map = "-6,-54", gather = true, changeMap = "bottom" }, 
        { map = "-6,-53", gather = true, changeMap = "bottom" }, 
        { map = "-6,-52", gather = true, changeMap = "right" }, 
        { map = "-5,-52", gather = true, changeMap = "bottom" }, 
        { map = "-5,-51", gather = true, changeMap = "right" }, 
        { map = "-4,-51", gather = true, changeMap = "right" }, 
        { map = "-3,-51", gather = true, changeMap = "right" }, 
        { map = "-2,-51", gather = true, changeMap = "bottom" }, 
        { map = "-2,-50", gather = true, changeMap = "left" }, 
        { map = "-3,-50", gather = true, changeMap = "left" }, 
        { map = "-4,-50", gather = true, changeMap = "left" }, 
        { map = "-5,-50", gather = true, changeMap = "left" }, 
        { map = "-6,-50", gather = true, changeMap = "left" }, 
        { map = "-7,-50", gather = true, changeMap = "left" }, 
        { map = "-8,-50", gather = true, changeMap = "left" }, 
        { map = "-9,-50", gather = true, changeMap = "left" }, 
        { map = "-10,-50", gather = true, changeMap = "left" }, 
        { map = "-11,-50", gather = true, changeMap = "left" }, 
        { map = "-12,-50", gather = true, changeMap = "left" }, 
        { map = "-13,-50", gather = true, changeMap = "left" }, 
        { map = "-14,-50", gather = true, changeMap = "left" }, 
        { map = "-15,-50", gather = true, changeMap = "bottom" }, 
        { map = "-15,-49", gather = true, changeMap = "bottom" }, 
        { map = "-15,-48", gather = true, changeMap = "right" }, 
        { map = "-14,-48", gather = true, changeMap = "right" }, 
        { map = "-13,-48", gather = true, changeMap = "bottom" }, 
        { map = "-13,-47", gather = true, changeMap = "bottom" }, 
        { map = "-13,-46", gather = true, changeMap = "right" }, 
        { map = "-12,-46", gather = true, changeMap = "right" }, 
        { map = "-11,-46", gather = true, changeMap = "right" }, 
        { map = "-10,-46", gather = true, changeMap = "right" }, 
        { map = "-9,-46", gather = true, changeMap = "bottom" }, 
        { map = "-9,-45", gather = true, changeMap = "bottom" }, 
        { map = "-9,-43", gather = true, changeMap = "bottom" }, 
        { map = "-9,-44", gather = true, changeMap = "bottom" }, 
        { map = "-9,-42", gather = true, changeMap = "left" }, 
        { map = "-10,-42", gather = true, changeMap = "left" }, 
        { map = "-11,-42", gather = true, changeMap = "left" }, 
        { map = "-12,-42", gather = true, changeMap = "left" }, 
        { map = "-13,-42", gather = true, changeMap = "left" }, 
        { map = "-14,-42", gather = true, changeMap = "left" }, 
        { map = "-15,-42", gather = true, changeMap = "left" }, 
        { map = "-16,-42", gather = true, changeMap = "left" }, 
        { map = "-17,-42", gather = true, changeMap = "left" }, 
        { map = "-18,-42", gather = true, changeMap = "left" }, 
        { map = "-19,-42", gather = true, changeMap = "left" }, 
        { map = "-20,-42", gather = true, changeMap = "left" }, 
        { map = "-21,-42", gather = true, changeMap = "left" }, 
        { map = "-22,-42", gather = true, changeMap = "left" }, 
        { map = "-23,-42", gather = true, changeMap = "left" }, 
        { map = "-24,-42", gather = true, changeMap = "left" }, 
        { map = "-25,-42", gather = true, changeMap = "left" }, 
        { map = "-26,-42", gather = true, changeMap = "left" }, 
        { map = "-27,-42", gather = true, changeMap = "left" }, 
        { map = "-28,-42", gather = true, changeMap = "left" }, 
        { map = "-29,-42", gather = true, changeMap = "left" }, 
        { map = "-30,-41", gather = true, changeMap = "top" }, 
        { map = "-30,-42", gather = true, changeMap = "left" }, 
        { map = "-11,-57", gather = true, changeMap = "right" }, 
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