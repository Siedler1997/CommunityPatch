function createPlayer1()
	ResearchTechnology(Technologies.GT_Mercenaries)
	ResearchTechnology(Technologies.GT_StandingArmy)
	ResearchTechnology(Technologies.GT_Tactics)
	
	ResearchTechnology(Technologies.GT_Construction)
	
	ResearchTechnology(Technologies.GT_Alchemy)
	
	ResearchTechnology(Technologies.GT_Literacy)
	
	ResearchTechnology(Technologies.GT_Mathematics)
	ResearchTechnology(Technologies.GT_Binocular)
	
	ForbidTechnology(Technologies.GT_Matchlock)
	ForbidTechnology(Technologies.GT_PulledBarrel)
	
	ForbidTechnology(Technologies.B_GunsmithWorkshop)
	ForbidTechnology(Technologies.UP1_Tavern)
	ForbidTechnology(Technologies.MU_LeaderRifle)
	ForbidTechnology(Technologies.T_UpgradeRifle1)
	ForbidTechnology(Technologies.T_ThiefSabotage)
	ForbidTechnology(Technologies.T_ScoutForester)
	ForbidTechnology(Technologies.B_Beautification16)

	if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
		ForbidTechnology(Technologies.UP2_Tower)
		ForbidTechnology(Technologies.GT_Chemistry)
		ForbidTechnology(Technologies.UP1_Foundry)
		ForbidTechnology(Technologies.UP2_Claymine)
		ForbidTechnology(Technologies.UP2_Stonemine)
		ForbidTechnology(Technologies.UP2_Ironmine)
		ForbidTechnology(Technologies.UP2_Sulfurmine)
		ForbidTechnology(Technologies.MU_Cannon3)
		ForbidTechnology(Technologies.MU_Cannon4)
		ForbidTechnology(Technologies.T_BetterChassis)
	end
end                                                       