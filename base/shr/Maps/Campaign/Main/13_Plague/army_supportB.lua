
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
		local type = Entities.PU_LeaderSword3
		local experience = VERYHIGH_EXPERIENCE
		local soldiers = 8
		if CP_Difficulty == 1 then
			type = Entities.PU_LeaderSword2
			experience = experience - 1
			soldiers = soldiers - 4
		end
			
		local troopDescription = {
		
			leaderType 			= type,
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= soldiers,
			experiencePoints 	= experience,
		}			
	
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
	
