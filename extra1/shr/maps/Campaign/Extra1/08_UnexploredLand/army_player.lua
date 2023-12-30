function CreateArmyPlayer()
	local bowmen = Entities.PU_LeaderBow3
	local swordmen = Entities.PU_LeaderSword3
	if CP_Difficulty > 0 then
		bowmen = Entities.PU_LeaderBow2
		swordmen = Entities.PU_LeaderSword2
	end

	local Position = GetPosition("PlayerRanged")
	-- Create bow men
	Logic.SetEntityName(AI.Entity_CreateFormation(
						1,
						bowmen,
						0,
						16,
						Position.X,Position.Y,
						0,0,
						2,
						0),"P1Ranged")
	LookAt("P1Ranged", "Dario")

	Position = GetPosition("PlayerMelees")
	-- Create bow men
	Logic.SetEntityName(AI.Entity_CreateFormation(
						1,
						swordmen,
						0,
						16,
						Position.X,Position.Y,
						0,0,
						2,
						0),"P1Melees")
	LookAt("P1Melees", "Dario")
end