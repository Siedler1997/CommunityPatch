
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
		local type = Entities.PV_Cannon3
		local experience = VERYHIGH_EXPERIENCE
		local soldiers = 8
		if CP_Difficulty == 1 then
			type = Entities.PV_Cannon1
			experience = experience - 1
			soldiers = soldiers - 4
		end
			
		local troopDescription = {
		
			leaderType 			= type,
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= soldiers,
			experiencePoints 	= experience,
		}			
	
		EnlargeArmy(armySupportC,troopDescription)
		EnlargeArmy(armySupportC,troopDescription)
		EnlargeArmy(armySupportC,troopDescription)
		EnlargeArmy(armySupportC,troopDescription)
		EnlargeArmy(armySupportC,troopDescription)
		
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
	
