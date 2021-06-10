function CreateArmyPlayer()

	local Position = GetPosition("P1_BowLeaderSpawn")
	local LookAt = GetPosition("Dario")
	
	local bowmen = Entities.PU_LeaderBow3
	local spearmen = Entities.PU_LeaderPoleArm3
	if CP_Difficulty > 0 then
		bowmen = Entities.PU_LeaderBow2
		spearmen = Entities.PU_LeaderPoleArm2
	end
	-- Create bow men
	AI.Entity_CreateFormation(
			1,
			bowmen,
			0,
			16,
			Position.X,Position.Y,
			LookAt.X,LookAt.Y,
			0,
			0)



	-- Create bow and sword men
	for i=1,2 do
		
		local Position = GetPosition("Defence_Squad_Ranged_"..i)
		
		if i == 2 then
		
			AI.Entity_CreateFormation(
				1,
				bowmen,
				0,
				16,
				Position.X,Position.Y,
				0,0,
				0,
				0
			)

			Position = GetPosition("Defence_Squad_Thief_"..i)
		
			AI.Entity_CreateFormation(
				1,
				Entities.PU_Thief,
				0,
				16,
				Position.X,Position.Y,
				0,0,
				0,
				0
			)

		end

		Position = GetPosition("Defence_Squad_Melee_"..i)
					
		AI.Entity_CreateFormation(
			1,
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