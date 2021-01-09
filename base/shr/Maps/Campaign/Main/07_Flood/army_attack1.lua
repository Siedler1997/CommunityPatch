createArmyAttack1 = function()

	--	set up

		armyAttack1						= {}
	
		armyAttack1.player 				= 8
		armyAttack1.id					= 1
		armyAttack1.strength			= 2
		armyAttack1.position			= GetPosition("army1")
		armyAttack1.rodeLength			= 50
		
		SetupArmy(armyAttack1)
		
	--	job		
		
		StartJob("SetupArmyAttack1")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyAttack1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return Counter.Tick2("SetupArmyAttack1",82)
						
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------

		if HasFullStrength(armyAttack1) then
		
			StartJob("ControlArmyAttack1")
			
			return true
			
			end

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderSword1
		else
			troopDescription.leaderType = Entities.PU_LeaderSword2
		end	
		EnlargeArmy(armyAttack1,troopDescription)				

		return false
		
		end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttack1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return Counter.Tick2("ControlArmyAttack1",65)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyAttack1) then
		
			Retreat(armyAttack1)
			
			StartJob("SetupArmyAttack1")
			
			return true

		else
		
			Advance(armyAttack1)
			
			end

		return false
		
		end
	