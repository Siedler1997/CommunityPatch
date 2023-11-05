--------------------------------------------------------------------------------
-- MapName: Die schwarzen Berge
--
-- Author: Christian & Matthias
-- Zeichen: ae ä oe ö ue ü Ue Ü Oe Ö- Ae Ä
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()
    SetHostile(1,2)
    SetHostile(1,3)
    SetHostile(1,7)
    SetHostile(3,4)
    SetFriendly(1,4)
    SetPlayerName(2,"Ataken")
    SetPlayerName(3,"Nebelvolk")
    SetPlayerName(4,"Birnheim")
    SetPlayerName(5,"Banditen")
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function InitResources()
    -- set some resources
		GlobalMissionScripting.GiveResouces(1, 1000, 1500, 1000, 1000, 500, 350)
    AddGold  (4,3000)
    AddSulfur(4,3000)
    AddIron  (4,3000)
    AddWood  (4,3000)	
    AddStone (4,3000)	
    AddClay  (4,3000)	

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function InitTechnologies()
   ForbidTechnology (Technologies.GT_Mathematics)
   ForbidTechnology (Technologies.GT_Binocular)
   ForbidTechnology (Technologies.GT_Matchlock)
   ForbidTechnology (Technologies.GT_PulledBarrel)
   
   ResearchAllMilitaryTechsAddOn(2)
   ResearchAllMilitaryTechsAddOn(3)
   ResearchAllMilitaryTechsAddOn(4, true)
   ResearchAllMilitaryTechsAddOn(5)
   ResearchAllMilitaryTechsAddOn(7)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function InitWeatherGfxSets()
	SetupNormalWeatherGfxSet()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function InitWeather()
	AddPeriodicSummer(600)
	AddPeriodicRain(180)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function InitPlayerColorMapping()
    local p1color = GetPlayerPreferredColor()
    Display.SetPlayerColorMapping(1, p1color)
    Display.SetPlayerColorMapping(2, 7)		
    if p1color ~= 2 then
        Display.SetPlayerColorMapping(3, 2)		
    else
        Display.SetPlayerColorMapping(3, 6)	
    end
    if p1color == 4 then
        Display.SetPlayerColorMapping(4, 3)	
    end
    Display.SetPlayerColorMapping(5, ROBBERS_COLOR)		
    Display.SetPlayerColorMapping(6, NPC_COLOR)		
    Display.SetPlayerColorMapping(7, ROBBERS_COLOR)		
    Display.SetPlayerColorMapping(8, NPC_COLOR)		
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function FirstMapAction()

	-- Level 0 is deactivated...ignore
	MapEditor_SetupAI(2, 2, 1500, 3, "Ataken", 1, 600)
	MapEditor_SetupAI(3, 2, 1000, 0, "Nebelvolk", 2, 0)
	MapEditor_SetupAI(4, 0, 1000, 3, "BirnBurg", 1, 0)
	MapEditor_SetupAI(5, 1, 6000, 0, "Banditen", 1, 0)
	MapEditor_SetupAI(6, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(7, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(8, 0, 0, 0, "", 0, 0)

	-- HQ Defeat Condition
	MapEditor_CreateHQDefeatCondition()
	LocalMusic.UseSet = EUROPEMUSIC

  ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
  ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree

	CreateNVolkEins()
	CreateSettlers()
	CreateBirnheim()
	Einleitung()
	CreateNpcs()
	SchleifeA = StartSimpleJob("Abfrage")
	SchleifeB = StartSimpleJob("AbfrageSP")
  majgesp = 0         --majgesp ist 1, sobald man das Geschenk vom B?rgermeister bekommen hat
  Haus = 0            --Haus ist 1, wenn das Haus f?r Leonardo gebaut ist
  Angriffe = 0        --Z?hlt die Angriffe auf Birnheim, l?st Angriffe auf eigene Burg aus
  NVMenge = 0         --Wechselt von 0 zu 1 zu 0 f?r eigenen NebelV Angriff
  angekommen = 0      --angekommen wird 1, sobald Leonardos Gehilfe zur?ck ist
  
	RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 8})
	RaidersCreate({player = 7, pos = "bearpos1", revier = {"bearpos1", "bearpos1_wp1"}, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
    
	StartSimpleJob("ControlEnemyHeroes")

    --gvGUI.BonusHeroId = GetEntityId("Yuki")

  --Tools.ExploreArea(-1, -1, 900)
end


function ControlEnemyHeroes()
	if Counter.Tick2("ControlEnemyHeroes", 5) then
		--Varg
		--[[
		--Deactivated for Varg because I'm too lazy to prevent him from drowning after usage
		if IsAlive("viking") then
			if AreEnemiesInArea(GetPlayer("viking"), GetPosition("viking"), 2000) then
				local HeroID = GetEntityId("viking")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerSummon(HeroID)
				end

				GUI.SettlerAffectUnitsInArea(HeroID)
			end
		end
		--]]
		--Mary
		if IsAlive("mary") then
			if AreEnemiesInArea(GetPlayer("mary"), GetPosition("mary"), 2000) then
				local HeroID = GetEntityId("mary")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerAffectUnitsInArea(HeroID)
				end
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.8) then
					GUI.SettlerCircularAttack(HeroID)
				end
			end
		end
		--Kala
		if IsAlive("Kala") then
			if AreEnemiesInArea(GetPlayer("Kala"), GetPosition("Kala"), 1000) then
				local HeroID = GetEntityId("Kala")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerCircularAttack(HeroID)
				end
			end
		end
	end
end
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Definieren der ersten Armee des Nebelvolkes
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function CreateNVolkEins()
  local pos1 = GetPosition("NVolk")
  local pos2 = GetPosition("Birnheim")
  local pos3 = GetPosition("NVGebirge")

-- Nebelvolk f?r eigene Burg
  SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos1.X,pos1.Y,0,0,2,0),"NVSkirone")
  SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos1.X,pos1.Y,0,0,2,0),"NVBearone")
	Attack("NVSkirone","StartPos")
	Attack("NVBearone","StartPos")

-- Nebelvolk f?r Birnheim (Tor)
  SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos2.X,pos2.Y,0,0,2,0),"NVBirnS")
  SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos2.X,pos2.Y,0,0,2,0),"NVBirnB")

-- Nebelvolk Verteidigung(Gebirge)
  AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos1.X,pos1.Y,0,0,3,0)
  AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos1.X,pos1.Y,0,0,3,0)
  AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos3.X,pos3.Y,0,0,3,0)
  AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos3.X,pos3.Y,0,0,3,0)
  AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos1.X,pos1.Y,0,0,3,0)
  AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos1.X,pos1.Y,0,0,3,0)
  AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos3.X,pos3.Y,0,0,3,0)
  AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos3.X,pos3.Y,0,0,3,0)



-- Nebelvolk f?r Birnheim (2.Angriff)
  SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos1.X,pos1.Y,0,0,2,0),"NVBirnSa")
  SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos1.X,pos1.Y,0,0,2,0),"NVBirnBa")
	Move("NVBirnSa","Birnheim")
	Move("NVBirnBa","Birnheim")

end

function CreateSettlers()

	CreateMilitaryGroup(4,Entities.PU_LeaderRifle1,4,GetPosition("Haupt"),"Scharfsch")
	Move("Scharfsch","StartPos")

  local pos = GetPosition("Birnsch")
  SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,1,0),"ScharfBirn")

end

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function CreateBirnheim()

    local description = {}
  description.serfLimit = 6
  description.extracting = false
  description.constructing = true
  description.repairing = true

	SetupPlayerAi(4,description)

end

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function Einleitung()

	PreludeBriefing = {}
-- 	PreludeBriefing.finished = PreludeBriefingFinished
	page = 0

		page = page + 1

		PreludeBriefing[page] 				= 	{}

		PreludeBriefing[page].title		= 	"Hauptmann"
		PreludeBriefing[page].text			=	"Alarm. Ich komme gerade von Birnheim, einer Stadt im Norden."

		PreludeBriefing[page].npc			=	{}
		PreludeBriefing[page].npc.id		=	GetEntityId("Scharfsch")
		PreludeBriefing[page].npc.isObserved=	true
		PreludeBriefing[page].dialogCamera	=	true

    -- store the count of the page, so we can resolve it later
		PreludeBriefingShowScharfsch		= PreludeBriefing[page]

		page = page + 1

		PreludeBriefing[page] 				= 	{}
		PreludeBriefing[page].title		= "Hauptmann"
		PreludeBriefing[page].text			=	"Die Stadt wird vom Nebelvolk angegriffen. Bestimmt werden sie auch hierher kommen."

		PreludeBriefing[page].position 	= 	GetPosition("Birnheim")
		PreludeBriefing[page].explore	=	BRIEFING_EXPLORATION_RANGE

		PreludeBriefingShowBirnheim 			=	PreludeBriefing[page]


		page = page + 1

		PreludeBriefing[page] 			   	= 	{}
		PreludeBriefing[page].title			= 	"Dario"
		PreludeBriefing[page].text			   =	"Wir werden auf Angriffe gewapnet sein. Hoffe ich zumindest..."

		PreludeBriefing[page].position 		= 	GetPosition("Dario")
		PreludeBriefing[page].explore		=	BRIEFING_EXPLORATION_RANGE
		PreludeBriefing[page].dialogCamera	=	true

  -- neuer Auftrag
		PreludeBriefing[page].quest			=	{}
		PreludeBriefing[page].quest.id		=	1
		PreludeBriefing[page].quest.type	=	SUBQUEST_OPEN
		PreludeBriefing[page].quest.title	=	"Verteidigt euch"
		PreludeBriefing[page].quest.text	=	"Versucht die Angriffe abzuwehren und ein florierendes Dorf aufzubauen."

		PreludeBriefingShowDario 			  =	PreludeBriefing[page]

		page = page + 1

		PreludeBriefing[page] 				= 	{}
		PreludeBriefing[page].title		= 	MISSION_OBJECTIVES
		PreludeBriefing[page].text			=	"Verteidigt euer Dorf"

		PreludeBriefing[page].position 	= 	GetPosition("StartPos")

		StartBriefing(PreludeBriefing)
--		DestroyNPC(PreludeBriefing[1].npc)
end
--...................................Endfilm.........................................
function Schluss()

	CloseBriefing = {}
 	CloseBriefing.finished = Ende
	page = 0

		page = page + 1

		CloseBriefing[page] 				= 	{}

		CloseBriefing[page].title		= 	"Leonardo"
		CloseBriefing[page].text			=	"Oh da kommt ja mein Gehilfe. Nun ist alles wieder in Ordnung."
		CloseBriefing[page].dialogCamera	=	true
		CloseBriefing[page].position 	= 	GetPosition("Leonardo")

		StartBriefing(CloseBriefing)

end

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

function CreateNpcs()

    NpcBriefing                         =   {}
    NpcBriefing.restoreCamera           =   true
    NpcBriefing.finished                = Wechsel

    page = 0

    page = page + 1
    NpcBriefing[page]               =   {}

    NpcBriefing[page].title         =   "Hauptmann"
    NpcBriefing[page].text          =   "Ich glaube ihr benötigt unsere Unterstützung. Wir werden mit euch die Angreifer zurückschlagen."

    NpcBriefing[page].position      =   GetPosition("StartPos")
    NpcBriefing[page].dialogCamera  =   true

		NpcBriefing[page].quest			  =	{}
		NpcBriefing[page].quest.id		  =	2
		NpcBriefing[page].quest.type	  =	SUBQUEST_OPEN
		NpcBriefing[page].quest.title	=	"Sprecht mit dem Bürgermeister"
		NpcBriefing[page].quest.text	  =	"Geht nach Birnheim und sprecht dort mit dem Bürgermeister."
    Majorquest = NpcBriefing[page]

    page = page + 1
    NpcBriefing[page]               =   {}
    NpcBriefing[page].title         =   "Hauptmann"
    NpcBriefing[page].text          =   "Ach ja, fasst hätte ich es vergessen. Unser Bürgermeister möchte mit euch sprechen."
    NpcBriefing[page].explore	    	=	  BRIEFING_EXPLORATION_RANGE
    NpcBriefing[page].marker		     =	  STATIC_MARKER

    NpcBriefing[page].position      =   GetPosition("Major")
    NpcBriefing[page].restoreCamera  =   true


    -- Setup table for NPC
    Npc               =   {}
    Npc.name                =   "Scharfsch"
    Npc.briefing            =   NpcBriefing
    -- Create the NPC
    CreateNPC(Npc)
-- ++++++++++++++++++++++++++++++++++++++++ Major ++++++++++++++++++++++++++++++++++++

    BuergBriefing                         =   {}
    BuergBriefing.restoreCamera           =   true
    BuergBriefing.finished = Buergerfertig


    page = 0

    page = page + 1
    BuergBriefing[page]               =   {}

    BuergBriefing[page].title         =   "Bürgermeister"
    BuergBriefing[page].text          =   "Hallo Dario. Gut dass ihr gekommen seid. Wie ihr seht, haben wir ein Problem. Das Nebelvolk attackiert andauernd unsere Stadt."

    BuergBriefing[page].position      =   GetPosition("Major")
    BuergBriefing[page].dialogCamera  =   true

    page = page + 1
    BuergBriefing[page]               =   {}
    BuergBriefing[page].title         =   "Bürgermeister"
    BuergBriefing[page].text          =   "Wir wären euch sehr dankbar, wenn ihr sie vertreiben könntet. Unsere Kundschafter haben berichtet, dass es mehrere Wege in ihr Hauptquartier gibt."
    BuergBriefing[page].marker		     =	  ANIMATET_MARKER

    BuergBriefing[page].position      =   GetPosition("Major")
    BuergBriefing[page].restoreCamera  =   true

		BuergBriefing[page].quest			=	   {}
		BuergBriefing[page].quest.id		=	   3
		BuergBriefing[page].quest.type	=	   SUBQUEST_OPEN
		BuergBriefing[page].quest.title = 	"Besiegt das Nebelvolk"
		BuergBriefing[page].quest.text	=	   "Findet das Hauptquartier des Nebelvolkes und zerstört es. Hinweis, Es gibt mehrere Wege, die in ihr Hauptquartier führen."

		Buergerquest                = 	   BuergBriefing[page]

    -- Setup table for NPC
    Bue                     =   {}
    Bue.name                =   "Major"
    Bue.briefing            =   BuergBriefing
    Bue.heroName            =   "Dario"
    Bue.wrongHeroMessage    =   "Ich möchte mit Dario sprechen."

    -- Create the NPC
    CreateNPC(Bue)


--++++++++++++++++++++++ Leonardo ++++++++++++++++++++++++++++++++++++++++++++++++++++++
    LeoBriefing                         =   {}
    LeoBriefing.restoreCamera           =   true

    page = 0

    page = page + 1
    LeoBriefing[page]               =   {}

    LeoBriefing[page].title         =   "Leonardo"
    LeoBriefing[page].text          =   "Ach wie schön euch zu sehen. Dieses Mal wurde ich einmal tatsächlich nicht gefangen genommen. Welch ein Glück! Doch meinem Gehilfen ging es schlechter. Er wurde von den Ataken gefangen genommen."

    LeoBriefing[page].position      =   GetPosition("Leonardo")
    LeoBriefing[page].dialogCamera  =   true

    page = page + 1
    LeoBriefing[page]               =   {}
    LeoBriefing[page].title         =   "Leonardo"
    LeoBriefing[page].text          =   "Er hatte die Brückenpläne bei sich. Ähm... ja. Und nun können die Ataken Brücken bauen und wir nicht. Möglicherweise könnte ich die Pläne nachzeichnen, doch nur unter folgenden Bedingungen."
    LeoBriefing[page].marker		     =	  ANIMATET_MARKER

    LeoBriefing[page].position      =   GetPosition("Leonardo")
    LeoBriefing[page].dialogCamera  =   true

    page = page + 1
    LeoBriefing[page]               =   {}
    LeoBriefing[page].title         =   "Leonardo"
    LeoBriefing[page].text          =   "Mein Haus auf dem Hügel wurde zerstört. Wenn ihr die Ruinen abreisst und an der gleichen Stelle ein 'grosses Wohnhaus' errichtet, bekommt ihr die Pläne für die Brücke."
    LeoBriefing[page].marker		     =	  STATIC_MARKER

    LeoBriefing[page].position       =   GetPosition("Huegel")
    LeoBriefing[page].restoreCamera  =   true

		LeoBriefing[page].quest			=	   {}
		LeoBriefing[page].quest.id		=	   4
		LeoBriefing[page].quest.type	=	   SUBQUEST_OPEN
		LeoBriefing[page].quest.title = 	"Baut ein grosses Wohnhaus"
		LeoBriefing[page].quest.text	=	   "Reisst die Ruine des alten Hauses von Leonardo ab und errichtet ein neues GROSSES WOHNHAUS an dieser Stelle."

		LeonardoQuest                = 	   LeoBriefing[page]

    -- Setup table for NPC
    Leo                     =   {}
    Leo.name                =   "Leonardo"
    Leo.briefing            =   LeoBriefing
    -- Create the NPC
    CreateNPC(Leo)

--++++++++++++++++++++++ Hermit ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    HermitBriefing                         =   {}
    HermitBriefing.restoreCamera           =   true
    HermitBriefing.finished                =  Hermitfinished

    page = 0

    page = page + 1
    HermitBriefing[page]               =   {}

    HermitBriefing[page].title         =   "Wanderer"
    HermitBriefing[page].text          =   "Hallo. Falls ihr auf der Suche nach einem Dorfzentrum seid, wüsste ich, wo ihr eins finden könnt."
    HermitBriefing[page].position      =   GetPosition("Hermit")
    HermitBriefing[page].dialogCamera  =   true

    page = page + 1
    HermitBriefing[page]               =   {}
    HermitBriefing[page].title         =   "Wanderer"
    HermitBriefing[page].text          =   "Leider ist es schon besetzt."
    HermitBriefing[page].explore       =   1200
    HermitBriefing[page].position      =   GetPosition("Dorfzentrum")
    HermitBriefing[page].restoreCamera =   true

    page = page + 1
    HermitBriefing[page]               =   {}
    HermitBriefing[page].title         =   "Wanderer"
    HermitBriefing[page].text          =   "Kampflos werdet ihr es nicht erhalten."
    HermitBriefing[page].explore       =   1200
    HermitBriefing[page].position      =   GetPosition("Kaserne")
    HermitBriefing[page].restoreCamera  =   true

    HermitKas = HermitBriefing[page]
    -- Setup table for NPC
    Her                     =   {}
    Her.name                =   "Hermit"
    Her.briefing            =   HermitBriefing
    -- Create the NPC
    CreateNPC(Her)
end
------------------------------------------Funktionen nach Briefings------------------------------

function Wechsel()
   ChangePlayer("Scharfsch",1)
end

function Buergerfertig()
   ResolveBriefing (Majorquest)
end

function finishMajorAuftrag()
   ResolveBriefing (Buergerquest)
end

-- Geschenk des B?rgermeisters
function Mafertig()
  local pos = GetPosition("Geschenk")
  AI.Entity_CreateFormation(1, Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,1,0)
  AI.Entity_CreateFormation(1, Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,1,0)
  CreateEntity(1,Entities.PV_Cannon4, pos)
  CreateEntity(1,Entities.PV_Cannon4, pos)
  EndJob(SchleifeA) -- Beendet den ersten SimpleJob
end

function Hermitfinished()
   ResolveBriefing (HermitKas)
end

function finishLeonardoAuftrag()
   ResolveBriefing (LeonardoQuest)
end

function LeoBurg()
   ResolveBriefing (ShowAtaken)
   ResearchTechnology(Technologies.GT_Mathematics)
   AllowTechnology(Technologies.GT_Binocular)
   AllowTechnology(Technologies.GT_Matchlock)
   AllowTechnology(Technologies.GT_PulledBarrel)
end

function HilfGespr()
   ResolveBriefing (BriefingGehilfe)
   Nachlaufen()
end


function Ende()
   Message("Sie haben gewonnen")
   ResolveBriefing (LeonardoGehilfe)
   Victory()
end


--++++++++++++++ Wenn Nebelvolk besiegt (Major)+++++++++++++++++++++++++++++++++++++++++

function NPCMajor()

    MaBriefing                         =   {}
    MaBriefing.restoreCamera           =   true
    MaBriefing.finished                = Mafertig

    page = 0

    page = page + 1
    MaBriefing[page]               =   {}

    MaBriefing[page].title         =   "Bürgermeister"
    MaBriefing[page].text          =   "Herzlichen Dank. Endlich haben die Angriffe auf unsere Stadt aufgehört. Das habt ihr sauber gemacht."

    MaBriefing[page].position      =   GetPosition("Major")
    MaBriefing[page].dialogCamera  =   true

    page = page + 1
    MaBriefing[page]               =   {}
    MaBriefing[page].title         =   "Bürgermeister"
    MaBriefing[page].text          =   "Als Dank schenken wir euch... Huch, wo sind sie denn? Na ja, sie sollten gleich da sein. Eilt zum westlichen Stadttor. Unser Geschenk wird dort auf euch warten."
    MaBriefing[page].marker		     =	  ANIMATET_MARKER

    MaBriefing[page].position       =   GetPosition("Geschenk")
    MaBriefing[page].restoreCamera  =   true
    -- Setup table for NPC
    Ma                     =   {}
    Ma.name                =   "Major"
    Ma.briefing            =   MaBriefing
    -- Create the NPC
    CreateNPC(Ma)


end

--+++++++++++++++++++++++++++++ Leonardo 2. Gespr?ch +++++++++++++++++++++++++++++++++++
function NPCLeonardo()

    LeBriefing                         =   {}
    LeBriefing.restoreCamera           =   true
    LeBriefing.finished               =  LeoBurg


    page = 0

    page = page + 1
    LeBriefing[page]               =   {}

    LeBriefing[page].title         =   "Leonardo"
    LeBriefing[page].text          =   "Sehr gut! Ach ja, und die Pläne habe ich tatsächlich in meinem kleinen provisorischen Häuschen gefunden. Mein Gehilfe musste wohl eine Kopie davon gemacht haben."

    LeBriefing[page].position      =   GetPosition("Leonardo")
    LeBriefing[page].dialogCamera  =   true

    page = page + 1
    LeBriefing[page]               =   {}
    LeBriefing[page].title         =   "Leonardo"
    LeBriefing[page].text          =   "Doch nun zu wichtigeren Sachen. Mein Gehilfe ist immer noch gefangen. Befreit ihn aus der Burg der Ataken und bringt ihn heil zurück. Doch passt auf; die Ataken sind nicht zu unterschützen."
    LeBriefing[page].marker		     =	  ANIMATET_MARKER
	  LeBriefing[page].explore	       =	 BRIEFING_EXPLORATION_RANGE
    LeBriefing[page].position       =   GetPosition("Ataken")
    LeBriefing[page].restoreCamera  =   true

		ShowAtaken                     = 	   LeBriefing[page]

    page = page + 1
    LeBriefing[page]               =   {}
    LeBriefing[page].title         =   "Leonardo"
    LeBriefing[page].text          =   "Ich habe gehört, es gäbe auch noch einen anderen Weg als den über die Brücke südlich von hier. Dieser ist nämlich nicht zu empfehlen."
    LeBriefing[page].position       =   GetPosition("Leonardo")
    LeBriefing[page].dialogCamera  =   true

		LeBriefing[page].quest			=	   {}
		LeBriefing[page].quest.id		=	   5
		LeBriefing[page].quest.type	=	   MAINQUEST_OPEN
		LeBriefing[page].quest.title = 	   "Befreit Leonardos Gehilfen"
		LeBriefing[page].quest.text	=	   "Sucht einen Weg zu den Ataken und befreit Leonardos Gehilfen aus deren Gefangenschaft. Begleitet ihn zurück zu Leonardo und passt auf ihn auf!"

		LeonardoGehilfe                = 	   LeBriefing[page]


    -- Setup table for NPC
    Le                     =   {}
    Le.name                =   "Leonardo"
    Le.briefing            =   LeBriefing
    -- Create the NPC
    CreateNPC(Le)


end

------------------------------------- Leonardos Gehilfe -------------------------------------
function Nachlaufen()

    HilfBriefing                         =   {}
    HilfBriefing.restoreCamera           =   true
    HilfBriefing.finished               =  HilfGespr

    page = 0

    page = page + 1
    HilfBriefing[page]               =   {}

    HilfBriefing[page].title         =   "Gefangener"
    HilfBriefing[page].text          =   "Endlich frei."
	  HilfBriefing[page].npc			   =	   {}
		HilfBriefing[page].npc.id		   =	   GetEntityId("Gehilfe")
		HilfBriefing[page].npc.isObserved=	true
    HilfBriefing[page].dialogCamera  =   true

    BriefingGehilfe = HilfBriefing[page]

    page = page + 1
    HilfBriefing[page]               =   {}
    HilfBriefing[page].title         =   "Leonardos Gehilfe"
    HilfBriefing[page].text          =   "Führt mich bitte zurück zu Leonardos Hütte. Ich werde euch folgen."

	  HilfBriefing[page].npc			   =	   {}
		HilfBriefing[page].npc.id		   =	   GetEntityId("Gehilfe")
		HilfBriefing[page].npc.isObserved=	true
    HilfBriefing[page].restoreCamera  =   true

    -- Setup table for NPC
    Hilf                     =   {}
    Hilf.name                =   "Gehilfe"
    Hilf.briefing            =   HilfBriefing
    Hilf.follow = true
    -- Create the NPC
    CreateNPC(Hilf)

end



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function Abfrage()

-- Nebelvolkaufr?stung
        Angriff()
    if Angriffe > 20 then
      unserAngriff()
    end

-- Scharfsch?tzenersatz in Birnheim
    if IsDestroyed("ScharfBirn") then 
          local pos = GetPosition("Major")
          SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,1,0),"ScharfBirn")
        	Move("ScharfBirn","Birnsch")
    end

-- Nebelvolk besiegt
    if IsDead("NVBurg") then 
        if TalkedToNPC(Bue) and majgesp == 0 then
            finishMajorAuftrag()
            Message("Sprecht nun wieder mit dem Bürgermeister von Birnheim")
            NPCMajor()
            majgesp = 1
            ResearchTechnology(Technologies.T_SuperTechnology, 2)
        end
      	 --return true
    end
end

function AbfrageSP()
-- Haus f?r Leonardo gebaut
   if AreEntitiesInArea(1,Entities.PB_Residence3,GetPosition("Huegel"),250,1) then
    if Haus == 0 then
      Haus = 1
      finishLeonardoAuftrag()
      NPCLeonardo()
    end
   end

   if IsDead("Ataken") and IsDestroyed("Gehilfe") then
      CreateEntity(6,Entities.CU_AssistentLeoIdle,GetPosition("InABurg"),"Gehilfe")
      Nachlaufen()
   end
   
   if IsNear("Gehilfe","Leonardo",600) and angekommen == 0 then 
      angekommen = 1
      ResearchTechnology(Technologies.T_SuperTechnology, 3)
      Schluss()
   end

end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function Angriff()
 if IsExisting("NVBurg") then
  local pos = GetPosition("NVolk")
  if IsDestroyed("NVBirnS") and IsDestroyed("NVBirnB") then
    SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos.X,pos.Y,0,0,2,0),"NVBirnS")
    SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0),"NVBirnB")
    Move("NVBirnS","Birnheim")
    Attack("NVBirnB","Birnheim")
    Angriffe = Angriffe + 1
  end

  if IsDestroyed("NVBirnBa") and IsDestroyed("NVBirnSa") and IsDestroyed("NVBirnSb") then
   SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos.X,pos.Y,0,0,2,0),"NVBirnSa")
   SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0),"NVBirnBa")
   SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0),"NVBirnBb")
	 Move("NVBirnSa","Birnheim")
	 Attack("NVBirnBa","Birnheim")
	 Move("NVBirnBb","Birnheim")
   Angriffe = Angriffe + 1
  end
 end
end

function unserAngriff()
 if IsExisting("NVBurg") then
-- Nebelvolk f?r unsere Burg
  if NVMenge == 0 then
    SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos.X,pos.Y,0,0,2,0),"NVSkirone")
    SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0),"NVBearone")
    Attack("NVSkirone","StartPos")
    Attack("NVBearone","StartPos")
    NVMenge = 1
  else
    SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos.X,pos.Y,0,0,2,0),"NVSkirone")
    SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0),"NVBearone")
    SetEntityName(AI.Entity_CreateFormation(3, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0),"NVBeartwo")
    Attack("NVSkirone","StartPos")
    Attack("NVBearone","StartPos")
    Attack("NVBeartwo","StartPos")
   NVMenge = 0
  end
 Angriffe = 0
 end
end

