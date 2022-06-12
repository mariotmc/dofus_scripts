-- lvl 200
-- Or, Obsidienne, Etain, Bauxite, Manganèse, Kobalte, Argent, Bronze

ELEMENTS_TO_GATHER = {25, 135, 52, 26, 54, 37, 24, 55}

MAX_PODS = 95

routen_zaap = "zaap(121,217,88082704)"

bank_zaap = "zaap(121,217,191105026)"

function pickUpPotion()
    global:delay(1000)
	global:sendKey(68)
	global:delay(1000)
	global:clickPosition(538,428)
	global:delay(1000)
	global:clickPosition(34,112)
	global:clickPosition(34,112)
	global:delay(1000)
	global:clickPosition(630,52)
	global:delay(1000)
	global:clickPosition(625,94)
    global:delay(1000)
end

function usePotion()
    global:clickPosition(270,481)
    global:clickPosition(270,481)
end

function hiboux()
	global:clickPosition(384, 234)
	global:delay(1000)
	global:clickPosition(300, 383)
	storage:putAllItems()
	global:leaveDialog()
    pickUpPotion()
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

function travelToMadrestam()
    global:delay(1000)
    global:clickPosition(270,165)
	global:delay(1000)
	global:clickPosition(289,397)
	global:delay(1000)
end

function move()
    return MULTIPLE_MAP:Run({
        -- Goblin
        {map = "0,0", changeMap = routen_zaap},
        {map = "5,7", changeMap = "bottom"},
        {map = "5,8", changeMap = "left"},
        {map = "4,8", changeMap = "left"},
        {map = "3,8", changeMap = "left"},
        {map = "2,8", changeMap = "left"},
        {map = "1,8", changeMap = "left"},
        {map = "0,8", changeMap = "left"},
        {map = "-1,8", changeMap = "368"},
        {map = "-2,8", changeMap = "left"},
        {map = "-3,8", changeMap = "left"},
        {map = "-4,8", changeMap = "left"},
        {map = "-5,8", changeMap = "left"},
        {map = "-6,8", changeMap = "top"},
        {map = "-6,7", changeMap = "left"},
        {map = "104202753", changeMap = "100"},
        -- 1st mine
        {map = "104859143", gather = true, changeMap = "160"},
        {map = "104860167", gather = true, changeMap = "205"},
        {map = "104861191", gather = true, changeMap = "457"},
        {map = "104860167", gather = true, changeMap = "478"},
        {map = "104859143", gather = true, changeMap = "171"},
        {map = "104862215", gather = true, changeMap = "472"},
        {map = "104859143", gather = true, changeMap = "543"},
        -- Weg zur zweiten miene
        {map = "104202753", changeMap = "right"},
        {map = "-6,7", changeMap = "top"},
        {map = "104071168", changeMap = "213"},
        -- 2nd mine
        {map = "104860165", gather = true, changeMap = "242"},
        {map = "104861189", gather = true, changeMap = "451"},
        {map = "104862213", gather = true, changeMap = "376"},
        {map = "104858119", gather = true, changeMap = "207"},
        {map = "104860165", gather = true, changeMap = "444"},
        -- Weg zur dritten miene
        {map = "104071168", changeMap = "top"},
        {map = "104071425", changeMap = "199"},
        -- 3rd mine
        {map = "104859139", gather = true, changeMap = "444"},
        -- Weg zur vierten miene
        {map = "104071425", changeMap = "right"},
        {map = "-5,5", changeMap = "right"},
        {map = "-4,5", changeMap = "top"},
        {map = "-4,4", changeMap = "top"},
        {map = "-4,3", changeMap = "top"},
        {map = "104072452", changeMap = "235"},
        -- 4th mine
        {map = "104858121", gather = true, changeMap = "348"},
        {map = "104860169", gather = true, changeMap = "263"},
        {map = "104861193", gather = true, changeMap = "248"},
        {map = "104862217", gather = true, changeMap = "369"},
        {map = "104861193", gather = true, changeMap = "254"},
        {map = "104859145", gather = true, changeMap = "457"},
        {map = "104858121", gather = true, changeMap = "507"},
        -- Weg nach Arkal
        {map = "104072452", changeMap = "bottom"},
        { map = "-4,3", changeMap = "bottom" }, 
        { map = "-4,4", changeMap = "bottom" }, 
        { map = "-4,5", changeMap = "bottom" }, 
        { map = "-4,6", changeMap = "bottom" }, 
        { map = "-4,7", changeMap = "bottom" }, 
        { map = "-4,8", changeMap = "right" }, 
        { map = "-3,8", changeMap = "right" }, 
        { map = "-2,8", changeMap = "247" },
        { map = "-1,8", changeMap = "right" }, 
        { map = "0,8", changeMap = "right" }, 
        { map = "1,8", changeMap = "right" }, 
        { map = "2,8", changeMap = "right" }, 
        { map = "3,8", changeMap = "top" }, 
        { map = "3,7", changeMap = "top" }, 
        { map = "3,6", changeMap = "top" }, 
        { map = "3,5", changeMap = "top" }, 
        { map = "3,4", changeMap = "top" }, 
        { map = "3,3", changeMap = "right" }, 
        { map = "4,3", changeMap = "right" }, 
        { map = "5,3", changeMap = "right" }, 
        { map = "6,3", changeMap = "right" }, 
        { map = "7,3", changeMap = "top" }, 
        { map = "7,2", changeMap = "top" }, 
        { map = "7,1", changeMap = "top" }, 
        { map = "7,0", changeMap = "top" }, 
        { map = "7,-1", changeMap = "top" }, 
        { map = "7,-2", changeMap = "top" }, 
        { map = "7,-3", changeMap = "right" }, 
        { map = "7,-3", changeMap = "right" },
        { map = "8,-3", changeMap = "right" },
        { map = "9,-3", changeMap = "right" },
        { map = "10,-3", changeMap = "right" },
        { map = "11,-3", changeMap = "right" },
        { map = "12,-3", custom = travelToArkal },
        -- Arkal
        { map = "-51,-38", changeMap = "left" },
        { map = "-52,-39", changeMap = "left" },
        { map = "-53,-40", changeMap = "top" },
        { map = "-53,-41", changeMap = "top" },
        { map = "-53,-42", changeMap = "right" },
        { map = "-52,-42", changeMap = "top" },
        { map = "-52,-43", changeMap = "top" },
        { map = "-52,-44", changeMap = "right" },
        { map = "54159148", changeMap = "159" },
        -- 1st mine
        { map = "57017863", gather = true, changeMap = "429" },
        -- Weg zur zweiten miene
        { map = "54159148", changeMap = "right" },
        { map = "-50,-44", changeMap = "top" },
        { map = "54158637", changeMap = "362" },
        -- 2nd mine
        { map = "57016839", gather = true, changeMap = "298" },
        { map = "56886791", gather = true, changeMap = "442" },
        { map = "57016839", gather = true, changeMap = "262" },
        { map = "56885767", gather = true, changeMap = "410" },
        { map = "57016839", gather = true, changeMap = "451" },
        -- Weg zum Fresssack-Ecke zaap
        { map = "54158637", changeMap = "left" },
        { map = "-66,-39", changeMap = "right" }, 
        { map = "-51,-45", changeMap = "bottom" }, 
        { map = "54159148", changeMap = "left" }, 
        { map = "-52,-44", changeMap = "left" }, 
        { map = "-53,-44", changeMap = "bottom" }, 
        { map = "-53,-43", changeMap = "bottom" }, 
        { map = "-53,-42", changeMap = "bottom" }, 
        { map = "-53,-41", changeMap = "bottom" },
        { map = "-53,-40", changeMap = "right" },
        { map = "-52,-39", changeMap = "right" },
        { map = "-51,-38", custom = travelToMadrestam },
        { map = "12,-3", changeMap = "left" }, 
        { map = "11,-3", changeMap = "left" }, 
        { map = "10,-3", changeMap = "left" }, 
        { map = "9,-3", changeMap = "left" }, 
        { map = "8,-3", changeMap = "bottom" }, 
        { map = "8,-2", changeMap = "bottom" }, 
        { map = "8,-1", changeMap = "left" }, 
        { map = "7,-1", changeMap = "bottom" }, 
        { map = "7,0", changeMap = "bottom" }, 
        { map = "7,1", changeMap = "bottom" }, 
        { map = "7,2", changeMap = "bottom" }, 
        { map = "7,3", changeMap = "left" }, 
        { map = "6,3", changeMap = "bottom" }, 
        { map = "6,4", changeMap = "bottom" }, 
        { map = "6,5", changeMap = "bottom" }, 
        { map = "6,6", changeMap = "bottom" }, 
        { map = "6,7", changeMap = "left" }, 
        
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
    if inventory:podsP() >= 95 then 
        usePotion()
        global:delay(1000)
        enterHavenbag()
    else
        enterHavenbag()
    end
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