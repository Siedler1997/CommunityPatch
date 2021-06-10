--	Kerberos-Armee:
--	
--	CU_BlackKnight_LeaderMace1
--	CU_BlackKnight_LeaderMace2
--	
--	Beigemischt:
--	CU_BanditLeaderSword1
--	CU_BanditLeaderSword2
--	
--	Ab Folklung-Karte:
--	CU_Barbarian_LeaderClub1
--	CU_Barbarian_LeaderClub2

-- sowie normale Soldaten und Kanonen


-- East iron and sulfur mines

createArmyResources2 = function()

	--	set up

		armyResources2						= {}
	
		armyResources2.player 				= 5
		armyResources2.id					= 4
		armyResources2.strength				= 3
		armyResources2.position				= GetPosition("defend2")
		armyResources2.rodeLength			= 5500
		armyResources2.beAgressive			= true
		armyResources2.control				= {}
		armyResources2.control.timer		= 0
		
		SetupArmy(armyResources2)
	
	--	create

		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}				
	
--		troopDescription.leaderType = Entities.PU_LeaderSword1				
--		EnlargeArmy(armyResources2,troopDescription)

		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow1
			EnlargeArmy(armyResources2,troopDescription)

			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1	
		else
			troopDescription.experiencePoints = HIGH_EXPERIENCE
			if CP_Difficulty == 1 then
				troopDescription.leaderType = Entities.PU_LeaderBow2
			else
				troopDescription.leaderType = Entities.PU_LeaderBow3
			end
			EnlargeArmy(armyResources2,troopDescription)

			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
		end		
						
		EnlargeArmy(armyResources2,troopDescription)
		EnlargeArmy(armyResources2,troopDescription)
	
	--	job		
		
		StartJob("ControlArmyResources2")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyResources2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyResources2 = function()
	-------------------------------------------------------------------------------------------------------------------

		if armyResources2.control.timer > 0 then
		
			armyResources2.control.timer = armyResources2.control.timer -1

			return false

			end
		
		return Counter.Tick2("ControlArmyResources2",3)	
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyResources2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if HasFullStrength(armyResources2)	== false 
			and	IsDead("tower2a") 				== false 
			and	IsDead("tower2b") 				== false
			then

			local troopDescription = {
			
				maxNumberOfSoldiers	= 4,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}				
			
			if CP_Difficulty > 0 then
				troopDescription.experiencePoints = HIGH_EXPERIENCE
			end

			if Logic.GetRandom() > 30 then
				if CP_Difficulty == 0 then
					troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1	
				else
					troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
				end
			else
				if CP_Difficulty == 0 then
					troopDescription.leaderType = Entities.PU_LeaderBow1
				elseif CP_Difficulty == 1 then
					troopDescription.leaderType = Entities.PU_LeaderBow2
				else
					troopDescription.leaderType = Entities.PU_LeaderBow3
				end	
			end
			
			armyResources2.position = GetPosition("spawn2")
			
			EnlargeArmy(armyResources2,troopDescription)
			
			armyResources2.position = GetPosition("defend2")
			
			Retreat(armyResources2)
			
			if CP_Difficulty == 0 then
				armyResources2.control.timer = 5 * 60
			elseif CP_Difficulty == 1 then
				armyResources2.control.timer = 3 * 60
			else
				armyResources2.control.timer = 60
			end
			
		else

			if armyResources2.control.timer == 0 then

				Defend(armyResources2)
				
				end
			
			end

		return false
		
		end
	