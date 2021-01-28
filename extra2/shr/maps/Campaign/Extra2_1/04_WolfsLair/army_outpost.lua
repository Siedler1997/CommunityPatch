------------------------------------------------------------------------------------------------------------------------------------
function createArmyOutpost()
	StartSimpleJob("spawnArmyOutpost")
end

------------------------------------------------------------------------------------------------------------------------------------
function spawnArmyOutpost()

	if Counter.Tick2("counterArmyOutpost", 8*60 + GetRandom(2*60)) then
		if IsDead(armyOutpost) then
			if IsExisting("towerOutpost") then
			
				armyOutpost = {}
		
				troopsArmyOutpost = {
					Entities.CU_BanditLeaderBow1,
					Entities.CU_BanditLeaderSword2
					}
		
				local strength = 5
				local experience = MEDIUM_EXPERIENCE
				if CP_Difficulty == 0 then
					table.insert(troopsArmyOutpost, Entities.CU_Barbarian_LeaderClub1)
				else
					strength = strength + 2
					experience = experience + 2
					table.insert(troopsArmyOutpost, Entities.CU_Barbarian_LeaderClub2)
					table.insert(troopsArmyOutpost, Entities.PV_Cannon1)
				end

				createArmy(2,2,armyOutpost,strength,"armyOutpost",experience,troopsArmyOutpost)
		
				StartSimpleJob("controlArmyOutpost")
				
			end
	    end
	end
end

------------------------------------------------------------------------------------------------------------------------------------
function controlArmyOutpost()
	simpleAttackBehaviour(armyOutpost)
end