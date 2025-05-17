createArmyDefend2 = function()

	armyDefend2							= {}

	armyDefend2.player 					= 4
	armyDefend2.id						= 2
	armyDefend2.strength				= 8
	armyDefend2.position				= GetPosition("deployDefend2")
	armyDefend2.rodeLength				= 5000
	
	armyDefend2.control					= {}
	armyDefend2.control.mode			= DEFEND
	armyDefend2.control.defendPosition	= GetPosition("deployDefend2")
	armyDefend2.control.delay			= 20
	armyDefend2.control.spawnPosition	= GetPosition("spawnDefend")
	armyDefend2.control.troops			= { Entities.PU_LeaderHeavyCavalry2,
											Entities.PU_LeaderSword4,
											Entities.PU_LeaderPoleArm4,
											Entities.PU_LeaderBow4,
											Entities.PV_Cannon4,
											Entities.PU_LeaderRifle2 }
	
	SetupArmy(armyDefend2)

	StartJob("ControlArmyDefend2")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefend2"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyDefend2 = function()

		return true
		
		end

	Action_ControlArmyDefend2 = function()

		return defendBehaviour(armyDefend2)

		end

	