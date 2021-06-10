function CreateArmyPlayer()


	local Position = GetPosition("PlayerRanged")
	local LookAt = GetPosition("Dario")

	local bowmen = Entities.PU_LeaderBow3
	local swordmen = Entities.PU_LeaderSword3
	if CP_Difficulty > 0 then
		bowmen = Entities.PU_LeaderBow2
		swordmen = Entities.PU_LeaderSword2
	end

	-- Create bow men
	Logic.SetEntityName(AI.Entity_CreateFormation(
						1,
						bowmen,
						0,
						16,
						Position.X,Position.Y,
						LookAt.X,LookAt.Y,
						0,
						0),"P1Ranged")

	Position = GetPosition("PlayerMelees")
	LookAt = GetPosition("Dario")

	-- Create bow men
	Logic.SetEntityName(AI.Entity_CreateFormation(
						1,
						swordmen,
						0,
						16,
						Position.X,Position.Y,
						LookAt.X,LookAt.Y,
						0,
						0),"P1Melees")


end