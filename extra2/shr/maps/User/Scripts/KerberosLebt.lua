--------------------------------------------------------------------------------
-- MapName: Kerberos lebt
--
-- Author: Ritter Lanzelot
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")

-- Variable für armyFive
counter = 400
runde = 1

barbColor = 5
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()
	SetHostile(1,2)
	SetHostile(1,3)
	SetHostile(1,6)
	SetNeutral(1,4)
	SetNeutral(1,5)
	SetNeutral(1,6)
	SetNeutral(1,7)
	SetNeutral(1,8)
	SetPlayerName(2,"Barbaren")
	SetPlayerName(3,"Kerberos")
	SetPlayerName(5,"Darkmoor")
	SetPlayerName(7,"Bergdorf")
	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function InitResources()
    -- set some resources
    AddGold  (500)
    AddSulfur(0)
    AddIron  (0)
    AddWood  (0)	
    AddStone (0)	
    AddClay  (0)	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function InitTechnologies()
	ResearchAllMilitaryTechsAddOn(3)
	ResearchAllMilitaryTechsAddOn(6)

	ResearchAnimalTechs(2)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function InitWeatherGfxSets()
	SetupHighlandWeatherGfxSet()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function InitWeather()
    AddPeriodicSummer(600)
    AddPeriodicRain(120)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if barbColor == 5 then
		if p1color ~= 5 then
			Display.SetPlayerColorMapping(2, barbColor)
		else
			Display.SetPlayerColorMapping(2, 6)
		end
	else
		Display.SetPlayerColorMapping(2, barbColor)
	end
	Display.SetPlayerColorMapping(3, KERBEROS_COLOR)
	Display.SetPlayerColorMapping(4, NPC_COLOR)
	if p1color ~= 4 then
		Display.SetPlayerColorMapping(5, 4)
	else
		Display.SetPlayerColorMapping(5, 3)
	end
	Display.SetPlayerColorMapping(6, KERBEROS_COLOR)
	Display.SetPlayerColorMapping(7, 8)
	Display.SetPlayerColorMapping(8, CLEYCOURT_COLOR)
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  FIRST MAP ACTION
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function FirstMapAction()
	CreateBriefingMiner()
  InitNPC( "miner" );
  SetNPCWaypoints( "miner", "NPCminer_WP", 5 );
	CreateBriefingMonk()
  InitNPC( "monk" );
  SetNPCWaypoints( "monk", "NPCmonk_WP", 5 );
	--CreateBriefingGirl()
	CreateBriefingHermit()
	CreatePreludeBriefing()
---------------------------------------------------------------------------------------------	
    LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
    LocalMusic.UseSet = HIGHLANDMUSIC
---------------------------------------------------------------------------------------------	
	CreatePlayer2()
	CreatePlayer3()
	CreatePlayer6()
	CreatePlayer7()
	--CreatePlayer8()
---------------------------------------------------------------------------------------------	
	CreateArmyZero()	-- 1. für player2
	-- CreateArmyOne()		wird durch ControlArmyZero aufgerufen
	CreateArmyTwo()     -- Fernkämpfer für player3  - in der Burg vorne
	CreateArmyThree()   -- 1. für player3  obere Kaserne
	-- CreateArmyFour                     wird durch ControlArmyThree aufgerufen
	-- CreateArmyFive                     wird durch BriefingMajor aufgerufen
	-- CreateArmySix                      wird durch CountingArmyFive aufgerufen
	-- CreateArmySeven                  wird durch CountingArmySix aufgerufen
	-- CreateArmyEight                   wird durch CountingArmySeven aufgerufen
	-- CreateArmyNine                   wird durch StartArmyNine aufgerufen ( über BriefingHermit )
---------------------------------------------------------------------------------------------	
	StartSimpleJob("OpenPrison")
	StartSimpleJob("KillNPC")
	StartSimpleJob("VictoryJob")
	createChest()
	
	StartSimpleJob("ControlEnemyHeroes")
	
    --Tools.ExploreArea(-1, -1, 900)
end


function ControlEnemyHeroes()
	if Counter.Tick2("ControlEnemyHeroes", 5) then
		--Kerberos
		if IsAlive("kerberos") then
			if AreEnemiesInArea(GetPlayer("kerberos"), GetPosition("kerberos"), 1000) then
				local HeroID = GetEntityId("kerberos")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerAffectUnitsInArea(HeroID)
				end
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.8) then
					GUI.SettlerInflictFear(HeroID)
				end
			end
		end
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  BRIEFINGS
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

---------------------------------------------------------------------------------------------
-- Briefing "Prelude"
function CreatePreludeBriefing()
	PreludeBriefing = {}
	PreludeBriefing.finished = PreludeBriefingFinished
	page = 0
	--	page #1
	page = page + 1
	PreludeBriefing[page] 				  	= 	{}
	PreludeBriefing[page].title			  	= 	"ERZÄHLER"
	PreludeBriefing[page].text			  	=	"Nach langer Reise sind unsere drei Helden wieder im Lande...."
	PreludeBriefing[page].position 		  	= 	GetPosition("StartPos")
	PreludeBriefing[page].dialogCamera		=	true
	--	page #2
	page = page + 1
	PreludeBriefing[page] 				   	= 	{}
	PreludeBriefing[page].title				= 	"ERZÄHLER"
	PreludeBriefing[page].text			   	=	"Wanderer berichten, dass Kerberos dem sicheren Tod entgangen sei."
	PreludeBriefing[page].position 			= 	GetPosition("kerberos")
	PreludeBriefing[page].explore			=	BRIEFING_EXPLORATION_RANGE
	--	page #3
	page = page + 1
	PreludeBriefing[page] 			   		= 	{}
	PreludeBriefing[page].title				= 	"ERZÄHLER"
	PreludeBriefing[page].text			  	=	"Auf den Resten einer uralten Burg soll er eine neue Festung errichtet haben."
	PreludeBriefing[page].position 			= 	GetPosition("player3")
	PreludeBriefing[page].explore			=	BRIEFING_EXPLORATION_RANGE
	PreludeBriefing[page].marker		  	=	ANIMATED_MARKER
	--	page #4
	page = page + 1
	PreludeBriefing[page] 				   	= 	{}
	PreludeBriefing[page].title				= 	"ERZÄHLER"
	PreludeBriefing[page].text			   	= 	"Zerschlagt seine Truppen, @cr zerstört die Burg @cr und vernichtet ihn endgültig!"
	PreludeBriefing[page].position 			= 	GetPosition("armyThree_Old")
	PreludeBriefing[page].explore			=	BRIEFING_EXPLORATION_RANGE
	PreludeBriefingShowArmy 			  	=	PreludeBriefing[page]
	--	page #5
	page = page + 1
	PreludeBriefing[page] 					= 	{}
	PreludeBriefing[page].title				= 	"ERZÄHLER"
	PreludeBriefing[page].text				=	"Dieser alte Mönch kann Euch bei Eurer Aufgabe vielleicht helfen!"
	PreludeBriefing[page].position 			= 	GetPosition("kloster")
	PreludeBriefing[page].explore			=	BRIEFING_EXPLORATION_RANGE
	PreludeBriefingShowKloster 			  	=	PreludeBriefing[page]
	--	page #6
	page = page + 1
	PreludeBriefing[page] 				    = 	{}
	PreludeBriefing[page].title			  	= 	"ERZÄHLER"
	PreludeBriefing[page].text			    =	"Ich wünsche Euch viel Glück!"
	PreludeBriefing[page].position 		  	= 	GetPosition("StartPos")
	PreludeBriefing[page].dialogCamera		=	true
	StartBriefing( Umlaute(PreludeBriefing) )
end

---------------------------------------------------------------------------------------------
-- BriefingFinished "Prelude"
function PreludeBriefingFinished()
	ResolveBriefing(PreludeBriefingShowKloster)
	ResolveBriefing(PreludeBriefingShowArmy)
end

---------------------------------------------------------------------------------------------
-- Diese Funktion erzeugt das Briefing für den Bischof und den Bischof selbst
function CreateBriefingMonk()
	BriefingMonk 						= {}
	BriefingMonk.finished 				= BriefingMonkFinished
	local page = 0
	-- page #1
	page = page + 1
	BriefingMonk[page] 					= {}
	BriefingMonk[page].title 			= "Mönch"
	BriefingMonk[page].text 			= "Hallo, es ist schön, Euch zu sehen!"
	BriefingMonk[page].position 		= GetPosition("monk")
	BriefingMonk[page].dialogCamera 	= true
	-- page #2
	page = page + 1
	BriefingMonk[page] 					= {}
	BriefingMonk[page].title 			= "Mönch"
	BriefingMonk[page].text 			= "Seit einiger Zeit hausen Halunken dort im Wald."
	BriefingMonk[page].position 		= GetPosition("player2")
	BriefingMonk[page].explore 			= BRIEFING_EXPLORATION_RANGE
	BriefingMonk[page].marker			= ANIMATED_MARKER
	BriefingMonkMarker 					= BriefingMonk[page]
	-- page #3
	page = page + 1
	BriefingMonk[page] 					= {}
	BriefingMonk[page].title 			= "Mönch"
	BriefingMonk[page].text 			= "Alles haben sie niedergerissen, selbst unseren Schatz haben sie geraubt!"
	BriefingMonk[page].position 		= GetPosition("kloster")
	BriefingMonk[page].explore 			= BRIEFING_EXPLORATION_RANGE
	-- page #4
	page = page + 1
	BriefingMonk[page] 					= {}
	BriefingMonk[page].title 			= "Mönch"
	BriefingMonk[page].text 			= "Diese Geächteten hier werden Euch helfen, das Nest auszuheben und das Gold zu retten."
	BriefingMonk[page].position 		= GetPosition("support")
	local npcMonk 						= {}
	npcMonk.name 						= "monk"
	npcMonk.briefing 					= Umlaute( BriefingMonk)
	npcMonk.vanishPos					= "StartPos"
	CreateNPC(npcMonk)
end

---------------------------------------------------------------------------------------------
-- Diese Funktion erzeugt die Hilfstruppen für Dario
function BriefingMonkFinished()
	local troopDescription 				= {
	minNumberOfSoldiers 				= 0,
	maxNumberOfSoldiers 				= 6,
	experiencePoints 					= HIGH_EXPERIENCE,
	leaderType 							= Entities.CU_BanditLeaderBow2,
	position 							= GetPosition("support")
	}
	local army 							= {}
	local a1 							= CreateTroop(army,troopDescription)
	local a2 							= CreateTroop(army,troopDescription)
	local troopDescription 				= {
		minNumberOfSoldiers 			= 0,
		maxNumberOfSoldiers 			= 6,
		experiencePoints 				= HIGH_EXPERIENCE,
		leaderType 						= Entities.CU_BanditLeaderSword2,
		position 						= GetPosition("support")
	}
	local army 							= {}
	local b1 							= CreateTroop(army,troopDescription)
	local b2 							= CreateTroop(army,troopDescription)
	--local b3 							= CreateTroop(army,troopDescription)
end

---------------------------------------------------------------------------------------------
-- Diese Funktion erzeugt das Briefing für die Tochter und den NPC selbst
function CreateBriefingGirl()
	BriefingGirl = {}
	BriefingGirl.restoreCamera = true
	BriefingGirl.finished = BriefingGirlFinished
	local page = 0
	-- page #1
	page = page + 1
	BriefingGirl[page] = {}
	BriefingGirl[page].title = "TOCHTER DES BÜRGERMEISTERS"
	BriefingGirl[page].text = "Endlich! @cr Ich dachte schon, ich müsste hier verhungern!"
	BriefingGirl[page].position = GetPosition("girl")
	BriefingGirlShowGirl = BriefingGirl[page]
	-- page #2
	page = page + 1
	BriefingGirl[page] = {}
	BriefingGirl[page].title = "TOCHTER DES BÜRGERMEISTERS"
	BriefingGirl[page].text = "Diese Wilden haben mich entführt, mein Vater, der Bürgermeister von Darkmoor, wird Euch sehr dankbar für meine Befreiung sein."
	BriefingGirl[page].position = GetPosition("major")
	BriefingGirl[page].explore = BRIEFING_EXPLORATION_RANGE
	BriefingGirl[page].dialogCamera = true
	-- page #3
	page = page + 1
	BriefingGirl[page] = {}
	BriefingGirl[page].title = "TOCHTER DES BÜRGERMEISTERS"
	BriefingGirl[page].text = "Eilt Euch, das Dorf braucht Eure Hilfe!"
	BriefingGirl[page].position = GetPosition("darkmoor")
	-- page #4
	page = page + 1
	BriefingGirl[page] = {}
	BriefingGirl[page].title = "TOCHTER DES BÜRGERMEISTERS"
	BriefingGirl[page].text = "Lasst uns gehen!"
	BriefingGirl[page].position = GetPosition("girl")
	local npcGirl = {}
	npcGirl.name 		= 	"girl"
	npcGirl.briefing 	= 	Umlaute( BriefingGirl )
	npcGirl.vanishPos	=	"npcVanishPos"
	CreateNPC(npcGirl)
end

---------------------------------------------------------------------------------------------
-- BriefingFinished "Girl"
function BriefingGirlFinished()
	SetPlayerName(2,nil)
	ResolveBriefing(BriefingGirlShowGirl)
	CreateBriefingMajor()
end

---------------------------------------------------------------------------------------------
-- Diese Funktion erzeugt das Briefing für den Bürgermeister und den NPC selbst  / aufgerufen in BriefingGirl
function CreateBriefingMajor()
	BriefingMajor = {}
	BriefingMajor.restoreCamera = true
	BriefingMajor.finished = BriefingMajorFinished
	local page = 0
	-- page #1
	page = page + 1
	BriefingMajor[page] = {}
	BriefingMajor[page].title = "BÜRGERMEISTER"
	BriefingMajor[page].text = "Mein Herr, @cr ich bin Euch ja so dankbar für die Rettung meiner Tochter!"
	BriefingMajor[page].position = GetPosition("major")
	BriefingMajor[page].dialogCamera = true
	BriefingMajorShowMajor = BriefingMajor[page]
	-- page #2
	page = page + 1
	BriefingMajor[page] = {}
	BriefingMajor[page].title = "BÜRGERMEISTER"
	BriefingMajor[page].text = "Hier, unser gesamtes Dorf steht Euch zur Verfügung."
	BriefingMajor[page].position = GetPosition("headquarter")
	BriefingMajor[page].explore = BRIEFING_EXPLORATION_RANGE
	-- page #3
	page = page + 1
	BriefingMajor[page] = {}
	BriefingMajor[page].title = "BÜRGERMEISTER"
	BriefingMajor[page].text = "Bleibt doch bitte noch hier und helft uns gegen die Truppen von Kerberos, die unsere Gegend unsicher machen!"
	BriefingMajor[page].position = GetPosition("major")
	BriefingMajor[page].dialogCamera = true
	-- page #4
	page = page + 1
	BriefingMajor[page] = {}
	BriefingMajor[page].title 		= "BÜRGERMEISTER"
	BriefingMajor[page].text 		= "Ich glaube, sie kommen von dort! @cr Zerstört am besten die Kaserne."
	BriefingMajor[page].position 	= GetPosition("barrack_1")
	BriefingMajor[page].explore 	= BRIEFING_EXPLORATION_RANGE
	BriefingMajorShowBarrack 		= BriefingMajor[page]
	BriefingMajor[page].marker		= ANIMATED_MARKER
	BriefingMajorMarker 			= BriefingMajor[page]
	local npcMajor = {}
	npcMajor.name 		= 	"major"
	npcMajor.briefing 	= 	Umlaute( BriefingMajor )
	npcMajor.vanishPos	=	"npcVanishPos"
	CreateNPC(npcMajor)
end

---------------------------------------------------------------------------------------------
-- BriefingFinished "Major"
function BriefingMajorFinished()
	ResolveBriefing(BriefingMajorShowMajor)
	ResolveBriefing(BriefingMajorShowBarrack)
	CreateArmyFive()
	StartSimpleJob("CountingArmyFive")
	StartSimpleJob("KillMarker")
	ChangeCity()
	AddResources()
	local troopDescription 				= {
		minNumberOfSoldiers 			= 0,
		maxNumberOfSoldiers 			= 4,
		experiencePoints 				= HIGH_EXPERIENCE,
		leaderType 						= Entities.PU_LeaderSword2,
		position 						= GetPosition("supportA")
	}
	local army 							= {}
	local c1 							= CreateTroop(army,troopDescription)
	local c2 							= CreateTroop(army,troopDescription)

	SetPlayerName(2,nil)
	SetPlayerName(5,nil)

	barbColor = ROBBERS_COLOR
	Display.SetPlayerColorMapping(2, barbColor)

	CreateRaiders()
end


function CreateRaiders()
	RaidersCreate({player = 2, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
	RaidersCreate({player = 2, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2", "rudelpos2_wp3"}, range = 4000, types = RaidersDefaultSets.Europe, samount = 2, ramount = 12})
	RaidersCreate({player = 2, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1", "rudelpos3_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = 2, ramount = 12})
	RaidersCreate({player = 2, pos = "rudelpos4", revier = {"rudelpos4", "rudelpos4_wp1", "rudelpos4_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = 2, ramount = 12})
	RaidersCreate({player = 2, pos = "rudelpos5", revier = {"rudelpos5", "rudelpos5_wp1", "rudelpos5_wp2", "rudelpos5_wp3"}, range = 4000, types = RaidersDefaultSets.Europe, samount = 2, ramount = 12})

	RaidersCreate({player = 2, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
	RaidersCreate({player = 2, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
	RaidersCreate({player = 2, pos = "bearpos3", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
end

---------------------------------------------------------------------------------------------
-- Diese Funktion erzeugt das Briefing für den Eisenminer und den NPC selbst
function CreateBriefingMiner()
	BriefingMiner = {}
	BriefingMiner.restoreCamera = true
	BriefingMiner.finished = BriefingMinerFinished
	local page = 0
	-- page #1
	page = page + 1
	BriefingMiner[page] = {}
	BriefingMiner[page].title = "BERGMANN"
	BriefingMiner[page].text = "Was ich hier mache? Das frage ich mich auch!"
	BriefingMiner[page].position = GetPosition("miner")
	BriefingMiner[page].dialogCamera = true
	BriefingMinerShowMiner = BriefingMiner[page]
	-- page #2
	page = page + 1
	BriefingMiner[page] = {}
	BriefingMiner[page].title = "BERGMANN"
	BriefingMiner[page].text = "Dort hinten ist meine Eisenmine und ein prima Siedlungsplatz."
	BriefingMiner[page].position = GetPosition("bergdorf")
	BriefingMiner[page].explore = BRIEFING_EXPLORATION_RANGE
	-- page #3
	page = page + 1
	BriefingMiner[page] = {}
	BriefingMiner[page].title = "BERGMANN"
	BriefingMiner[page].text = "Ich habe hier mit Sprengstoff herumgespielt, dabei habe ich eine Lawine ausgelöst!"
	BriefingMiner[page].position = GetPosition("felsen1")
	BriefingMiner[page].explore = BRIEFING_EXPLORATION_RANGE
	-- page #4
	page = page + 1
	BriefingMiner[page] = {}
	BriefingMiner[page].title = "BERGMANN"
	BriefingMiner[page].text = "Nun stehe ich hier und komme nicht mehr zu meinem Arbeitsplatz!"
	BriefingMiner[page].position = GetPosition("miner")
	-- page #5
	page = page + 1
	BriefingMiner[page] = {}
	BriefingMiner[page].title = "BERGMANN"
	BriefingMiner[page].text = "Wenn Ihr mir den Weg freisprengen könntet?"
	BriefingMiner[page].position = GetPosition("eisenmine")
	BriefingMiner[page].explore = BRIEFING_EXPLORATION_RANGE
	-- page #6
	page = page + 1
	BriefingMiner[page] = {}
	BriefingMiner[page].title = "BERGMANN"
	BriefingMiner[page].text = "Hinter diesem Durchgang soll sich ja auch noch ein Siedlungsplatz befinden..."
	BriefingMiner[page].position = GetPosition("felsen2")
	BriefingMiner[page].explore = BRIEFING_EXPLORATION_RANGE
	local npcMiner = {}
	npcMiner.name 		= 	"miner"
	npcMiner.briefing 	= 	Umlaute( BriefingMiner )
	npcMiner.vanishPos	=	"npcVanishPos"
	CreateNPC(npcMiner)
end

---------------------------------------------------------------------------------------------
-- BriefingFinished "Miner"
function BriefingMinerFinished()
	ResolveBriefing(BriefingMinerShowMiner)
	ChangePlayer ("eisenmine",1)
	CreateBriefingRitter()
end

---------------------------------------------------------------------------------------------
-- Diese Funktion erzeugt das Briefing für den Ritter und den NPC selbst
function CreateBriefingRitter()
	BriefingRitter = {}
	BriefingRitter.restoreCamera = true
	BriefingRitter.finished = BriefingRitterFinished
	local page = 0
	-- page #1
	page = page + 1
	BriefingRitter[page] = {}
	BriefingRitter[page].title = "RITTER"
	BriefingRitter[page].text = "Wer ich bin, fragt Ihr? @cr LANZELOT ist mein Name, RITTER LANZELOT! Ich habe mir das Ganze hier ausgedacht!"
	BriefingRitter[page].position = GetPosition("lanzelot")
	BriefingRitterShowRitter = BriefingRitter[page]
	-- page #2
	page = page + 1
	BriefingRitter[page] = {}
	BriefingRitter[page].title = "RITTER"
	BriefingRitter[page].text = "Sind Eure Dorfzentren etwa schon wieder überfüllt?"
	BriefingRitter[page].position = GetPosition("darkmoor")
	BriefingRitter[page].explore = BRIEFING_EXPLORATION_RANGE
	-- page #3
	page = page + 1
	BriefingRitter[page] = {}
	BriefingRitter[page].title = "Ritter"
	BriefingRitter[page].text = "Dann will ich mal nicht so sein, dieses hier könnt Ihr haben! @cr Und noch ein kleiner Tipp:"
	BriefingRitter[page].position = GetPosition("last_village")
	BriefingRitter[page].explore = BRIEFING_EXPLORATION_RANGE
	-- page #4
	page = page + 1
	BriefingRitter[page] = {}
	BriefingRitter[page].title = "RITTER"
	BriefingRitter[page].text = "Es soll in der Nähe der Stadt unterhalb der Burg einen Einsiedler geben, redet mit ihm...."
	BriefingRitter[page].position = GetPosition("hermit")
	BriefingRitter[page].explore = BRIEFING_EXPLORATION_RANGE
	BriefingRitterShowHermit = BriefingRitter[page]
	-- page #5
	page = page + 1
	BriefingRitter[page] = {}
	BriefingRitter[page].title = "RITTER"
	BriefingRitter[page].text = "Oder baut die alte Brücke wieder auf, von dieser Seite ist die Burg weniger geschützt."
	BriefingRitter[page].position = GetPosition("neutral_bridge")
	BriefingRitter[page].explore = BRIEFING_EXPLORATION_RANGE
	BriefingRitterShowBridge = BriefingRitter[page]
	
	local npcRitter = {}
	npcRitter.name 		= 	"lanzelot"
	npcRitter.briefing 	= 	Umlaute( BriefingRitter )
	npcRitter.vanishPos	=	"npcVanishPos"
	CreateNPC(npcRitter)
end

---------------------------------------------------------------------------------------------
-- BriefingFinished "Miner"
function BriefingRitterFinished()
	ResolveBriefing(BriefingRitterShowRitter)
	ResolveBriefing(BriefingRitterShowHermit)
	ResolveBriefing(BriefingRitterShowBridge)
	ChangePlayer ("last_village",1)
end

---------------------------------------------------------------------------------------------
-- Diese Funktion erzeugt das Briefing für den Einsiedler und den NPC selbst
function CreateBriefingHermit()
	BriefingHermit = {}
	BriefingHermit.restoreCamera = true
	BriefingHermit.finished = BriefingHermitFinished
	local page = 0
	-- page #1
	page = page + 1
	BriefingHermit[page] = {}
	BriefingHermit[page].title = "EINSIEDLER"
	BriefingHermit[page].text = "Ha, alles wird besser, haben sie gesagt! Aber lieber hause ich hier allein im Wald, als in der Stadt von denen!"
	BriefingHermit[page].position = GetPosition("hermit")
	BriefingHermitShowHermit = BriefingHermit[page]
	-- page #2
	page = page + 1
	BriefingHermit[page] = {}
	BriefingHermit[page].title = "EINSIEDLER"
	BriefingHermit[page].text = "Aber ich habe hier etwas, was Ihr gebrauchen könntet! @cr Wie wäre es mit einem Schlüssel für die Festungstore?"
	BriefingHermit[page].position = GetPosition("kerberos")
	-- page #3
	page = page + 1
	BriefingHermit[page] = {}
	BriefingHermit[page].title = "EINSIEDLER"
	BriefingHermit[page].text = "Keiner weiss, dass ich den noch habe, ich wünsche Euch viel Glück!"
	BriefingHermit[page].position = GetPosition("hermit")
	
	local npcHermit = {}
	npcHermit.name 		= 	"hermit"
	npcHermit.briefing 	= 	Umlaute( BriefingHermit )
	npcHermit.vanishPos	=	"npcVanishPos"
	CreateNPC(npcHermit)
end

---------------------------------------------------------------------------------------------
-- BriefingFinished "Miner"
function BriefingHermitFinished()
	CreateArmyFour()
	StartSimpleJob("StartArmyNine")
	ResolveBriefing(BriefingHermitShowHermit)
	ReplaceEntity ("last_gate", Entities.XD_DarkWallStraightGate )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  Erzeugen der Computerspieler
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function CreatePlayer2()
	player2 					= {}
	player2.id 					= 2
	local description 			= {serfLimit = 10}
	SetupPlayerAi(player2.id,description)
end

function CreatePlayer3()
	player3 					= {}
	player3.id 					= 3

  MapEditor_SetupAI(player3.id, 2, 10000, 3, "p3_hq", 0, 0)

	local description 			= {
    serfLimit = 12,
    --------------------------------------------------
    extracting			=	false,
    --------------------------------------------------
    rebuild = {
      delay				=	25,
      randomTime	=	25
    },
    --------------------------------------------------
    resources = {
      gold				=	2000,
      clay				=	1000,
      wood				=	1000,
      stone				=	1000,
      iron				=	1000,
      sulfur			=	1000
    },
    --------------------------------------------------
    refresh = {
      gold				=	20,
      clay				=	10,
      wood				=	10,
      stone				=	10,
      iron				=	10,
      sulfur			=	10,
      updateTime	=	1
    },
  }
	SetupPlayerAi(player3.id,description)
end

function CreatePlayer6()
	player6 					= {}
	player6.id 					= 6
	local description 			= {serfLimit = 10}
	SetupPlayerAi(player6.id,description)
end

function CreatePlayer7()
	player7 					= {}
	player7.id 					= 7
	local description 			= {serfLimit = 10}
	SetupPlayerAi(player7.id,description)
end

function CreatePlayer8()
	player8 					= {}
	player8.id 					= 8
	local description 			= {serfLimit = 10}
	SetupPlayerAi(player8.id,description)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  Erzeugen der Armeen für den Computer
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- erzeugt die erste Truppe Barbaren für den Spieler 2
function CreateArmyZero()
	armyZero						= {}
	armyZero.player 				= 2
	armyZero.id 					= 0
	armyZero.strength 				= 8
	armyZero.position 				= GetPosition("armyZero")
	armyZero.rodeLength 			= 500
	SetupArmy(armyZero)
	local troopDescription 					= {}
	troopDescription.maxNumberOfSoldiers 	= 4
	troopDescription.minNumberOfSoldiers 	= 0
	troopDescription.experiencePoints 		= LOW_EXPERIENCE
	troopDescription.leaderType 			= Entities.CU_Barbarian_LeaderClub1
	for i = 1,4,1 do
		EnlargeArmy(armyZero,troopDescription)
	end
	StartSimpleJob("ControlArmyZero")
end

-- erzeugt die zweite Truppe Barbaren für den Spieler 2
function CreateArmyOne()
	armyOne	= {}
	armyOne.player 					= 2
	armyOne.id 						= 1
	armyOne.strength 				= 8
	armyOne.position 				= GetPosition("armyOne")
	armyOne.rodeLength 				= 4000
	SetupArmy(armyOne)
	local troopDescription 					= {}
	troopDescription.maxNumberOfSoldiers 	= 4
	troopDescription.minNumberOfSoldiers 	= 0
	troopDescription.experiencePoints 		= LOW_EXPERIENCE
	troopDescription.leaderType 			= Entities.CU_Barbarian_LeaderClub1
	for i = 1,4,1 do
		EnlargeArmy(armyOne,troopDescription)
	end
	StartSimpleJob("ControlArmyOne")
end

-- erzeugt die erste Truppe für den Spieler 3 (  in der Burg )
function CreateArmyTwo()
	armyTwo	 = {}
	armyTwo.player 					= 3
	armyTwo.id						= 0
	armyTwo.strength				= 8
	armyTwo.position				= GetPosition("armyTwo")
	armyTwo.rodeLength				= 4000
	SetupArmy(armyTwo)
	local troopDescription 					= {
		maxNumberOfSoldiers					= 8,
		minNumberOfSoldiers					= 0,
		experiencePoints 					= VERYHIGH_EXPERIENCE,
		leaderType         					= Entities.PU_LeaderBow4
	}
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
  troopDescription.leaderType = Entities.PU_LeaderRifle2
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	EnlargeArmy(armyTwo,troopDescription)
	StartSimpleJob("ControlArmyTwo")
end

-- erzeugt die erste Armee an der oberen Kaserne für den Spieler 3  
function CreateArmyThree()
	armyThree							= {}
	armyThree.player 					= 3
	armyThree.id 						= 9
	armyThree.strength 					= 8
	armyThree.position 					= GetPosition("armyThree")
	armyThree.rodeLength 				= 5000
	SetupArmy(armyThree)
	local troopDescription1 				= {}
	troopDescription1.maxNumberOfSoldiers 	= 8
	troopDescription1.minNumberOfSoldiers 	= 0
	troopDescription1.experiencePoints 		= VERYHIGH_EXPERIENCE
	troopDescription1.leaderType 			= Entities.PU_LeaderSword4
	local troopDescription2 				= {}
	troopDescription2.maxNumberOfSoldiers 	= 8
	troopDescription2.minNumberOfSoldiers 	= 0
	troopDescription2.experiencePoints 		= VERYHIGH_EXPERIENCE
	troopDescription2.leaderType 			= Entities.PU_LeaderBow4
	for i = 1,4,1 do
		EnlargeArmy(armyThree,troopDescription1)
	end
		for i = 1,4,1 do
		EnlargeArmy(armyThree,troopDescription2)
	end
	StartSimpleJob("ControlArmyThree")
end

-- erzeugt die zweite Armee an der oberen Kaserne für den Spieler 3  
function CreateArmyFour()
	armyFour	 						= {}
	armyFour.player 					= 3
	armyFour.id							= 8
	armyFour.strength					= 8
	armyFour.position					= GetPosition("armyThree_Old")
	armyFour.rodeLength					= 4000
	SetupArmy(armyFour)
	local troopDescription1 			= {
		maxNumberOfSoldiers				= 8,
		minNumberOfSoldiers				= 0,
		experiencePoints 				= VERYHIGH_EXPERIENCE,
		leaderType         				= Entities.PU_LeaderSword4
	}
	local troopDescription2 			= {
	maxNumberOfSoldiers					= 8,
	minNumberOfSoldiers					= 0,
	experiencePoints 					= VERYHIGH_EXPERIENCE,
	leaderType         					= Entities.PU_LeaderBow4
	}
	EnlargeArmy(armyFour,troopDescription1)
	EnlargeArmy(armyFour,troopDescription2)
	EnlargeArmy(armyFour,troopDescription1)
	EnlargeArmy(armyFour,troopDescription2)
	EnlargeArmy(armyFour,troopDescription1)
	EnlargeArmy(armyFour,troopDescription2)
	StartSimpleJob("ControlArmyFour")
  end  

-- erzeugt die erste Angriffstruppe für den Spieler 3  
function CreateArmyFive()
	armyFive							= {}
	armyFive.player 					= 6
	armyFive.id 						= 5
	armyFive.strength 					= 8
	armyFive.position 					= GetPosition("armyFive")
	armyFive.rodeLength 				= 10000
	SetupArmy(armyFive)
	local troopDescription 					= {}
	troopDescription.maxNumberOfSoldiers 	= 4
	troopDescription.minNumberOfSoldiers 	= 0
	troopDescription.experiencePoints 		= LOW_EXPERIENCE
	troopDescription.leaderType 			= Entities.PU_LeaderSword2
	for i = 1,5,1 do
		EnlargeArmy(armyFive,troopDescription)
	end
	StartSimpleJob("ControlArmyFive")
end

-- armySix löst nach 5 Durchläufen armyFive ab
function CreateArmySix()
	armySix								= {}
	armySix.player 						= 6
	armySix.id 							= 6
	armySix.strength 					= 8
	armySix.position 					= GetPosition("armyFive")
	armySix.rodeLength 					= 10000
	SetupArmy(armySix)
	local troopDescription = {}
	troopDescription.maxNumberOfSoldiers = 8
	troopDescription.minNumberOfSoldiers = 0
	troopDescription.experiencePoints = HIGH_EXPERIENCE
	troopDescription.leaderType = Entities.PU_LeaderSword3
	for i = 1,5,1 do
		EnlargeArmy(armySix,troopDescription)
	end
	StartSimpleJob("ControlArmySix")
end

-- armySeven löst nach 5 Durchläufen armySix ab
function CreateArmySeven()
	armySeven								= {}
	armySeven.player 						= 6
	armySeven.id 							= 7
	armySeven.strength 						= 8
	armySeven.position 						= GetPosition("armyFive")
	armySeven.rodeLength 					= 10000
	SetupArmy(armySeven)
	local troopDescription1 					= {}
	troopDescription1.maxNumberOfSoldiers 		= 8
	troopDescription1.minNumberOfSoldiers 		= 0
	troopDescription1.experiencePoints 			= HIGH_EXPERIENCE
	troopDescription1.leaderType 				= Entities.PU_LeaderSword3
	local troopDescription2 					= {}
	troopDescription2.maxNumberOfSoldiers 		= 8
	troopDescription2.minNumberOfSoldiers 		= 0
	troopDescription2.experiencePoints 			= HIGH_EXPERIENCE
	troopDescription2.leaderType 				= Entities.PU_LeaderBow3
	for i = 1,6,1 do
		EnlargeArmy(armySeven,troopDescription1)
	end
	for i = 1,4,1 do
		EnlargeArmy(armySeven,troopDescription2)
	end
	StartSimpleJob("ControlArmySeven")
end

-- armyEighth löst nach 5 Durchläufen armySeven ab
function CreateArmyEight()
	armyEight								= {}
	armyEight.player 						= 6
	armyEight.id 							= 8
	armyEight.strength 						= 8
	armyEight.position 						= GetPosition("armyFive")
	armyEight.rodeLength 					= 10000
	SetupArmy(armyEight)
	local troopDescription1 					= {}
	troopDescription1.maxNumberOfSoldiers 		= 3
	troopDescription1.minNumberOfSoldiers 		= 0
	troopDescription1.experiencePoints 			= LOW_EXPERIENCE
	troopDescription1.leaderType 				= Entities.PU_LeaderCavalry1
	local troopDescription2 					= {}
	troopDescription2.maxNumberOfSoldiers 		= 3
	troopDescription2.minNumberOfSoldiers 		= 0
	troopDescription2.experiencePoints 			= LOW_EXPERIENCE
	troopDescription2.leaderType 				= Entities.PU_LeaderHeavyCavalry1
	for i = 1,5,1 do
		EnlargeArmy(armyEight,troopDescription1)
	end
	for i = 1,5,1 do
		EnlargeArmy(armyEight,troopDescription2)
	end
	StartSimpleJob("ControlArmyEight")
end

-- erzeugt die Schwertkämpfer in der Burg  
function CreateArmyNine()
	armyNine							= {}
	armyNine.player 					= 3
	armyNine.id 						= 7
	armyNine.strength 					= 8
	armyNine.position 					= GetPosition("armyNine")
	armyNine.rodeLength 				= 5000
	SetupArmy(armyNine)
	local troopDescription1 					= {}
    troopDescription1.maxNumberOfSoldiers 	= 8
    troopDescription1.minNumberOfSoldiers 	= 0
    troopDescription1.experiencePoints 		= VERYHIGH_EXPERIENCE
    troopDescription1.leaderType 			= Entities.PU_LeaderSword4
	local troopDescription2 					= {}
    troopDescription2.maxNumberOfSoldiers 		= 8
    troopDescription2.minNumberOfSoldiers 		= 0
    troopDescription2.experiencePoints 			= VERYHIGH_EXPERIENCE
    troopDescription2.leaderType 				= Entities.PU_LeaderBow4
	for i = 1,4,1 do
		EnlargeArmy(armyNine,troopDescription1)
	end
  troopDescription1.leaderType 			= Entities.PU_LeaderPoleArm4
	for i = 1,2,1 do
		EnlargeArmy(armyNine,troopDescription1)
	end
	for i = 1,2,1 do
		EnlargeArmy(armyNine,troopDescription2)
	end
  troopDescription2.leaderType 			= Entities.PU_LeaderRifle2
	for i = 1,2,1 do
		EnlargeArmy(armyNine,troopDescription2)
	end
	StartSimpleJob("ControlArmyNine")
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  Diverse Funktionen
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- diese Funktion übergibt die Stadt an Player1
function ChangeCity()
	ChangePlayer ("darkmoor",1)
	ChangePlayer ("headquarter",1) 
	ChangePlayer ("turm1",1)
	ChangePlayer ("turm2",1) 
	ChangePlayer ("haus1",1)
	ChangePlayer ("haus2",1) 
	ChangePlayer ("haus3",1)
	ChangePlayer ("mill1",1) 
	ChangePlayer ("farm1",1)
	ChangePlayer ("farm2",1) 
	ChangePlayer ("farm3",1) 
	ChangePlayer ("farm4",1) 
	ChangePlayer ("schmied",1)
	ChangePlayer ("uni",1) 
	ChangePlayer ("steinmetz",1) 
end

-- Dierse Funktion gibt dem Spieler Rohstoffe in der angegebenen Menge(s)
function AddResources()
  GlobalMissionScripting.GiveResouces(1, 1000, 2000, 2000, 1000, 1000, 500)
end

-- Diese Funktion erzeugt eine Schatztruhe mit zufälligem Inhalt
function createChest()
	CreateRandomGoldChest(GetPosition("chest"))
	CreateChestOpener("dario")
	CreateChestOpener("erec")
	CreateChestOpener("pilgrim")
	StartChestQuest()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  ControlArmy-Jobs
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- 1. Barbarentruppe
function ControlArmyZero()
	-- kommen die Helden dem Turm von player2 zu nahe, greift armyZero an
	if IsNear("dario",65542,6000) or IsNear("pilgrim",65542,6000) or IsNear("erec",65542,6000) then
		Advance(armyZero)
	else
		Defend(armyZero)
	end	
	
	-- kommen die Helden dem Turm von player2 zu nahe, erscheint der zweite Trupp
	if IsNear("dario",65542,3000) or IsNear("pilgrim",65542,3000) or IsNear("erec",65542,3000) then
		CreateArmyOne()
		return true
	end
end
-- 2. Barbarentruppe
function ControlArmyOne()
	FrontalAttack(armyOne)
end
-- Fernkämpfer in der Burg
function ControlArmyTwo()
	Defend(armyTwo)
end
-- Truppen an der 2. Kaserne
function ControlArmyThree()
	Defend (armyThree)
end

function ControlArmyFour()
	Advance(armyFour)
end
-- Angriffstruppen von der unteren Kaserne
function ControlArmyFive()
	FrontalAttack(armyFive)
	if not armyFive.created then
        armyFive.created = not IsDead(armyFive);
        return false;
    end

    if IsDead(armyFive) then
        Message( "Der Angreifer ist besiegt" );
        return true;
    end
end

function ControlArmySix()
	FrontalAttack(armySix)
	if not armySix.created then
        armySix.created = not IsDead(armySix);
        return false;
    end

    if IsDead(armySix) then
        Message( "Der Angreifer ist besiegt" );
        return true;
    end
end

function ControlArmySeven()
	FrontalAttack(armySeven)
	if not armySeven.created then
        armySeven.created = not IsDead(armySeven);
        return false;
    end

    if IsDead(armySeven) then
        Message( "Der Angreifer ist besiegt" );
        return true;
    end
end

function ControlArmyEight()
	FrontalAttack(armyEight)
	if not armyEight.created then
        armyEight.created = not IsDead(armyEight);
        return false;
    end

    if IsDead(armyEight) then
        Message( "Der Angreifer ist besiegt" );
        return true;
    end
end
-- Schwertkämpfer in der Burg
function ControlArmyNine()
	FrontalAttack(armyNine)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  ArmyCounter-Jobs
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- zählt den Counter herunter und startet bei Null  armyFive
function CountingArmyFive()
	if ( counter > 0 ) then
		counter = counter -1
	else
		if IsAlive ("barrack_1") then
			if ( runde < 5 ) then
				CreateArmyFive()
				Message("Ein kleiner Trupp Feinde ist im Anmarsch")
				counter = 360
				runde = runde +1
			else
				StartSimpleJob("CountingArmySix")
				return true
			end
		else
			Message (" ")
			return true
		end
	end
end

-- zählt den Counter herunter und startet bei Null  armySix
function CountingArmySix()
	if ( counter > 0 ) then
		counter = counter -1
	else
		if IsAlive ("barrack_1") then
			if ( runde < 10 ) then
				CreateArmySix()
				Message("Ein grosser Trupp Feinde ist im Anmarsch")
				counter = 420
				runde = runde +1
			else
				StartSimpleJob("CountingArmySeven")
				return true
			end
		else
			Message (" ")
			return true
		end
	end
end

-- zählt den Counter herunter und startet bei Null  armySeven
function CountingArmySeven()
	if ( counter > 0 ) then
		counter = counter -1
	else
		if IsAlive ("barrack_1") then
			if ( runde < 15 ) then
				CreateArmySeven()
				Message("Eine kleine Armee ist im Anmarsch")
				counter = 480
				runde = runde +1
			else
				StartSimpleJob("CountingArmyEight")
				return true
			end
		else
			Message (" ")
			return true
		end
	end
end

-- zählt den Counter herunter und startet bei Null  armyEight  
function CountingArmyEight()
	if ( counter > 0 ) then
		counter = counter -1
	else
		if IsAlive ("barrack_1") then
			CreateArmyEight()
			Message("Eine berittene Armee ist im Anmarsch")
			counter = 480
			runde = runde +1

			ResearchTechnology(Technologies.T_AnimalTechnology2, 2);
		else
			return true
		end
	end
end

function StartArmyNine()
	if IsNear("dario","tor_unten",3000) 
	or IsNear("pilgrim","tor_unten",3000) 
	or IsNear("erec","tor_unten",3000) then
	CreateArmyNine()
	return true
	end
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  Diverse Jobs
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- killt die NPCs
function KillNPC()
	if IsNear ("major","headquarter",1000) then
		DestroyEntity ("major") 
	end
	
	if IsNear ("girl","headquarter",1000) then
		DestroyEntity ("girl") 
	end
	
	if IsNear ("miner","headquarter",1000) then
		DestroyEntity ("miner") 
	end
	
	if IsNear ("lanzelot","headquarter",1000) then
		DestroyEntity ("lanzelot") 
	end
end

-- Diese Funktion ?ffnet das Gef?ngnis, wenn der Turm von player2 zerst?rt ist
function OpenPrison()
	if IsDead("player2") and IsDead("p2_prison") then
		ResolveBriefing(BriefingMonkMarker)
		CreateBriefingGirl()
	end
end

function KillMarker()
	if IsDead("barrack_1") then
		ResolveBriefing(BriefingMajorMarker)
	end
end

function Umlaute( _text )
	local texttype = type( _text );
	if texttype == "string" then
		_text = string.gsub( _text, "ä", "\195\164" );
		_text = string.gsub( _text, "ö", "\195\182" );
		_text = string.gsub( _text, "ü", "\195\188" );
		_text = string.gsub( _text, "ß", "\195\159" );
		_text = string.gsub( _text, "Ä", "\195\132" );
		_text = string.gsub( _text, "Ö", "\195\150" );
		_text = string.gsub( _text, "Ü", "\195\156" );
		return _text;
	elseif texttype == "table" then
		for k,v in _text do
			_text[k] = Umlaute( v );
		end
		return _text;
	else
		return _text;
	end
end

-- Diese Funktion stellt den VictoryJob dar
function VictoryJob()
	if IsDead("player3") then
		Victory()
	end
end