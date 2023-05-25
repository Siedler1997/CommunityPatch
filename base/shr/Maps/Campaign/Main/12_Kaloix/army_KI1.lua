setupArmyKI1 = function()

	armyKI1						= {}

	armyKI1.player 				= 6
	armyKI1.id					= 1
	armyKI1.strength			= 2
	armyKI1.retreatStrength		= 1
	armyKI1.position				= GetPosition("KI1_Position")
	armyKI1.baseDefenseRange		= 6000
	armyKI1.outerDefenseRange		= 10000
	armyKI1.rodeLength			= 3000
	armyKI1.beAgressive		=	true
	armyKI1.AllowedTypes = { UpgradeCategories.BlackKnightLeaderMace1}

	armyKI1.Attack			= false
	armyKI1.AttackPos			= GetPosition("KI1_Entrace1")
	armyKI1.AttackAllowed		= false


	-- Setup army
	SetupArmy(armyKI1)
	
	-- Army generator
	SetupAITroopGenerator("KI1", armyKI1)
	
	-- Setup time line
	TimeLine.Enter("AttackArmy Size 4", TimeLine.Seconds + 1400, "IncreaseArmySize" )
--30min
	TimeLine.Enter("AttackAllow Bows", TimeLine.Seconds + 1800, "AllowBowLeader" )
--	TimeLine.Enter("AttackArmy Size 5", TimeLine.Seconds + 2000, "IncreaseArmySize" )
--36min
	TimeLine.Enter("AttackArmy Size 6", TimeLine.Seconds + 2200, "IncreaseArmySize" )
--	TimeLine.Enter("AttackArmy RetreatSize 6", TimeLine.Seconds + 2210, "IncreaseArmyRetreatSize" )
--	TimeLine.Enter("AttackArmy Size 7", TimeLine.Seconds + 2400, "IncreaseArmySize" )
	TimeLine.Enter("AttackAllow Cannon1", TimeLine.Seconds + 2600, "AllowCannon1" )
--46min
	TimeLine.Enter("AttackArmy Size 8", TimeLine.Seconds + 2800, "IncreaseArmySize" )
--	TimeLine.Enter("AttackArmy RetreatSize 8", TimeLine.Seconds + 2810, "IncreaseArmyRetreatSize" )
-- 50min
	TimeLine.Enter("AttackAllow Cannon2", TimeLine.Seconds + 3000, "AllowCannon2" )
-- 60min
	TimeLine.Enter("AttackAllow SuperTech", TimeLine.Seconds + 3600, "AllowSuperTech" )


	-- Start attack after 10 minutes
	TimeLine.Enter("Start Attack", TimeLine.Seconds + 1200, "StartKI1_Attack")

	-- Control army
	StartJob("ControlArmyKI1")
end

StartKI1_Attack = function()

	-- Begin attack
	armyKI1.AttackAllowed = true

end

IncreaseArmySize = function()
	armyKI1.strength = armyKI1.strength + 1
	armyKI1.retreatStrength = armyKI1.strength / 3

end
IncreaseArmyRetreatSize = function()
	armyKI1.retreatStrength = armyKI1.retreatStrength + 1

end

AllowBowLeader = function()
	table.insert(armyKI1.AllowedTypes, UpgradeCategories.LeaderBow)
end

AllowCannon1 = function()
	if CP_Difficulty == 0 then
		table.insert(armyKI1.AllowedTypes, Entities.PV_Cannon1)
	else
		table.insert(armyKI1.AllowedTypes, Entities.PV_Cannon2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 6)
	end
end

AllowCannon2 = function()
	if CP_Difficulty == 0 then
		table.insert(armyKI1.AllowedTypes, Entities.PV_Cannon2)
	else
		table.insert(armyKI1.AllowedTypes, Entities.PV_Cannon3)
		
		armyKI1.strength = armyKI1.strength + 3
		table.insert(armyKI1.AllowedTypes, UpgradeCategories.LeaderHeavyCavalry)
	end
end

AllowSuperTech = function()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechs(2, true)
		ResearchAllMilitaryTechs(5, true)
		ResearchAllMilitaryTechs(6, true)
		ResearchAllMilitaryTechs(7, true)
	end
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyKI1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyKI1 = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyKI1",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyKI1 = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyKI1)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
