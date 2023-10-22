createArmyBig = function()

	armyBig						= {}

	armyBig.player 				= 2
	armyBig.id					= armyPlayer2Count
	armyBig.strength			= 8
	armyBig.position			= GetPosition("bigArmy")
	armyBig.rodeLength			= 1500
	
	armyPlayer2Count = armyPlayer2Count +1
	
	SetupArmy(armyBig)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERHIGH_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.PU_LeaderBow4
	
	EnlargeArmy(armyBig,troopDescription)
	EnlargeArmy(armyBig,troopDescription)
	
	troopDescription.leaderType = Entities.PU_LeaderRifle2
	EnlargeArmy(armyBig,troopDescription)

	troopDescription.leaderType = Entities.PV_Cannon4
	
	EnlargeArmy(armyBig,troopDescription)
	EnlargeArmy(armyBig,troopDescription)
	
	troopDescription.leaderType = Entities.PU_LeaderPoleArm4
		
	EnlargeArmy(armyBig,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderSword4

	EnlargeArmy(armyBig,troopDescription)
	EnlargeArmy(armyBig,troopDescription)
		
	StartJob("ControlArmyBig")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyBig"
--
-----------------------------------------------------------------------------------------------------------------------	

	Condition_ControlArmyBig = function()

		return Counter.Tick2("ControlArmyBig",70)
		
		end

	Action_ControlArmyBig = function()

		if IsDead(armyBig) then

			return true
		
			end

		Advance(armyBig)

		return false

		end

	