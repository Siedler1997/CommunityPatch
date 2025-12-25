------------------------------------------------------------------------------------------------------------------------------------
function createArmyAmbush2()

	armyAmbush2 = {}

	troopsArmyAmbush2 = {
		Entities.CU_AggressiveWolf_White
    	}
       
	local strenghth = 5 + CP_Difficulty
	if CP_Difficulty < 2 then
		table.insert(troopsArmyAmbush2, Entities.CU_Barbarian_LeaderClub1)
	else
		table.insert(troopsArmyAmbush2, Entities.CU_Barbarian_LeaderClub2)
	end

    createArmy(2,5,armyAmbush2,strenghth,"armyAmbush2",CP_Difficulty,troopsArmyAmbush2)

    armyAmbush2.rodeLength = 500

    StartSimpleJob("controlArmyAmbush2")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAmbush2()
	simpleAttackBehaviour(armyAmbush2)
end