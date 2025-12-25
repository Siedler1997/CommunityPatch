
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
			
		local troopDescription = {
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 8,
			experiencePoints 	= VERYHIGH_EXPERIENCE - CP_Difficulty,
		}		
		if CP_Difficulty < 2 then	
			troopDescription.leaderType = Entities.PU_LeaderBow3
		else
			troopDescription.leaderType = Entities.PU_LeaderBow2a
		end
	
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
	
