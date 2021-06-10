function VillageDefenders()
	local experience = LOW_EXPERIENCE	
	if CP_Difficulty > 0 then
		experience = experience + 2
	end

	local pos = GetPosition("VillageDef1")
	VDef1 = AI.Entity_CreateFormation(2, Entities.CU_BanditLeaderSword2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(VDef1, "P2Defence1")

	local pos = GetPosition("VillageDef2")
	VDef2 = AI.Entity_CreateFormation(2, Entities.CU_Barbarian_LeaderClub2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(VDef2, "P2Defence2")

	local pos = GetPosition("VillageDef3")
	VDef3 = AI.Entity_CreateFormation(2, Entities.CU_BanditLeaderSword2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(VDef3, "P2Defence3")


end