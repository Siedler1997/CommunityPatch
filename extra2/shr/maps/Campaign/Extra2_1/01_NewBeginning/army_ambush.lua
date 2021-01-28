------------------------------------------------------------------------------------------------------------------------------------
function createArmyAmbush()

	armyAmbush = {}

	troopsArmyAmbush = {
    	Entities.CU_BanditLeaderSword2,
    	Entities.CU_BanditLeaderBow1
    	}
        
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAmbush, Entities.CU_Barbarian_LeaderClub1)
	else
		experience = experience + 2
		table.insert(troopsArmyAmbush, Entities.CU_Barbarian_LeaderClub2)
	end
    createArmy(2,3,armyAmbush,7,"armyAmbush",experience,troopsArmyAmbush)

    armyAmbush.rodeLength = 4000

	StartSimpleJob("controlArmyAmbush")
   
end

------------------------------------------------------------------------------------------------------------------------------------
function controlArmyAmbush()
	Advance(armyAmbush)
end