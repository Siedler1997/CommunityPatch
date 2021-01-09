
-- Follow Dario

createArmySupportA = function()

	--	set up

		armySupportA						= {}
	
		armySupportA.player 				= 6
		armySupportA.id						= 1
		armySupportA.strength				= 5
		armySupportA.position				= GetPosition("AriTroopSpawn")
		armySupportA.rodeLength				= 200
		
		SetupArmy(armySupportA)

		AI.Army_SetSize(armySupportA.player,armySupportA.id,1)

	--	create 
		local type = Entities.PU_LeaderBow3
		local experience = VERYHIGH_EXPERIENCE
		local soldiers = 8
		if CP_Difficulty == 1 then
			type = Entities.PU_LeaderBow2
			experience = experience - 1
			soldiers = soldiers - 4
		end
			
		local troopDescription = {
		
			leaderType 			= type,
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= soldiers,
			experiencePoints 	= experience,
		}			
	
		EnlargeArmy(armySupportA,troopDescription)
		EnlargeArmy(armySupportA,troopDescription)
		EnlargeArmy(armySupportA,troopDescription)
		EnlargeArmy(armySupportA,troopDescription)
		EnlargeArmy(armySupportA,troopDescription)
		
	--	start controlling job		
		
		StartJob("ControlArmySupportA")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmySupportA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmySupportA = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmySupportA",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmySupportA = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armySupportA) then
		
			return true
				
			end

		if IsDead("Dario") then
		
			return false
			
			end

		Redeploy(armySupportA,GetPosition("Dario"),1000)

		return false
		
		end
	
