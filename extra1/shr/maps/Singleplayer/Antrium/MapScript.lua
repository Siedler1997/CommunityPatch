winterTimer 				= 0
TMR_ArmyPL2Assault	= 0
TMR_ArmyPL4Assault	= 0

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Map Name 				: 	(1)Antrium
-- Author 					: 	Janos Toth
-- Script 					: 	Janos Toth
--------------------------------------------------------------------------------
-- Terrain Set 			: 	Europe
-- Dynamic Weather 	: 	No
-- Weathermashine 	: 	Yes
-- Heroes 					: 	3 (Dario, Pilgrim, Ari)
-- Victory Cond.Hum.:		Player 3 dead (HQ destroyed)
-- Defeat  Cond.Hum.:		HQ or Cathedrale destroyed
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- INCLUDE global tool script functions
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")
-- Script.Load("Data\\Script\\MapTools\\GlobalMissionScripts.lua") -- Nicht nötig, da Main.LUA schon alles hat.
-- Script.Load("Data\\Script\\MapTools\\WeatherSets.lua")

-- DIPLOMACY -------------------------------------------------------------------
function InitDiplomacy()

    SetHostile(1,2)
    SetHostile(1,3)
    SetHostile(1,4)
    SetHostile(1,6)
--  SetNeutral(2,3)	-- Neutral ist Default.
--  SetNeutral(2,4)
--  SetNeutral(3,4)
		SetHostile(5,2)
		SetHostile(5,3)
--	Player 5 got only the special building "Cathedrale" and further deco buildings near cathedrale

	end
------------------------------------------------------------------------------------------
-- Set RESOURCES for Human Player 1 ------------------------------------------------------
function InitResources()
	GlobalMissionScripting.GiveResouces(1, 900, 1200, 1200, 1200, 600, 350)
end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
function InitTechnologies()
	ResearchTechnology(Technologies.GT_Literacy)
	ResearchTechnology(Technologies.GT_Mercenaries)
	ResearchTechnology(Technologies.GT_StandingArmy)
	ResearchTechnology(Technologies.GT_Tactics)
	ResearchTechnology(Technologies.GT_Construction)
	ResearchTechnology(Technologies.GT_GearWheel)
	
	ResearchAllMilitaryTechsAddOn(2)
	ResearchAllMilitaryTechsAddOn(3)
	ResearchAllMilitaryTechsAddOn(4)
	ResearchAllMilitaryTechsAddOn(6)
	
	ResearchAnimalTechs(6)
end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupMediterraneanWeatherGfxSet()
end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
function InitWeather()
	Logic.AddWeatherElement(1, 600, 1, 1, 5, 10)
	Logic.AddWeatherElement(2,  90, 1, 2, 5, 10)
end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
function InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color == 2 then
		Display.SetPlayerColorMapping(2, 6)		
	end
	if p1color == 3 then
		Display.SetPlayerColorMapping(3, 4)		
	end
	Display.SetPlayerColorMapping(4, BARBARIAN_COLOR)

	Display.SetPlayerColorMapping(5, 16)
	Display.SetPlayerColorMapping(6, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7, 15)
end
---------------------------------------------------------------------------------------------
--###########################################################################################
-- First Map Action -------------------------------------------------------------------------
function FirstMapAction()
String.Init("SP_Antrium")
--	EnableDebugging()

  ---- set up and activate PLAYER 2 (Graf Nerlon Junior)

	CreatePlayer2()

  ---- set up and activate PLAYER 3 (Graf Nerlon Senior)

  CreatePlayer3()

  ---- set up and activate PLAYER 4 (Raubritter Varg)

	CreatePlayer4()

  ---- CREATE the single troops

	CreateGuardTroopsPL1()
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_Pine)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_Pine
	
	-- play music :
    LocalMusic.UseSet = EUROPEMUSIC

	---- CREATE the ARMIES

	CreateArmyPL2Assault()
	CreateArmyPL2DefNord()
	CreateArmyPL2DefTown()
	CreateArmyPL2DefHQ()
	CreateArmyPL4Assault()
	CreateArmyPL4DefHQ()
	CreateArmyPL3DefHQ()
	CreateArmyPL3Assault1()
	CreateArmyPL3Assault2()
	CreateArmyPL3Assault3()

	---- show Mission Briefing

	CreatePreludeBriefing()

  ---- start the VICTORY JOB

	StartSimpleJob("VictoryJob")
	StartSimpleJob("ControlDefeat")
	StartSimpleJob("WinterStartJob")
	
	RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 12})
	RaidersCreate({player = 6, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
	RaidersCreate({player = 6, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
	RaidersCreate({player = 6, pos = "bearpos1", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end

--#################################################################################################

function WinterStartJob() -- Freeze after 60 minutes ----------------------------------------------

	winterTimer = winterTimer + 1

	if winterTimer == 5100 then 	-- Richtiger Wert: 5100 (85 Min)

		StartWinter(1800) 				-- Richtiger Wert: 1800 (30 Min)

		-- Move Player 3 Assault armies near human town Antrium. -------------------------------------

		Redeploy(ArmyPL3Assault1,GetPosition("RedeploySpot1"),6000)
		Redeploy(ArmyPL3Assault2,GetPosition("RedeploySpot2"),3000)
		Redeploy(ArmyPL3Assault3,GetPosition("RedeploySpot3"),4000)

	end

end

---------------------------------------------------------------------------------------------
-- JOB: "VictoryJob"
---------------------------------------------------------------------------------------------
function VictoryJob()

    if IsDead("HQ_PL3") then
    	Victory()
		end

end

-----------------------------------------------------------------------------------------------------------------------
--	JOB: "ControlDefeat"
-----------------------------------------------------------------------------------------------------------------------
function ControlDefeat()

		if IsDead("HQ_PL1") or IsDead("Kathedrale") then
			Defeat()
			return true
		end
		return false
end

---------------------------------------------------------------------------------------------
-- CREATE AI Player 2 (Graf Nerlon Junior)
---------------------------------------------------------------------------------------------
function CreatePlayer2()

	player2 	= {}
	player2.id 	= 2

	--	set up default information
	
		SetPlayerName(2, String.Key("_Player2Name"))
		MapEditor_SetupAI(player2.id, 1, 6000, 1, "HQ_PL2", 0, 0)

		local description = {

			serfLimit				=	8,
			--------------------------------------------------
			extracting			=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	25,
				randomTime	=	25
			},
			--------------------------------------------------
			resources = {
				gold				=	700,
				clay				=	500,
				wood				=	500,
				stone				=	500,
				iron				=	500,
				sulfur			=	500
			},
			--------------------------------------------------
			refresh = {
				gold				=	10,
				clay				=	3,
				wood				=	3,
				stone				=	3,
				iron				=	3,
				sulfur			=	3,
				updateTime	=	2
			},
		}

	SetupPlayerAi(player2.id,description)

    end


---------------------------------------------------------------------------------------------
-- CREATE AI Player 3 (Graf Nerlon Senior)
---------------------------------------------------------------------------------------------
function CreatePlayer3()

	player3 	= {}
	player3.id 	= 3

	--	set up default information
	
		SetPlayerName(3, String.Key("_Player3Name"))
		MapEditor_SetupAI(player3.id, 2, 6000, 3, "HQ_PL3", 2, 0)

		local description = {

			serfLimit				=	12,
			--------------------------------------------------
			extracting			=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	25,
				randomTime	=	25
			},
			--------------------------------------------------
			resources = {
				gold				=	700,
				clay				=	500,
				wood				=	500,
				stone				=	500,
				iron				=	500,
				sulfur			=	500
			},
			--------------------------------------------------
			refresh = {
				gold				=	30,
				clay				=	15,
				wood				=	15,
				stone				=	15,
				iron				=	15,
				sulfur			=	15,
				updateTime	=	5
			},
		}

	SetupPlayerAi(player3.id,description)

    end


---------------------------------------------------------------------------------------------
-- CREATE AI Player 4 (Raubritter Varg)
---------------------------------------------------------------------------------------------
function CreatePlayer4()

	player4 	= {}
	player4.id 	= 4

	--	set up default information
		SetPlayerName(4, String.Key("_Player4Name"))

		local description = {

			serfLimit				=	2,
			--------------------------------------------------
			extracting			=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	25,
				randomTime	=	25
			},
			--------------------------------------------------
			resources = {
				gold				=	700,
				clay				=	500,
				wood				=	500,
				stone				=	500,
				iron				=	500,
				sulfur			=	500
			},
			--------------------------------------------------
			refresh = {
				gold				=	3,
				clay				=	3,
				wood				=	3,
				stone				=	3,
				iron				=	3,
				sulfur			=	3,
				updateTime	=	2
			},
		}

	SetupPlayerAi(player4.id,description)

    end

-- There is a Player 5 with only 1 building, the Cathedrale, that the human player need to protect. There are no units for Player 5.

---------------------------------------------------------------------------------------------
-- ATTACH SOLDIERS to Leaders Player 1 + Heroes (Armyless, single guard units)
---------------------------------------------------------------------------------------------

function CreateGuardTroopsPL1()


		local troopDescription_1 = {

			leaderType 					= Entities.PU_LeaderSword1,
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 		= MEDIUM_EXPERIENCE,
		}

		local troopDescription_2 = {

			leaderType 					= Entities.PU_LeaderBow1,
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 		= MEDIUM_EXPERIENCE,
		}

		local troopDescription_3 = {

			leaderType 					= Entities.PU_LeaderCavalry1,
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 		= MEDIUM_EXPERIENCE,
		}

		Unit = {}

		Unit.player 					= GetHumanPlayer()
--	Unit.id								=	1
		Unit.position					=	GetPosition("Spawn_1_PL1")

		-- Troops in the town
		local support1 				= CreateTroop(Unit,troopDescription_1)
		local support2 				= CreateTroop(Unit,troopDescription_2)

		-- Troops in the military camp
		Unit.position					=	GetPosition("Spawn_2_PL1")
		local support3 				= CreateTroop(Unit,troopDescription_3)

		Unit.position					=	GetPosition("Spawn_3_PL1")
		local support4 				= CreateTroop(Unit,troopDescription_3)

		Unit.position					=	GetPosition("Spawn_4_PL1")
		local support5 				= CreateTroop(Unit,troopDescription_1)

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Assault" Player 2
---------------------------------------------------------------------------------------------

function CreateArmyPL2Assault()

	TMR_ArmyPL2Assault 					= 0

	ArmyPL2Assault							= {}

	ArmyPL2Assault.player 			= 2
	ArmyPL2Assault.id						= 0
	ArmyPL2Assault.strength			= 8
	ArmyPL2Assault.position			= GetPosition("SP_ArmyPL2DefHQ") -- "SP_ArmyPL2Assault"
	ArmyPL2Assault.rodeLength		= 4000

	SetupArmy(ArmyPL2Assault)

	local troopDescription_1 = {

		leaderType 					= Entities.PU_LeaderPoleArm2,
		maxNumberOfSoldiers	= 4,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= HIGH_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.PU_LeaderBow2,
		maxNumberOfSoldiers	= 4,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= HIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL2Assault,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault,troopDescription_2)

    StartSimpleJob("ControlArmyPL2Assault")
    StartSimpleJob("ArmyPL2AssaultJob")

		Redeploy(ArmyPL2Assault,GetPosition("SP_ArmyPL2Assault"),4000)

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL2Assault
---------------------------------------------------------------------------------------------

function ControlArmyPL2Assault()

    if Counter.Tick2("ControlArmyPL2Assault",360) == false then -- es war 120
        return false
		end

    if IsDead(ArmyPL2Assault) and IsAlive("HQ_PL2") then
					CreateArmyPL2Assault()
        return true
    else
     -- Defend(ArmyPL2Assault)
        Advance(ArmyPL2Assault)
    end

end
--------------------------------------------------------------------------------
--	JOB: Attack after 8 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2AssaultJob()

	TMR_ArmyPL2Assault = TMR_ArmyPL2Assault + 1

	if TMR_ArmyPL2Assault == 480 then 	-- Richtiger Wert: 480 (8 Min)

		-- Move Player 2 Assault armies near human military base. ---------------------------------
		FrontalAttack(ArmyPL2Assault)
		-- Redeploy(ArmyPL2Assault,GetPosition("RD_ArmyPL2Assault"),8000)
		ArmyPL2Assault.rodeLength		= 8000

	end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2DefNord" Player 2
---------------------------------------------------------------------------------------------

function CreateArmyPL2DefNord()

	ArmyPL2DefNord							= {}

	ArmyPL2DefNord.player 			= 2
	ArmyPL2DefNord.id						= 9
	ArmyPL2DefNord.strength			= 3
	ArmyPL2DefNord.position			= GetPosition("SP_ArmyPL2DefNord")
	ArmyPL2DefNord.rodeLength		= 2000

	SetupArmy(ArmyPL2DefNord)

	local troopDescription_1 = {

		leaderType 					= Entities.PU_LeaderSword3,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= HIGH_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.PU_LeaderBow3,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= HIGH_EXPERIENCE,
	}

	local troopDescription_3 = {

		leaderType 					= Entities.PV_Cannon3,
		maxNumberOfSoldiers	= 1,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= HIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL2DefNord,troopDescription_1)
	EnlargeArmy(ArmyPL2DefNord,troopDescription_2)
	EnlargeArmy(ArmyPL2DefNord,troopDescription_3)

    StartSimpleJob("ControlArmyPL2DefNord")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL2DefNord
---------------------------------------------------------------------------------------------

function ControlArmyPL2DefNord()

    if Counter.Tick2("ControlArmyPL2DefNord",10) == false then
        return false
		end

    if IsDead(ArmyPL2DefNord) then
--        CreateArmyTwo()
        return true
    else
        Defend(ArmyPL2DefNord)
    end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2DefTown" Player 2
---------------------------------------------------------------------------------------------

function CreateArmyPL2DefTown()

	ArmyPL2DefTown							= {}

	ArmyPL2DefTown.player 			= 2
	ArmyPL2DefTown.id						= 8
	ArmyPL2DefTown.strength			= 4
	ArmyPL2DefTown.position			= GetPosition("SP_ArmyPL2DefTown")
	ArmyPL2DefTown.rodeLength		= 3000

	SetupArmy(ArmyPL2DefTown)

	local troopDescription_1 = {

		leaderType 					= Entities.PU_LeaderHeavyCavalry2,
		maxNumberOfSoldiers	= 3,
		minNumberOfSoldiers	= 1,
		experiencePoints 		= HIGH_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.PU_LeaderBow3,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= HIGH_EXPERIENCE,
	}

	local troopDescription_3 = {

		leaderType 					= Entities.PV_Cannon3,
		maxNumberOfSoldiers	= 1,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= HIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL2DefTown,troopDescription_1)
	EnlargeArmy(ArmyPL2DefTown,troopDescription_1)
	EnlargeArmy(ArmyPL2DefTown,troopDescription_2)
	EnlargeArmy(ArmyPL2DefTown,troopDescription_3)

    StartSimpleJob("ControlArmyPL2DefTown")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL2DefTown
---------------------------------------------------------------------------------------------

function ControlArmyPL2DefTown()

    if Counter.Tick2("ControlArmyPL2DefTown",10) == false then
        return false
		end

    if IsDead(ArmyPL2DefTown) then
--        CreateArmyTwo()
        return true
    else
        Defend(ArmyPL2DefTown)
    end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2DefHQ" Player 2
---------------------------------------------------------------------------------------------

function CreateArmyPL2DefHQ()

	ArmyPL2DefHQ							= {}

	ArmyPL2DefHQ.player 			= 2
	ArmyPL2DefHQ.id						= 7
	ArmyPL2DefHQ.strength			= 4
	ArmyPL2DefHQ.position			= GetPosition("SP_ArmyPL2DefHQ")
	ArmyPL2DefHQ.rodeLength		= 3000

	SetupArmy(ArmyPL2DefHQ)

	local troopDescription_1 = {

		leaderType 					= Entities.PU_LeaderHeavyCavalry2,
		maxNumberOfSoldiers	= 3,
		minNumberOfSoldiers	= 1,
		experiencePoints 		= HIGH_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.PU_LeaderBow4,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 1,
		experiencePoints 		= HIGH_EXPERIENCE,
	}

	local troopDescription_3 = {

		leaderType 					= Entities.PV_Cannon3,
		maxNumberOfSoldiers	= 1,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= HIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL2DefHQ,troopDescription_1)
	EnlargeArmy(ArmyPL2DefHQ,troopDescription_2)
	EnlargeArmy(ArmyPL2DefHQ,troopDescription_3)
	EnlargeArmy(ArmyPL2DefHQ,troopDescription_3)

    StartSimpleJob("ControlArmyPL2DefHQ")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL2DefHQ
---------------------------------------------------------------------------------------------

function ControlArmyPL2DefHQ()

    if Counter.Tick2("ControlArmyPL2DefHQ",30) == false then
        return false
		end

    if IsDead(ArmyPL2DefHQ) and IsAlive("HQ_PL2") then
				CreateArmyPL2DefHQ()
        return true
    else
        Defend(ArmyPL2DefHQ)
    end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL4Assault" Player 4
---------------------------------------------------------------------------------------------

function CreateArmyPL4Assault()

	TMR_ArmyPL4Assault					= 0

	ArmyPL4Assault							= {}

	ArmyPL4Assault.player 			= 4
	ArmyPL4Assault.id						= 1
	ArmyPL4Assault.strength			= 3
	ArmyPL4Assault.position			= GetPosition("SP_ArmyPL4Assault")
	ArmyPL4Assault.rodeLength		= 3000

	SetupArmy(ArmyPL4Assault)

	local troopDescription_1 = {

		leaderType 					= Entities.CU_Barbarian_LeaderClub2,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= MEDIUM_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.PU_LeaderPoleArm4,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= VERYHIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL4Assault,troopDescription_1)
	EnlargeArmy(ArmyPL4Assault,troopDescription_1)
	EnlargeArmy(ArmyPL4Assault,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault,troopDescription_2)

    StartSimpleJob("ControlArmyPL4Assault")
		StartSimpleJob("ArmyPL4AssaultJob")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL4Assault
---------------------------------------------------------------------------------------------

function ControlArmyPL4Assault()

    if Counter.Tick2("ControlArmyPL4Assault",60) == false then
        return false
		end

    if IsDead(ArmyPL4Assault) and IsAlive("HQ_PL4") then
				CreateArmyPL4Assault()
        return true
    else
        Defend(ArmyPL4Assault)
    end

end

--------------------------------------------------------------------------------
--	JOB: Attack after 16 minutes
---------------------------------------------------------------------------------------------

function ArmyPL4AssaultJob()

	TMR_ArmyPL4Assault = TMR_ArmyPL4Assault + 1

	if TMR_ArmyPL4Assault	== 960 then 	-- Richtiger Wert: 960 (16 Min)

		-- Move Player 4 Assault armie near human town. ---------------------------------
		FrontalAttack(ArmyPL4Assault)
		ArmyPL4Assault.rodeLength		= 9000

	end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL4DefHQ" Player 4
---------------------------------------------------------------------------------------------

function CreateArmyPL4DefHQ()

	ArmyPL4DefHQ							= {}

	ArmyPL4DefHQ.player 			= 4
	ArmyPL4DefHQ.id						= 2
	ArmyPL4DefHQ.strength			= 3
	ArmyPL4DefHQ.position			= GetPosition("SP_ArmyPL4DefHQ")
	ArmyPL4DefHQ.rodeLength		= 3000

	SetupArmy(ArmyPL4DefHQ)

	local troopDescription_1 = {

		leaderType 					= Entities.CU_Barbarian_LeaderClub2,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= MEDIUM_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.CU_BanditLeaderBow2,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= MEDIUM_EXPERIENCE,
	}

	local troopDescription_3 = {

		leaderType 					= Entities.PV_Cannon3,
		maxNumberOfSoldiers	= 1,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= HIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL4DefHQ,troopDescription_1)
	EnlargeArmy(ArmyPL4DefHQ,troopDescription_2)
	EnlargeArmy(ArmyPL4DefHQ,troopDescription_3)

    StartSimpleJob("ControlArmyPL4DefHQ")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL4DefHQ
---------------------------------------------------------------------------------------------

function ControlArmyPL4DefHQ()

    if Counter.Tick2("ControlArmyPL4DefHQ",10) == false then
        return false
		end

    if IsDead(ArmyPL4DefHQ) then

        return true
    else
        Defend(ArmyPL4DefHQ)
    end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL3DefHQ" Player 3
---------------------------------------------------------------------------------------------

function CreateArmyPL3DefHQ()

	ArmyPL3DefHQ							= {}

	ArmyPL3DefHQ.player 			= 3
	ArmyPL3DefHQ.id						= 0
	ArmyPL3DefHQ.strength			= 4
	ArmyPL3DefHQ.position			= GetPosition("SP_ArmyPL3DefHQ")
	ArmyPL3DefHQ.rodeLength		= 2500

	SetupArmy(ArmyPL3DefHQ)

	local troopDescription_1 = {

		leaderType 					= Entities.PU_LeaderHeavyCavalry2,
		maxNumberOfSoldiers	= 3,
		minNumberOfSoldiers	= 1,
		experiencePoints 		= VERYHIGH_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.PU_LeaderBow4,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= VERYHIGH_EXPERIENCE,
	}

	local troopDescription_3 = {

		leaderType 					= Entities.PV_Cannon3,
		maxNumberOfSoldiers	= 1,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= VERYHIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL3DefHQ,troopDescription_1)
	EnlargeArmy(ArmyPL3DefHQ,troopDescription_2)
	EnlargeArmy(ArmyPL3DefHQ,troopDescription_2)
	EnlargeArmy(ArmyPL3DefHQ,troopDescription_3)

    StartSimpleJob("ControlArmyPL3DefHQ")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL3DefHQ
---------------------------------------------------------------------------------------------

function ControlArmyPL3DefHQ()

    if Counter.Tick2("ControlArmyPL3DefHQ",10) == false then
        return false
		end

    if IsDead(ArmyPL3DefHQ) then
--        CreateArmyTwo()
        return true
    else
        Defend(ArmyPL3DefHQ)
    end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL3Assault1" Player 3
---------------------------------------------------------------------------------------------

function CreateArmyPL3Assault1()

	ArmyPL3Assault1							= {}

	ArmyPL3Assault1.player 				= 3
	ArmyPL3Assault1.id						= 9
	ArmyPL3Assault1.strength			= 8
	ArmyPL3Assault1.position			= GetPosition("SP_ArmyPL3Assault1")
	ArmyPL3Assault1.rodeLength		= 4000

	SetupArmy(ArmyPL3Assault1)

	local troopDescription_1 = {

		leaderType 					= Entities.PU_LeaderHeavyCavalry2,
		maxNumberOfSoldiers	= 4,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.PU_LeaderCavalry2,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL3Assault1,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault1,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault1,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault1,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault1,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault1,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault1,troopDescription_2)
	EnlargeArmy(ArmyPL3Assault1,troopDescription_2)

    StartSimpleJob("ControlArmyPL3Assault1")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL3Assault1
---------------------------------------------------------------------------------------------

function ControlArmyPL3Assault1()

    if Counter.Tick2("ControlArmyPL3Assault1",10) == false then
        return false
		end

    if IsDead(ArmyPL3Assault1) then
--        CreateArmyTwo()
        return true
    else
        Defend(ArmyPL3Assault1)
    end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL3Assault2" Player 3
---------------------------------------------------------------------------------------------

function CreateArmyPL3Assault2()

	ArmyPL3Assault2							= {}

	ArmyPL3Assault2.player 				= 3
	ArmyPL3Assault2.id						= 8
	ArmyPL3Assault2.strength			= 8
	ArmyPL3Assault2.position			= GetPosition("SP_ArmyPL3Assault2")
	ArmyPL3Assault2.rodeLength		= 4000

	SetupArmy(ArmyPL3Assault2)

	local troopDescription_1 = {

		leaderType 					= Entities.PU_LeaderPoleArm4,
		maxNumberOfSoldiers	= 8,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}


	local troopDescription_2 = {

		leaderType 					= Entities.PV_Cannon3,
		maxNumberOfSoldiers	= 1,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}

	local troopDescription_3 = {

		leaderType 					= Entities.PV_Cannon4,
		maxNumberOfSoldiers	= 1,
		minNumberOfSoldiers	= 0,
		experiencePoints 		= VERYHIGH_EXPERIENCE,
	}

	EnlargeArmy(ArmyPL3Assault2,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault2,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault2,troopDescription_2)
	EnlargeArmy(ArmyPL3Assault2,troopDescription_2)
	EnlargeArmy(ArmyPL3Assault2,troopDescription_3)
	EnlargeArmy(ArmyPL3Assault2,troopDescription_3)
	EnlargeArmy(ArmyPL3Assault2,troopDescription_3)
	EnlargeArmy(ArmyPL3Assault2,troopDescription_3)

    StartSimpleJob("ControlArmyPL3Assault2")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL3Assault2
---------------------------------------------------------------------------------------------

function ControlArmyPL3Assault2()

    if Counter.Tick2("ControlArmyPL3Assault2",10) == false then
        return false
		end

    if IsDead(ArmyPL3Assault2) then
--        CreateArmyTwo()
        return true
    else
        Defend(ArmyPL3Assault2)
    end

end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL3Assault3" Player 3
---------------------------------------------------------------------------------------------

function CreateArmyPL3Assault3()

	ArmyPL3Assault3							= {}

	ArmyPL3Assault3.player 				= 3
	ArmyPL3Assault3.id						= 7
	ArmyPL3Assault3.strength			= 8
	ArmyPL3Assault3.position			= GetPosition("SP_ArmyPL3Assault2")
	ArmyPL3Assault3.rodeLength		= 4000

	SetupArmy(ArmyPL3Assault3)

	local troopDescription_1 = {

		leaderType 					= Entities.PU_LeaderCavalry2,
		maxNumberOfSoldiers	= 4,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}


	EnlargeArmy(ArmyPL3Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL3Assault3,troopDescription_1)

    StartSimpleJob("ControlArmyPL3Assault3")

end

---------------------------------------------------------------------------------------------
-- JOB: ControlArmyPL3Assault3
---------------------------------------------------------------------------------------------

function ControlArmyPL3Assault3()

    if Counter.Tick2("ControlArmyPL3Assault3",10) == false then
        return false
		end

    if IsDead(ArmyPL3Assault3) then
--        CreateArmyTwo()
        return true
    else
        Defend(ArmyPL3Assault3)
    end

end

---------------------------------------------------------------------------------------------
-- Mission Briefing "Prelude"
---------------------------------------------------------------------------------------------
function CreatePreludeBriefing()

	PreludeBriefing = {}

	-- call on end of briefing
	PreludeBriefing.finished 				= 	PreludeBriefingFinished

	page = 0

	--	page #1

		-- next page
--		page = page + 1

		-- create table
--		PreludeBriefing[page] 				= 	{}

		-- text
--		PreludeBriefing[page].title			= "Willkommen"
--		PreludeBriefing[page].text			=	"Dies hier ist ein PreludeBriefing Tutorial"

		-- follow npc "Pilgrim" with dialog camera
--		PreludeBriefing[page].npc			=	{}
--		PreludeBriefing[page].npc.id		=	GetEntityId("Pilgrim")
--		PreludeBriefing[page].npc.isObserved=	true
--		PreludeBriefing[page].dialogCamera	=	true

--		PreludeBriefingShowPilgrim			= PreludeBriefing[page]

	--	page #1 (2)

		page = page + 1

		PreludeBriefing[page] 					= {}
		PreludeBriefing[page].title			= String.Key("uebersicht.title")
		PreludeBriefing[page].text			=	String.Key("PreludeBriefing[1].text")
		PreludeBriefing[page].position 	= GetPosition("CameraSpot_1")
		PreludeBriefing[page].explore		=	2500

		PreludeBriefingShowArmy 				=	PreludeBriefing[page]

	--	page #2 (neu)

		page = page + 1

		PreludeBriefing[page] 					= {}
		PreludeBriefing[page].title			= String.Key("uebersicht.title")
		PreludeBriefing[page].text			= String.Key("PreludeBriefing[2].text")

		PreludeBriefing[page].position 	= GetPosition("HQ_PL2")
		PreludeBriefing[page].explore		=	2500

		PreludeBriefingShowArmy 				=	PreludeBriefing[page]

	--	page #3

		page = page + 1

		PreludeBriefing[page] 					= {}
		PreludeBriefing[page].title			= String.Key("uebersicht.title")
		PreludeBriefing[page].text			= String.Key("PreludeBriefing[3].text")

		PreludeBriefing[page].position 	= GetPosition("CameraSpot_3")
		PreludeBriefing[page].explore		=	2500

		PreludeBriefingShowArmy 				=	PreludeBriefing[page]

	--	page #4

		page = page + 1

		PreludeBriefing[page] 						= {}
		PreludeBriefing[page].title				= String.Key("PreludeBriefing[4].title")
		PreludeBriefing[page].text				= String.Key("PreludeBriefing[4].text")

		PreludeBriefing[page].position 		= GetPosition("HQ_PL3")
		PreludeBriefing[page].explore			=	2500
		PreludeBriefing[page].marker			=	ANIMATED_MARKER

		PreludeBriefing[page].quest				=	{}
		PreludeBriefing[page].quest.id		=	1
		PreludeBriefing[page].quest.type	=	MAINQUEST_OPEN
		PreludeBriefing[page].quest.title	=	String.MainKey.."PreludeBriefing[4].quest.title"
		PreludeBriefing[page].quest.text	=	String.MainKey.."PreludeBriefing[4].quest.text"

		PreludeBriefingDestroyHQ 					=	PreludeBriefing[page]

	--	page #5

		page = page + 1

		PreludeBriefing[page] 					= {}
		PreludeBriefing[page].title			= String.GenericKey("MissionObjectives")
		PreludeBriefing[page].text			=	String.Key("PreludeBriefing[5].text")

		PreludeBriefing[page].position 	= GetPosition("Spawn_1_PL1")

	--	go!

		StartBriefing(PreludeBriefing)

	end

---------------------------------------------------------------------------------------------
-- BriefingFinished "Prelude"
---------------------------------------------------------------------------------------------

function PreludeBriefingFinished()

--	ResolveBriefing(PreludeBriefingShowPilgrim)
	ResolveBriefing(PreludeBriefingShowArmy)
--	ResolveBriefing(PreludeBriefingDestroyHQ) -- NEU !!!

end
