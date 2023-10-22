
-- At Castle area SW of Kerberos' castle

ARMYRAIDING_FIRSTATTACK 	=	10 * 60		
ARMYRAIDING_SECONDTATTACK	= 	30 * 60

setupArmyRaiding = function()

	ArmyRaiding							= {}

	ArmyRaiding.player 					= 5
	ArmyRaiding.id						= 1
	ArmyRaiding.strength				= 2
	ArmyRaiding.retreatStrength			= 1
	ArmyRaiding.position				= GetPosition("KerberosDefenseSpawnPos")		-- at Outpost
	ArmyRaiding.rodeLength				= 3000
	ArmyRaiding.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword
										}

	ArmyRaiding.baseDefenseRange		= 6000
	ArmyRaiding.outerDefenseRange		= 8000
	ArmyRaiding.Attack					= false
	ArmyRaiding.AttackPos				= GetPosition("KerberosDefenseSpawnPos")
	ArmyRaiding.AttackAllowed			= false

	-- Setup army
	SetupArmy(ArmyRaiding)
	
	
	
	-- Army generator
	SetupAITroopGenerator("Raiding", ArmyRaiding)
	
	ArmyRaiding2						= 	{}
                                          	
	ArmyRaiding2.player 				= 	5
	ArmyRaiding2.id						= 	8
	ArmyRaiding2.strength				= 	2
	ArmyRaiding2.retreatStrength		= 	1
	ArmyRaiding2.position				= 	GetPosition("P5_DefensePos")
	ArmyRaiding2.rodeLength				= 	3000
	ArmyRaiding2.AllowedTypes 			= 	{ 	UpgradeCategories.LeaderPoleArm, 
												UpgradeCategories.LeaderSword
											}

	ArmyRaiding2.baseDefenseRange		= 	2000
	ArmyRaiding2.outerDefenseRange		= 	4000
	ArmyRaiding2.Attack					= 	false
--	ArmyRaiding2.AttackPos				= 	GetPosition("P5_AttackPos")						-- GetPosition("P5_AttackPos")
	ArmyRaiding2.AttackPos				= 	GetPosition("P5_DefensePos")					-- TF: Original entry
	ArmyRaiding2.AttackAllowed			= 	false


	-- Setup army
	SetupArmy(ArmyRaiding2)


	
	-- Start attack	at time:
	TimeLine.Enter("Start Attack", 			TimeLine.Seconds + ARMYRAIDING_FIRSTATTACK, 	"StartRaiding_Attack")
	TimeLine.Enter("Start Attack2", 		TimeLine.Seconds + ARMYRAIDING_SECONDTATTACK, 	"StartRaiding_Attack2")


	-- change army settings at time:
	TimeLine.Enter("Allow bow", 			TimeLine.Seconds +  20*60, "AllowP5Bow")
	TimeLine.Enter("Upgrade bow to 3",		TimeLine.Seconds +  36*60, "UpgradeP5Bow")
	TimeLine.Enter("Upgrade bow to 4",		TimeLine.Seconds +  50*60, "UpgradeP5Bow")
                                                                
	TimeLine.Enter("Upgrade pike to 3",		TimeLine.Seconds +  32*60, "UpgradeP5Pike")
	TimeLine.Enter("Upgrade pike to 4",		TimeLine.Seconds +  41*60, "UpgradeP5Pike")
                                                                
	TimeLine.Enter("Upgrade sword to 3",	TimeLine.Seconds +  35*60, "UpgradeP5Sword")
	TimeLine.Enter("Upgrade sword to 4",	TimeLine.Seconds +  45*60, "UpgradeP5Sword")
                                                                
	TimeLine.Enter("Cannon 2", 				TimeLine.Seconds +  22*60, "AllowP5Cannon2")
	TimeLine.Enter("Cannon 4", 				TimeLine.Seconds +  52*60, "AllowP5Cannon4")

	TimeLine.Enter("Cavalery", 				TimeLine.Seconds +  40*60, "AllowP5Cavalery")
	TimeLine.Enter("Upgrade cavalery",		TimeLine.Seconds +  55*60, "UpgradeP5Cavalery")
	TimeLine.Enter("Upgrade hvy cavalery",	TimeLine.Seconds +  65*60, "UpgradeP5HeavyCavalery")


	TimeLine.Enter("Increase Size to 3/1", 	TimeLine.Seconds +  16*60, "IncreaseP5AttackSize")
	TimeLine.Enter("Increase Size to 4/1", 	TimeLine.Seconds +  37*60, "IncreaseP5AttackSize")
	TimeLine.Enter("Increase Size to 5/1", 	TimeLine.Seconds +  51*60, "IncreaseP5AttackSize")
	TimeLine.Enter("Increase Size to 6/2", 	TimeLine.Seconds +  80*60, "IncreaseP5AttackSize")
	if CP_Difficulty == 0 then
		TimeLine.Enter("Upgrade pike to 2",		TimeLine.Seconds +  10*60, "UpgradeP5Pike")
		TimeLine.Enter("Upgrade sword to 2",	TimeLine.Seconds +  21*60, "UpgradeP5Sword")
		TimeLine.Enter("Upgrade bow to 2",		TimeLine.Seconds +  26*60, "UpgradeP5Bow")
	else
		UpgradeP5Sword()
		UpgradeP5Pike()
		UpgradeP5Bow()
		IncreaseP5AttackSize()
		TimeLine.Enter("Increase Size to X1", 	TimeLine.Seconds +  30*60, "IncreaseP5AttackSize")
	end
	
	-- Army generator
	SetupAITroopGenerator("Raiding2", ArmyRaiding2)
	
	-- Control armies
	StartJob("ControlArmyRaiding")	
end



StartRaiding_Attack = function()

	ArmyRaiding.AttackAllowed = true

end



StartRaiding_Attack2 = function()

	ArmyRaiding2.AttackAllowed = true

end



IncreaseP5AttackSize = function()

	ArmyRaiding.strength			= 	ArmyRaiding.strength + 1
	ArmyRaiding.retreatStrength		= 	ArmyRaiding.strength / 3

	ArmyRaiding2.strength			= 	ArmyRaiding2.strength + 1
	ArmyRaiding2.retreatStrength	= 	ArmyRaiding2.strength / 3
	
end



AllowP5Cavalery = function()

	table.insert(ArmyRaiding.AllowedTypes, 	UpgradeCategories.LeaderCavalry)
	table.insert(ArmyRaiding.AllowedTypes, 	UpgradeCategories.LeaderHeavyCavalry)

	table.insert(ArmyRaiding2.AllowedTypes, UpgradeCategories.LeaderCavalry)
	table.insert(ArmyRaiding2.AllowedTypes, UpgradeCategories.LeaderHeavyCavalry)
end


AllowP5Bow = function()

	table.insert(ArmyRaiding.AllowedTypes, 	UpgradeCategories.LeaderBow)
	table.insert(ArmyRaiding2.AllowedTypes, UpgradeCategories.LeaderBow)

end


AllowP5Cannon2 = function()

	table.insert(ArmyRaiding.AllowedTypes, 	Entities.PV_Cannon2)
	table.insert(ArmyRaiding2.AllowedTypes, Entities.PV_Cannon2)

end



AllowP5Cannon4 = function()

	table.insert(ArmyRaiding.AllowedTypes, 	Entities.PV_Cannon4a)
	table.insert(ArmyRaiding.AllowedTypes, 	Entities.PV_Cannon4a)
	table.insert(ArmyRaiding2.AllowedTypes, Entities.PV_Cannon4a)
	table.insert(ArmyRaiding2.AllowedTypes, Entities.PV_Cannon4a)


end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyRaiding"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyRaiding = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyRaiding",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyRaiding = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyRaiding)
		TickOffensiveAIController(ArmyRaiding2)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
