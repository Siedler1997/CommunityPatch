
-- Follow Erec

createArmySupportB = function()

	--	set up

		armySupportB						= {}
	
		armySupportB.player 				= 6
		armySupportB.id						= 2
		armySupportB.strength				= 5
		armySupportB.position				= GetPosition("AriTroopSpawn")
		armySupportB.rodeLength				= 200
		
		AI.Army_SetSize(armySupportB.player,armySupportB.id,1)
		
		SetupArmy(armySupportB)

	--	create 
			
		local troopDescription = {
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 8,
			experiencePoints 	= VERYHIGH_EXPERIENCE - CP_Difficulty,
		}			
		if CP_Difficulty < 2 then	
			troopDescription.leaderType = Entities.PU_LeaderSword3
		else
			troopDescription.leaderType = Entities.PU_LeaderSword2a
		end
	
		EnlargeArmy(armySupportB,troopDescription)
		EnlargeArmy(armySupportB,troopDescription)
		EnlargeArmy(armySupportB,troopDescription)
		EnlargeArmy(armySupportB,troopDescription)
		EnlargeArmy(armySupportB,troopDescription)
		
	--	start controlling job		
		
		StartJob("ControlArmySupportB")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmySupportB"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmySupportB = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmySupportB",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmySupportB = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armySupportB) then
		
			return true
				
			end

		if IsDead("Erec") then
		
			return false
			
			end

		Redeploy(armySupportB,GetPosition("Erec"),1000)

		return false
		
		end
	
