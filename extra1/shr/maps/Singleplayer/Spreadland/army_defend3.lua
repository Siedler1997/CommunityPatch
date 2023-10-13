createArmyDefend3 = function()

	armyDefend3							= {}

	armyDefend3.player 					= 4
	armyDefend3.id						= 3
	armyDefend3.strength				= 8
	armyDefend3.position				= GetPosition("deployDefend3")
	armyDefend3.rodeLength				= 4000
	
	armyDefend3.control					= {}
	armyDefend3.control.mode			= DEFEND
	armyDefend3.control.defendPosition	= GetPosition("deployDefend3")
	armyDefend3.control.delay			= 20
	armyDefend3.control.spawnPosition	= GetPosition("spawnDefend")
	armyDefend3.control.troops			= { Entities.PU_LeaderHeavyCavalry2,
											Entities.PU_LeaderSword4,
											Entities.PU_LeaderPoleArm4,
											Entities.PU_LeaderBow4,
											Entities.PV_Cannon4,
											Entities.PU_LeaderRifle2 }
	
	SetupArmy(armyDefend3)

	StartJob("ControlArmyDefend3")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefend3"
--
-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyDefend3 = function()

		return true
		
		end

	Action_ControlArmyDefend3 = function()

		return defendBehaviour(armyDefend3)

		end

	