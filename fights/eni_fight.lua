-- IA

DofusClass="7"


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
            fight:launchSpellInCell(fight:getNearestEnemy(), "Mot Secret")
            fight:launchSpellInCell(fight:getNearestEnemy(), "Mot Secret")
        end
    else
        fight:launchSpellInCell(fight:getNearestEnemy(), "Mot Secret")
        fight:launchSpellInCell(fight:getNearestEnemy(), "Mot Secret")
    end
end