createQuestDefendNorfolk = function()

	setupDestroyAttackArmy(ArmyP2WinterAttacker1)
	setupDestroyAttackArmy(ArmyP2WinterAttacker2)
	setupDestroyAttackArmy(ArmyP2WinterAttacker3)
	setupDestroyAttackArmy(ArmyP2Attacker)
	setupDestroyAttackArmy(ArmyP2Defense1)
	setupDestroyAttackArmy(ArmyP2Defense2)

	setupDestroyAttackArmy(ArmyP4WinterAttacker1)
	setupDestroyAttackArmy(ArmyP4Attacker)
	setupDestroyAttackArmy(ArmyP4Defense1)

	if CP_Difficulty > 0 then
		setupDestroyAttackBoss("P2_Boss")
		setupDestroyAttackBoss("P4_Boss")
	end
	
	DiedCount	=	0
end

setupDestroyAttackArmy = function(_army)

	local Quest		=	{}
	Quest.Army		=	_army
	
	Quest.Callback	=	NorfolkAttackerDied
	
	SetupDestroy(Quest)
	
end

setupDestroyAttackBoss = function(_boss)

	local Quest		=	{}
	Quest.Target	=	_boss
	
	Quest.Callback	=	NorfolkAttackerDied
	
	SetupDestroy(Quest)
	
end

NorfolkAttackerDied = function()

	DiedCount = DiedCount + 1
	
	local necDies = 9
	if CP_Difficulty > 0 then
		necDies = necDies + 2
	end

	if DiedCount >= necDies and IsBriefingActive() ~= true then
		
		end3rdQuest()
	
	end

end