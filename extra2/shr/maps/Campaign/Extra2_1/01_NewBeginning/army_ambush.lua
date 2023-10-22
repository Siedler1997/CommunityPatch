------------------------------------------------------------------------------------------------------------------------------------
function createArmyAmbush()

	armyAmbush = {}

	troopsArmyAmbush = { }
        
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAmbush, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyAmbush, Entities.CU_BanditLeaderSword1)
		table.insert(troopsArmyAmbush, Entities.CU_BanditLeaderBow1)
	else
		table.insert(troopsArmyAmbush, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyAmbush, Entities.CU_BanditLeaderSword2)
		table.insert(troopsArmyAmbush, Entities.CU_BanditLeaderBow2)
	end
    createArmy(2,3,armyAmbush,7,"armyAmbush",CP_Difficulty,troopsArmyAmbush)

    armyAmbush.rodeLength = 4000

	StartSimpleJob("controlArmyAmbush")
   
end

------------------------------------------------------------------------------------------------------------------------------------
function controlArmyAmbush()
	Advance(armyAmbush)
end