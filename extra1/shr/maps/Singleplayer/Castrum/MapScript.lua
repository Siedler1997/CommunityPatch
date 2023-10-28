TimeLimitTimer 			= 0
TMR_ArmyPL2Assault1	= 0
TMR_ArmyPL2Assault2	= 0
TMR_ArmyPL2Assault3	= 0
TMR_ArmyPL2Assault4	= 0
TMR_ArmyPL2Assault5	= 0
TMR_ArmyPL2Assault6	= 0
TMR_ArmyPL2Assault7	= 0
TMR_ArmyPL2Killer		= 0
FirstSpawn 					= 1

EnemySwordType = Entities.PU_LeaderSword3
EnemySpearType = Entities.PU_LeaderPoleArm3
EnemyBowType = Entities.PU_LeaderBow3
EnemyHeavyCavalryType = Entities.PU_LeaderHeavyCavalry1
EnemyCannon1Type = Entities.PV_Cannon1
EnemyCannon2Type = Entities.PV_Cannon2
EnemyRifleType = Entities.PU_LeaderRifle1
EnemyExperience = 1

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Map Name 			: 	(1)Castrum
-- Author 			: 	Janos Toth
-- Script 			: 	Janos Toth
--------------------------------------------------------------------------------
-- Terrain Set 			: 	Europe / Meditteran
-- Dynamic Weather 		: 	No
-- Weathermashine 		: 	Enabled, but not needed
-- Heroes 			: 	3 (Erec, Pilgrim, Salim)
-- Victory Cond.Hum.		:	Citadell must survive 70 minutes
-- Defeat  Cond.Hum.		:	Citadell is destroyed


-- Background story:
-- An evil baron, the "red baron", is trying to establish a new kingdom. To achieve this goal he has begun
-- to siege the great fortress of Lerrmonto. If this fortress is fallen, he can cross the river and take
-- over the defensless town of Lerrmonto. The player must hold the citadell of the fortress of Lerrmonto
-- for 70 minutes to win this mission.
-- A river is dividing up the country in 2 parts, that can not be crossed.
-- The weather is allways summer, but the player could change it (however, it makes no sense).

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- INCLUDE global tool script functions
Script.Load( Folders.MapTools.."Main.lua" )

-- DIPLOMACY -------------------------------------------------------------------
function InitDiplomacy()

    SetHostile(1,2)

end
------------------------------------------------------------------------------------------
-- Set RESOURCES for Human Player 1 ------------------------------------------------------
function InitResources()

	GlobalMissionScripting.GiveResouces(1, 3500, 2000, 2000, 1600, 2000, 500)

end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
function InitTechnologies()
--[[
	ResearchTechnology(Technologies.GT_Literacy)
	ResearchTechnology(Technologies.GT_Mercenaries)
	ResearchTechnology(Technologies.GT_Alchemy)
	ResearchTechnology(Technologies.GT_Construction)
--]]

	ResearchTechnology(Technologies.T_UpgradeSword1)
	ResearchTechnology(Technologies.T_UpgradeSpear1)
	ResearchTechnology(Technologies.T_UpgradeBow1)
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
	if p1color ~= 2 then
		Display.SetPlayerColorMapping(1, p1color)		
	else
		Display.SetPlayerColorMapping(1, 7)		
	end
	Display.SetPlayerColorMapping(3, 15)
end
---------------------------------------------------------------------------------------------
--###########################################################################################
-- First Map Action -------------------------------------------------------------------------
function FirstMapAction()
String.Init("SP_Castrum")

--	EnableDebugging()

  ---- set up and activate PLAYER 2 (Red Baron)

	CreatePlayer2()

--	Break() -- ! ! ! Muﬂ groﬂ geschrieben werden.

  ---- CREATE the single troops

--	CreateGuardTroopsPL1()

	---- CREATE the ARMIES

	CreateArmyPL2Assault1()
	CreateArmyPL2Assault2()
	CreateArmyPL2Assault3()
	CreateArmyPL2Assault4()
	CreateArmyPL2Assault5()
	CreateArmyPL2Assault6()
	CreateArmyPL2Assault7()
--	CreateArmyPL2Killer() -- diese Army wird sp‰ter bei TimeLimitStartJob kreiert

	---- show Mission Briefing

	CreatePreludeBriefing()
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_Pine)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_Pine

	-- play music :
		LocalMusic.UseSet = MEDITERANEANMUSIC
		
  ---- start the VICTORY JOB

	--StartSimpleJob("VictoryJob") -- Wird bei TimeLimitStartJob behandelt
	StartSimpleJob("ControlDefeat")

	StartSimpleJob("TimeLimitStartJob")
	
	GUIQuestTools.ToggleStopWatch(4200, 1)
    StartCountdown(30 * 60, UpgradeEnemies, false)
	
    gvGUI.BonusHeroId = GetEntityId("Yuki")

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end

function UpgradeEnemies()
	EnemySwordType = Entities.PU_LeaderSword4
	EnemySpearType = Entities.PU_LeaderPoleArm4
	EnemyBowType = Entities.PU_LeaderBow4
	EnemyHeavyCavalryType = Entities.PU_LeaderHeavyCavalry2
	EnemyCannon1Type = Entities.PV_Cannon3
	EnemyCannon2Type = Entities.PV_Cannon4
	EnemyRifleType = Entities.PU_LeaderRifle2

	EnemyExperience = 2

	ResearchAllMilitaryTechsAddOn(2)

    StartCountdown(30 * 60, EnrageEnemies, false)
end

function EnrageEnemies()
	EnemyExperience = 3
	ResearchTechnology(Technologies.T_SuperTechnology, 2);
end


--#################################################################################################

function TimeLimitStartJob() -- Mission won after 70 minutes -------------------------------------------

	TimeLimitTimer = TimeLimitTimer + 1

	if TimeLimitTimer == 3000 then 	-- Richtiger Wert: 3000 (50 Min)

		-- Create the strong, 8 heavy cavalry "Killer" Army. ----------------------------------
		CreateArmyPL2Killer()
	end

	if TimeLimitTimer == 4200 then 	-- Richtiger Wert: 4200 (70 Min)

		-- Victory, the citadell is hold for 70 minutes ---------------------------------------
		Victory()
	end

end

--		Redeploy(ArmyPL3Assault1,GetPosition("RedeploySpot1"),6000)

---------------------------------------------------------------------------------------------
-- JOB: "VictoryJob"
---------------------------------------------------------------------------------------------
--function VictoryJob()

--   	 if IsDead("HQ_PL3") then
--    		Victory()
--	end

--end

-----------------------------------------------------------------------------------------------------------------------
--	JOB: "ControlDefeat"
-----------------------------------------------------------------------------------------------------------------------
function ControlDefeat()

	if IsDead("Citadell_PL1") or IsDead("HQ_PL1") then
		Defeat()
		return true
	end
	return false
end

---------------------------------------------------------------------------------------------
-- CREATE AI Player 2 (Red Baron)
---------------------------------------------------------------------------------------------
function CreatePlayer2()

--	local playerId = 2
--	Logic.SetPlayerName(2, "Der rote Baron")
	Logic.SetPlayerName(2, String.MainKey.."_Player2Name")

	player2 		= {}
	player2.id 	= 2

	--	set up default information

		local description = {

			serfLimit				=	2,
			--------------------------------------------------
			extracting			=	false,
			--------------------------------------------------
			rebuild = {
				delay					=	55,
				randomTime		=	55
			},
			--------------------------------------------------
			resources = {
				gold					=	100,
				clay					=	100,
				wood					=	100,
				stone					=	100,
				iron					=	100,
				sulfur				=	100
			},
			--------------------------------------------------
			refresh = {
				gold					=	60,
				clay					=	60,
				wood					=	60,
				stone					=	60,
				iron					=	60,
				sulfur				=	60,
				updateTime		=	5
			},
		}

	SetupPlayerAi(player2.id,description)

end

--___________________________________________________________________________________________
---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Assault1" Player 2 (South)
---------------------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

function CreateArmyPL2Assault1()

	TMR_ArmyPL2Assault1 					= 0

	ArmyPL2Assault1								= {}

	ArmyPL2Assault1.player 				= 2
	ArmyPL2Assault1.id						= 1
	ArmyPL2Assault1.strength			= 6 -- Amount of "full" units in the army
	ArmyPL2Assault1.position			= GetPosition("SP_ArmyPL2Assault1")
	ArmyPL2Assault1.rodeLength		= 6000

	SetupArmy(ArmyPL2Assault1)


	TMR_ArmyPL2Assault1 = 0

  StartSimpleJob("ArmyPL2AssaultJob1")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 8 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2AssaultJob1()

	if IsDead(ArmyPL2Assault1) then
		Redeploy(ArmyPL2Assault1,GetPosition("SP_ArmyPL2Assault1"),6000)
		TMR_ArmyPL2Assault1 = 0
		
		
	local troopDescription_1 = {

		leaderType 							= EnemySpearType,
		maxNumberOfSoldiers			= 8, -- 4
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}


	local troopDescription_2 	= {

		leaderType 							= EnemySwordType,
		maxNumberOfSoldiers			= 8,
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}

	EnlargeArmy(ArmyPL2Assault1,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault1,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault1,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault1,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault1,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault1,troopDescription_2)
		
	end

	TMR_ArmyPL2Assault1 = TMR_ArmyPL2Assault1 + 1

	if TMR_ArmyPL2Assault1 < 480 then 	-- Richtiger Wert: 480 (8 Min)

		Defend(ArmyPL2Assault1)

	else

		Advance(ArmyPL2Assault1)

	end
end

--___________________________________________________________________________________________
---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Assault2" Player 2 (South)
---------------------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

function CreateArmyPL2Assault2()

	TMR_ArmyPL2Assault2 					= 0

	ArmyPL2Assault2								= {}

	ArmyPL2Assault2.player 				= 2
	ArmyPL2Assault2.id						= 2
	ArmyPL2Assault2.strength			= 6
	ArmyPL2Assault2.position			= GetPosition("SP_ArmyPL2Assault2")
	ArmyPL2Assault2.rodeLength		= 6000

	SetupArmy(ArmyPL2Assault2)

	TMR_ArmyPL2Assault2 = 0

  StartSimpleJob("ArmyPL2AssaultJob2")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 8 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2AssaultJob2()

	if IsDead(ArmyPL2Assault2) then
		Redeploy(ArmyPL2Assault2,GetPosition("SP_ArmyPL2Assault2"),6000)
		TMR_ArmyPL2Assault2 = 0

			
	local troopDescription_1 = {

		leaderType 							= EnemyBowType,
		maxNumberOfSoldiers			= 8,
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}

	local troopDescription_2 = {

		leaderType 							= EnemyCannon1Type,
		maxNumberOfSoldiers			= 8,
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}

	EnlargeArmy(ArmyPL2Assault2,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault2,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault2,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault2,troopDescription_2)
	troopDescription_2.leaderType = EnemyRifleType
	EnlargeArmy(ArmyPL2Assault2,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault2,troopDescription_2)

	end

	TMR_ArmyPL2Assault2 = TMR_ArmyPL2Assault2 + 1

	if TMR_ArmyPL2Assault2 < 485 then 	-- Richtiger Wert: 485 (8 Min + 5 sec)

		Defend(ArmyPL2Assault2)

	else

		Advance(ArmyPL2Assault2)

	end
end

--___________________________________________________________________________________________
---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Assault3" Player 2 (East)
---------------------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

function CreateArmyPL2Assault3()

	TMR_ArmyPL2Assault3 					= 0

	ArmyPL2Assault3								= {}

	ArmyPL2Assault3.player 				= 2
	ArmyPL2Assault3.id						= 3
	ArmyPL2Assault3.strength			= 5
	ArmyPL2Assault3.position			= GetPosition("SP_ArmyPL2Assault3")
	ArmyPL2Assault3.rodeLength		= 7000

	SetupArmy(ArmyPL2Assault3)

	TMR_ArmyPL2Assault3 = 0

  StartSimpleJob("ArmyPL2AssaultJob3")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 9 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2AssaultJob3()

	if IsDead(ArmyPL2Assault3) then
		Redeploy(ArmyPL2Assault3,GetPosition("SP_ArmyPL2Assault3"),6000)
		TMR_ArmyPL2Assault3 = 0

			
	local troopDescription_1 	= {

		leaderType 							= EnemySwordType,
		maxNumberOfSoldiers			= 8, -- 4
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}


	local troopDescription_2 	= {

		leaderType 							= EnemyCannon2Type,
		maxNumberOfSoldiers			= 1,
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}

	EnlargeArmy(ArmyPL2Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault3,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault3,troopDescription_2)

	end

	TMR_ArmyPL2Assault3 = TMR_ArmyPL2Assault3 + 1

	if TMR_ArmyPL2Assault3 < 590 then 	-- Richtiger Wert: 520 (9 Min)

		Defend(ArmyPL2Assault3)

	else

		Advance(ArmyPL2Assault3)

	end
end
--___________________________________________________________________________________________
---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Assault4" Player 2 (West)
---------------------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

function CreateArmyPL2Assault4()

	TMR_ArmyPL2Assault4 					= 0

	ArmyPL2Assault4								= {}

	ArmyPL2Assault4.player 				= 2
	ArmyPL2Assault4.id						= 4
	ArmyPL2Assault4.strength			= 6
	ArmyPL2Assault4.position			= GetPosition("SP_ArmyPL2Assault4")
	ArmyPL2Assault4.rodeLength		= 6000

	SetupArmy(ArmyPL2Assault4)

	TMR_ArmyPL2Assault4 = 0

  StartSimpleJob("ArmyPL2AssaultJob4")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 10 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2AssaultJob4()

	if IsDead(ArmyPL2Assault4) then
		Redeploy(ArmyPL2Assault4,GetPosition("SP_ArmyPL2Assault4"),6000)
		TMR_ArmyPL2Assault4 = 0

			
	local troopDescription_1 = {

		leaderType 							= EnemyHeavyCavalryType,
		maxNumberOfSoldiers			= 3,
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}


	local troopDescription_2	= {

		leaderType 							= Entities.PU_LeaderCavalry2,
		maxNumberOfSoldiers			= 3,
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}

	EnlargeArmy(ArmyPL2Assault4,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault4,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault4,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault4,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault4,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault4,troopDescription_2)

	end

	TMR_ArmyPL2Assault4 = TMR_ArmyPL2Assault4 + 1

	if TMR_ArmyPL2Assault4 < 580 then 	-- Richtiger Wert: 580 (10 Min)

		Defend(ArmyPL2Assault4)

	else

		Advance(ArmyPL2Assault4)

	end
end
--___________________________________________________________________________________________
---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Assault5" Player 2 (North)
---------------------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

function CreateArmyPL2Assault5()

	TMR_ArmyPL2Assault5 					= 0

	ArmyPL2Assault5								= {}

	ArmyPL2Assault5.player 				= 2
	ArmyPL2Assault5.id						= 5
	ArmyPL2Assault5.strength			= 3
	ArmyPL2Assault5.position			= GetPosition("SP_ArmyPL2Assault5")
	ArmyPL2Assault5.rodeLength		= 8000

	SetupArmy(ArmyPL2Assault5)

	TMR_ArmyPL2Assault5 = 0

  StartSimpleJob("ArmyPL2AssaultJob5")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 8 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2AssaultJob5()

	if IsDead(ArmyPL2Assault5) then
		Redeploy(ArmyPL2Assault5,GetPosition("SP_ArmyPL2Assault5"),8000)
		TMR_ArmyPL2Assault5 = 0

			
	local troopDescription_1 = {

		leaderType 							= EnemyCannon1Type,
		maxNumberOfSoldiers			= 1,
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}


	local troopDescription_2	= {

		leaderType 							= EnemyCannon2Type,
		maxNumberOfSoldiers			= 1,
		minNumberOfSoldiers			= 0,
		experiencePoints 				= EnemyExperience,
	}

	EnlargeArmy(ArmyPL2Assault5,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault5,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault5,troopDescription_2)

	end

	TMR_ArmyPL2Assault5 = TMR_ArmyPL2Assault5 + 1

	if TMR_ArmyPL2Assault5 < 460 then 	-- Richtiger Wert: 460 (8 Min)

		Defend(ArmyPL2Assault5)

	else

		Advance(ArmyPL2Assault5)
		
	end
end


--___________________________________________________________________________________________
---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Assault6" Player 2 (North)
---------------------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

function CreateArmyPL2Assault6()

	TMR_ArmyPL2Assault6 					= 0

	ArmyPL2Assault6								= {}

	ArmyPL2Assault6.player 				= 2
	ArmyPL2Assault6.id						= 6
	ArmyPL2Assault6.strength			= 8
	ArmyPL2Assault6.position			= GetPosition("SP_ArmyPL2Assault6")
	ArmyPL2Assault6.rodeLength		= 7000

	SetupArmy(ArmyPL2Assault6)

	TMR_ArmyPL2Assault6 = 0

  StartSimpleJob("ArmyPL2AssaultJob6")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 8 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2AssaultJob6()

	if IsDead(ArmyPL2Assault6) then
		Redeploy(ArmyPL2Assault6,GetPosition("SP_ArmyPL2Assault6"),7000)
		TMR_ArmyPL2Assault6 = 0

			
	local troopDescription_1 		= {

		leaderType 								= EnemyBowType,
		maxNumberOfSoldiers				= 8,
		minNumberOfSoldiers				= 0,
		experiencePoints 					= EnemyExperience,
	}


	local troopDescription_2		= {

		leaderType 								= EnemySwordType,
		maxNumberOfSoldiers				= 8,
		minNumberOfSoldiers				= 0,
		experiencePoints 					= EnemyExperience,
	}

	local troopDescription_3 		= {

		leaderType 								= EnemySpearType,
		maxNumberOfSoldiers				= 8,
		minNumberOfSoldiers				= 0,
		experiencePoints 					= EnemyExperience,
	}

	EnlargeArmy(ArmyPL2Assault6,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault6,troopDescription_1)
	EnlargeArmy(ArmyPL2Assault6,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault6,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault6,troopDescription_2)
	EnlargeArmy(ArmyPL2Assault6,troopDescription_3)
	EnlargeArmy(ArmyPL2Assault6,troopDescription_3)
	troopDescription_3.leaderType = EnemyRifleType
	EnlargeArmy(ArmyPL2Assault6,troopDescription_3)

	end

	TMR_ArmyPL2Assault6 = TMR_ArmyPL2Assault6 + 1

	if TMR_ArmyPL2Assault6 < 485 then 	-- 	-- Richtiger Wert: 485 (8 Min +5 Sec)

		Defend(ArmyPL2Assault6)

	else

		Advance(ArmyPL2Assault6)

	end
end

--___________________________________________________________________________________________
---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Killer" Player 2 (West) This army is spawning 50 minutes after start to the first time.
---------------------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

function CreateArmyPL2Killer()

	ArmyPL2Killer								= {}

	ArmyPL2Killer.player 				= 2
	ArmyPL2Killer.id						= 7
	ArmyPL2Killer.strength			= 8
	ArmyPL2Killer.position			= GetPosition("SP_ArmyPL2Killer")
	ArmyPL2Killer.rodeLength		= 7000

	SetupArmy(ArmyPL2Killer)

  StartSimpleJob("ArmyPL2KillerControl")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 5 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2KillerControl()

	if IsDead(ArmyPL2Killer) then
		Redeploy(ArmyPL2Killer,GetPosition("SP_ArmyPL2Killer"),7000)
		TMR_ArmyPL2Killer = 0
			
		local troopDescription_1 	= {
	
			leaderType 							= Entities.PU_LeaderHeavyCavalry2,
			maxNumberOfSoldiers			= 3,
			minNumberOfSoldiers			= 0,
			experiencePoints 				= VERYHIGH_EXPERIENCE,
		}
	
		EnlargeArmy(ArmyPL2Killer,troopDescription_1)
		EnlargeArmy(ArmyPL2Killer,troopDescription_1)
		EnlargeArmy(ArmyPL2Killer,troopDescription_1)
		EnlargeArmy(ArmyPL2Killer,troopDescription_1)
		EnlargeArmy(ArmyPL2Killer,troopDescription_1)
		EnlargeArmy(ArmyPL2Killer,troopDescription_1)
		EnlargeArmy(ArmyPL2Killer,troopDescription_1)
		EnlargeArmy(ArmyPL2Killer,troopDescription_1)

	end

	TMR_ArmyPL2Killer = TMR_ArmyPL2Killer + 1

	if TMR_ArmyPL2Killer < 300 then 	-- Richtiger Wert: 300 (5 Min)

		Defend(ArmyPL2Killer)

	else

		Advance(ArmyPL2Killer)

	end
	
end

---------------------------------------------------------------------------------------------
-- CREATE ARMY "ArmyPL2Assault7" to defend the VC
---------------------------------------------------------------------------------------------
function CreateArmyPL2Assault7()

	ArmyPL2Assault7								= {}

	ArmyPL2Assault7.player 				= 2
	ArmyPL2Assault7.id					= 8
	ArmyPL2Assault7.strength			= 8
	ArmyPL2Assault7.position			= GetPosition("SP_ArmyPL2Assault7")
	ArmyPL2Assault7.rodeLength		= 7000

	SetupArmy(ArmyPL2Assault7)

  StartSimpleJob("ArmyPL2Assault7Control")

end

--------------------------------------------------------------------------------
--	JOB: Attack after 10 minutes
---------------------------------------------------------------------------------------------

function ArmyPL2Assault7Control()

	if IsDead(ArmyPL2Assault7) and IsExisting("p2_vc") then
		Redeploy(ArmyPL2Assault7,GetPosition("SP_ArmyPL2Assault7"),7000)
		TMR_ArmyPL2Assault7 = 0
			
		local troopDescription = {

			leaderType 					= EnemySwordType,
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 0,
			experiencePoints 		= EnemyExperience,
		}

		EnlargeArmy(ArmyPL2Assault7,troopDescription)
		EnlargeArmy(ArmyPL2Assault7,troopDescription)

		troopDescription.leaderType = EnemySpearType
		EnlargeArmy(ArmyPL2Assault7, troopDescription)
		EnlargeArmy(ArmyPL2Assault7, troopDescription)
	
		troopDescription.leaderType = EnemyBowType
		EnlargeArmy(ArmyPL2Assault7, troopDescription)
		EnlargeArmy(ArmyPL2Assault7, troopDescription)
	
		troopDescription.leaderType = EnemyRifleType
		EnlargeArmy(ArmyPL2Assault7, troopDescription)
		EnlargeArmy(ArmyPL2Assault7, troopDescription)

	end

	TMR_ArmyPL2Assault7 = TMR_ArmyPL2Assault7 + 1

	if TMR_ArmyPL2Assault7 < 600 then 	-- Richtiger Wert: 300 (5 Min)

		Defend(ArmyPL2Assault7)

	else

		Advance(ArmyPL2Assault7)

	end
	
end

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
---------------------------------------------------------------------------------------------
-- Mission Briefing "Prelude"
---------------------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

function CreatePreludeBriefing()

	PreludeBriefing = {}

	-- call on end of briefing
	PreludeBriefing.finished 				= 	PreludeBriefingFinished

	page = 0

	--	page #1

		-- next page
--		page = page + 1

		-- create table
--		PreludeBriefing[page] 				=  {}

		-- text
--		PreludeBriefing[page].title			= "Willkommen"
--		PreludeBriefing[page].text			= "Dies hier ist ein PreludeBriefing Tutorial"

		-- follow npc "Pilgrim" with dialog camera
--		PreludeBriefing[page].npc			= {}
--		PreludeBriefing[page].npc.id			= GetEntityId("Pilgrim")
--		PreludeBriefing[page].npc.isObserved		= true
--		PreludeBriefing[page].dialogCamera		= true

--		PreludeBriefingShowPilgrim			= PreludeBriefing[page]

	--	page #1 (2)

		page = page + 1

		PreludeBriefing[page] 				= {}
		PreludeBriefing[page].title			= String.Key("ubersicht")
		PreludeBriefing[page].text			= String.Key("PreludeBriefing[1].text")
		PreludeBriefing[page].position 			= GetPosition("SP_ArmyPL2Assault3")
		PreludeBriefing[page].explore			= 3000

		PreludeBriefingShowArmy 			= PreludeBriefing[page]

	--	page #2 (neu)

		page = page + 1

		PreludeBriefing[page] 				= {}
		PreludeBriefing[page].title			= String.Key("ubersicht")
		PreludeBriefing[page].text			= String.Key("PreludeBriefing[2].text")

		PreludeBriefing[page].position 			= GetPosition("SP_ArmyPL2Assault4")
		PreludeBriefing[page].explore			= 3000

		PreludeBriefingShowArmy 			= PreludeBriefing[page]

	--	page #3

		page = page + 1

		PreludeBriefing[page] 				= {}
		PreludeBriefing[page].title			= String.Key("ubersicht")
		PreludeBriefing[page].text			= String.Key("PreludeBriefing[3].text")

		PreludeBriefing[page].position 			= GetPosition("RD_ArmyPL2Assault4")
		PreludeBriefing[page].explore			= 3000

		PreludeBriefingShowArmy 			= PreludeBriefing[page]

	--	page #4

		page = page + 1

		PreludeBriefing[page] 				= {}
		PreludeBriefing[page].title			= String.Key("PreludeBriefing[4].title")
		PreludeBriefing[page].text			= String.Key("PreludeBriefing[4].text")

		PreludeBriefing[page].position 			= GetPosition("CameraSpot_1")
		PreludeBriefing[page].explore			= 3000
		PreludeBriefing[page].marker			= ANIMATED_MARKER

		PreludeBriefing[page].quest			= {}
		PreludeBriefing[page].quest.id			= 1
		PreludeBriefing[page].quest.type		= MAINQUEST_OPEN
		PreludeBriefing[page].quest.title		= String.MainKey.."PreludeBriefing[4].quest.title"
		PreludeBriefing[page].quest.text		= String.MainKey.."PreludeBriefing[4].quest.text"

		PreludeBriefingDestroyHQ 			= PreludeBriefing[page]

	--	page #5

		page = page + 1

		PreludeBriefing[page] 				= {}
		PreludeBriefing[page].title			= String.GenericKey("MissionObjectives")
		PreludeBriefing[page].text			= String.Key("PreludeBriefing[5].text")

		PreludeBriefing[page].position 			= GetPosition("CameraSpot_1")

	--	go!

		StartBriefing(PreludeBriefing)

	end

---------------------------------------------------------------------------------------------
-- BriefingFinished "Prelude"
---------------------------------------------------------------------------------------------

function PreludeBriefingFinished()

	ResolveBriefing(PreludeBriefingShowArmy)

end


