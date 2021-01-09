
-- At west ironmines

SPAWN_TIME_RESOURCE1 = 5 * 60
if CP_Difficulty == 1 then
	SPAWN_TIME_RESOURCE1 = SPAWN_TIME_RESOURCE1 - 60
end

createArmyResources1 = function()

	--	set up

		armyResources1						= {}
	
		armyResources1.player 				= 5
		armyResources1.id					= 3
		armyResources1.strength				= 2
		armyResources1.position				= GetPosition("defend1")
		armyResources1.rodeLength			= 6500
		armyResources1.beAgressive			= true
		armyResources1.control				= {}
		armyResources1.control.timer		= 0
		
		SetupArmy(armyResources1)
	
	--	create

		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}				
	
--		troopDescription.leaderType = Entities.PU_LeaderSword1				
--		EnlargeArmy(armyResources1,troopDescription)

		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow1
		else
			troopDescription.leaderType = Entities.PU_LeaderBow2
		end			
		EnlargeArmy(armyResources1,troopDescription)

		troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1				
		EnlargeArmy(armyResources1,troopDescription)
	
	--	job		
		
		StartJob("ControlArmyResources1")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyResources1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyResources1 = function()
	-------------------------------------------------------------------------------------------------------------------

		if armyResources1.control.timer > 0 then
		
			armyResources1.control.timer = armyResources1.control.timer -1

			return false

			end
		
		return Counter.Tick2("ControlArmyResources1",3)	
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyResources1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if 		HasFullStrength(armyResources1)	== false 
			and	IsDead("tower1a") 				== false 
			and	IsDead("tower1b") 				== false
			then

			local troopDescription = {
			
				maxNumberOfSoldiers	= 4,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}				

			if Logic.GetRandom() > 30 then
			
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1				
				
			else
			

				if CP_Difficulty == 0 then
					troopDescription.leaderType = Entities.PU_LeaderBow1
				else
					troopDescription.leaderType = Entities.PU_LeaderBow2
				end				 

			end
			
			armyResources1.position = GetPosition("spawn1")
			
			EnlargeArmy(armyResources1,troopDescription)
			
			armyResources1.position = GetPosition("defend1")
			
			Retreat(armyResources1)
			
			armyResources1.control.timer = SPAWN_TIME_RESOURCE1
			
		else

			if armyResources1.control.timer == 0 then

				Defend(armyResources1)
				
				end
			
			end

		return false
		
		end
	