function createPlayer1()
	ForbidTechnology(Technologies.GT_PulledBarrel)
	ForbidTechnology(Technologies.UP1_GunsmithWorkshop)
	ForbidTechnology(Technologies.T_UpgradeRifle1)
	ForbidTechnology(Technologies.B_Beautification16)
	ForbidTechnology(Technologies.T_PlateBardingArmor)
	
	ForbidTechnology(Technologies.T_ChangeWeather)
	ForbidTechnology(Technologies.T_WeatherForecast)
	ForbidTechnology(Technologies.B_Weathermachine)
	ForbidTechnology(Technologies.B_PowerPlant)
	
	if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
		ForbidTechnology(Technologies.GT_Matchlock)
		ForbidTechnology(Technologies.B_GunsmithWorkshop)
		ForbidTechnology(Technologies.UP1_Tavern)
		ForbidTechnology(Technologies.MU_LeaderRifle)
		ForbidTechnology(Technologies.T_ThiefSabotage)
		ForbidTechnology(Technologies.T_ScoutForester)

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