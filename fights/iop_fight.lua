-- IA

DofusClass="8"


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
            fight:launchSpellInCell(fight:getNearestEnemy(), "Pression")
            fight:launchSpellInCell(fight:getNearestEnemy(), "Pression")
        end
    else
        fight:launchSpellInCell(fight:getNearestEnemy(), "Pression")
        fight:launchSpellInCell(fight:getNearestEnemy(), "Pression")
    end
end