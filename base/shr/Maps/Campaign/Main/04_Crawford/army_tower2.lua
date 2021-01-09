
-- attackers from East

ATTACK_DELAY_TOWER2 							= 3 * 60
if CP_Difficulty == 1 then
	ATTACK_DELAY_TOWER2 = ATTACK_DELAY_TOWER2 - 30
end

createArmyTower2 = function()

	--	set up

		armyTower2						= {}
	
		armyTower2.player 				= 5
		armyTower2.id					= 2
		armyTower2.strength				= 2
		if CP_Difficulty == 1 then
			armyTower2.strength = armyTower2.strength + 1
		end
		armyTower2.position				= GetPosition("spawn2")
		armyTower2.rodeLength			= 2000
		armyTower2.control				= {}
		armyTower2.control.timer		= 0
		armyTower2.control.delay		= ATTACK_DELAY_TOWER2
		
		SetupArmy(armyTower2)
	
	--	job		
		
		StartJob("SetupArmyTower2")

	end



	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyTower2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyTower2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("SetupArmyTower2",10)
		
		end




		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyTower2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		--	check spawn condition 
		
			if IsDead("tower2a") and IsDead("tower2b") then
				
				return true
				
			end

		--	set up completed?

			if HasFullStrength(armyTower2) then
	
				armyTower2.control.delay = ATTACK_DELAY_TOWER2 + Logic.GetRandom(180)
			
				StartJob("ControlArmyTower2")
				
				return true
				
			end
				
		-- 	enlarge army

			local troopDescription = {
			
				maxNumberOfSoldiers	= 4,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}				
		
			if CP_Difficulty == 0 then
				if Logic.GetRandom(100) > 60 then

					troopDescription.leaderType = Entities.PU_LeaderPoleArm1
				
				else
			
					troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
			
				end
			
				EnlargeArmy(armyTower2,troopDescription)
			else
				troopDescription.leaderType = Entities.PU_LeaderPoleArm2
				EnlargeArmy(armyTower2, troopDescription)
				EnlargeArmy(armyTower2, troopDescription)
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
				EnlargeArmy(armyTower2, troopDescription)
			end
		

		return false
		
	end



-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyTower2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyTower2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		armyTower2.control.delay = armyTower2.control.delay -1
		
		return Counter.Tick2("ControlArmyTower2",2)
		
	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyTower2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyTower2) then
		
			Retreat(armyTower2)
		
			StartJob("SetupArmyTower2")
						
			return true
			
		end


		if armyTower2.control.delay <= 0 then

			Report("Army Tower 2 advances!")
			Advance(armyTower2)

		end
		

		return false
		
	end
	