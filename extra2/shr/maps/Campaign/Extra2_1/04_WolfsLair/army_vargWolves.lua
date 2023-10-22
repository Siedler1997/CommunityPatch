function createArmyVargWolves()
	
	armyVargWolves = {}

	troopsArmyVargWolves = {
		Entities.CU_AggressiveWolf_White
    	}
	
	createArmy(2,1,armyVargWolves,7,"armyVarg",VERYHIGH_EXPERIENCE,troopsArmyVargWolves)

	StartSimpleJob("controlArmyVargWolves")
	
end

------------------------------------------------------------------------------------------------------------------------------------

function controlArmyVargWolves()
	simpleAttackBehaviour(armyVargWolves)
end