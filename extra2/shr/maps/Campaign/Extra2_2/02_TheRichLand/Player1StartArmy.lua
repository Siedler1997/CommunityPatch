function P1StartArmy()
	local etype1 = Entities.PU_LeaderBow3
	if CP_Difficulty > 0 then
		etype1 = Entities.PU_LeaderBow2
	end

	local pos = GetPosition("ArmyStart1")
	Escort1 = AI.Entity_CreateFormation(1, etype1, 0, 8, pos.X, pos.Y, 0, 0, 2, 0)
	SetEntityName(Escort1, "P1Archers1")
	LookAt(Escort1, "Pilgrim")

	local pos = GetPosition("ArmyStart2")
	Escort2 = AI.Entity_CreateFormation(1, Entities.PU_LeaderRifle1, 0, 8, pos.X, pos.Y, 0, 0, 2, 0)
	SetEntityName(Escort2, "P1Archers2")
	LookAt(Escort2, "Pilgrim")

end