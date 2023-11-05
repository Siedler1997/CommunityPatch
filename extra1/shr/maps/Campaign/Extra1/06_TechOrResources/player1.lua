function createPlayer1()
	ResearchTechnology(Technologies.GT_Construction)
	ResearchTechnology(Technologies.T_ThiefSabotage)
	ForbidTechnology(Technologies.B_Beautification16)

	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		ForbidTechnology(Technologies.GT_PulledBarrel)
		ForbidTechnology(Technologies.UP1_GunsmithWorkshop)
		ForbidTechnology(Technologies.T_UpgradeRifle1)
	end
end                                                       