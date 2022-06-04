--*************************************--
-- Trajet par JejeBotteur
-- FlatyBot
-- Pêcheur - Zaap Chateau d'amakna, égouts
--_____________________________________--

lastActionId = 0
MAX_PODS = 90

ELEMENTS_TO_GATHER = {} -- On récolte tout.

function updateLastActionId() -- On met à jour la variable pour pouvoir faire plusieurs déplacements sur la même map
	lastActionId = map:currentMapId()
end

function move()
	if lastActionId == 0 or lastActionId == 101713409 then
		return {
			{ map = "0,0", changeMap = "zaap(119,212,68552706)" }, -- Zaap Chateau d'Amakna
			{ map = "3,-5", changeMap = "right" }, -- Zaap Chateau d'Amakna
			{ map = "4,-5", changeMap = "right" },
			{ map = "5,-5", changeMap = "right" },
			{ map = "3333", changeMap = "231" }, -- Entrée égouts 1
			
			{ map = "101713429", gather = true, changeMap = "319" }, -- Entrée égouts 2
			{ map = "101714453", gather = true, changeMap = "249" },
			{ map = "101715477", gather = true, changeMap = "461" },
			{ map = "101715479", gather = true, changeMap = "535" },
			{ map = "101715481", gather = true, custom = updateLastActionId, changeMap = "234" }, 
		}
	elseif lastActionId == 101715481 then	
		return{	
			{ map = "101715481", gather = true, changeMap = "234" },
			{ map = "101715479", gather = true, changeMap = "264" },
			{ map = "101716503", gather = true, custom = updateLastActionId, changeMap = "425" },
		}
	elseif lastActionId == 101716503 then
		return{
			{ map = "101716503", gather = true, changeMap = "425" },
			{ map = "101715479", gather = true, changeMap = "213" },
			{ map = "101715477", gather = true, changeMap = "278" },
			{ map = "101716501", gather = true, changeMap = "194" },			
			{ map = "101717525", gather = true, custom = updateLastActionId ,changeMap = "438" },
		}		
	elseif lastActionId == 101717525 then
		return{
			{ map = "101717525", gather = true, changeMap = "438" },
			{ map = "101716501", gather = true, changeMap = "464" },
			{ map = "101715477", gather = true, changeMap = "170" },
			{ map = "101715475", gather = true, changeMap = "239" },
			{ map = "101714451", gather = true, custom = updateLastActionId, changeMap = "473" },
		}
	elseif lastActionId == 101714451 then
		return{
			{ map = "101714451", gather = true, changeMap = "473" },
			{ map = "101715475", gather = true, changeMap = "234" },
			{ map = "101715473", gather = true, changeMap = "157" },
			{ map = "101715471", gather = true, changeMap = "391" },
			{ map = "101716495", gather = true, changeMap = "285" },
			{ map = "101716493", gather = true, changeMap = "334" },
			{ map = "101717517", gather = true, custom = updateLastActionId, changeMap = "437" },
		}
	elseif lastActionId == 101717517 then
		return{
			{ map = "101717517", gather = true, changeMap = "437" },
			{ map = "101716493", gather = true, changeMap = "394" },
			{ map = "101715469", gather = true, custom = updateLastActionId, changeMap = "463" },
		}
	elseif lastActionId == 101715469 then
		return{
			{ map = "101715469", gather = true, changeMap = "463" },
			{ map = "101715471", gather = true, changeMap = "421" },
			{ map = "101714447", gather = true, changeMap = "310" },
			{ map = "101713423", gather = true, changeMap = "188" },
			{ map = "101713421", gather = true, changeMap = "446" },
			{ map = "101714445", gather = true, custom = updateLastActionId, changeMap = "225" },	
		}
	elseif lastActionId == 101714445 then
		return{
			{ map = "101714445", gather = true, changeMap = "225" },
			{ map = "101713421", gather = true, changeMap = "38" },
			{ map = "101713419", gather = true, changeMap = "446" },
			{ map = "101714443", gather = true, changeMap = "264" },
			{ map = "101715467", gather = true, changeMap = "135" },
			{ map = "101715465", gather = true, changeMap = "278" },
			{ map = "101716489", gather = true, changeMap = "249" },
			{ map = "101717512", gather = true, custom = updateLastActionId, changeMap = "536" },
		}
	elseif lastActionId == 101717512 then
		return{
			{ map = "101717512", gather = true, changeMap = "536" },
			{ map = "101716489", gather = true, changeMap = "519" },
			{ map = "101715465", gather = true, changeMap = "213" },
			{ map = "101715463", gather = true, changeMap = "391" },
			{ map = "101716487", gather = true, custom = updateLastActionId, changeMap = "266" },	
		}
	elseif lastActionId == 101716487 then
		return{
			{ map = "101716487", gather = true, changeMap = "266" },
			{ map = "101715463", gather = true, changeMap = "252" },
			{ map = "101714439", gather = true, changeMap = "463" },
			{ map = "101713415", gather = true, changeMap = "146" },
			{ map = "101713413", gather = true, changeMap = "115" },
			{ map = "101713411", gather = true, changeMap = "183" },
			{ map = "101712387", gather = true, custom = updateLastActionId, changeMap = "474" },
		}
	elseif lastActionId == 101712387 then
		return{
			{ map = "101712387", gather = true, changeMap = "474" },
			{ map = "101713411", gather = true, changeMap = "138" },
			{ map = "101713409", gather = true, custom = updateLastActionId, changeMap = "146" },
		}
	end
end

function havenBag()
	usedTP = true
	global:printMessage("Retour en banque enclenche, teleportation dans l'havre-sac.")
	global:sendKey(72) -- H key
end

function leaveBank()
	usedTP = false
	lastActionId = 0
	global:printMessage("Retour sur le trajet, teleportation dans l'havre-sac.")
	global:sendKey(72) -- H key
end

function bank()
	if usedTP == true then
		return {
			{ map = "0,0", changeMap = "zaap(119,212,191105026)" },
			{ map = "5,-18", changeMap = "left" }, -- Zaap Astrub
			{ map = "191104002", changeMap = "261" }, -- Exterieur banque
			{ map = "192415750", npcBank = true, custom = leaveBank }, -- Interieur banque
		}
	else
		return {
			{ map = map:currentPos(), custom = havenBag }, 
		}
	end
end

function lost()
	global:printMessage("Le personnage est perdu...")
	return bank()
end