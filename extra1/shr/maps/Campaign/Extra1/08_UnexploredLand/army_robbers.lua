function CreateArmyRobbers()

	ArmyRobbers	=	{}
	
	for i=1,2 do
		-- Init army
		ArmyRobbers[i]						= 	{}
		ArmyRobbers[i].player 				=	7
		ArmyRobbers[i].id					=	0+i
		ArmyRobbers[i].strength				=	8
		ArmyRobbers[i].position				=	GetPosition("RobbersSpawnPos"..i)
		ArmyRobbers[i].rodeLength			=	3000
		ArmyRobbers[i].retreatStrength		=	0
		ArmyRobbers[i].baseDefenseRange		=	2000
		ArmyRobbers[i].outerDefenseRange	=	2500
		ArmyRobbers[i].AttackAllowed		=	false
		ArmyRobbers[i].pulse				=	true

		if CP_Difficulty == 0 then
			ArmyRobbers[i].spawnTypes			=	{ 	{ Entities.CU_BanditLeaderSword1, 12 },
													{ Entities.CU_BanditLeaderBow1, 12 } }
			ArmyRobbers[i].respawnTime			=	5*60
			ArmyRobbers[i].maxSpawnAmount		= 	1
		else
			ArmyRobbers[i].spawnTypes			=	{ 	{ Entities.CU_BanditLeaderSword2, 12 },
													{ Entities.CU_BanditLeaderBow2, 12 } }
			ArmyRobbers[i].respawnTime			=	3*60
			ArmyRobbers[i].maxSpawnAmount		= 	2
		end	

												
		ArmyRobbers[i].spawnGenerator		=	"RobberyTower"..i
		ArmyRobbers[i].spawnPos				=	GetPosition("RobbersSpawnPos"..i)
		ArmyRobbers[i].endless				=	true
		ArmyRobbers[i].experiencePoints		=	CP_Difficulty
	
		-- Spawn generator
		SetupAITroopSpawnGenerator("ArmyRobbers"..i, ArmyRobbers[i])
	end

	StartSimpleJob("ControlArmyRobbers")

end

function ControlArmyRobbers()

	if Counter.Tick2("ControlArmyRobbers", 10) then

		for i=1,2 do
		
			TickOffensiveAIController(ArmyRobbers[i])
		
		end
		
	end

end
