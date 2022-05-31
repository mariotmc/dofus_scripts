-- Nom: IA Eca Eau Variantes
-- Zone: N/A
-- Version: 2.0
-- Créateur: Wardzz00
--------------------------------------
DofusClass ="6" -- Eca


function Main()
    MoveAggressive()
    SpellInfortuneEnnemi12()
	SpellKrapsEnnemi12()
	SpellBluffEnnemi12()
end

function MoveAggressive()
    if (not(fighter:isHandToHand())) then
        fight:moveToWardCell(fight:getNearestEnemy())
    end
end

function SpellInfortuneEnnemi12()
    if (fight:getCurrentTour() == 1 or fight:getCurrentTour() % 1 == 0) then
        fight:launchSpellInCell(fight:getNearestEnemy(), "Infortune")
			if (fighter:getMP() > 0 and not fighter:isHandToHand()) then
				fight:moveToWardCell(fight:getNearestEnemy())
				elseif (fighter:isHandToHand()) then
					fight:launchSpellInCell(fight:getNearestEnemy(), "Infortune")
						if (fighter:getMP() > 0 and not fighter:isHandToHand()) then
							fight:moveToWardCell(fight:getNearestEnemy())
								elseif (fighter:isHandToHand()) then
									fight:launchSpellInCell(fight:getNearestEnemy(), "Infortune")
										if (fighter:getMP() > 0 and not fighter:isHandToHand()) then
										fight:moveToWardCell(fight:getNearestEnemy())
										end
								end		
						end
				end		
			end

function SpellKrapsEnnemi12()
	if (fight:getCurrentTour() == 1 or fight:getCurrentTour() % 4 == 0)then
				if (fighter:getAP() >= 4) then	
					fight:launchSpellInCell(fight:getNearestEnemy(),"Kraps")
			
				end
	end		
end

function SpellBluffEnnemi12()
	if (fight:getCurrentTour() == 1 or fight:getCurrentTour() % 4 == 0)then
		if (fighter:getAP() == 3 )then
			fight:launchSpellInCell(fight:getNearestEnemy(),"Bluff")
		end
	end
end	