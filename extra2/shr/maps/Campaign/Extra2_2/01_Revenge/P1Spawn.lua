Player1Spawn=function()

----------------------------------Player 1 Spawn Archers---------------------
	local etype = Entities.PU_LeaderBow3
	if CP_Difficulty == 1 then
		etype = Entities.PU_LeaderBow2
	end

	local pos = GetPosition("p1spawn1")
	Escort1 = AI.Entity_CreateFormation(1, etype, 0, 8, pos.X, pos.Y, 0, 0, 2, 0)
	SetEntityName(Escort1, "P1Archers1")
	LookAt(Escort1, "Pilgrim")

	local pos = GetPosition("p1spawn2")
	Escort2 = AI.Entity_CreateFormation(1, Entities.PU_LeaderRifle1, 0, 8, pos.X, pos.Y, 0, 0, 2, 0)
	SetEntityName(Escort2, "P1Archers2")
	LookAt(Escort2, "Pilgrim")

end