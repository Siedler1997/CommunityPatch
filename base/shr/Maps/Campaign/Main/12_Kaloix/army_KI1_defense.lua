setupArmyKI1Defense = function()

	armyKI1Defense				= {}

	armyKI1Defense.player 				= 6
	armyKI1Defense.id					= 2
	armyKI1Defense.strength				= 3
	armyKI1Defense.retreatStrength		= 2
	armyKI1Defense.position				= GetPosition("KI1_Defense")
	armyKI1Defense.baseDefenseRange		= 3000
	armyKI1Defense.outerDefenseRange	= 4000
	armyKI1Defense.rodeLength			= 3000
	armyKI1Defense.beAgressive			=	false
	armyKI1Defense.AllowedTypes 		= { UpgradeCategories.BlackKnightLeaderMace1 }
	armyKI1Defense.Attack				= false
	armyKI1Defense.AttackAllowed		= false


	-- Setup army
	SetupArmy(armyKI1Defense)
	
	-- Army generator
	SetupAITroopGenerator("KI1Defense", armyKI1Defense)
	
		-- Setup time line
	TimeLine.Enter("Army Size 4", TimeLine.Seconds + 601, "DefenseIncreaseArmySize" )
	TimeLine.Enter("Allow Bows", TimeLine.Seconds + 901, "DefenseAllowBowLeader" )
	TimeLine.Enter("UpgradeArmy", TimeLine.Seconds + 902, "DefenseUpgradeArmy" )
	TimeLine.Enter("Army Size 5", TimeLine.Seconds + 1201, "DefenseIncreaseArmySize" )
	TimeLine.Enter("Army Size 6", TimeLine.Seconds + 1501, "DefenseIncreaseArmySize" )
	TimeLine.Enter("Army Size 7", TimeLine.Seconds + 1801, "DefenseIncreaseArmySize" )
	TimeLine.Enter("Allow Cannon1", TimeLine.Seconds + 2101, "DefenseAllowCannon1" )
	TimeLine.Enter("Army Size 8", TimeLine.Seconds + 2401, "DefenseIncreaseArmySize" )
	TimeLine.Enter("Allow Cannon2", TimeLine.Seconds + 2701, "DefenseAllowCannon2" )
	TimeLine.Enter("Allow Cavalry", TimeLine.Seconds + 3000, "DefenseAllowCavalry" )
	TimeLine.Enter("UpgradeArmy", TimeLine.Seconds + 4000, "DefenseUpgradeArmy" )

	
	-- Control army
	StartJob("ControlarmyKI1Defense")
end


DefenseIncreaseArmySize = function()

	armyKI1Defense.strength = armyKI1Defense.strength + 1

end

DefenseAllowBowLeader = function()

	table.insert(armyKI1Defense.AllowedTypes, UpgradeCategories.LeaderBow)

end

DefenseAllowCannon1 = function()
	if CP_Difficulty == 0 then
		table.insert(armyKI1Defense.AllowedTypes, Entities.PV_Cannon1)
	else
		table.insert(armyKI1Defense.AllowedTypes, Entities.PV_Cannon2)
	end
end

DefenseAllowCannon2 = function()
	if CP_Difficulty == 0 then
		table.insert(armyKI1Defense.AllowedTypes, Entities.PV_Cannon2)
	else
		table.insert(armyKI1Defense.AllowedTypes, Entities.PV_Cannon3)
	end
end

DefenseAllowCavalry = function()
	table.insert(armyKI1Defense.AllowedTypes, UpgradeCategories.LeaderHeavyCavalry)
		
	local bosspos1 = GetPosition("KI1_Target1")
	local bossID1 = AI.Entity_CreateFormation(6,Entities.CU_VeteranCaptain,0,0,(bosspos1.X + -300),(bosspos1.Y + 1500),0,0,3,0)
end

DefenseUpgradeArmy = function()
	for i = 1, 2 do
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)

		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)
	end

end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyKI1Defense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyKI1Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyKI1Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyKI1Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyKI1Defense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
