createArmyHostile3 = function()

	armyHostile3						= {}

	armyHostile3.player 				= 2
	armyHostile3.id						= armyPlayer2Count
	armyHostile3.strength				= 6
	armyHostile3.position				= GetPosition("hostileArmy3")
	armyHostile3.rodeLength				= 2000
	
	armyPlayer2Count = armyPlayer2Count +1
	
	armyHostile3.control				= {}
	armyHostile3.control.mode			= DEFEND
	armyHostile3.control.defendPosition	= GetPosition("hostileArmy3")
	armyHostile3.control.delay			= 20
	armyHostile3.control.spawnPosition	= GetPosition("hostileSupport")
	armyHostile3.control.troops			= { Entities.PU_LeaderSword2,Entities.PU_LeaderHeavyCavalry1 }
	armyHostile3.control.spawnIsActive	= true
	
	SetupArmy(armyHostile3)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
	}			

	troopDescription.leaderType = Entities.PU_LeaderSword2
		
	EnlargeArmy(armyHostile3,troopDescription)
	EnlargeArmy(armyHostile3,troopDescription)
	EnlargeArmy(armyHostile3,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry1
	
	EnlargeArmy(armyHostile3,troopDescription)
	EnlargeArmy(armyHostile3,troopDescription)
	EnlargeArmy(armyHostile3,troopDescription)
		
	StartJob("ControlArmyHostile3")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyHostile3"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyHostile3 = function()

		return true
		
		end

	Action_ControlArmyHostile3 = function()

		if armyFriendly1.control.isDead and armyFriendly2.control.isDead then
		
			Advance(armyHostile3)
			
			return false
			
		else
		
			return battleBehaviour(armyHostile3)

			end

		end

	