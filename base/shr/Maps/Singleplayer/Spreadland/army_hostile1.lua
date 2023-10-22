createArmyHostile1 = function()

	armyHostile1						= {}

	armyHostile1.player 				= 2
	armyHostile1.id						= armyPlayer2Count
	armyHostile1.strength				= 6
	armyHostile1.position				= GetPosition("hostileArmy1")
	armyHostile1.rodeLength				= 1500
	
	armyPlayer2Count = armyPlayer2Count +1
	
	armyHostile1.control				= {}
	armyHostile1.control.mode			= DEFEND
	armyHostile1.control.defendPosition	= GetPosition("hostileArmy1")
	armyHostile1.control.delay			= 20
	armyHostile1.control.spawnPosition	= GetPosition("hostileSupport")
	armyHostile1.control.troops			= { Entities.PU_LeaderCavalry1,Entities.PU_LeaderSword2,Entities.PU_LeaderPoleArm2,Entities.PU_LeaderPoleArm2,Entities.PU_LeaderBow2 }
	armyHostile1.control.spawnIsActive	= true
	
	SetupArmy(armyHostile1)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.PU_LeaderPoleArm2
		
	EnlargeArmy(armyHostile1,troopDescription)
	EnlargeArmy(armyHostile1,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderBow2
	
	EnlargeArmy(armyHostile1,troopDescription)
	EnlargeArmy(armyHostile1,troopDescription)
	EnlargeArmy(armyHostile1,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderCavalry1
	EnlargeArmy(armyHostile1,troopDescription)
		
	StartJob("ControlArmyHostile1")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyHostile1"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyHostile1 = function()

		return true
		
		end

	Action_ControlArmyHostile1 = function()

		if armyFriendly1.control.isDead and armyFriendly2.control.isDead then
		
			Advance(armyHostile1)
			
			return false
			
		else
		
			return battleBehaviour(armyHostile1)

			end

		end

	