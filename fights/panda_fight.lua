-- IA

DofusClass="12"


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
            fight:launchSpellInCell(fight:getNearestEnemy(), 12794)
            fight:launchSpellInCell(fight:getNearestEnemy(), 12794)
        end
    else
        fight:launchSpellInCell(fight:getNearestEnemy(), 12794)
        fight:launchSpellInCell(fight:getNearestEnemy(), 12794)
    end
end


-- [17:03] Your character is in combat the route will continue at the end of it.
-- global:delay(5000) (for delay in ms)