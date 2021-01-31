function CreatePlayer1Army()
	local etype1 = Entities.PU_LeaderBow4
	local etype2 = Entities.PU_LeaderRifle2
	if CP_Difficulty == 1 then
		etype1 = Entities.PU_LeaderBow3
		etype2 = Entities.PU_LeaderRifle1
	end

	local pos 	= GetPosition("P1Spawn1")
	Group1 		= Tools.CreateGroup(1, etype1, 8, pos.X, pos.Y, 180)
	SetEntityName(Group1, "Group1")

	local pos 	= GetPosition("P1Spawn2")
	Group2 		= Tools.CreateGroup(1, etype1, 8, pos.X, pos.Y, 180)
	SetEntityName(Group2, "Group2")

	local pos 	= GetPosition("P1Spawn3")
	Group3 		= Tools.CreateGroup(1, etype2, 8, pos.X, pos.Y, 180)
	SetEntityName(Group3, "Group3")

	local pos 	= GetPosition("P1Spawn4")
	Group4 		= Tools.CreateGroup(1, etype1, 8, pos.X, pos.Y, 180)
	SetEntityName(Group4, "Group4")

end