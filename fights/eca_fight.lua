-- IA

DofusClass="6"


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
            fight:launchSpellInCell(fight:getNearestEnemy(), 12848)
        end
    else
        fight:launchSpellInCell(fight:getNearestEnemy(), 12848)
        fight:launchSpellInCell(fight:getNearestEnemy(), 12848)
    end
end