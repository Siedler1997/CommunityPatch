------------------------------------------------------------------------------------------------------------------------------------
function createArmyAmbush2()

	armyAmbush2 = {}

	troopsArmyAmbush2 = {
		Entities.CU_Barbarian_LeaderClub1,
		Entities.CU_AggressiveWolf
    	}
       
	local strenghth = 5
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
		strenghth = strenghth + 2
	end

    createArmy(2,5,armyAmbush2,strenghth,"armyAmbush2",experience,troopsArmyAmbush2)

    armyAmbush2.rodeLength = 500

    StartSimpleJob("controlArmyAmbush2")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAmbush2()
	simpleAttackBehaviour(armyAmbush2)
end