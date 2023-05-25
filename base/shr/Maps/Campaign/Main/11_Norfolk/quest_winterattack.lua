createQuestWinterAttack = function()

	StartJob("WeatherChange")

	Count = 0
end

Condition_WeatherChange = function()

	Count = Count + 1
	
	return Count > WinterTime and not Logic.IsWeatherChangeActive() and IsBriefingActive() ~= true --3600

end

Action_WeatherChange = function()

	StartBinkVideo("Norfolk")

	-- Start snow
	Logic.AddWeatherElement(3, 1000000, 0, 3, 5, 10)
	
	if BuildIronTowers1Page ~= nil then
		ResolveBriefing(BuildIronTowers1Page)
		ResolveBriefing(BuildIronTowers2Page)
	end

	createBriefingWinterWarning()

	StartJob("PlayerWeatherChange")

	if talkedToLeonardo == true 
		then
			-- Allow weather machine
			Report("WaetherTechsALLOWED")
			Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 2)
			Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_PowerPlant, 2)
			Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 2)
			Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 2)
		else
			Report("WaetherTechsFORBIDDEN")
		
		end
		
		

	-- Setup attack armies
	MapLocal_StartCountDown(WinterAttackCountdown)

	-- clear all Sulfur from P2
	P2SulfurRaw = Logic.GetPlayersGlobalResource(2,ResourceType.SulfurRaw)
	P2Sulfur = Logic.GetPlayersGlobalResource(2,ResourceType.Sulfur)
	
	Logic.SubFromPlayersGlobalResource(2,ResourceType.SulfurRaw,P2SulfurRaw)
	Logic.SubFromPlayersGlobalResource(2,ResourceType.Sulfur,P2Sulfur)

	setupNorfolkWinterArmy()
--	setupArmyP2WinterAttacker()
--	setupArmyP4WinterAttacker()

	-- Give resources
	Logic.AddToPlayersGlobalResource(2, ResourceType.GoldRaw, 5000)
	Logic.AddToPlayersGlobalResource(4, ResourceType.GoldRaw, 5000)

	--StartCountdown(WinterAttackCountdown, startNorfolkWinterAttack, true)
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechs(2, true)
		ResearchAllMilitaryTechs(3, true)	--No enemy, but has to survive attacks without help
		ResearchAllMilitaryTechs(4, true)
		ResearchAllMilitaryTechs(6, true)
	end

	return true
end


setupNorfolkWinterArmy = function()
Report("SetupWinterArmy")
	setupArmyP2WinterAttacker()
	setupArmyP4WinterAttacker()
	
	if CP_Difficulty > 0 then
		StartSimpleJob("SetupBossesWinterGather")
	end
end

startNorfolkWinterAttack = function()
Report("StartWinterAttack!!!")
	WinterAttackAttackRunning = true
	StartArmyP2WinterAttacker()
	StartArmyP4WinterAttacker()
	--Give KI enough Res to refresh fast (except Sulphur):
	Tools.GiveResouces(2, 5000, 5000, 5000, 5000, 5000, 0)
	Tools.GiveResouces(4, 5000, 5000, 5000, 5000, 5000, 0)
	
	if CP_Difficulty > 0 then
		StartSimpleJob("ControlBossesWinterAttack")
	end
	
	MapLocal_StopCountDown(0)
	createQuestDefendNorfolk()
	Sound.Play2DSound(Sounds.Misc_so_signalhorn, 0,75)
end
