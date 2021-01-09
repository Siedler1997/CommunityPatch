------------------------------------------------------------------------------------------------------------------------------------
function createArmyAmbush()

	armyAmbush = {}

	troopsArmyAmbush = {
    	Entities.CU_Barbarian_LeaderClub1,
    	Entities.CU_BanditLeaderSword1,
    	Entities.CU_BanditLeaderBow1,
    	}
        
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
	end
    createArmy(2,3,armyAmbush,7,"armyAmbush",experience,troopsArmyAmbush)

    armyAmbush.rodeLength = 4000

	StartSimpleJob("controlArmyAmbush")
   
end

------------------------------------------------------------------------------------------------------------------------------------
function controlArmyAmbush()
	Advance(armyAmbush)
end