------------------------------------------------------------------------------------------------------------------------------------
function createArmyWolves()

	
	troopsArmyWolves = {
		Entities.CU_AggressiveWolf
    	}
    
	local experience = LOW_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 3
	end

	armyWolves1 = {}
	createArmy(2,7,armyWolves1,(6+CP_Difficulty),"armyWolves1",experience,troopsArmyWolves)
	armyWolves1.rodeLength = 4000
    
	armyWolves2 = {}
	createArmy(2,8,armyWolves2,(2+CP_Difficulty),"armyWolves2",experience,troopsArmyWolves)
	armyWolves2.rodeLength = 4000
    
	armyWolves3 = {}
	createArmy(2,9,armyWolves3,(4+CP_Difficulty),"armyWolves3",experience,troopsArmyWolves)
	armyWolves3.rodeLength = 4000

	StartSimpleJob("controlArmyWolves")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyWolves()
	simpleDefendBehaviour(armyWolves1)
	simpleDefendBehaviour(armyWolves2)
	simpleDefendBehaviour(armyWolves3)
end