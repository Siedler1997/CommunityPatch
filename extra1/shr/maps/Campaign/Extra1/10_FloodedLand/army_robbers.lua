function CreateArmyRobbers()

	-- Init army
	ArmyRobbers						= 	{}
	ArmyRobbers.player 				=	6
	ArmyRobbers.id					=	1
	ArmyRobbers.strength			=	8
	ArmyRobbers.position			=	GetPosition("RobbersSpawnPos")
	ArmyRobbers.rodeLength			=	3000
	ArmyRobbers.retreatStrength		=	0
	ArmyRobbers.baseDefenseRange	=	3000
	ArmyRobbers.outerDefenseRange	=	3000
	ArmyRobbers.AttackAllowed		=	false
	ArmyRobbers.pulse				=	true
	
	if CP_Difficulty == 0 then
		ArmyRobbers.spawnTypes			=	{ 	{ Entities.CU_BanditLeaderSword1, 12 },
												{ Entities.CU_BanditLeaderBow1, 12 } }
		ArmyRobbers.respawnTime			=	5*60
		ArmyRobbers.maxSpawnAmount		= 	1
	else
		ArmyRobbers.spawnTypes			=	{ 	{ Entities.CU_BanditLeaderSword2, 12 },
												{ Entities.CU_BanditLeaderBow2, 12 } }
		ArmyRobbers.respawnTime			=	3*60
		ArmyRobbers.maxSpawnAmount		= 	2
	end
	ArmyRobbers.experiencePoints	=	CP_Difficulty
												
	ArmyRobbers.spawnGenerator		=	"RobberyTower"
	ArmyRobbers.spawnPos			=	GetPosition("RobbersSpawnPos")
	ArmyRobbers.endless				=	true
	
	-- Spawn generator
	SetupAITroopSpawnGenerator("ArmyRobbers", ArmyRobbers)

	StartSimpleJob("ControlArmyRobbers")

end

function ControlArmyRobbers()

	if Counter.Tick2("ControlArmyRobbers", 10) then

		--if IsAITroopGeneratorDead(ArmyRobbers) then
			
--			return true
			
	--	else
			
			TickOffensiveAIController(ArmyRobbers)
			
	--	end
		
	end

end
