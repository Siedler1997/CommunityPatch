function CreatePlayer1()
	-- Forbid market
	ForbidTechnology(Technologies.UP1_Market)
	ForbidTechnology(Technologies.B_Outpost)
	ResearchTechnology(Technologies.T_ThiefSabotage)
	ForbidTechnology(Technologies.T_ChangeWeather)
	ForbidTechnology(Technologies.T_WeatherForecast)
	ForbidTechnology(Technologies.B_Weathermachine)
	ForbidTechnology(Technologies.B_PowerPlant)

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