createArmyDefend4 = function()

	armyDefend4							= {}

	armyDefend4.player 					= 4
	armyDefend4.id						= 4
	armyDefend4.strength				= 8
	armyDefend4.position				= GetPosition("deployDefend4")
	armyDefend4.rodeLength				= 4000
	
	armyDefend4.control					= {}
	armyDefend4.control.mode			= DEFEND
	armyDefend4.control.defendPosition	= GetPosition("deployDefend4")
	armyDefend4.control.delay			= 20
	armyDefend4.control.spawnPosition	= GetPosition("spawnDefend")
	armyDefend4.control.troops			= { Entities.PU_LeaderHeavyCavalry2,
											Entities.PU_LeaderSword4,
											Entities.PU_LeaderPoleArm4,
											Entities.PU_LeaderBow4,
											Entities.PV_Cannon4,
											Entities.PU_LeaderRifle2 }
	
	SetupArmy(armyDefend4)

	StartJob("ControlArmyDefend4")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefend4"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyDefend4 = function()

		return true
		
		end

	Action_ControlArmyDefend4 = function()

		return defendBehaviour(armyDefend4)

		end

	