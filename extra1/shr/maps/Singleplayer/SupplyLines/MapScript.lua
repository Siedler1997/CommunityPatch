
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("gameControl")

IncludeLocals("player_2")
IncludeLocals("player_3")
IncludeLocals("player_4")
IncludeLocals("player_5")
IncludeLocals("player_6")

IncludeLocals("briefing_prelude")
IncludeLocals("briefing_coinac")
IncludeLocals("briefing_coinac2")

IncludeLocals("army_spawn")

IncludeLocals("quest_Coinac")
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
        Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
        Logic.SetDiplomacyState( 2, 3, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 2, 4, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 2, 5, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 2, 6, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 3, 4, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 3, 5, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 3, 6, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 4, 5, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 4, 6, Diplomacy.Neutral )
        Logic.SetDiplomacyState( 5, 6, Diplomacy.Neutral )

	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	ResearchAllMilitaryTechsAddOn(2)
	ResearchAllMilitaryTechsAddOn(5)
	ResearchAllMilitaryTechsAddOn(6)
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
 	-- set player colors
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	Display.SetPlayerColorMapping(8, 11)
	if p1color == 1 then
		Display.SetPlayerColorMapping(2, 2)
		Display.SetPlayerColorMapping(3, 3)
	elseif p1color == 2 then
		Display.SetPlayerColorMapping(2, 9)
		Display.SetPlayerColorMapping(3, 3)
	else
		Display.SetPlayerColorMapping(2, 2)
		Display.SetPlayerColorMapping(3, 8)
	end
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	String.Init("SP_SupplyLines")

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

	--	resources
	
		GlobalMissionScripting.GiveResouces(1, 1500, 2000, 1500, 2000, 1500, 1000)
	
	--	create players
	
		createPlayer2()
        createPlayer3()
        createPlayer4()
		createPlayer5()
		createPlayer6()


        --      Create Armies

                CreateArmyOne()
                CreateDefSouth()
                CreateBandit1()
                CreateBandit2()
                CreateDefMid1()
                CreateDefMid2()
                CreatebackOne()
                CreatebackSouth()
                CreateMainDef1()
                CreateMainDef2()
                CreateMainDef3()
                CreateMainDef4()


	-- Set Music-Set

		LocalMusic.UseSet = EVELANCEMUSIC
	
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

	armyOne.player 			= 3
	armyOne.id			= 1
	armyOne.strength		= 12
	armyOne.position		= GetPosition("armyOne")
	armyOne.rodeLength		= 1000

	SetupArmy(armyOne)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm3


	EnlargeArmy(armyOne,troopDescription)
	EnlargeArmy(armyOne,troopDescription)




    StartSimpleJob("ControlArmyOne")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateArmyTwo()

	armyTwo				= {}

	armyTwo.player 			= 3
	armyTwo.id			= 2
	armyTwo.strength		= 12
	armyTwo.position		= GetPosition("armyOne")
	armyTwo.rodeLength		= 1000

	SetupArmy(armyTwo)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm3

	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)



    StartSimpleJob("ControlArmyTwo")

    end


---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreatebackOne()

	backOne				= {}

	backOne.player 			= 3
	backOne.id			= 7
	backOne.strength		= 12
	backOne.position		= GetPosition("backOne")
	backOne.rodeLength		= 1000

	SetupArmy(backOne)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow3

	EnlargeArmy(backOne,troopDescription)
	EnlargeArmy(backOne,troopDescription)





    StartSimpleJob("ControlbackOne")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateDefSouth()

	DefSouth			= {}

	DefSouth.player 		= 1
	DefSouth.id			= 1
	DefSouth.strength		= 12
	DefSouth.position		= GetPosition("DefSouth")
	DefSouth.rodeLength		= 1000

	SetupArmy(DefSouth)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm3

	EnlargeArmy(DefSouth,troopDescription)




    StartSimpleJob("ControlDefSouth")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreatebackSouth()

	backSouth			= {}

	backSouth.player 		= 1
	backSouth.id			= 1
	backSouth.strength		= 12
	backSouth.position		= GetPosition("backSouth")
	backSouth.rodeLength		= 1000

	SetupArmy(backSouth)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow3

	EnlargeArmy(backSouth,troopDescription)




    StartSimpleJob("ControlbackSouth")

    end


---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateBandit1()

	Bandit1		          	= {}

	Bandit1.player 		        = 4
	Bandit1.id			= 1
	Bandit1.strength		= 12
	Bandit1.position		= GetPosition("Bandit1")
	Bandit1.rodeLength		= 1000

	SetupArmy(Bandit1)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm3

	EnlargeArmy(Bandit1,troopDescription)
	EnlargeArmy(Bandit1,troopDescription)




    StartSimpleJob("ControlBandit1")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateBandit2()

	Bandit2		          	= {}

	Bandit2.player 		        = 4
	Bandit2.id			= 2
	Bandit2.strength		= 12
	Bandit2.position		= GetPosition("Bandit2")
	Bandit2.rodeLength		= 1000

	SetupArmy(Bandit2)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword3

	EnlargeArmy(Bandit2,troopDescription)
	EnlargeArmy(Bandit2,troopDescription)




    StartSimpleJob("ControlBandit2")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateDefMid1()

	DefMid1		          	= {}

	DefMid1.player 		        = 1
	DefMid1.id			= 2
	DefMid1.strength		= 12
	DefMid1.position		= GetPosition("DefMid1")
	DefMid1.rodeLength		= 1000

	SetupArmy(DefMid1)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword3

	EnlargeArmy(DefMid1,troopDescription)
	EnlargeArmy(DefMid1,troopDescription)





    StartSimpleJob("ControlDefMid1")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateDefMid2()

	DefMid2		          	= {}

	DefMid2.player 		        = 1
	DefMid2.id			= 3
	DefMid2.strength		= 12
	DefMid2.position		= GetPosition("DefMid2")
	DefMid2.rodeLength		= 1000

	SetupArmy(DefMid2)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow4

	EnlargeArmy(DefMid2,troopDescription)





    StartSimpleJob("ControlDefMid2")

    end




---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef1()

	MainDef1			= {}

	MainDef1.player 		= 6
	MainDef1.id			= 8
	MainDef1.strength		= 12
	MainDef1.position		= GetPosition("MainDef1")
	MainDef1.rodeLength		= 1000

	SetupArmy(MainDef1)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderBow4

	EnlargeArmy(MainDef1,troopDescription)
	EnlargeArmy(MainDef1,troopDescription)
	EnlargeArmy(MainDef1,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderRifle2
	EnlargeArmy(MainDef1,troopDescription)
	EnlargeArmy(MainDef1,troopDescription)


    StartSimpleJob("ControlMainDef1")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef2()

	MainDef2			= {}

	MainDef2.player 		= 6
	MainDef2.id			= 7
	MainDef2.strength		= 12
	MainDef2.position		= GetPosition("MainDef2")
	MainDef2.rodeLength		= 1000

	SetupArmy(MainDef2)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

	EnlargeArmy(MainDef2,troopDescription)
	EnlargeArmy(MainDef2,troopDescription)
	EnlargeArmy(MainDef2,troopDescription)
	EnlargeArmy(MainDef2,troopDescription)


    StartSimpleJob("ControlMainDef2")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef3()

	MainDef3			= {}

	MainDef3.player 		= 6
	MainDef3.id			= 8
	MainDef3.strength		= 12
	MainDef3.position		= GetPosition("MainDef3")
	MainDef3.rodeLength		= 1000

	SetupArmy(MainDef3)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword4

	EnlargeArmy(MainDef3,troopDescription)
	EnlargeArmy(MainDef3,troopDescription)
	EnlargeArmy(MainDef3,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderPoleArm4
	EnlargeArmy(MainDef3,troopDescription)
	EnlargeArmy(MainDef3,troopDescription)


    StartSimpleJob("ControlMainDef3")

    end



---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateMainDef4()

	MainDef4			= {}

	MainDef4.player 		= 6
	MainDef4.id			= 6
	MainDef4.strength		= 12
	MainDef4.position		= GetPosition("MainDef4")
	MainDef4.rodeLength		= 1000

	SetupArmy(MainDef4)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderSword4

	EnlargeArmy(MainDef4,troopDescription)
	EnlargeArmy(MainDef4,troopDescription)
	EnlargeArmy(MainDef4,troopDescription)
	troopDescription.leaderType = Entities.PU_LeaderPoleArm4
	EnlargeArmy(MainDef4,troopDescription)
	EnlargeArmy(MainDef4,troopDescription)


    StartSimpleJob("ControlMainDef4")

    end


---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateFirstCon()

	FirstCon			= {}

	FirstCon.player 		= 3
	FirstCon.id			= 8
	FirstCon.strength		= 12
	FirstCon.position		= GetPosition("FirstCon")
	FirstCon.rodeLength		= 1000

	SetupArmy(FirstCon)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm3

	EnlargeArmy(FirstCon,troopDescription)
	EnlargeArmy(FirstCon,troopDescription)



    StartSimpleJob("ControlFirstCon")

    end




---------------------------------------------------------------------------------------------
-- Creates an army for testing
function CreateSecCon()

	SecCon			        = {}

	SecCon.player 		        = 3
	SecCon.id			= 7
	SecCon.strength		        = 12
	SecCon.position		        = GetPosition("SecCon")
	SecCon.rodeLength		= 1000

	SetupArmy(SecCon)

	local troopDescription = {

		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	troopDescription.leaderType = Entities.PU_LeaderPoleArm3

	EnlargeArmy(SecCon,troopDescription)
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



---------------------------------------------------------------------------------------------
-- Job "ControlbackOne"
function ControlbackOne()

    if Counter.Tick2("ControlbackOne",10) == false then
        return false
		end

	     end


---------------------------------------------------------------------------------------------
-- Job "ControlbackSouth"
function ControlbackSouth()

    if Counter.Tick2("ControlbackSouth",10) == false then
        return false
		end

	     end