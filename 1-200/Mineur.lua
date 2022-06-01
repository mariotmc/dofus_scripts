---------------------------------------------
-- Version 1.0.0
-- Compatible avec FlatyBot
-- https://flatybot.net/
---------------------------------------------
-- Date enregistré : 09/01/2021
-- Date exporté : 09/01/2021
---------------------------------------------
-- Nom :      Mineur 1 / 200
-- Zone :     Dofus
-- Type :     Récolte
-- Version :  1
-- Créateur : TomLaVachette
-- Modifé Par : Plopo
---------------------------------------------
---------------------------------------------
-- Paramètres
-- Posséder la pluspart des zaaps tels que pandala, otomai, frigost
--------------------------------------------
---------------------------------------------
-- Non Fonctionnel
-- Retour Phoenix 
---------------------------------------------
-- [LVL 1] = 17 - Fer
-- [LVL 20] = 53 - Pierre Cuivrée
-- [LVL 40] = 55 - Bronze
-- [LVL 60] = 37 - Pierre de Kobalte
-- [LVL 80] = 54 - Manganèse
-- [LVL 100] = 52 - Etain
-- [LVL 100] = 114 - Silicate
-- [LVL 120] = 24 - Argent
-- [LVL 140] = 26 - Pierre de Bauxite
-- [LVL 160] = 25 - Or
-- [LVL 180] = 113 - Dolomite
-- [LVL 200] = 135 - Obsidienne
---------------------------------------------

local idZaapi, idTransporteur = nil , nil
local smallDelay, baseDelay, mediumDelay, longDelay, veryLongDelay = 100, 500, 1000, 2500, 5000
MAX_PODS = 90

stepList = {
	{
		level = 39, -- maximum level of the step
		zones = {
			"Astirite",
			"Auderie",
			"Centre-ville d'Astrub",
			"Hable",
			"Herale",
			"Hipouce",
			"Istrairameur",
			"Lac de Cania",
			"Tunnel de Kartonpath",
			"Yjupe",
			"Scara",
			"Porco1",
			"Porco2",
			"PlaineRocheuse",
			"Estrone",
			"Manganèse",
			"Hurlement",
			"Bwork",
			"Arak",
			"Imale",
			-- "Pandala",
			-- "Himum",
			--"Sakai",
			--"Maksage",
			--"Hissoire",
			--"Ouronigride"
		}
	},
	{
		level = 201,
		zones = {
			"Astirite",
			"Auderie",
			"Centre-ville d'Astrub",
			"Hable",
			"Herale",
			"Hipouce",
			"Istrairameur",
			"Lac de Cania",
			"Tunnel de Kartonpath",
			"Yjupe",
			"Scara",
			"Porco1",
			"Porco2",
			"PlaineRocheuse",
			"Estrone",
			"Manganèse",
			"Hurlement",
			"Bwork",
			"Arak",
			"Imale",
			"Pandala",
			"Himum",
			"Sakai",
			"Maksage",
			"Hissoire",
			"Ouronigride"
		}
	},
}

housePath = {
	-- { map = "0,0", changeMap = "zaap(121,217,191105026)" },
	-- { map = "0,1", changeMap = "bottom" },
}

currentStep = nil

--[[---------------------------------------------------------
	DEFAULT FUNCTIONS
-----------------------------------------------------------]]

ELEMENTS_TO_GATHER = {
	17, -- Fer
	53, -- Pierre Cuivrée
	55, -- Bronze
	37, -- Pierre de Kobalte
	54, -- Manganèse
	52, -- Etain
	114, -- Silicate
	24, -- Argent
	26, -- Pierre de Bauxite
	25, -- Or
	113, -- Dolomite
	135, -- Obsidienne
	291, -- Écume de mer
	293 -- Écume de mer
}
function hiboux()
global:clickPosition(408, 228, false)
global:delay(1000)
global:clickPosition(300, 383, false)
global:delay(500)
storage:putAllItems()
global:delay(500)
global:leaveDialog()
global:delay(500)

end
function move()
	if not currentStep then
		updateCurrentStep()
	end
	checkBag()
	local tab = stepList[currentStep]
	return mines[tab.zones[tab.currentZone]]()
end

function bank()
	currentPos = map.currentPos()
	currentMapId = map.currentMapId()
	checkBag()
	-- Custom bank function (for personal houses)
	for i, v in pairs(housePath) do
		if v.map == currentPos or v.map == tostring(currentMapId) then
			return { housePath[i] }
		end
	end

	-- Default bank function (Astrub bank)
	return {
		{ map = "0,0", changeMap = "zaap(121,217,191105026)" },
		{ map = "5,-18", changeMap = "left" },
		{ map = "191104002", changeMap = "247" },
		{ map = "192415750", custom = hiboux, havenbag = true },
		{ map = map.currentMapId(), custom = tryHavenbag },
	}
	
end

function phenix()
	global.printMessage("[ERREUR] Le personnage est devenu un fantome car il n'a plus d'energie.")
end

function lost()
	global.printMessage("[AVERTISSEMENT] Personnage perdu sur la carte [" .. map.currentPos() .. "].")
	return {
		{ map = map.currentMapId(), havenbag = true },
	}
end

--[[---------------------------------------------------------
	CUSTOM FUNCTIONS
-----------------------------------------------------------]]

function tryHavenbag()
	-- global.sendKey(72) -- H key
	
	global.delay(1000)
	
	-- After the delay, if the script read here, it might be
	-- because the havenbag is not accessible.
	global.printMessage("[AVERTISSEMENT] Havre-sac inaccessible sur la carte [" .. map.currentPos() .. "].")
	
	-- So let's continue our work...
	return move()
end

function updateCurrentStep()
	for i, v in ipairs(stepList) do
		if job.level(24) < v.level then
			-- Shuffle the mine list to avoid repetition
			v.zones = shuffleList(v.zones)
			
			-- Start to the first mine
			v.currentZone = 1
		
			-- First time on this step
			if i ~= currentStep then
				-- Set the step
				currentStep = i
				
				global.printMessage("[INFO] Execution de l'etape numero " .. i .. "/" .. #stepList .. ".")
				global.printMessage("[INFO] Passage a la mine " .. v.zones[1] .. ".")

				break
			end
		end
	end
end

function shuffleList(list)
	newList = {}

	for i = 1, #list do
		e = table.remove(list, math.random(1, #list))
		table.insert(newList, e)
	end

	return newList
end

function nextMine()
	local tab = stepList[currentStep]

	tab.currentZone =  1 + tab.currentZone
	if tab.currentZone > #tab.zones then
		tab.currentZone = 1
	end

	global.printMessage("[INFO] Passage a la mine " .. tab.zones[tab.currentZone] .. ".")

	map.havenbag()
end

function updatePath()
	updateCurrentStep()
	MULTIPLE_MAP:Reset()
end

--[[---------------------------------------------------------
	MINES
-----------------------------------------------------------]]

mines = {
	["Astirite"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Village d'Amakna
			{ map = "-2,0", gather = true, changeMap = "top" },
			{ map = "-2,-1", gather = true, changeMap = "top" },
			{ map = "-2,-2", gather = true, changeMap = "top" },
			{ map = "-2,-3", gather = true, changeMap = "top" },
			{ map = "-2,-4", gather = true, changeMap = "top" },
			{ map = "185862148", gather = true, changeMap = "324" },
			{ map = "97255951", gather = true, changeMap = "203" },
			{ map = "97256975", gather = true, changeMap = "323" },
			{ map = "97257999", gather = true, changeMap = "247" },
			{ map = "97259023", gather = true, changeMap = "451" },
			{ map = "97257999", gather = true, changeMap = "268" },
			{ map = "97260047", gather = true, changeMap = "379" },
			{ map = "97261071", gather = true, changeMap = "248" },
			{ map = "97260047", gather = true, changeMap = "432" },
			{ map = "97257999", gather = true, changeMap = "403" },
			{ map = "97256975", gather = true, custom = nextMine },
		})
	end,
	["Auderie"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Village d'Amakna 
			{ map = "-2,0", gather = true, changeMap = "bottom" },
			{ map = "-2,1", gather = true, changeMap = "bottom" },
			{ map = "-2,2", gather = true, changeMap = "bottom" },
			{ map = "-2,3", gather = true, changeMap = "bottom" },
			{ map = "88213267", gather = true, changeMap = "222" },
			{ map = "97255949", gather = true, changeMap = "376" },
			{ map = "97256973", gather = true, changeMap = "122" },
			{ map = "97257997", gather = true, changeMap = "235" },
			{ map = "97259021", gather = true, changeMap = "323" },
			{ map = "97257997", gather = true, changeMap = "451" },
			{ map = "97256973", gather = true, changeMap = "537" },
			{ map = "97260045", gather = true, changeMap = "254" },
			{ map = "97261069", gather = true, changeMap = "348" },
			{ map = "97260045", gather = true, changeMap = "291" },
			{ map = "97256973", gather = true, changeMap = "157" },
			{ map = "97255949", gather = true, custom = nextMine },
		})
	end,
	["Centre-ville d'Astrub"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,191105026)" }, -- Zaap Astrub
			{ map = "5,-18", gather = true, changeMap = "left" },
			{ map = "4,-18", gather = true, changeMap = "left" },
			{ map = "191102978", gather = true, changeMap = "left" }, -- 3,-18
			{ map = "188744196", gather = true, changeMap = "left" }, -- 2,-18
			{ map = "188743684", gather = true, changeMap = "bottom" }, -- 1,-18
			{ map = "188743685", gather = true, changeMap = "386" },
			{ map = "188482052", gather = true, changeMap = "181" },
			{ map = "188483076", gather = true, changeMap = "349" },
			{ map = "188484100", gather = true, changeMap = "155" },
			{ map = "188483076", gather = true, changeMap = "476" },
			{ map = "188482052", gather = true, custom = nextMine },
		})
	end,
	["Hable"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,191105026)" }, -- Zaap Astrub
			{ map = "5,-18", gather = true, changeMap = "right" },
			{ map = "6,-18", gather = true, changeMap = "right" },
			{ map = "7,-18", gather = true, changeMap = "right" },
			{ map = "8,-18", gather = true, changeMap = "bottom" },
			{ map = "8,-17", gather = true, changeMap = function()
				global.clickPosition(643,328)
			end },
			{ map = "9,-17", gather = true, changeMap = function()
				global.clickPosition(7,342)
			end },
			{ map = "8,-17", gather = true, changeMap = "bottom" },
			{ map = "8,-16", gather = true, changeMap = "right" },
			{ map = "9,-16", gather = true, changeMap = "right" },
			{ map = "10,-16", gather = true, changeMap = "top" },
			{ map = "10,-17", gather = true, changeMap = "left" },
			{ map = "9,-17", gather = true, changeMap = "top" },
			{ map = "9,-18", gather = true, changeMap = "left" },
			{ map = "8,-18", gather = true, changeMap = "top" },
			{ map = "8,-19", gather = true, changeMap = "top" },
			{ map = "8,-20", gather = true, changeMap = "top" },
			{ map = "8,-21", gather = true, changeMap = "right" },
			{ map = "9,-21", gather = true, changeMap = "bottom" },
			{ map = "9,-20", gather = true, changeMap = "bottom" },
			{ map = "9,-19", gather = true, changeMap = "right" },
			{ map = "193200131", gather = true, changeMap = "bottom" },
			{ map = "10,-18", gather = true, changeMap = "top" },
			{ map = "193200131", gather = true, changeMap = "248" },
			{ map = "188484108", gather = true, changeMap = "166" },
			{ map = "188484106", gather = true, changeMap = "78" },
			{ map = "188484104", gather = true, changeMap = "73" },
			{ map = "188485128", gather = true, changeMap = "right" },
			{ map = "188484104", gather = true, changeMap = "bottom" },
			{ map = "188484106", gather = true, changeMap = "293" },	
			{ map = "188486154", gather = true, custom = nextMine },
		})
	end,
	["Herale"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,88212481)" }, -- Zaap 
			{ map = "-1,24", gather = true, changeMap = "right" },
			{ map = "0,24", gather = true, changeMap = "right" },
			{ map = "1,24", gather = true, changeMap = "right" },
			{ map = "2,24", gather = true, changeMap = "right" },
			{ map = "3,24", gather = true, changeMap = "right" },
			{ map = "4,24", gather = true, changeMap = "top" },
			{ map = "4,23", gather = true, changeMap = "top" },
			{ map = "4,22", gather = true, changeMap = "top" },
			{ map = "4,21", gather = true, changeMap = "top" },
			{ map = "4,20", gather = true, changeMap = "top" },
			{ map = "4,19", gather = true, changeMap = "right" },
			{ map = "88082692", gather = true, changeMap = "332" },
			{ map = "97260033", gather = true, changeMap = "405" },
			{ map = "97261057", gather = true, changeMap = "421" },
			{ map = "97259011", gather = true, changeMap = "276" },
			{ map = "97261057", gather = true, changeMap = "487" },
			{ map = "97257987", gather = true, changeMap = "492" },
			{ map = "97260035", gather = true, changeMap = "288" },
			{ map = "97257987", gather = true, changeMap = "249" },
			{ map = "97256963", gather = true, changeMap = "172" },
			{ map = "97255939", gather = true, changeMap = "478" },
			{ map = "97261057", gather = true, changeMap = "227" },
			{ map = "97260033", gather = true, changeMap = "183" },
			{ map = "97261059", gather = true, custom = nextMine }, 
		})
	end,
	["Hipouce"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,171967506)" }, -- Zaap Route des Roulottes
			{ map = "171967506", changeMap = "bottom" },
            { map = "171967507", changeMap = "bottom" },
            { map = "171967508", changeMap = "bottom" },
            { map = "173017857", changeMap = "bottom" },
            { map = "173017600", changeMap = "bottom" },
            { map = "173017601", changeMap = "434" },
            { map = "173017602", changeMap = "484" },
            { map = "173017603", changeMap = "bottom" },
            { map = "173017604", changeMap = "right" },
            { map = "173018116", changeMap = "bottom" },
            { map = "173018117", changeMap = "left" },
            { map = "173017605", changeMap = "493" },
            { map = "173017606", changeMap = "268" },
            { map = "178782208", gather = true, custom = clickMap },
            { map = "178782210", gather = true, changeMap = "221" },
            { map = "178783234", gather = true, custom = clickMap },
            { map = "178783232", gather = true, changeMap = "204" },
            { map = "178784256", gather = true, changeMap = "476" },
            { map = "178783232", gather = true, changeMap = "213" },
            { map = "178783236", gather = true, changeMap = "138" },
            { map = "178784260", gather = true, changeMap = "406" },
            { map = "178783236", gather = true, changeMap = "323" },
            { map = "178782214", gather = true, changeMap = "507" },
            { map = "178782216", changeMap = "450" },
            { map = "178782218", gather = true, changeMap = "518" },
            { map = "178782220", gather = true, changeMap = "57" },
            { map = "178782218", gather = true, custom = clickMap },
            { map = "178782216", gather = true, changeMap = "162" },
            { map = "178782214", gather = true, changeMap = "179" },
            { map = "178783236", gather = true, changeMap = "527" },
            { map = "178783232", gather = true, changeMap = "406", custom = nextMine },
		})
	end,
	---------------------------------------------
-- Version 1.0.0
-- Compatible avec FlatyBot
-- https://flatybot.net/
---------------------------------------------
-- Date enregistré : 09/01/2021
-- Date exporté : 09/01/2021
---------------------------------------------
-- Nom :      Mineur 1 / 200
-- Zone :     Dofus
-- Type :     Récolte
-- Version :  1
-- Créateur : TomLaVachette
-- Modifé Par : Plopo
---------------------------------------------
---------------------------------------------
-- Paramètres
-- Posséder la pluspart des zaaps tels que pandala, otomai, frigost
--------------------------------------------
---------------------------------------------
-- Non Fonctionnel
-- Retour Phoenix 
---------------------------------------------
-- [LVL 1] = 17 - Fer
-- [LVL 20] = 53 - Pierre Cuivrée
-- [LVL 40] = 55 - Bronze
-- [LVL 60] = 37 - Pierre de Kobalte
-- [LVL 80] = 54 - Manganèse
-- [LVL 100] = 52 - Etain
-- [LVL 100] = 114 - Silicate
-- [LVL 120] = 24 - Argent
-- [LVL 140] = 26 - Pierre de Bauxite
-- [LVL 160] = 25 - Or
-- [LVL 180] = 113 - Dolomite
-- [LVL 200] = 135 - Obsidienne
---------------------------------------------
	["Istrairameur"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,88212746)" }, -- Zaap bord de la foret malefique
			{ map = "-1,13", gather = true, changeMap = "top" },
			{ map = "-1,12", gather = true, changeMap = "top" },
			{ map = "-1,11", gather = true, changeMap = "top" },
			{ map = "-1,10", gather = true, changeMap = "top" },
			{ map = "-1,9", gather = true, changeMap = "left" },
			{ map = "-2,9", gather = true, changeMap = "left" },
			{ map = "88213774", gather = true, changeMap = "354" },
			{ map = "97259013", gather = true, changeMap = "276" }, 
			{ map = "97256967", gather = true, changeMap = "194" }, 
			{ map = "97260039", gather = true, changeMap = "262" }, 
			{ map = "97257993", gather = true, changeMap = "122" }, 
			{ map = "97261065", gather = true, changeMap = "236" }, 
			{ map = "97259019", gather = true, changeMap = "276" }, 
			{ map = "97260043", gather = true, changeMap = "451" },
			{ map = "97259019", gather = true, changeMap = "438" }, 
			{ map = "97261065", gather = true, changeMap = "213" }, 
			{ map = "97255947", gather = true, changeMap = "199" }, 
			{ map = "97256971", gather = true, changeMap = "234" },
			{ map = "97261067", gather = true, changeMap = "521" }, 
			{ map = "97256971", gather = true, changeMap = "239" }, 
			{ map = "97257995", gather = true, changeMap = "374" }, 
			{ map = "97256971", gather = true, changeMap = "503" }, 
			{ map = "97255947", gather = true, changeMap = "500" }, 
			{ map = "97261065", gather = true, changeMap = "479" }, 
			{ map = "97257993", gather = true, changeMap = "537" }, 
			{ map = "97260039", gather = true, changeMap = "241" }, 
			{ map = "97261063", gather = true, changeMap = "331" }, 
			{ map = "97259017", gather = true, changeMap = "436" },
			{ map = "97261063", gather = true, changeMap = "296" }, 
			{ map = "97255945", gather = true, changeMap = "332" }, 
			{ map = "97260041", gather = true, changeMap = "354" },
			{ map = "97255945", gather = true, changeMap = "213" }, 
			{ map = "97256969", gather = true, changeMap = "401" }, 
			{ map = "97255945", gather = true, changeMap = "416" }, 
			{ map = "97261063", gather = true, changeMap = "459" }, 
			{ map = "97260039", gather = true, changeMap = "451" }, 
			{ map = "97256967", gather = true, changeMap = "518" }, 
			{ map = "97259013", gather = true, changeMap = "258" }, 
			{ map = "97260037", gather = true, changeMap = "303" },
			{ map = "97257991", gather = true, changeMap = "464" },
			{ map = "97260037", gather = true, changeMap = "352" },
			{ map = "97261061", gather = true, changeMap = "290" },
			{ map = "97259015", gather = true, changeMap = "451" },
			{ map = "97261061", gather = true, changeMap = "284" },
			{ map = "97255943", gather = true, changeMap = "403" },
			{ map = "97261061", gather = true, changeMap = "458" },
			{ map = "97260037", gather = true, changeMap = "430" },
			{ map = "97259013", gather = true, custom = nextMine },
		})
	end,
	["Lac de Cania"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,156240386)" }, -- Zaap Lac de Cania
			{ map = "-3,-42", gather = true, changeMap = "right" },
			{ map = "-2,-42", gather = true, changeMap = "right" },
			{ map = "156241410", gather = true, changeMap = "149" },
			{ map = "133431302", gather = true, changeMap = "179" },
			{ map = "133431300", gather = true, changeMap = "165" },
			{ map = "133431298", gather = true, changeMap = "432" },
			{ map = "133432322", gather = true, changeMap = "116" },
			{ map = "133432320", gather = true, changeMap = "351" },
			{ map = "133431296", gather = true, changeMap = "264" },
			{ map = "133432320", gather = true, changeMap = "134" },
			{ map = "133432578", gather = true, changeMap = "409" },
			{ map = "133432320", gather = true, changeMap = "402" },
			{ map = "133432322", gather = true, changeMap = "348" },
			{ map = "133433346", gather = true, changeMap = "177" },
			{ map = "133433344", gather = true, changeMap = "501" },
			{ map = "133433346", gather = true, changeMap = "351" },
			{ map = "133432322", gather = true, changeMap = "338" },
			{ map = "133431298", gather = true, custom = nextMine },
		})
	end,
	["Tunnel de Kartonpath"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,88085249)" }, -- Rivage sufokien
			{ map = "88085249", changeMap = "right" },
            { map = "88085761", changeMap = "right" },
            { map = "88086273", changeMap = "right" },
            { map = "88086785", changeMap = "right" },
            { map = "88087297", changeMap = "top" },
            { map = "88087298", changeMap = "top" },
            { map = "88087299", changeMap = "top" },
            { map = "88087300", changeMap = "top" },
            { map = "88087301", changeMap = "top" },
            { map = "88087302", changeMap = "top" },
            { map = "88087303", changeMap = "top" },
            { map = "88087304", changeMap = "top" },
            { map = "88087305", custom = clickMap },
            { map = "117440512", changeMap = "222" },
            { map = "117441536", gather = true, changeMap = "167" },
            { map = "117442560", gather = true, changeMap = "473" },
            { map = "117443584", gather = true, changeMap = "236" },
            { map = "117440514", gather = true, changeMap = "307" },
            { map = "117441538", gather = true, changeMap = "250" },
            { map = "117442562", gather = true, changeMap = "395" },
            { map = "117441538", gather = true, changeMap = "421" },
            { map = "117440514", gather = true, changeMap = "393" },
            { map = "117443584", gather = true, changeMap = "253" },
            { map = "117442560", gather = true, changeMap = "434", custom = nextMine },
		})
	end,
	["Yjupe"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Village d'Amakna
			{ map = "-2,0", gather = true, changeMap = "top" },
			{ map = "-2,-1", gather = true, changeMap = "top" },
			{ map = "-2,-2", gather = true, changeMap = "top" },
			{ map = "-2,-3", gather = true, changeMap = "right" },
			{ map = "-1,-3", gather = true, changeMap = "right" },
			{ map = "88212250", gather = true, changeMap = "248" },
			{ map = "97255955", gather = true, changeMap = "512" },
			{ map = "97256979", gather = true, changeMap = "248" },
			{ map = "97258003", gather = true, changeMap = "228" },
			{ map = "97259027", gather = true, changeMap = "194" },
			{ map = "97260051", gather = true, changeMap = "423" },
			{ map = "97259027", gather = true, changeMap = "267" },
			{ map = "97261075", gather = true, changeMap = "498" },
			{ map = "97259027", gather = true, changeMap = "515" },
			{ map = "97258003", gather = true, changeMap = "479" },
			{ map = "97256979", gather = true, changeMap = "297" },
			{ map = "97255955", gather = true, custom = nextMine },
		})
	end,
	["Scara"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,88212481)" },-- Zaap Scara 
			{ map = "88212481", changeMap = "right" },
			{ map = "88211969", changeMap = "bottom" },
			{ map = "88211970", changeMap = "right" },
			{ map = "88080386", changeMap = "bottom" },
			{ map = "88080387", changeMap = "right" },
			{ map = "88080899", changeMap = "bottom" },
			{ map = "88080900", changeMap = "right" },
			{ map = "88081412", changeMap = "bottom" },
			{ map = "88081413", changeMap = "right" },
			{ map = "88081925", changeMap = "164" },
			{ map = "97255937", gather = true, changeMap = "360" },
			{ map = "97256961", gather = true, changeMap = "276" },
			{ map = "97257985", gather = true, changeMap = "436" },
			{ map = "97256961", gather = true, changeMap = "351" },
			{ map = "97255937", gather = true, changeMap = "360", custom = nextMine },
		})
	end,
	["Porco1"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,88212481)" },-- Zaap Scara 
			{ map = "88212481", changeMap = "right" },
            { map = "88211969", changeMap = "right" },
            { map = "88080385", changeMap = "bottom" },
            { map = "88080386", changeMap = "bottom" },
            { map = "88080387", changeMap = "bottom" },
            { map = "88080388", changeMap = "bottom" },
            { map = "88080389", changeMap = "bottom" },
            { map = "88080390", changeMap = "bottom" },
            { map = "88080391", changeMap = "bottom" },
            { map = "72619521", changeMap = "bottom" },
            { map = "72619522", changeMap = "147" },
            { map = "30672658", gather = true, changeMap = "362" },
            { map = "30672655", gather = true, changeMap = "221" },
            { map = "30672649", gather = true, changeMap = "408" },
            { map = "30672655", gather = true, changeMap = "270", custom = nextMine },
		})
	end,
	["Porco2"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,88212481)" },-- Zaap Scara 
			{ map = "88212481", changeMap = "right" },
            { map = "88211969", changeMap = "right" },
            { map = "88080385", changeMap = "bottom" },
            { map = "88080386", changeMap = "bottom" },
            { map = "88080387", changeMap = "bottom" },
            { map = "88080388", changeMap = "bottom" },
            { map = "88080389", changeMap = "bottom" },
            { map = "88080390", changeMap = "bottom" },
            { map = "88080391", changeMap = "bottom" },
            { map = "72619521", changeMap = "bottom" },
            { map = "72619522", changeMap = "bottom" },
            { map = "72619523", changeMap = "left" },
            { map = "72619011", changeMap = "left" },
            { map = "72618499", changeMap = "85" },
            { map = "30671116", gather = true, changeMap = "292" },
            { map = "30671110", gather = true, changeMap = "479" },
            { map = "30671107", gather = true, changeMap = "298" },
            { map = "30670848", gather = true, changeMap = "344" },
            { map = "30671107", gather = true, changeMap = "247" },
            { map = "30671110", gather = true, changeMap = "188", custom = nextMine },
		})
	end,
	["PlaineRocheuse"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,147590153)" },-- Zaap Plaine rocheuse
			{ map = "147590153", changeMap = "top" },
            { map = "147590152", changeMap = "top" },
            { map = "147590151", custom = clickMap },
            { map = "164758273", gather = true, custom = nextMine },
		})
	end,
	["Estrone"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,171967506)" },-- Zaap Plaine rocheuse
			{ map = "171967506", changeMap = "top" },
            { map = "171967505", changeMap = "top" },
            { map = "171967504", changeMap = "top" },
            { map = "171967503", changeMap = "top" },
            { map = "171967502", changeMap = "top" },
            { map = "171967501", changeMap = "top" },
            { map = "171967500", changeMap = "top" },
            { map = "171967499", changeMap = "left" },
            { map = "171966987", custom = clickMap },
            { map = "178785286", gather = true, changeMap = "113" },
            { map = "178785288", gather = true, custom = nextMine },
		})
	end,
	["Manganèse"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,88212481)" },-- Zaap roulottes
			{ map = "88212481", changeMap = "left" },
            { map = "84412416", changeMap = "left" },
            { map = "84411904", changeMap = "left" },
            { map = "84411392", custom = clickMap },
            { map = "84410880", changeMap = "left" },
            { map = "84410368", custom = clickMap },
            { map = "86246410", gather = true, changeMap = "431" },
            { map = "84410368", custom = nextMine },
		})
	end,
	["Hurlement"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,164364304)" },-- Zaap rocailleuse
			{ map = "164364304", changeMap = "bottom" },
            { map = "164364305", changeMap = "bottom" },
            { map = "164364306", changeMap = "bottom" },
            { map = "164364307", changeMap = "bottom" },
            { map = "164364308", changeMap = "bottom" },
            { map = "164364309", changeMap = "bottom" },
            { map = "164364310", changeMap = "bottom" },
            { map = "164364311", changeMap = "bottom" },
            { map = "164364312", changeMap = "bottom" },
            { map = "171708416", changeMap = "bottom" },
            { map = "171708417", changeMap = "left" },
            { map = "171707905", changeMap = "bottom" },
            { map = "171707906", changeMap = "bottom" },
            { map = "171707907", changeMap = "bottom" },
            { map = "171707908", custom = clickMap },
            { map = "178784264", gather = true, custom = nextMine },
		})
	end,
	["Bwork"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,88212746)" },-- Zaap foret malefique
			{ map = "88212746", changeMap = "top" },
            { map = "88212747", changeMap = "top" },
            { map = "88212748", changeMap = "top" },
            { map = "88212749", changeMap = "top" },
            { map = "88212750", changeMap = "top" },
            { map = "88212751", custom = clickMap },
            { map = "104073218", changeMap = "left" },
            { map = "104072706", changeMap = "left" },
            { map = "104072194", changeMap = "top" },
            { map = "104072193", changeMap = "top" },
            { map = "104072192", changeMap = "left" },
            { map = "104071680", changeMap = "left" },
            { map = "104071168", custom = clickMap },
            { map = "104860165", gather = true, changeMap = "444" },
            { map = "104071168", changeMap = "top" },
            { map = "104071425", custom = clickMap },
            { map = "104859139", gather = true, changeMap = "444" },
            { map = "104071425", changeMap = "right" },
            { map = "104071937", changeMap = "right" },
            { map = "104072449", changeMap = "top" },
            { map = "104072450", changeMap = "top" },
            { map = "104072451", changeMap = "top" },
            { map = "104072452", custom = clickMap },
            { map = "104858121", gather = true, changeMap = "348" },
            { map = "104860169", gather = true, changeMap = "263" },
            { map = "104861193", gather = false, changeMap = "248" },
            { map = "104862217", gather = true, changeMap = "369" },
            { map = "104861193", gather = false, changeMap = "254" },
            { map = "104859145", gather = true, changeMap = "457" },
            { map = "104858121", gather = true, changeMap = "507" },
            { map = "104072452", changeMap = "bottom" },
            { map = "104072451", changeMap = "bottom" },
            { map = "104072450", changeMap = "bottom" },
            { map = "104072449", changeMap = "bottom" },
            { map = "104072192", changeMap = "left" },
            { map = "104071680", changeMap = "left", custom = nextMine },
		})
	end,
	["Arak"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,84806401)" },-- Zaap porkass
			{ map = "84806401", changeMap = "bottom" },
            { map = "84806144", changeMap = "bottom" },
            { map = "84806145", changeMap = "bottom" },
            { map = "84806146", changeMap = "bottom" },
            { map = "165156368", changeMap = "bottom" },
            { map = "147854083", changeMap = "bottom" },
            { map = "147854082", changeMap = "left" },
            { map = "147853570", changeMap = "left" },
            { map = "147853058", changeMap = "left" },
            { map = "147852546", changeMap = "bottom" },
            { map = "147852545", changeMap = "bottom" },
            { map = "147852288", changeMap = "bottom" },
            { map = "147852289", changeMap = "bottom" },
            { map = "147852290", custom = clickMap },
            { map = "149949440", gather = true, custom = nextMine },
		})
	end,	
	["Imale"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,171967506)" },-- Zaap roulottes
			{ map = "171967506", changeMap = "bottom" },
            { map = "171967507", changeMap = "bottom" },
            { map = "171967508", changeMap = "bottom" },
            { map = "173017857", changeMap = "bottom" },
            { map = "173017600", changeMap = "bottom" },
            { map = "173017601", changeMap = "right" },
            { map = "173018113", changeMap = "right" },
            { map = "173018625", changeMap = "right" },
            { map = "173019137", changeMap = "right" },
            { map = "173019649", changeMap = "bottom" },
            { map = "173019650", changeMap = "bottom" },
            { map = "173019651", changeMap = "bottom" },
            { map = "173019652", changeMap = "bottom" },
            { map = "173019653", changeMap = "right" },
            { map = "173020165", changeMap = "right" },
            { map = "172490758", changeMap = "right" },
            { map = "172491270", changeMap = "right" },
            { map = "172491782", custom = clickMap },
            { map = "178783240", gather = true, changeMap = "235" },
            { map = "178783242", gather = true, custom = nextMine },
		})
	end,	
	["Pandala"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,207619076)" },-- Zaap Pandala
			{ map = "207619076", changeMap = "436" },
            { map = "206307842", changeMap = "right" },
            { map = "206308354", changeMap = "right" },
            { map = "206308866", changeMap = "bottom" },
            { map = "206308867", changeMap = "right" },
            { map = "206309379", changeMap = "bottom" },
            { map = "206309380", changeMap = "right" },
            { map = "205260033", gather = true, changeMap = "right" },
            { map = "205260545", gather = true, changeMap = "right" },
            { map = "205261057", gather = true, changeMap = "right" },
            { map = "205261569", gather = true, changeMap = "top" },
            { map = "205261570", gather = true, changeMap = "bottom" },
            { map = "205261569", gather = true, changeMap = "bottom" },
            { map = "205261312", gather = true, changeMap = "left" },
            { map = "205260800", gather = true, changeMap = "left" },
            { map = "205260288", gather = true, changeMap = "left" },
            { map = "205259776", gather = true, changeMap = "left" },
            { map = "205259264", gather = true, changeMap = "left" },
            { map = "205258752", gather = true, changeMap = "bottom" },
            { map = "205258753", gather = true, changeMap = "right" },
            { map = "205259265", gather = true, changeMap = "right" },
            { map = "205259777", gather = true, changeMap = "right" },
            { map = "205260289", gather = true, changeMap = "right" },
            { map = "205260801", gather = true, changeMap = "bottom" },
            { map = "205260802", gather = true, changeMap = "left" },
            { map = "205260290", gather = true, changeMap = "left" },
            { map = "205259778", gather = true, changeMap = "left" },
            { map = "205259266", gather = true, changeMap = "right" },
            { map = "205259778", gather = true, changeMap = "bottom" },
            { map = "205259779", gather = true, changeMap = "bottom" },
            { map = "205259780", gather = true, changeMap = "right" },
            { map = "205260292", gather = true, changeMap = "319" },
            { map = "207619084", gather = true, changeMap = "235" },
            { map = "207620108", gather = true, custom = nextMine },
		})
	end,
	["Himum"] = function()
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,173278210)" },-- Zaap saharach
			{ map = "173278210", changeMap = "top" },
            { map = "173278209", changeMap = "top" },
            { map = "173278208", changeMap = "right" },
            { map = "173278720", changeMap = "147" },
            { map = "173935364", gather = true, changeMap = "297" },
            { map = "173936388", gather = true, changeMap = "464" },
            { map = "173937412", gather = true, changeMap = "382" },
            { map = "173938436", gather = true, changeMap = "367" },
            { map = "173939460", gather = true, changeMap = "432" },
            { map = "173938436", gather = true, changeMap = "291" },
            { map = "173937412", gather = true, changeMap = "264" },
            { map = "173936388", gather = true, changeMap = "389", custom = nextMine },
		})
	end,
	["Sakai"] = function()
		idTransporteur = "sakai"
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,54172969)" },-- Zaap frigost
			{ map = "54172969", changeMap = "right" },
            { map = "54172457", changeMap = "right" },
            { map = "54171945", changeMap = "right" },
            { map = "54171433", changeMap = "right" },
            { map = "54170921", changeMap = "right" },
            { map = "54170409", changeMap = "bottom" },
            { map = "54170408", changeMap = "bottom" },
            { map = "54170407", changeMap = "bottom" },
            { map = "54170406", changeMap = "bottom" },
            { map = "54170405", changeMap = "bottom" },
            { map = "54170404", changeMap = "bottom" },
            { map = "54170403", changeMap = "bottom" },
            { map = "54170402", changeMap = "right" },
            { map = "54169890", changeMap = "right" },
            { map = "54169378", changeMap = "right" },
            { map = "54168866", changeMap = "right" },
            { map = "54168354", changeMap = "right" },
            { map = "54167842", custom = transporteurFrigostien },
            { map = "54161193", changeMap = "right" },
            { map = "54160681", changeMap = "right" },
            { map = "54160169", changeMap = "top" },
            { map = "54160170", changeMap = "top" },
            { map = "54160171", changeMap = "top" },
            { map = "54160172", changeMap = "right" },
            { map = "54159660", changeMap = "right" },
            { map = "54159148", changeMap = "173" },
            { map = "57017863", gather = true, changeMap = "429" },        
            { map = "54159148", changeMap = "top" },
            { map = "54159149", changeMap = "right" },
            { map = "54158637", changeMap = "377" }, 
            { map = "57016839", gather = true, changeMap = "298" }, 
            { map = "56886791", gather = true, changeMap = "442" }, 
            { map = "57016839", gather = true, changeMap = "262" }, 
            { map = "56885767", gather = true, changeMap = "410" }, 
            { map = "57016839", gather = true, custom = nextMine },
		})
	end,
	["Maksage"] = function()
		idTransporteur = "maksage"
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,54172969)" },-- Zaap frigost
			{ map = "54172969", changeMap = "right" },
            { map = "54172457", changeMap = "right" },
            { map = "54171945", changeMap = "right" },
            { map = "54171433", changeMap = "right" },
            { map = "54170921", changeMap = "right" },
            { map = "54170409", changeMap = "bottom" },
            { map = "54170408", changeMap = "bottom" },
            { map = "54170407", changeMap = "bottom" },
            { map = "54170406", changeMap = "bottom" },
            { map = "54170405", changeMap = "bottom" },
            { map = "54170404", changeMap = "bottom" },
            { map = "54170403", changeMap = "bottom" },
            { map = "54170402", changeMap = "right" },
            { map = "54169890", changeMap = "right" },
            { map = "54169378", changeMap = "right" },
            { map = "54168866", changeMap = "right" },
            { map = "54168354", changeMap = "right" },
            { map = "54167842", custom = transporteurFrigostien },
            { map = "54161738", changeMap = "bottom" },
            { map = "54161737", changeMap = "left" },
            { map = "54162249", changeMap = "left" },
            { map = "54162761", changeMap = "left" },
            { map = "54163273", changeMap = "198" },
            { map = "56885760", changeMap = "212" },
            { map = "57016832", changeMap = "256" },
            { map = "54162757", changeMap = "bottom" },
            { map = "54162756", changeMap = "bottom" },
            { map = "54162755", changeMap = "bottom" },
            { map = "54162754", changeMap = "bottom" },
            { map = "54162753", changeMap = "bottom" },               
            { map = "54162752", changeMap = "right" },
            { map = "54162240", changeMap = "right" },
            { map = "54161728", changeMap = "right" },
            { map = "54161216", changeMap = "275" },
            { map = "57017859", gather = true, changeMap = "359" },
            { map = "57017861", gather = true, changeMap = "270" }, -- rt
            { map = "57017859", gather = true, changeMap = "206" },
            { map = "57016835", gather = true, changeMap = "220" },               
            { map = "56885763", gather = true, changeMap = "207" },
            { map = "56886787", gather = true, changeMap = "396" }, -- rt
            { map = "56885763", gather = true, changeMap = "436" }, -- rt
            { map = "57016835", gather = true, changeMap = "257" },               
            { map = "57016837", gather = true, changeMap = "401" }, --rt              
            { map = "57016835", gather = true, changeMap = "409" }, -- rt 
            { map = "57017859", gather = true, changeMap = "395" }, -- rt
            { map = "54161216", custom = nextMine },
		})
	end,
	["Hissoire"] = function()
		idTransporteur = "hissoire"
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,54172969)" },-- Zaap frigost
			{ map = "54172969", changeMap = "right" },
            { map = "54172457", changeMap = "right" },
            { map = "54171945", changeMap = "right" },
            { map = "54171433", changeMap = "right" },
            { map = "54170921", changeMap = "right" },
            { map = "54170409", changeMap = "bottom" },
            { map = "54170408", changeMap = "bottom" },
            { map = "54170407", changeMap = "bottom" },
            { map = "54170406", changeMap = "bottom" },
            { map = "54170405", changeMap = "bottom" },
            { map = "54170404", changeMap = "bottom" },
            { map = "54170403", changeMap = "bottom" },
            { map = "54170402", changeMap = "right" },
            { map = "54169890", changeMap = "right" },
            { map = "54169378", changeMap = "right" },
            { map = "54168866", changeMap = "right" },
            { map = "54168354", changeMap = "right" },
            { map = "54167842", custom = transporteurFrigostien },
            { map = "54161738", changeMap = "top" },
            { map = "54161739", changeMap = "top" },
            { map = "54161740", changeMap = "220" },
            { map = "57017865", gather = true, changeMap = "386" },
            { map = "56886793", gather = true, changeMap = "270" },
            { map = "57017865", gather = true, changeMap = "299" },
            { map = "57016841", gather = true, changeMap = "260" },
            { map = "56885769", gather = true, custom = nextMine },
		})
	end,
	["Ouronigride"] = function()
		idTransporteur = "ouronigride"
		return MULTIPLE_MAP:Run({
			{ map = "0,0", changeMap = "zaap(110,190,54172969)" },-- Zaap frigost
			{ map = "54172969", changeMap = "right" },
            { map = "54172457", changeMap = "right" },
            { map = "54171945", changeMap = "right" },
            { map = "54171433", changeMap = "right" },
            { map = "54170921", changeMap = "right" },
            { map = "54170409", changeMap = "bottom" },
            { map = "54170408", changeMap = "bottom" },
            { map = "54170407", changeMap = "bottom" },
            { map = "54170406", changeMap = "bottom" },
            { map = "54170405", changeMap = "bottom" },
            { map = "54170404", changeMap = "bottom" },
            { map = "54170403", changeMap = "bottom" },
            { map = "54170402", changeMap = "right" },
            { map = "54169890", changeMap = "right" },
            { map = "54169378", changeMap = "right" },
            { map = "54168866", changeMap = "right" },
            { map = "54168354", changeMap = "right" },
            { map = "54167842", custom = transporteurFrigostien },
            { map = "54168407", changeMap = "bottom" },
            { map = "54168406", changeMap = "bottom" },
            { map = "54168405", changeMap = "left" },
            { map = "54168917", changeMap = "left" },
            { map = "54169429", changeMap = "left" },
            { map = "54169941", changeMap = "left" },
            { map = "54170453", changeMap = "left" },
            { map = "54170965", changeMap = "left" },
            { map = "54171477", changeMap = "left" },
            { map = "54171989", changeMap = "96" },
            { map = "57017867", gather = true, custom = nextMine },
		})
	end,



}

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

function clickMap()
    local currentMapId = map:currentMapId()
    -- Mine Hipouce
        if currentMapId == 178782208 then
	        global:delay(mediumDelay)
	        global:clickPosition(370,280)
	        global:delay(mediumDelay)
        elseif currentMapId == 178782210 then
	        global:delay(mediumDelay)
	        global:clickPosition(170,110)
	        global:delay(mediumDelay)
        elseif currentMapId == 178782218 then
	        global:delay(mediumDelay)
	        global:clickPosition(460,30)
	        global:delay(mediumDelay)
        elseif currentMapId == 178783234 then
	        global:delay(mediumDelay)
	        global:clickPosition(355,115)
	        global:delay(mediumDelay)
        end
    -- Mine plaine rocheuse
        if currentMapId == 147590151 then
	        global:delay(mediumDelay)
	        global:clickPosition(75,55)
	        global:delay(mediumDelay)
        end
    -- Mine du chemin vers kartonpath
        if currentMapId == 88087305 then
	        global:delay(mediumDelay)
	        global:clickPosition(530,250)
	        global:delay(mediumDelay)
        end
    -- Mine Estrone
        if currentMapId == 171966987 then
	        global:delay(mediumDelay)
	        global:clickPosition(240,290)
	        global:delay(mediumDelay)
        end
    -- Mine ile dragoeuf
        if currentMapId == 84411392 then
	        global:delay(mediumDelay)
	        global:clickPosition(5,250)
	        global:delay(mediumDelay)
        elseif currentMapId == 84410368 then
	        global:delay(mediumDelay)
	        global:clickPosition(540,295)
	        global:delay(longDelay)
	        global:clickPosition(290,280)
	        global:delay(longDelay)
        end
    -- Mine Haut hurlement
        if currentMapId == 171707908 then
	        global:delay(mediumDelay)
	        global:clickPosition(600,100)
	        global:delay(mediumDelay)
        end
    -- Mine Campement Bwork
        if currentMapId == 88212751 then
	        global:delay(mediumDelay)
	        global:clickPosition(200,200)
	        global:delay(mediumDelay)
        elseif currentMapId == 104071168 then
	        global:delay(mediumDelay)
	        global:clickPosition(160,140)
	        global:delay(mediumDelay)
        elseif currentMapId == 104071425 then
	        global:delay(mediumDelay)
	        global:clickPosition(160,130)
	        global:delay(mediumDelay)
        elseif currentMapId == 104072452 then
	        global:delay(mediumDelay)
	        global:clickPosition(510,165)
	        global:delay(mediumDelay)
        end
    -- Mine du bois arak'hai
        if currentMapId == 147852290 then
	        global:delay(mediumDelay)
	        global:clickPosition(490,190)
	        global:delay(mediumDelay)
        end
    -- Mine Imale
        if currentMapId == 172491782 then
	        global:delay(mediumDelay)
	        global:clickPosition(410,280)
	        global:delay(mediumDelay)
        end
end
function transporteurFrigostien()
    global:delay(mediumDelay)
    global:clickPosition(355,320) -- PNJ
    global:delay(longDelay * 2)

    if idTransporteur == "sakai" then
		global:delay(veryLongDelay)
		global:clickPosition(280,390) -- Sakai
		global:delay(veryLongDelay)
		global:clickPosition(280,355)
    elseif idTransporteur == "maksage" or idTransporteur == "hissoire" then
		global:delay(veryLongDelay)
		global:clickPosition(280,340) -- Berceau alma                               
	elseif idTransporteur == "ouronigride" then
		global:delay(veryLongDelay)
		global:clickPosition(280,355)
	end
end
function checkBag()
	while inventory:itemCount(7971) > 0 -- Sac de fer
    or inventory:itemCount(7972) > 0 -- Sac de cuivre
    or inventory:itemCount(7973) > 0 -- Sac de bronze
    or inventory:itemCount(7974) > 0 -- Sac de Kobalte
    or inventory:itemCount(7975) > 0 -- Sac de manganese
    or inventory:itemCount(7976) > 0 -- Sac d'etain
    or inventory:itemCount(7977) > 0 -- Sac de silicate
    or inventory:itemCount(7978) > 0 -- Sac d'argent
    or inventory:itemCount(7979) > 0 -- Sac de Bauxite
    or inventory:itemCount(7980) > 0 -- Sac d'or
    or inventory:itemCount(7981) > 0 -- Sac de dolomite
    or inventory:itemCount(11114) > 0 do -- Sac d'Obsidienne
        openBag()
    end
end

function openBag()
    global:delay(baseDelay)
    global:sendKey(73) -- I
    global:delay(mediumDelay)
    global:clickPosition(532,65) -- Consomable
    global:delay(baseDelay)
    global:delay(baseDelay)
    global:clickPosition(484,110) -- Utiliser
    global:clickPosition(484,110) -- Utiliser
    global:delay(baseDelay)
    global:sendKey(73) -- I
    global:delay(mediumDelay)
end

---------------------------------------------
-- Version 1.0.0
-- Compatible avec FlatyBot
-- https://flatybot.net/
---------------------------------------------
-- Date enregistré : 09/01/2021
-- Date exporté : 09/01/2021
---------------------------------------------
-- Nom :      Mineur 1 / 200
-- Zone :     Dofus
-- Type :     Récolte
-- Version :  1
-- Créateur : TomLaVachette
-- Modifé Par : Plopo
---------------------------------------------
---------------------------------------------
-- Paramètres
-- Posséder la pluspart des zaaps tels que pandala, otomai, frigost
--------------------------------------------
---------------------------------------------
-- Non Fonctionnel
-- Retour Phoenix 
---------------------------------------------
-- [LVL 1] = 17 - Fer
-- [LVL 20] = 53 - Pierre Cuivrée
-- [LVL 40] = 55 - Bronze
-- [LVL 60] = 37 - Pierre de Kobalte
-- [LVL 80] = 54 - Manganèse
-- [LVL 100] = 52 - Etain
-- [LVL 100] = 114 - Silicate
-- [LVL 120] = 24 - Argent
-- [LVL 140] = 26 - Pierre de Bauxite
-- [LVL 160] = 25 - Or
-- [LVL 180] = 113 - Dolomite
-- [LVL 200] = 135 - Obsidienne
---------------------------------------------