-- Nom : Pêcheur
-- Zone : Astrub
-- Type : Récolte
-- Version : 1.0
-- Auteur : Chuzen

ELEMENTS_TO_GATHER = {75, 74}

MAX_MONSTERS = 8
MIN_MONSTERS = 1

MAX_PODS = 95

function move()
	return {
		{map = "192415750", changeMap = "424"},
		{map = "4,-18", changeMap = "top"},
		{map = "5,-18", changeMap = "left"},
		{map = "4,-18", changeMap = "top"},
		{map = "4,-19", changeMap = "top"},
		{map = "3,-18", changeMap = "top|right"},
		{map = "4,-17", changeMap = "top"},
		{map = "3,-19", changeMap = "right"},
		{map = "4,-20", gather = true, custom = wait, changeMap = "left"},
		{map = "3,-20", gather = true, custom = wait, changeMap = "left|right"},
		{map = "2,-20", gather = true, custom = wait, changeMap = "left"},
		{map = "1,-20", gather = true, custom = wait, changeMap = "top"},
		{map = "1,-21", gather = true, custom = wait, changeMap = "right"},
		{map = "2,-21", gather = true, custom = wait, changeMap = "right"},
		{map = "3,-21", changeMap = "top"},
		{map = "3,-22", changeMap = "right"},
		{map = "4,-22", changeMap = "right"},
		{map = "4,-21", changeMap = "top"},
		{map = "5,-21", changeMap = "top"},
		{map = "5,-20", changeMap = "left"},
		{map = "6,-21", changeMap = "top"},
		{map = "6,-20", changeMap = "left"},
		{map = "5,-22", changeMap = "right"},
		{map = "6,-22", gather = true, custom = wait, changeMap = "top"},
		{map = "6,-23", gather = true, custom = wait, changeMap = "top|right"},
		{map = "6,-24", gather = true, custom = wait, changeMap = "left"},
		{map = "5,-24", gather = true, custom = wait, changeMap = "top"},
		{map = "5,-25", changeMap = "right"},
		{map = "6,-25", gather = true, custom = wait, changeMap = "right"},
		{map = "7,-23", gather = true, custom = wait, changeMap = "left"},
		{map = "7,-24", changeMap = "right"},
		{map = "8,-24", changeMap = "bottom"},
		{map = "8,-23", changeMap = "bottom"},
		{map = "8,-22", changeMap = "bottom"},
		{map = "8,-21", changeMap = "bottom"},
		{map = "8,-20", changeMap = "left"},
		{map = "7,-20", changeMap = "left"},
		{map = "7,-25", gather = true, custom = wait, changeMap = "bottom"},
	}
end

function bank()
	return {
		{map = "3,-20", changeMap = "right"},
		{map = "2,-20", changeMap = "right"},
		{map = "1,-20", changeMap = "right"},
		{map = "1,-21", changeMap = "bottom"},
		{map = "2,-21", changeMap = "bottom"},
		{map = "4,-20", changeMap = "bottom"},
		{map = "4,-19", changeMap = "bottom"},
		{map = "5,-25", changeMap = "bottom"},
		{map = "6,-25", changeMap = "bottom"},
		{map = "7,-25", changeMap = "bottom"},
		{map = "5,-24", changeMap = "bottom"},
		{map = "6,-24", changeMap = "bottom"},
		{map = "7,-24", changeMap = "bottom"},
		{map = "8,-24", changeMap = "bottom"},
		{map = "8,-23", changeMap = "bottom"},
		{map = "8,-22", changeMap = "bottom"},
		{map = "7,-23", changeMap = "bottom"},
		{map = "6,-23", changeMap = "bottom"},
		{map = "5,-23", changeMap = "bottom"},
		{map = "5,-22", changeMap = "bottom"},
		{map = "6,-22", changeMap = "bottom"},
		{map = "7,-22", changeMap = "bottom"},
		{map = "8,-21", changeMap = "left"},
		{map = "8,-20", changeMap = "left"},
		{map = "7,-21", changeMap = "left"},
		{map = "7,-20", changeMap = "left"},
		{map = "6,-20", changeMap = "left"},
		{map = "6,-21", changeMap = "left"},
		{map = "5,-21", changeMap = "left"},
		{map = "5,-20", changeMap = "left"},
		{map = "4,-22", changeMap = "bottom"},
		{map = "3,-22", changeMap = "bottom"},
		{map = "3,-21", changeMap = "bottom"},
		{map = "4,-21", changeMap = "bottom"},
		{map = "3,-19", changeMap = "bottom"},
		{map = "3,-18", changeMap = "right"},
		{map = "5,-18", changeMap = "left"},
		{map = "4,-17", changeMap = "top"},
		{ map = "191104002", changeMap = "261" }, -- Map extérieure de la banque, on utilise la porte de la banque, MAPID OBLIGATOIRE
		{ map = "192415750", custom = hiboux, changeMap = "424" }, -- Map intérieure de la banque, on parle au banquier, MAPID OBLIGATOIRE
	}
	end

	function hiboux()
		npc:npcBank(-1,-1)
		global:delay(2500)
		storage:putAllItems()
		global:leaveDialog()
	end

	function wait()
		map:waitMovementFinish(5000)
	end


function phenix()
	return {
	}
end
