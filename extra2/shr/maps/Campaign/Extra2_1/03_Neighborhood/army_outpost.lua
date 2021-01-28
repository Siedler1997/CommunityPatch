------------------------------------------------------------------------------------------------------------------------------------
function createArmyOutpost()
	StartSimpleJob("spawnArmyOutpost")
end

------------------------------------------------------------------------------------------------------------------------------------
function spawnArmyOutpost()

	if Counter.Tick2("counterArmyOutpost", 60*4 + GetRandom(60*2)) then
		if IsDead(armyOutpost) then
			if IsExisting("outpost") then
			
				armyOutpost = {}
		
				troopsArmyOutpost = {
					Entities.CU_BanditLeaderSword2,
					Entities.CU_BanditLeaderBow1
					}
		
				local strength = 3
				local experience = HIGH_EXPERIENCE
				if CP_Difficulty == 0 then
					table.insert(troopsArmyOutpost, Entities.CU_Barbarian_LeaderClub1)
				else
					experience = experience + 1
					strength = strength + 1
					table.insert(troopsArmyOutpost, Entities.CU_Barbarian_LeaderClub2)
				end

				createArmy(2,3,armyOutpost,strength,"armyOutpost",experience,troopsArmyOutpost)
		
				StartSimpleJob("controlArmyOutpost")
				
			end
	    end
	end
end

------------------------------------------------------------------------------------------------------------------------------------
function controlArmyOutpost()
	Advance(armyOutpost)
end