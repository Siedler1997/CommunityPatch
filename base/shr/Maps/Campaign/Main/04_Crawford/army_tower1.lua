
-- attackers from west

createArmyTower1 = function()

	--	set up

		armyTower1						= {}
	
		armyTower1.player 				= 5
		armyTower1.id					= 1
		armyTower1.strength				= 2
		armyTower1.position				= GetPosition("spawn1")
		armyTower1.rodeLength			= 2000
		armyTower1.control				= {}
		armyTower1.control.timer		= 0
		if CP_Difficulty == 0 then
			armyTower1.control.delay		= 5 * 60
		else
			armyTower1.strength = armyTower1.strength + 2
			armyTower1.control.delay		= 3 * 60
		end
		
		
		SetupArmy(armyTower1)
	
	--	job		
		
		StartJob("SetupArmyTower1")

	end



	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyTower1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyTower1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("SetupArmyTower1", 10)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyTower1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		--	check spawn condition 
		
			if IsDead("tower1a") and IsDead("tower1b") then
				
				return true
				
			end


		--	set up completed?

			if HasFullStrength(armyTower1) then
				if CP_Difficulty == 0 then
					armyTower1.control.delay = 5 * 60 + Logic.GetRandom(120)
				else
					armyTower1.control.delay = 3 * 60 + Logic.GetRandom(120)
				end
			
				StartJob("ControlArmyTower1")
				
				return true
				
			end
				
		-- 	enlarge army

			local troopDescription = {
			
				maxNumberOfSoldiers	= 8,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}				
		
			if CP_Difficulty == 0 then
				if Logic.GetRandom(100) > 40 then
					troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
				else
					troopDescription.leaderType = Entities.PU_LeaderBow1
				end
				EnlargeArmy(armyTower1, troopDescription)
			else
				troopDescription.experiencePoints = HIGH_EXPERIENCE
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
				EnlargeArmy(armyTower1, troopDescription)
				EnlargeArmy(armyTower1, troopDescription)
				troopDescription.leaderType = Entities.PU_LeaderBow2
				EnlargeArmy(armyTower1, troopDescription)
				EnlargeArmy(armyTower1, troopDescription)
			end
	
		return false
		
	end






-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyTower1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyTower1 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		armyTower1.control.delay = armyTower1.control.delay -1
		
		return Counter.Tick2("ControlArmyTower1",5)
		
	end




		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyTower1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyTower1) then
		
			Retreat(armyTower1)
		
			StartJob("SetupArmyTower1")
						
			return true
			
		end


		if armyTower1.control.delay <= 0 then

			Report("Army Tower 1 advances!")
			Advance(armyTower1)

		end	
		

		return false
		
	end
	