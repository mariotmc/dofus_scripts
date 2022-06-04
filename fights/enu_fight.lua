-- IA

DofusClass="3"


function Main()
    MoveAggressive()
    fighter:passTurn()
end

function MoveAggressive()
    if (not(fighter:isHandToHand()))
    then
        fight:moveToWardCell(fight:getNearestEnemy())
        if (fighter:isHandToHand())
        then
            fight:launchSpellInCell(fight:getNearestEnemy(), "Lancer de Pelle")
        end
    else
        fight:launchSpellInCell(fight:getNearestEnemy(), "Lancer de Pelle")
        fight:launchSpellInCell(fight:getNearestEnemy(), "Eboulement")
    end
end