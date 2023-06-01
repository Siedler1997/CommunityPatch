------------------------------------------------------------------------------------------------------------------------------------
function createArmyWolves()

	
	troopsArmyWolves = {
		Entities.CU_AggressiveWolf_Grey
    	}

	armyWolves1 = {}
	createArmy(6,7,armyWolves1,(6+CP_Difficulty),"armyWolves1",CP_Difficulty,troopsArmyWolves)
	armyWolves1.rodeLength = 4000
    
	armyWolves2 = {}
	createArmy(6,8,armyWolves2,(2+CP_Difficulty),"armyWolves2",CP_Difficulty,troopsArmyWolves)
	armyWolves2.rodeLength = 4000
    
	armyWolves3 = {}
	createArmy(6,9,armyWolves3,(4+CP_Difficulty),"armyWolves3",CP_Difficulty,troopsArmyWolves)
	armyWolves3.rodeLength = 4000

	StartSimpleJob("controlArmyWolves")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyWolves()
	simpleDefendBehaviour(armyWolves1)
	simpleDefendBehaviour(armyWolves2)
	simpleDefendBehaviour(armyWolves3)
end