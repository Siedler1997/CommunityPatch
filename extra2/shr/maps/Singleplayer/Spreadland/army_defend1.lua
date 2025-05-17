createArmyDefend1 = function()

	armyDefend1							= {}

	armyDefend1.player 					= 4
	armyDefend1.id						= 1
	armyDefend1.strength				= 8
	armyDefend1.position				= GetPosition("deployDefend1")
	armyDefend1.rodeLength				= 4000
	
	armyDefend1.control					= {}
	armyDefend1.control.mode			= DEFEND
	armyDefend1.control.defendPosition	= GetPosition("deployDefend1")
	armyDefend1.control.delay			= 20
	armyDefend1.control.spawnPosition	= GetPosition("spawnDefend")
	armyDefend1.control.troops			= { Entities.PU_LeaderHeavyCavalry2,
											Entities.PU_LeaderSword4,
											Entities.PU_LeaderPoleArm4,
											Entities.PU_LeaderBow4,
											Entities.PV_Cannon4,
											Entities.PU_LeaderRifle2 }
	
	SetupArmy(armyDefend1)

	StartJob("ControlArmyDefend1")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefend1"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyDefend1 = function()

		return true
		
		end

	Action_ControlArmyDefend1 = function()

		return defendBehaviour(armyDefend1)

		end

	