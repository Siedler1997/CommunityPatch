createArmySupport = function()	

	armySupport1					= {}

	armySupport1.player 			= 3
	armySupport1.id					= armyPlayer3Count
	armySupport1.strength			= 8
	armySupport1.position			= GetPosition("merchant1")
	armySupport1.rodeLength			= 1500
	
	armyPlayer3Count = armyPlayer3Count +1
	
	SetupArmy(armySupport1)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERHIGH_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.PU_LeaderBow4
	
	EnlargeArmy(armySupport1,troopDescription)
	EnlargeArmy(armySupport1,troopDescription)
	EnlargeArmy(armySupport1,troopDescription)

	troopDescription.leaderType = Entities.PV_Cannon3
	
	EnlargeArmy(armySupport1,troopDescription)

	troopDescription.leaderType = Entities.PV_Cannon4
	
	EnlargeArmy(armySupport1,troopDescription)
	
	troopDescription.leaderType = Entities.PU_LeaderPoleArm4
		
	EnlargeArmy(armySupport1,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderSword4

	EnlargeArmy(armySupport1,troopDescription)
	EnlargeArmy(armySupport1,troopDescription)
		


	armySupport2					= {}

	armySupport2.player 			= 3
	armySupport2.id					= armyPlayer3Count
	armySupport2.strength			= 8
	armySupport2.position			= GetPosition("merchant1")
	armySupport2.rodeLength			= 1500
	
	armyPlayer3Count = armyPlayer3Count +1
	
	SetupArmy(armySupport1)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERHIGH_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
	
	EnlargeArmy(armySupport2,troopDescription)
	EnlargeArmy(armySupport2,troopDescription)
	EnlargeArmy(armySupport2,troopDescription)
	EnlargeArmy(armySupport2,troopDescription)
	EnlargeArmy(armySupport2,troopDescription)
	EnlargeArmy(armySupport2,troopDescription)
	EnlargeArmy(armySupport2,troopDescription)
	EnlargeArmy(armySupport2,troopDescription)
		
	supportArmyControl = 1
		
	StartJob("ControlArmySupport")

	Report("Player 3 support army created")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmySupport"
--
-----------------------------------------------------------------------------------------------------------------------	

	Condition_ControlArmySupport = function()

		return Counter.Tick2("ControlArmySupport",70)
		
		end

	Action_ControlArmySupport = function()

		if IsDead(armySupport1) and IsDead(armySupport2) then

			return true
		
			end

		if supportArmyControl == 1 then

			Advance(armySupport1)
			
			supportArmyControl = 2
			
			return false
			
		else
		
			Advance(armySupport2)
			
			supportArmyControl = 1
			
			return false
			
			end

		return false

		end
