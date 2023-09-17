createArmyDefend = function()

	--	player 2

		--	army <1>
	
			armyDefend21	= {}
			createArmy(2,1,armyDefend21,6,"defend21",HIGH_EXPERIENCE,troops4)
			StartJob("ControlArmyDefend21")
	
		--	army <2>

			armyDefend22	= {}
			createArmy(2,2,armyDefend22,4,"defend22",HIGH_EXPERIENCE,troops5)
			StartJob("ControlArmyDefend22")

		--	army <3>
	
			armyDefend23	= {}
			createArmy(2,3,armyDefend23,6,"defend23",HIGH_EXPERIENCE,troops3)
			StartJob("ControlArmyDefend22")

	--	player 3

		--	army <1>
	
			armyDefend31	= {}
			createArmy(3,1,armyDefend31,6,"defend31",HIGH_EXPERIENCE,troops4)
			StartJob("ControlArmyDefend31")
	
		--	army <2>
	
			armyDefend32	= {}
			createArmy(3,2,armyDefend32,6,"defend32",HIGH_EXPERIENCE,troops5)
			StartJob("ControlArmyDefend32")

	--	player 4

		--	army <1>
	
			armyDefend41		= {}
			createArmy(4,1,armyDefend41,6,"defend41",HIGH_EXPERIENCE,troops1)
			StartJob("ControlArmyDefend41")

		--	army <2>

			armyDefend42	= {}
			createArmy(4,2,armyDefend42,6,"defend42",HIGH_EXPERIENCE,troops1)
			StartJob("ControlArmyDefend42")

		--	army <3>
	
			armyDefend43	= {}
			createArmy(4,3,armyDefend43,6,"defend43",HIGH_EXPERIENCE,troops1)
			StartJob("ControlArmyDefend43")

	end

------------------------------------------------------------------------------------
Condition_ControlArmyDefend31 = function()
	return true	
	end
Action_ControlArmyDefend31 = function()
	return simpleDefendBehaviour(armyDefend31)
	end
------------------------------------------------------------------------------------
Condition_ControlArmyDefend32 = function()
	return true	
	end
Action_ControlArmyDefend32 = function()
	return simpleDefendBehaviour(armyDefend32)
	end
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
Condition_ControlArmyDefend21 = function()
	return true	
	end
Action_ControlArmyDefend21 = function()
	return simpleDefendBehaviour(armyDefend21)
	end
------------------------------------------------------------------------------------
Condition_ControlArmyDefend22 = function()
	return true	
	end
Action_ControlArmyDefend22 = function()
	return simpleDefendBehaviour(armyDefend22)
	end
------------------------------------------------------------------------------------
Condition_ControlArmyDefend23 = function()
	return true	
	end
Action_ControlArmyDefend23 = function()
	return simpleDefendBehaviour(armyDefend23)
	end
	------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
Condition_ControlArmyDefend41 = function()
	return true	
	end
Action_ControlArmyDefend41 = function()
	return simpleDefendBehaviour(armyDefend41)
	end
------------------------------------------------------------------------------------
Condition_ControlArmyDefend42 = function()
	return true	
	end
Action_ControlArmyDefend42 = function()
	return simpleDefendBehaviour(armyDefend42)
	end
------------------------------------------------------------------------------------
Condition_ControlArmyDefend43 = function()
	return true	
	end
Action_ControlArmyDefend43 = function()
	return simpleDefendBehaviour(armyDefend43)
	end
	