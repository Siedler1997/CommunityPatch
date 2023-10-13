
setupArmyNorth = function()

	-- define anchor

		armyNorth					= {}
	
		armyNorth.player 			= 4
		armyNorth.id				= 2
		armyNorth.strength			= 8
		armyNorth.position			= GetPosition("armyNorth")
		armyNorth.rodeLength		= 4000
		armyNorth.control			= {}
		armyNorth.control.delay		= 60 * 45			
		armyNorth.control.attack	= false
		
		SetupArmy(armyNorth)

	--	create army	
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 5,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
	
		EnlargeArmy(armyNorth,troopDescription)
		EnlargeArmy(armyNorth,troopDescription)
		EnlargeArmy(armyNorth,troopDescription)
		EnlargeArmy(armyNorth,troopDescription)
		EnlargeArmy(armyNorth,troopDescription)
		EnlargeArmy(armyNorth,troopDescription)
		EnlargeArmy(armyNorth,troopDescription)
		EnlargeArmy(armyNorth,troopDescription)
	
	--	start
	
		StartJob("ControlArmyNorth")
	
	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyNorth"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyNorth = function()
	-------------------------------------------------------------------------------------------------------------------

		if armyNorth.control.delay > 0 then 
		
			armyNorth.control.delay = armyNorth.control.delay -1
				
			return false
			
			end

		if armyNorth.control.attack == false then
		
			if GetClosestEntity(armyNorth,9000) ~= 0 then
		
				armyNorth.control.attack = true
			
				end		
			
			return false
				
			end

		return true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyNorth = function()
	-------------------------------------------------------------------------------------------------------------------
			
		if IsDead(armyNorth) then
		
			return true
			
			end

		FrontalAttack(armyNorth)	

		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	




	