
createArmyErec = function()

	--	set up

		armyErec					= {}
	
		armyErec.player 			= 1
		armyErec.id					= 2
		armyErec.strength			= 5
		armyErec.position			= GetPosition("ErecTroopSpawn1")
		armyErec.rodeLength			= 1000
		armyErec.control			= {}
		armyErec.control.delay		= 0
		
--		SetupArmy(armyErec)


	-- create
		local troopDescription = {
			
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= LOW_EXPERIENCE,
		}			
	
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderSword4
		else
			troopDescription.leaderType = Entities.PU_LeaderSword3
		end
		local support1 = CreateTroop(armyErec,troopDescription)  
		local support2 = CreateTroop(armyErec,troopDescription)  

		armyErec.position			= GetPosition("ErecTroopSpawn2")
		troopDescription.leaderType = Entities.PU_LeaderBow2
		local support3 = CreateTroop(armyErec,troopDescription)  
		local support4 = CreateTroop(armyErec,troopDescription)  

		armyErec.position			= GetPosition("ErecTroopSpawn3")
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderSword4
		else
			troopDescription.leaderType = Entities.PU_LeaderSword3
		end
		local support5 = CreateTroop(armyErec,troopDescription)  
--		local support6 = CreateTroop(armyErec,troopDescription)  
		

		Move(support1,"ErecTroop1")
		Move(support2,"ErecTroop2")
		Move(support3,"ErecTroop3")
		Move(support4,"ErecTroop4")
		Move(support5,"ErecTroop5")
--		Move(support6,"ErecTroop6")
	
	
	-- job
	
--		StartJob("ControlArmyErec")		TF: Not enable as player gets the army now

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyErec"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyErec = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyErec",130)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyErec = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyCave2) then

			endQuestErecsArrival()	
		
			return true
				
			end
				
		--FrontalAttack(armyErec)

		return false
		
		end
