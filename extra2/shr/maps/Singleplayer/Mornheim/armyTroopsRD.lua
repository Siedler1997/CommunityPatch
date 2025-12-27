
setupArmyTroopsRD = function()

	-- define anchor

		armyTroopsRD				= {}
	
		armyTroopsRD.player 		= 4
		armyTroopsRD.id				= 1
		armyTroopsRD.strength		= 8
		armyTroopsRD.position		= GetPosition("deployArmyRD")
		armyTroopsRD.rodeLength		= 3000
		armyTroopsRD.control		= {}
		armyTroopsRD.control.timer	= 0
		
		SetupArmy(armyTroopsRD)

	--	create army	
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 2,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			
	
		troopDescription.leaderType = Entities.PU_LeaderCavalry2
	
		EnlargeArmy(armyTroopsRD,troopDescription)
		EnlargeArmy(armyTroopsRD,troopDescription)
		EnlargeArmy(armyTroopsRD,troopDescription)
		EnlargeArmy(armyTroopsRD,troopDescription)

		troopDescription.leaderType = Entities.PU_LeaderBow4

		EnlargeArmy(armyTroopsRD,troopDescription)
		EnlargeArmy(armyTroopsRD,troopDescription)

		troopDescription.leaderType = Entities.PU_LeaderRifle2

		EnlargeArmy(armyTroopsRD,troopDescription)
		EnlargeArmy(armyTroopsRD,troopDescription)
	
	StartJob("ControlArmyTroopRD")
	
	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyTroopRD"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyTroopRD = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
				
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyTroopRD = function()
	-------------------------------------------------------------------------------------------------------------------
			
		if armyTroopsRD.control.timer > 10 and IsDead(armyTroopsRD) then
		
			return true
			
			end
		
		armyTroopsRD.control.timer = armyTroopsRD.control.timer +1
		
		if armyTroopsRD.control.timer > 30 + Logic.GetRandom(10) then
		
			Report("army RD: Frontal Attack")
		
			FrontalAttack(armyTroopsRD)	
			
			if armyTroopsRD.control.timer > 40 + Logic.GetRandom(10) then
		
				Report("army RD: Redeploy")
			
				Redeploy(armyTroopsRD,GetPosition("deployArmyRD"),2000)
			
				armyTroopsRD.control.timer = 0
	
				end
							
		else
		
			Report("army RD: Defend")
		
			Defend(armyTroopsRD)
			
			end

		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	
