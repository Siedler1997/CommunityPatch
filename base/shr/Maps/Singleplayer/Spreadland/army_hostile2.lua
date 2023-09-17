createArmyHostile2 = function()

	armyHostile2						= {}

	armyHostile2.player 				= 2
	armyHostile2.id						= armyPlayer2Count
	armyHostile2.strength				= 7
	armyHostile2.position				= GetPosition("hostileArmy2")
	armyHostile2.rodeLength				= 2000
	
	armyPlayer2Count = armyPlayer2Count +1
	
	armyHostile2.control				= {}
	armyHostile2.control.mode			= DEFEND
	armyHostile2.control.defendPosition	= GetPosition("hostileArmy2")
	armyHostile2.control.delay			= 20
	armyHostile2.control.spawnPosition	= GetPosition("hostileSupport")
	armyHostile2.control.troops			= { Entities.PU_LeaderSword2,Entities.PU_LeaderSword2,Entities.PU_LeaderBow2,Entities.PV_Cannon2 }
	armyHostile2.control.spawnIsActive	= true

	
	SetupArmy(armyHostile2)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.PU_LeaderSword2
		
	EnlargeArmy(armyHostile2,troopDescription)
	EnlargeArmy(armyHostile2,troopDescription)
	EnlargeArmy(armyHostile2,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderBow2

	EnlargeArmy(armyHostile2,troopDescription)
	EnlargeArmy(armyHostile2,troopDescription)

	troopDescription.leaderType = Entities.PV_Cannon2
	
	EnlargeArmy(armyHostile2,troopDescription)
	EnlargeArmy(armyHostile2,troopDescription)
		
	StartJob("ControlArmyHostile2")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyHostile2"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyHostile2 = function()

		return true
		
		end

	Action_ControlArmyHostile2 = function()

		if armyFriendly1.control.isDead and armyFriendly2.control.isDead then
		
			Advance(armyHostile2)
			
			return false
			
		else
		
			return battleBehaviour(armyHostile2)

			end

		end

	