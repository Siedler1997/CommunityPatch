function CreatePlayer1()
	-- Forbid market
	ForbidTechnology(Technologies.UP1_Market)
	ForbidTechnology(Technologies.B_Outpost)
	ResearchTechnology(Technologies.T_ThiefSabotage)

	if GDB.GetValue("Game\\Campaign_Difficulty") < 2 then
		ResearchTechnology(Technologies.GT_Mercenaries)
		ResearchTechnology(Technologies.GT_Construction)
		ResearchTechnology(Technologies.GT_Alchemy)
		ResearchTechnology(Technologies.GT_Literacy)
		ResearchTechnology(Technologies.GT_Mathematics)
		ResearchTechnology(Technologies.GT_Binocular)

		if GDB.GetValue("Game\\Campaign_Difficulty") == 0 then
			ResearchTechnology(Technologies.GT_StandingArmy)	
			ResearchTechnology(Technologies.GT_GearWheel)
			ResearchTechnology(Technologies.GT_Matchlock)
		end
	end
end