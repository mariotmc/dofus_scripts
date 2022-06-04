-- IA

DofusClass="16"


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
            fight:launchSpellInCell(fight:getNearestEnemy(), "Therapie")
            fight:launchSpellInCell(fight:getNearestEnemy(), "Therapie")
        end
    else
        fight:launchSpellInCell(fight:getNearestEnemy(), "Therapie")
        fight:launchSpellInCell(fight:getNearestEnemy(), "Therapie")
    end
end