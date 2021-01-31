function CreateTentsArmy()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_Barbarian_LeaderClub1
	local etype2 = Entities.CU_BanditLeaderSword1
	if CP_Difficulty == 1 then
		experience = experience + 2
		etype1 = Entities.CU_Barbarian_LeaderClub2
		etype2 = Entities.CU_BanditLeaderSword2
	end

	local pos 	= GetPosition("TentGroup1")
	Tent1Group1 = AI.Entity_CreateFormation(7, Entities.CU_BanditLeaderBow1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent1Group1, "Tent1Group1")

	local pos 	= GetPosition("TentGroup2")
	Tent1Group2 	= AI.Entity_CreateFormation(7, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent1Group2, "Tent1Group2")

	local pos 	= GetPosition("TentGroup3")
	Tent2Group1 	= AI.Entity_CreateFormation(7, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent2Group1, "Tent2Group1")

	local pos 	= GetPosition("TentGroup4")
	Tent2Group2 	= AI.Entity_CreateFormation(7, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent2Group2, "Tent2Group2")

	local pos 	= GetPosition("TentGroup5")
	Tent3Group1 	= AI.Entity_CreateFormation(7, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent3Group1, "Tent3Group1")

	local pos 	= GetPosition("TentGroup6")
	Tent3Group2 	= AI.Entity_CreateFormation(7, Entities.CU_BanditLeaderBow1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent3Group2, "Tent3Group2")


	local pos 	= GetPosition("TentGroup7")
	Tent4Group1 	= AI.Entity_CreateFormation(7, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent4Group1, "Tent4Group1")

	local pos 	= GetPosition("TentGroup8")
	Tent4Group2 	= AI.Entity_CreateFormation(7, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent4Group2, "Tent4Group2")

	local pos 	= GetPosition("TentGroup9")
	Tent5Group1 	= AI.Entity_CreateFormation(7, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent5Group1, "Tent5Group1")

	local pos 	= GetPosition("TentGroup10")
	Tent5Group2 	= AI.Entity_CreateFormation(7, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent5Group2, "Tent5Group2")

	local pos 	= GetPosition("TentGroup11")
	Tent6Group1 	= AI.Entity_CreateFormation(7, Entities.CU_BanditLeaderBow1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent6Group1, "Tent6Group1")

	local pos 	= GetPosition("TentGroup12")
	Tent6Group2 	= AI.Entity_CreateFormation(7, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Tent6Group2, "Tent6Group2")

end