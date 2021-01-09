createArmyAttack3 = function()

	--	set up

		armyAttack3						= {}
	
		armyAttack3.player 				= 8
		armyAttack3.id					= 3
		armyAttack3.strength			= 4
		armyAttack3.position			= GetPosition("army3")
		armyAttack3.rodeLength			= 50
		
		SetupArmy(armyAttack3)
		
	--	job		
		
		StartJob("SetupArmyAttack3")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyAttack3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyAttack3 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return Counter.Tick2("SetupArmyAttack3",80)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyAttack3 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		if IsDead("tower2") then
		
			return true
			
			end

		if HasFullStrength(armyAttack3) then
		
			StartJob("ControlArmyAttack3")
			
			return true
			
			end

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		if Logic.GetRandom(100) > 50 then
		
			if CP_Difficulty == 0 then
				troopDescription.leaderType = Entities.PU_LeaderSword1
			else
				troopDescription.leaderType = Entities.PU_LeaderSword2
			end	
			
		else
		
			if CP_Difficulty == 0 then
				troopDescription.leaderType = Entities.PU_LeaderBow1
			else
				troopDescription.leaderType = Entities.PU_LeaderBow2
			end	

		end
		
		EnlargeArmy(armyAttack3,troopDescription)				

		return false
		
		end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttack3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttack3 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return Counter.Tick2("ControlArmyAttack3",45)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttack3 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyAttack3) then
		
			Retreat(armyAttack3)
			
			StartJob("SetupArmyAttack3")
			
			return true

		else
		
			Advance(armyAttack3)
			
			end

		return false
		
		end
	