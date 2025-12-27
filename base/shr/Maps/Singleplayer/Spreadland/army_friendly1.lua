createArmyFriendly1 = function()

	armyFriendly1							= {}

	armyFriendly1.player 					= 3
	armyFriendly1.id						= armyPlayer3Count
	armyFriendly1.strength					= 8
	armyFriendly1.position					= GetPosition("friendlyArmy1")
	armyFriendly1.rodeLength				= 1000
	
	armyPlayer3Count = armyPlayer3Count +1
	
	armyFriendly1.control					= {}
	armyFriendly1.control.count				= 10
	armyFriendly1.control.mode				= DEFEND
	armyFriendly1.control.spawnIsActive		= true
	armyFriendly1.control.defendPosition	= GetPosition("friendlyArmy1")
	armyFriendly1.control.delay				= 20
	armyFriendly1.control.spawnPosition		= GetPosition("friendlySupport")
	armyFriendly1.control.troops			= { Entities.PU_LeaderSword2,Entities.PU_LeaderPoleArm2,Entities.PU_LeaderBow2 }
	armyFriendly1.control.isDead			= false
	armyFriendly1.control.experience		= HIGH_EXPERIENCE
	
	SetupArmy(armyFriendly1)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.PU_LeaderPoleArm2
		
	EnlargeArmy(armyFriendly1,troopDescription)
	EnlargeArmy(armyFriendly1,troopDescription)
	EnlargeArmy(armyFriendly1,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderBow2
	
	EnlargeArmy(armyFriendly1,troopDescription)
	EnlargeArmy(armyFriendly1,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderSword2

	EnlargeArmy(armyFriendly1,troopDescription)
	EnlargeArmy(armyFriendly1,troopDescription)
	EnlargeArmy(armyFriendly1,troopDescription)
		
	StartJob("ControlArmyFriendly1")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyFriendly1"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyFriendly1 = function()

		return true
		
		end

	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyFriendly1 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsDead(armyFriendly1) and armyFriendly1.control.count < 0 then
		
			armyFriendly1.control.isDead = true
		
			return true
			
			end
			
		armyFriendly1.control.count = armyFriendly1.control.count -1

		return battleBehaviour(armyFriendly1)
		
		end

