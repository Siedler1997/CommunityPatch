
-- Follow Salim

createArmySupportC = function()

	--	set up

		armySupportC						= {}
	
		armySupportC.player 				= 6
		armySupportC.id						= 3
		armySupportC.strength				= 5
		armySupportC.position				= GetPosition("AriTroopSpawn")
		armySupportC.rodeLength				= 200
		
		AI.Army_SetSize(armySupportC.player,armySupportC.id,1)
		
		SetupArmy(armySupportC)

	--	create 
			
		local troopDescription = {
		
			leaderType 			= Entities.PV_Cannon3,
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 0,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			
	
		EnlargeArmy(armySupportC,troopDescription)
		EnlargeArmy(armySupportC,troopDescription)
		EnlargeArmy(armySupportC,troopDescription)
		if CP_Difficulty == 0 then
			EnlargeArmy(armySupportC,troopDescription)
			EnlargeArmy(armySupportC,troopDescription)
		end
		
	--	start controlling job		
		
		StartJob("ControlArmySupportC")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmySupportC"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmySupportC = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmySupportC",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmySupportC = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armySupportC) then		
	
			return true
				
			end

		if IsDead("Salim") then
		
			return false
			
			end

		Redeploy(armySupportC,GetPosition("Salim"),1000)

		return false
		
		end
	
