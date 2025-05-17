createArmyPlayer2Attack = function()
	--	player 2

		--	army <4>
	
			armyAttack21		= {}
			createArmy(2,4,armyAttack21,8,"attack21",HIGH_EXPERIENCE,troops6)
			armyAttack21.control.mode			= ADVANCE
			armyAttack21.control.defendPosition	= GetPosition("attack21")
			armyAttack21.control.delay			= 20
			armyAttack21.control.spawnPosition	= GetPosition("support21")
			armyAttack21.control.troops			= { Entities.PU_LeaderSword4,
													Entities.PU_LeaderPoleArm4,
													Entities.PU_LeaderSword4,
													Entities.PU_LeaderPoleArm4,
													Entities.PU_LeaderSword4,
													Entities.PU_LeaderPoleArm4,
													Entities.PV_Cannon3, 
													Entities.PV_Cannon4}
			armyAttack21.control.spawnIsActive	= true
			StartJob("ControlArmyAttack21")


end

createArmyPlayer3Attack = function()
	--	player 3

		--	army <3>

			armyAttack31		= {}
			createArmy(3,3,armyAttack31,2,"attack31",HIGH_EXPERIENCE,troops5)
			armyAttack31.control.mode			= ADVANCE
			armyAttack31.control.defendPosition	= GetPosition("attack31")
			armyAttack31.control.delay			= 20
			armyAttack31.control.spawnPosition	= GetPosition("support31")
			armyAttack31.control.troops			= { Entities.PU_LeaderSword4,
													Entities.PU_LeaderPoleArm4,
													Entities.PU_LeaderSword4,
													Entities.PU_LeaderPoleArm4,
													Entities.PU_LeaderSword4,
													Entities.PU_LeaderPoleArm4,
													Entities.PV_Cannon3, 
													Entities.PV_Cannon4}
			armyAttack31.control.spawnIsActive	= true
			StartJob("ControlArmyAttack31")


end

createArmyPlayer4Attack = function()
	--	player 4

		--	army <4>
	
			armyAttack41		= {}
			createArmy(4,4,armyAttack41,4,"attack41",HIGH_EXPERIENCE,troops1)
			armyAttack41.control.mode			= ADVANCE
			armyAttack41.control.defendPosition	= GetPosition("attack41")
			armyAttack41.control.delay			= 20
			armyAttack41.control.spawnPosition	= GetPosition("support41")
			armyAttack41.control.troops			= { Entities.PU_LeaderCavalry2,
													Entities.PU_LeaderSword4,
													Entities.PU_LeaderPoleArm4,
													Entities.PU_LeaderPoleArm4,
													Entities.PU_LeaderBow4,
													Entities.PU_LeaderRifle2 }
			armyAttack41.control.spawnIsActive	= true
			StartJob("ControlArmyAttack41")
end

-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyAttack41 = function()
		return true
		end
	Action_ControlArmyAttack41 = function()
		if IsDead("player4") then 
			return true
			end
		return battleBehaviour(armyAttack41)
		end

-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyAttack21 = function()
		return true
		end
	Action_ControlArmyAttack21 = function()
		if IsDead("player2") then 
			return true
			end
		return battleBehaviour(armyAttack21)
		end

-----------------------------------------------------------------------------------------------------------------------	
	Condition_ControlArmyAttack31 = function()
		return true
		end
	Action_ControlArmyAttack31 = function()
		if IsDead("player3") then 
			return true
			end
		return battleBehaviour(armyAttack31)
		end
	