createArmyFriendly2 = function()

	armyFriendly2							= {}

	armyFriendly2.player 					= 3
	armyFriendly2.id						= armyPlayer3Count
	armyFriendly2.strength					= 6
	armyFriendly2.position					= GetPosition("friendlyArmy2")
	armyFriendly2.rodeLength				= 1000
	
	armyPlayer3Count = armyPlayer3Count +1
	
	armyFriendly2.control					= {}
	armyFriendly2.control.mode				= DEFEND
	armyFriendly2.control.defendPosition	= GetPosition("friendlyArmy2")
	armyFriendly2.control.delay				= 20
	armyFriendly2.control.spawnPosition		= GetPosition("friendlySupport")
	armyFriendly2.control.troops			= { Entities.PU_LeaderHeavyCavalry1,Entities.PU_LeaderHeavyCavalry1,Entities.PU_LeaderCavalry1,Entities.PV_Cannon3 }
	armyFriendly2.control.isDead			= false
	armyFriendly2.control.spawnIsActive		= true
	
	SetupArmy(armyFriendly2)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry1
		
	EnlargeArmy(armyFriendly2,troopDescription)
	EnlargeArmy(armyFriendly2,troopDescription)
	EnlargeArmy(armyFriendly2,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderCavalry1
	
	EnlargeArmy(armyFriendly2,troopDescription)
	EnlargeArmy(armyFriendly2,troopDescription)
	EnlargeArmy(armyFriendly2,troopDescription)

		
	StartJob("ControlArmyFriendly2")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyFriendly2"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyFriendly2 = function()

		return true
		
		end

	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyFriendly2 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsDead(armyFriendly2) and armyFriendly1.control.count < 0 then
		
			armyFriendly1.control.isDead = true
		
			return true
			
			end

		armyFriendly1.control.count = armyFriendly1.control.count -1

		return battleBehaviour(armyFriendly2)
		
		end

