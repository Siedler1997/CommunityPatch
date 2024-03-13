function CreateArmyPlayer()
	local Position = GetPosition("P1_BowLeaderSpawn")
	
	local bowmen = Entities.PU_LeaderBow3
	local spearmen = Entities.PU_LeaderPoleArm3
	if CP_Difficulty > 0 then
		bowmen = Entities.PU_LeaderBow2
		spearmen = Entities.PU_LeaderPoleArm2
	end
	-- Create rifle men
	LookAt(AI.Entity_CreateFormation(
			1,
			Entities.PU_LeaderRifle1,
			0,
			16,
			Position.X,Position.Y,
			0,0,
			2-CP_Difficulty,
			0), "Dario")

	Position = GetPosition("Defence_Squad_Thief_1")
	LookAt(AI.Entity_CreateFormation(
			1,
			Entities.PU_Thief,
			0,
			16,
			Position.X,Position.Y,
			0,0,
			3,
			0), "Dario")

	-- Create bow and sword men
	for i=1,2 do
		local Position = GetPosition("Defence_Squad_Ranged_"..i)
		AI.Entity_CreateFormation(
			4,
			bowmen,
			0,
			16,
			Position.X,Position.Y,
			0,0,
			0,
			0
		)

		Position = GetPosition("Defence_Squad_Melee_"..i)		
		AI.Entity_CreateFormation(
			4,
			spearmen,
			0,
			16,
			Position.X,Position.Y,
			0,0,
			0,
			0
		)
	end
end