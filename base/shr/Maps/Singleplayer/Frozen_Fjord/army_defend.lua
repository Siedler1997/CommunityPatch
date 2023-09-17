
-- East side of lake

PLAYER_DEFEND_1 = 8					-- playerID


createArmyDefend = function()

	troops1	= { Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PU_LeaderPoleArm3,
				Entities.PU_LeaderPoleArm3,
				Entities.PV_Cannon4 
				}
	troops2	= { Entities.PU_LeaderBow4,
				Entities.PU_LeaderBow4,
				Entities.PU_LeaderSword4,
				Entities.PU_LeaderSword4,
				Entities.PV_Cannon4 
				}
	troops3	= { Entities.PU_LeaderHeavyCavalry1,
				Entities.PU_LeaderCavalry2,
				Entities.PU_LeaderCavalry2
				}

	--	army <1>

		armyDefend1	= {}
		createArmy(PLAYER_DEFEND_1, 1,armyDefend1,7,"defend1",HIGH_EXPERIENCE,troops1)
		StartJob("ControlArmyDefend1")

	--	army <2>

		armyDefend2	= {}
		createArmy(PLAYER_DEFEND_1, 2,armyDefend2,8,"defend2",HIGH_EXPERIENCE,troops2)
		StartJob("ControlArmyDefend2")

	--	army <3>

		armyDefend3	= {}
		createArmy(PLAYER_DEFEND_1, 3,armyDefend3,8,"defend3",HIGH_EXPERIENCE,troops3)
		StartJob("ControlArmyDefend3")

	--	army <4>

		armyDefend4	= {}
		createArmy(PLAYER_DEFEND_1, 4,armyDefend4,7,"defend4",HIGH_EXPERIENCE,troops1)
		StartJob("ControlArmyDefend4")

	end

------------------------------------------------------------------------------------
Condition_ControlArmyDefend1 = function()
	return true	
	end
Action_ControlArmyDefend1 = function()
	return simpleDefendBehaviour(armyDefend1)
	end
------------------------------------------------------------------------------------
Condition_ControlArmyDefend2 = function()
	return true	
	end
Action_ControlArmyDefend2 = function()
	return simpleDefendBehaviour(armyDefend2)
	end
------------------------------------------------------------------------------------
Condition_ControlArmyDefend3 = function()
	return true	
	end
Action_ControlArmyDefend3 = function()
	return simpleDefendBehaviour(armyDefend3)
	end
------------------------------------------------------------------------------------
Condition_ControlArmyDefend4 = function()
	return true	
	end
Action_ControlArmyDefend4 = function()
	return simpleDefendBehaviour(armyDefend4)
	end

	