
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
		
			leaderType 			= Entities.PU_LeaderSword3,
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 8,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			
	
		EnlargeArmy(armySupportB,troopDescription)
		EnlargeArmy(armySupportB,troopDescription)
		EnlargeArmy(armySupportB,troopDescription)
		if CP_Difficulty == 0 then
			EnlargeArmy(armySupportB,troopDescription)
			EnlargeArmy(armySupportB,troopDescription)
		end
		
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
	
