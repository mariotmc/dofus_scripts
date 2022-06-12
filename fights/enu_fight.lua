-- IA

DofusClass="3"


function Main()
    MoveAggressive()
    fighter:passTurn()
end

function MoveAggressive()
    if (not(fighter:isHandToHand())) then
        fight:moveToWardCell(fight:getNearestEnemy())
        if (fighter:isHandToHand()) then
            fight:launchSpellInCell(fight:getNearestEnemy(), 13360)
            fight:launchSpellInCell(fight:getNearestEnemy(), 13370)
        end
    else
        fight:launchSpellInCell(fight:getNearestEnemy(), 13360)
        fight:launchSpellInCell(fight:getNearestEnemy(), 13370)
    end
end