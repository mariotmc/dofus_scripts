--*************************************--
-- Trajet par TomLaVachette
-- FlatyBot.net
-- Mineur - Mine Istairameur
--_____________________________________--

lastActionId = 0
MAX_PODS = 90

ELEMENTS_TO_GATHER = {
	17, -- Fer
	53, -- Pierre Cuivree
	55, -- Bronze
	54, -- Manganèse
	37, -- Pierre de Kobalte
	24, -- Argent
}

function updateLastActionId()
	lastActionId = map:currentMapId()
end

function move()
	if lastActionId == 0 or lastActionId == 97259013 then
		return {
			{ map = "0,0", changeMap = "zaap(119,212,88212746)" }, -- Zaap Bord de la forêt malefique
			{ map = "-1,13", changeMap = "top" }, -- Zaap Bord de la forêt malefique
			{ map = "-1,12", changeMap = "top" },
			{ map = "-1,11", changeMap = "top" },
			{ map = "-1,10", changeMap = "top" },
			{ map = "-1,9", changeMap = "left" },
			{ map = "-2,9", changeMap = "left" },
			{ map = "88213774", changeMap = "354" },
			
			{ map = "97259013", gather = true, changeMap = "276" }, 
			{ map = "97256967", gather = true, changeMap = "194" }, 
			{ map = "97260039", gather = true, changeMap = "262" }, 
			{ map = "97257993", gather = true, changeMap = "122" }, 
			{ map = "97261065", gather = true, changeMap = "236" }, 
			{ map = "97259019", gather = true, changeMap = "276" }, 
			{ map = "97260043", gather = true, custom = updateLastActionId, changeMap = "451" }, 
		}
	elseif lastActionId == 97260043 then
		return {	
			{ map = "97260043", gather = true, changeMap = "451" }, 
			{ map = "97259019", gather = true, changeMap = "438" }, 
			{ map = "97261065", gather = true, changeMap = "213" }, 
			{ map = "97255947", gather = true, changeMap = "199" }, 
			{ map = "97256971", gather = true, changeMap = "234" },
			{ map = "97261067", gather = true, custom = updateLastActionId, changeMap = "521" }, 
		}
	elseif lastActionId == 97261067 then
		return {
			{ map = "97261067", gather = true, changeMap = "521" }, 
			{ map = "97256971", gather = true, changeMap = "239" }, 
			{ map = "97257995", gather = true, custom = updateLastActionId, changeMap = "374" }, 
		}
	elseif lastActionId == 97257995 then
		return {
			{ map = "97257995", gather = true, changeMap = "374" }, 
			{ map = "97256971", gather = true, changeMap = "503" }, 
			{ map = "97255947", gather = true, changeMap = "500" }, 
			{ map = "97261065", gather = true, changeMap = "479" }, 
			{ map = "97257993", gather = true, changeMap = "537" }, 
			{ map = "97260039", gather = true, changeMap = "241" }, 
			{ map = "97261063", gather = true, changeMap = "331" }, 
			{ map = "97259017", gather = true, custom = updateLastActionId, changeMap = "436" },
		}
	elseif lastActionId == 97259017 then
		return {
			{ map = "97259017", gather = true, changeMap = "436" }, 
			{ map = "97261063", gather = true, changeMap = "296" }, 
			{ map = "97255945", gather = true, changeMap = "332" }, 
			{ map = "97260041", gather = true, custom = updateLastActionId, changeMap = "354" },
		}
	elseif lastActionId == 97260041 then
		return {
			{ map = "97260041", gather = true, changeMap = "354" }, 
			{ map = "97255945", gather = true, changeMap = "213" }, 
			{ map = "97256969", gather = true, custom = updateLastActionId, changeMap = "401" },
		}
	elseif lastActionId == 97256969 then
		return {
			{ map = "97256969", gather = true, changeMap = "401" }, 
			{ map = "97255945", gather = true, changeMap = "416" }, 
			{ map = "97261063", gather = true, changeMap = "459" }, 
			{ map = "97260039", gather = true, changeMap = "451" }, 
			{ map = "97256967", gather = true, changeMap = "518" }, 
			{ map = "97259013", gather = true, changeMap = "258" }, 
			{ map = "97260037", gather = true, changeMap = "303" }, 
			{ map = "97257991", gather = true, custom = updateLastActionId, changeMap = "464" },
		}
	elseif lastActionId == 97257991 then
		return {
			{ map = "97257991", gather = true, changeMap = "464" }, 
			{ map = "97260037", gather = true, changeMap = "352" }, 
			{ map = "97261061", gather = true, changeMap = "290" }, 
			{ map = "97259015", gather = true, custom = updateLastActionId, changeMap = "451" },
		}
	elseif lastActionId == 97259015 then
		return {
			{ map = "97259015", gather = true, changeMap = "451" }, 
			{ map = "97261061", gather = true, changeMap = "284" }, 
			{ map = "97255943", gather = true, custom = updateLastActionId, changeMap = "403" },
		}
	elseif lastActionId == 97255943 then
		return {
			{ map = "97255943", gather = true, changeMap = "403" }, 
			{ map = "97261061", gather = true, changeMap = "458" }, 
			{ map = "97260037", gather = true, changeMap = "430" }, 
			{ map = "97259013", gather = true, custom = updateLastActionId, changeMap = "276" }, 
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