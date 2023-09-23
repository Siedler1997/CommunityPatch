
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("gameControl")

IncludeLocals("player_2")
IncludeLocals("player_3")
IncludeLocals("player_4")
IncludeLocals("player_5")

IncludeLocals("briefing_prelude")
IncludeLocals("briefing_merchant1")

IncludeLocals("army_spawn")
IncludeLocals("burnTowers")


IncludeLocals("quest_rewards")
IncludeLocals("quest_defeat")
IncludeLocals("quest_victory")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
    Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
    Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
    Logic.SetDiplomacyState( 2, 3, Diplomacy.Neutral )
    Logic.SetDiplomacyState( 2, 4, Diplomacy.Neutral )
    Logic.SetDiplomacyState( 2, 5, Diplomacy.Neutral )
    Logic.SetDiplomacyState( 3, 4, Diplomacy.Neutral )
    Logic.SetDiplomacyState( 3, 5, Diplomacy.Neutral )
    Logic.SetDiplomacyState( 4, 5, Diplomacy.Neutral )

end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	GlobalMissionScripting.GiveResouces(1, 1500, 2000, 1500, 2000, 1500, 1000)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 0)
    Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Tower, 0)
	
	ResearchAllMilitaryTechsAddOn(2)
	--ResearchAllMilitaryTechsAddOn(3)
	ResearchAllMilitaryTechsAddOn(4)
	ResearchAllMilitaryTechsAddOn(5)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

	Display.SetRenderUseGfxSets(1)
	
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)
	WeatherSets_SetupNormal(4, 0, 1)
	WeatherSets_SetupRain(5, 1, 1)
	WeatherSets_SetupSnow(6, 0, 0)
	WeatherSets_SetupSnow(7, 1, 0)
	WeatherSets_SetupSnow(8, 1, 1)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 140, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 320, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(2, 60, 1, 5, 5, 10)	-- Foggy with Rain and Snow
	Logic.AddWeatherElement(2, 60, 1, 4, 5, 10)	-- Foggy with Snow
	Logic.AddWeatherElement(3, 320, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 120, 1, 6, 5, 10)	-- Winter
	Logic.AddWeatherElement(3, 200, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 90, 1, 8, 5, 10)	-- Winter with Rain and Snow
	Logic.AddWeatherElement(3, 60, 1, 7, 5, 10)	-- Winter with Rain
	Logic.AddWeatherElement(2, 90, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 130, 1, 2, 5, 10)	-- Foggy with Rain

end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
 	-- set player colors
	Display.SetPlayerColorMapping(1, p1color)
	Display.SetPlayerColorMapping(2, 5)	
	if p1color == 3 then
		Display.SetPlayerColorMapping(3, 8)		
	end	
	Display.SetPlayerColorMapping(5, 6)		
	Display.SetPlayerColorMapping(8, 11)		

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	String.Init("SP_Old_Enemies")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()
	
	--	exploring
	
	--	Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

	--	create players
	
		createPlayer2()
        createPlayer3()
        createPlayer4()
		createPlayer5()


        --      Create Armies

                CreateArmyOne()
                CreateDefSouth()
                CreateBandit1()
                CreateBandit2()
                CreateDefMid1()
                CreateDefMid2()
                CreateMainDef1()
                CreateMainDef2()
                CreateMainDef3()
                CreateMainDef4()
                CreateMainDef5()
                CreateMainDef6()
                CreateMainDef7()
                CreateMainDef8()
                CreateMainDef9()
                CreateNorthDef1()
                CreateNorthDef2()
                CreateNorthDef3()
                CreateNorthDef4()
                CreateFirstCon()
                CreateSecCon()

	-- Set Music-Set

		LocalMusic.UseSet = EUROPEMUSIC
	
	--	start quest
	
		create1stQuest()

		--Tools.ExploreArea(-1, -1, 900)
		    	
end



---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateArmyOne()

	armyOne				= {}

	armyOne.player 			= 2
	armyOne.id			= 1
	armyOne.strength		= 8
	armyOne.position		= GetPosition("armyOne")
	armyOne.rodeLength		= 1000

	SetupArmy(armyOne)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

	EnlargeArmy(armyOne,troopDescription)
	EnlargeArmy(armyOne,troopDescription)
	EnlargeArmy(armyOne,troopDescription)
	EnlargeArmy(armyOne,troopDescription)
	EnlargeArmy(armyOne,troopDescription)
	EnlargeArmy(armyOne,troopDescription)


    StartSimpleJob("ControlArmyOne")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateArmyTwo()

	armyTwo				= {}

	armyTwo.player 			= 2
	armyTwo.id			= 2
	armyTwo.strength		= 8
	armyTwo.position		= GetPosition("armyOne")
	armyTwo.rodeLength		= 1000

	SetupArmy(armyTwo)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderCavalry2
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)


    StartSimpleJob("ControlArmyTwo")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateDefSouth()

	DefSouth			= {}

	DefSouth.player 		= 3
	DefSouth.id			= 3
	DefSouth.strength		= 8
	DefSouth.position		= GetPosition("DefSouth")
	DefSouth.rodeLength		= 2000

	SetupArmy(DefSouth)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm2

	EnlargeArmy(DefSouth,troopDescription)
	EnlargeArmy(DefSouth,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderSword2
	EnlargeArmy(DefSouth,troopDescription)
	EnlargeArmy(DefSouth,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow2
	EnlargeArmy(DefSouth,troopDescription)
	EnlargeArmy(DefSouth,troopDescription)


    StartSimpleJob("ControlDefSouth")

    end


---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateBandit1()

	Bandit1		          	= {}

	Bandit1.player 		        = 3
	Bandit1.id			= 4
	Bandit1.strength		= 8
	Bandit1.position		= GetPosition("Bandit1")
	Bandit1.rodeLength		= 1000

	SetupArmy(Bandit1)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm2

	EnlargeArmy(Bandit1,troopDescription)
	EnlargeArmy(Bandit1,troopDescription)
	EnlargeArmy(Bandit1,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow2
	EnlargeArmy(Bandit1,troopDescription)
	EnlargeArmy(Bandit1,troopDescription)


    StartSimpleJob("ControlBandit1")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateBandit2()

	Bandit2		          	= {}

	Bandit2.player 		        = 3
	Bandit2.id			= 6
	Bandit2.strength		= 8
	Bandit2.position		= GetPosition("Bandit2")
	Bandit2.rodeLength		= 1000

	SetupArmy(Bandit2)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword2

	EnlargeArmy(Bandit2,troopDescription)
	EnlargeArmy(Bandit2,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow2
	EnlargeArmy(Bandit2,troopDescription)
	EnlargeArmy(Bandit2,troopDescription)




    StartSimpleJob("ControlBandit2")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateDefMid1()

	DefMid1		          	= {}

	DefMid1.player 		        = 5
	DefMid1.id			= 1
	DefMid1.strength		= 8
	DefMid1.position		= GetPosition("DefMid1")
	DefMid1.rodeLength		= 1000

	SetupArmy(DefMid1)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword3

	EnlargeArmy(DefMid1,troopDescription)
	EnlargeArmy(DefMid1,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderPoleArm3
	EnlargeArmy(DefMid1,troopDescription)
	EnlargeArmy(DefMid1,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow3
	EnlargeArmy(DefMid1,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderRifle1
	EnlargeArmy(DefMid1,troopDescription)



    StartSimpleJob("ControlDefMid1")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateDefMid2()

	DefMid2		          	= {}

	DefMid2.player 		        = 5
	DefMid2.id			= 2
	DefMid2.strength		= 8
	DefMid2.position		= GetPosition("DefMid2")
	DefMid2.rodeLength		= 1000

	SetupArmy(DefMid2)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry1

	EnlargeArmy(DefMid2,troopDescription)
	EnlargeArmy(DefMid2,troopDescription)
	EnlargeArmy(DefMid2,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderCavalry2
	EnlargeArmy(DefMid2,troopDescription)


    StartSimpleJob("ControlDefMid2")

    end




---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef1()

	MainDef1			= {}

	MainDef1.player 		= 2
	MainDef1.id			= 3
	MainDef1.strength		= 8
	MainDef1.position		= GetPosition("MainDef1")
	MainDef1.rodeLength		= 1000

	SetupArmy(MainDef1)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

	EnlargeArmy(MainDef1,troopDescription)
	EnlargeArmy(MainDef1,troopDescription)
	EnlargeArmy(MainDef1,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderCavalry2
	EnlargeArmy(MainDef1,troopDescription)
	EnlargeArmy(MainDef1,troopDescription)


    StartSimpleJob("ControlMainDef1")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef2()

	MainDef2			= {}

	MainDef2.player 		= 2
	MainDef2.id			= 4
	MainDef2.strength		= 8
	MainDef2.position		= GetPosition("MainDef2")
	MainDef2.rodeLength		= 1000

	SetupArmy(MainDef2)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow4

	EnlargeArmy(MainDef2,troopDescription)
	EnlargeArmy(MainDef2,troopDescription)
	EnlargeArmy(MainDef2,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderRifle2
	EnlargeArmy(MainDef2,troopDescription)
	EnlargeArmy(MainDef2,troopDescription)


    StartSimpleJob("ControlMainDef2")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef3()

	MainDef3			= {}

	MainDef3.player 		= 2
	MainDef3.id			= 5
	MainDef3.strength		= 8
	MainDef3.position		= GetPosition("MainDef3")
	MainDef3.rodeLength		= 1000

	SetupArmy(MainDef3)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow4

	EnlargeArmy(MainDef3,troopDescription)
	EnlargeArmy(MainDef3,troopDescription)
	EnlargeArmy(MainDef3,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderRifle2
	EnlargeArmy(MainDef3,troopDescription)
	EnlargeArmy(MainDef3,troopDescription)


    StartSimpleJob("ControlMainDef3")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef4()

	MainDef4			= {}

	MainDef4.player 		= 2
	MainDef4.id			= 6
	MainDef4.strength		= 8
	MainDef4.position		= GetPosition("MainDef4")
	MainDef4.rodeLength		= 1000

	SetupArmy(MainDef4)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword4

	EnlargeArmy(MainDef4,troopDescription)
	EnlargeArmy(MainDef4,troopDescription)
	EnlargeArmy(MainDef4,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow4
	EnlargeArmy(MainDef4,troopDescription)
	EnlargeArmy(MainDef4,troopDescription)


    StartSimpleJob("ControlMainDef4")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef5()

	MainDef5			= {}

	MainDef5.player 		= 2
	MainDef5.id			= 7
	MainDef5.strength		= 8
	MainDef5.position		= GetPosition("MainDef5")
	MainDef5.rodeLength		= 1000

	SetupArmy(MainDef5)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

	EnlargeArmy(MainDef5,troopDescription)
	EnlargeArmy(MainDef5,troopDescription)
	EnlargeArmy(MainDef5,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderCavalry2
	EnlargeArmy(MainDef5,troopDescription)
	EnlargeArmy(MainDef5,troopDescription)


    StartSimpleJob("ControlMainDef5")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef6()

	MainDef6			= {}

	MainDef6.player 		= 2
	MainDef6.id			= 8
	MainDef6.strength		= 8
	MainDef6.position		= GetPosition("MainDef6")
	MainDef6.rodeLength		= 1000

	SetupArmy(MainDef6)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

	EnlargeArmy(MainDef6,troopDescription)
	EnlargeArmy(MainDef6,troopDescription)
	EnlargeArmy(MainDef6,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderCavalry2
	EnlargeArmy(MainDef6,troopDescription)
	EnlargeArmy(MainDef6,troopDescription)


    StartSimpleJob("ControlMainDef6")

    end


---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef7()

	MainDef7			= {}

	MainDef7.player 		= 4
	MainDef7.id			= 1
	MainDef7.strength		= 8
	MainDef7.position		= GetPosition("MainDef7")
	MainDef7.rodeLength		= 1000

	SetupArmy(MainDef7)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow3

	EnlargeArmy(MainDef7,troopDescription)
	EnlargeArmy(MainDef7,troopDescription)
	EnlargeArmy(MainDef7,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderRifle1
	EnlargeArmy(MainDef7,troopDescription)
	EnlargeArmy(MainDef7,troopDescription)


    StartSimpleJob("ControlMainDef7")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef8()

	MainDef8			= {}

	MainDef8.player 		= 4
	MainDef8.id			= 2
	MainDef8.strength		= 8
	MainDef8.position		= GetPosition("MainDef8")
	MainDef8.rodeLength		= 1000

	SetupArmy(MainDef8)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow3

	EnlargeArmy(MainDef8,troopDescription)
	EnlargeArmy(MainDef8,troopDescription)
	EnlargeArmy(MainDef8,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderRifle1
	EnlargeArmy(MainDef8,troopDescription)
	EnlargeArmy(MainDef8,troopDescription)


    StartSimpleJob("ControlMainDef8")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef9()

	MainDef9			= {}

	MainDef9.player 		= 4
	MainDef9.id			= 3
	MainDef9.strength		= 8
	MainDef9.position		= GetPosition("MainDef9")
	MainDef9.rodeLength		= 1000

	SetupArmy(MainDef9)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword3

	EnlargeArmy(MainDef9,troopDescription)
	EnlargeArmy(MainDef9,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderPoleArm3
	EnlargeArmy(MainDef9,troopDescription)
	EnlargeArmy(MainDef9,troopDescription)
	troopDescription.leaderType = Entities.PV_Cannon3
	EnlargeArmy(MainDef9,troopDescription)


    StartSimpleJob("ControlMainDef9")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateNorthDef1()

	NorthDef1			= {}

	NorthDef1.player 		= 4
	NorthDef1.id			= 4
	NorthDef1.strength		= 8
	NorthDef1.position		= GetPosition("NorthDef1")
	NorthDef1.rodeLength		= 1000

	SetupArmy(NorthDef1)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword3

	EnlargeArmy(NorthDef1,troopDescription)
	EnlargeArmy(NorthDef1,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderPoleArm3
	EnlargeArmy(NorthDef1,troopDescription)
	EnlargeArmy(NorthDef1,troopDescription)
	troopDescription.leaderType = Entities.PV_Cannon3
	EnlargeArmy(NorthDef1,troopDescription)


    StartSimpleJob("ControlNorthDef1")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateNorthDef2()

	NorthDef2			= {}

	NorthDef2.player 		= 4
	NorthDef2.id			= 5
	NorthDef2.strength		= 8
	NorthDef2.position		= GetPosition("NorthDef2")
	NorthDef2.rodeLength		= 1000

	SetupArmy(NorthDef2)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow3

	EnlargeArmy(NorthDef2,troopDescription)
	EnlargeArmy(NorthDef2,troopDescription)
	EnlargeArmy(NorthDef2,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderRifle1
	EnlargeArmy(NorthDef2,troopDescription)
	EnlargeArmy(NorthDef2,troopDescription)


    StartSimpleJob("ControlNorthDef2")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateNorthDef3()

	NorthDef3			= {}

	NorthDef3.player 		= 4
	NorthDef3.id			= 6
	NorthDef3.strength		= 8
	NorthDef3.position		= GetPosition("NorthDef3")
	NorthDef3.rodeLength		= 1000

	SetupArmy(NorthDef3)

	local troopDescription = {

		maxNumberOfSoldiers	= 5,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry1

	EnlargeArmy(NorthDef3,troopDescription)
	EnlargeArmy(NorthDef3,troopDescription)
	EnlargeArmy(NorthDef3,troopDescription)
	EnlargeArmy(NorthDef3,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderCavalry2
	EnlargeArmy(NorthDef3,troopDescription)
	EnlargeArmy(NorthDef3,troopDescription)


    StartSimpleJob("ControlNorthDef3")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateNorthDef4()

	NorthDef4			= {}

	NorthDef4.player 		= 4
	NorthDef4.id			= 7
	NorthDef4.strength		= 8
	NorthDef4.position		= GetPosition("NorthDef4")
	NorthDef4.rodeLength		= 1000

	SetupArmy(NorthDef4)

	local troopDescription = {

		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword3

	EnlargeArmy(NorthDef4,troopDescription)
	EnlargeArmy(NorthDef4,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderPoleArm3
	EnlargeArmy(NorthDef4,troopDescription)
	EnlargeArmy(NorthDef4,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow3
	EnlargeArmy(NorthDef4,troopDescription)
	EnlargeArmy(NorthDef4,troopDescription)


    StartSimpleJob("ControlNorthDef4")

    end





---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateFirstCon()

	FirstCon			= {}

	FirstCon.player 		= 3
	FirstCon.id			= 8
	FirstCon.strength		= 8
	FirstCon.position		= GetPosition("FirstCon")
	FirstCon.rodeLength		= 1000

	SetupArmy(FirstCon)

	local troopDescription = {

		maxNumberOfSoldiers	= 6,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm2

	EnlargeArmy(FirstCon,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderSword2
	EnlargeArmy(FirstCon,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow2
	EnlargeArmy(FirstCon,troopDescription)



    StartSimpleJob("ControlFirstCon")

    end




---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateSecCon()

	SecCon			        = {}

	SecCon.player 		        = 3
	SecCon.id			= 7
	SecCon.strength		        = 8
	SecCon.position		        = GetPosition("SecCon")
	SecCon.rodeLength		= 1000

	SetupArmy(SecCon)

	local troopDescription = {

		maxNumberOfSoldiers	= 6,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm2

	EnlargeArmy(SecCon,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderSword2
	EnlargeArmy(SecCon,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderBow2
	EnlargeArmy(SecCon,troopDescription)



    StartSimpleJob("ControlSecCon")

    end



---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
-- Job "ControlArmyOne"
function ControlArmyOne()

    if Counter.Tick2("ControlArmyOne",10) == false then
        return false
		end

    if IsDead(armyOne) then
        CreateArmyTwo()
        return true
    else
        Defend(armyOne)
        end

	end



---------------------------------------------------------------------------------------------
-- Job "ControlArmyTwo"
function ControlArmyTwo()

    if Counter.Tick2("ControlArmyTwo",10) == false then
        return false
		end

    Advance(armyTwo)

	end



---------------------------------------------------------------------------------------------
-- Job "ControlDefSouth"
function ControlDefSouth()

    if Counter.Tick2("ControlDefSouth",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlBandit1"
function ControlBandit1()

    if Counter.Tick2("ControlBandit1",10) == false then
        return false
		end

	     end



---------------------------------------------------------------------------------------------
-- Job "ControlBandit2"
function ControlBandit2()

    if Counter.Tick2("ControlBandit2",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlDefMid1"
function ControlDefMid1()

    if Counter.Tick2("ControlDefMid1",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlDefMid2"
function ControlDefMid2()

    if Counter.Tick2("ControlDefMid1",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlMainDef1"
function ControlMainDef1()

    if Counter.Tick2("ControlMainDef1",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlMainDef2"
function ControlMainDef2()

    if Counter.Tick2("ControlMainDef2",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlMainDef3"
function ControlMainDef3()

    if Counter.Tick2("ControlMainDef3",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlMainDef4"
function ControlMainDef4()

    if Counter.Tick2("ControlMainDef4",10) == false then
        return false
		end

	     end



---------------------------------------------------------------------------------------------
-- Job "ControlMainDef5"
function ControlMainDef5()

    if Counter.Tick2("ControlMainDef5",10) == false then
        return false
		end

	     end



---------------------------------------------------------------------------------------------
-- Job "ControlMainDef6"
function ControlMainDef6()

    if Counter.Tick2("ControlMainDef6",10) == false then
        return false
		end

	     end



---------------------------------------------------------------------------------------------
-- Job "ControlMainDef7"
function ControlMainDef7()

    if Counter.Tick2("ControlMainDef7",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlMainDef8"
function ControlMainDef8()

    if Counter.Tick2("ControlMainDef8",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlMainDef9"
function ControlMainDef9()

    if Counter.Tick2("ControlMainDef9",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlNorthDef1"
function ControlNorthDef1()

    if Counter.Tick2("ControlNorthDef1",10) == false then
        return false
		end

	     end



---------------------------------------------------------------------------------------------
-- Job "ControlNorthDef2"
function ControlNorthDef2()

    if Counter.Tick2("ControlNorthDef2",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlNorthDef3"
function ControlNorthDef3()

    if Counter.Tick2("ControlNorthDef3",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlNorthDef4"
function ControlNorthDef4()

    if Counter.Tick2("ControlNorthDef4",10) == false then
        return false
		end

	     end

---------------------------------------------------------------------------------------------
-- Job "ControlFirstCon"
function ControlFirstCon()

    if Counter.Tick2("ControlFirstCon",10) == false then
        return false
		end

	     end



---------------------------------------------------------------------------------------------
-- Job "ControlSecCon"
function ControlSecCon()

    if Counter.Tick2("ControlSecCon",10) == false then
        return false
		end

	     end