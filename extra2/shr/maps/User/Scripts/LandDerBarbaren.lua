--------------------------------------------------------------------------------
-- MapName: Land der Barbaren
--
-- Author: Kai Frantzen
-- Zeichen: ae ä oe ö ue ü Ue Ü Oe Ö- Ae Ä
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()
	SetHostile(1,2)
	SetHostile(2,3)
	SetNeutral(1,3)
	SetPlayerName(2,"Barbaren")
	SetPlayerName(3,Umlaute("Überlebende"))
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function InitResources()
    -- set some resources
	GlobalMissionScripting.GiveResouces(1, 1000, 2000, 2000, 2000, 1000, 500)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function InitTechnologies()
	ResearchTechnology(Technologies.GT_Mathematics)
	ResearchTechnology(Technologies.GT_Mercenaries)
	
	ResearchAllMilitaryTechsAddOn(2)
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
	AddPeriodicRain(150)
	AddPeriodicSummer(300)
	AddPeriodicRain(120)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function InitPlayerColorMapping()
	Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())
	Display.SetPlayerColorMapping(2, 5)
	Display.SetPlayerColorMapping(3, 9)
	Display.SetPlayerColorMapping(4, 8)
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function FirstMapAction()

	local VictoryConditionType = 2

	if VictoryConditionType == 1 then
		MapEditor_SetupResourceVictoryCondition(	
													1000,
													1000,
													1000,
													1000,
													1000,
													1000 ) 
	elseif VictoryConditionType == 2 then
		MapEditor_SetupDestroyVictoryCondition(2)
	end
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree

	-- Level 0 is deactivated...ignore
	MapEditor_SetupAI(2, 2, 9999, 2, "Barbaren", 2, 600)
	MapEditor_SetupAI(3, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(4, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(5, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(6, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(7, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(8, 0, 0, 0, "", 0, 0)

	-- HQ Defeat Condition
	MapEditor_CreateHQDefeatCondition()
   
   -- ...
  LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = EUROPEMUSIC
	CreateBriefingThief()
	CreateBriefingBishop()
-- Bleibt nur zur sicherheit drin bis StartGespr?ch klapt
-----------------------
	CreateBarbaren()
	CreateArmee1()
	CreateArmee3()
	CreateArmee4()
	StartSimpleJob("VictoryJob")
	StartSimpleJob("TurmJob")
	CreateChest1()
	CreateChest2()
	CreateChest3()
	CreateChest4()
-- Funktion existiert nicht    
--	CreateVArmee2()
	Anfang()
	CreateSettlers()
	Nachschub()
	TotA2()
	Tot = 0
	angekommen = 0
	CreateBriefingScout()

    --Tools.ExploreArea(-1, -1, 900)
end

function TotA2()
	if IsDestroyed("Armee2") and Tot == 0 then
		Tot = 1
		Move("Scout","StartPos3")
		Move("Scharfsch","StartPos4")
	end
end

function CreateSettlers()
	CreateMilitaryGroup(3,Entities.PU_LeaderRifle1,4,GetPosition("Haupt"),"Scharfsch")
	Move("Scharfsch","StartPos2")
end
-- +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
-- Startgespr?ch
function Anfang()
	PreludeBriefing = {}
-- 	PreludeBriefing.finished = PreludeBriefingFinished
	page = 0
	page = page + 1
	PreludeBriefing[page] = {}
	Move("Scout","StartPos")
	PreludeBriefing[page].title = "Kundschafter"
	PreludeBriefing[page].text = "Hallo! Es ist etwas Schreckliches passiert."
	PreludeBriefing[page].position = GetPosition("1")
	PreludeBriefing[page].npc = {}
	PreludeBriefing[page].npc.id = GetEntityId("Scout")
	PreludeBriefing[page].npc.isObserved = true
	PreludeBriefing[page].dialogCamera = true
	PreludeBriefingShowHaupt = 	PreludeBriefing[page]
-- page 2
	page = page + 1
	PreludeBriefing[page] = {}
	PreludeBriefing[page].title = ("Held")
	PreludeBriefing[page].text = "Was denn?"
	PreludeBriefing[page].position = GetPosition("StartPos")
	PreludeBriefingShowStartPos = 	PreludeBriefing[page]
-- page3
	page = page + 1
	PreludeBriefing[page] = {}
	PreludeBriefing[page].title = "Kundschafter"
	PreludeBriefing[page].text = "Wir waren eine wundevolle Handelsstadt. Aber dann kam eine Horde Barbaren und vernichteten unsere Dörfer."
	PreludeBriefing[page].position = GetPosition("StartPos")
	PreludeBriefingShowStartPos = 	PreludeBriefing[page]
-- page 4
	page = page + 1
	PreludeBriefing[page] = {}
	PreludeBriefing[page].title = "Kundschafter"
	PreludeBriefing[page].text = "Das einzige was übrig ist, sind diese paar Häuser und eine kleine Kaserne im Norden. Aber..."
	PreludeBriefing[page].position = GetPosition("Blumen2")
	PreludeBriefing[page].explore =	2000
	PreludeBriefing[page].marker = ANIMATED_MARKER
	PreludeBriefingShowBlumen2 = 	PreludeBriefing[page]
-- page 4.5
	page = page + 1
	PreludeBriefing[page] = {}
	PreludeBriefing[page].title = "Anführer"
	PreludeBriefing[page].text = "Brücke erfolgreich gesprengt!"
	PreludeBriefing[page].position = GetPosition("StartPos")
	PreludeBriefingShowStartPos = 	PreludeBriefing[page]

-- page 5
	page = page + 1
	PreludeBriefing[page] = {}
	PreludeBriefing[page].title = "Kundschafter"
	PreludeBriefing[page].text = "...das einige was wir tun konnten war, die Brücke zu sprengen. Deswegen sind wir im Moment auf uns alleine gestellt."
	PreludeBriefing[page].position = GetPosition("NB")
	PreludeBriefingShowNB = 	PreludeBriefing[page]
-- page 6
	page = page + 1
	PreludeBriefing[page] = {}
	PreludeBriefing[page].title = "Held"
	PreludeBriefing[page].text = "Wir werden gucken was wir machen können."
	PreludeBriefing[page].position = GetPosition("StartPos")
	PreludeBriefingShowStartPos = 	PreludeBriefing[page]
-- page 7
	page = page + 1
	PreludeBriefing[page] = {}
	PreludeBriefing[page].title = "Kundschafter"
	PreludeBriefing[page].text = "Wirklich? Oh, vielen Dank."
	PreludeBriefing[page].position = GetPosition("StartPos")

	PreludeBriefing[page].quest = {}
	PreludeBriefing[page].quest.id = 1
	PreludeBriefing[page].quest.type = SUBQUEST_OPEN
	PreludeBriefing[page].quest.title = "Vernichten sie die Barbaren"
	PreludeBriefing[page].quest.text = "Vernichten sie die Barbaren, indem sie die Banditentürme zerstören."

	PreludeBriefingShowStartPos = 	PreludeBriefing[page]
-- page 8
	page = page + 1
	PreludeBriefing[page] = {}
	PreludeBriefing[page].title = "Mission"
	PreludeBriefing[page].text = "Vernichten sie die Barbaren, indem sie die Banditentürme zerstören."

	PreludeBriefing[page].position = GetPosition("StartPos")

	StartBriefing(Umlaute(PreludeBriefing))
-- DestroyNPC(PreludeBriefing[1].npc)
end

function BriefingScoutFinished()
		ChangePlayer("Scout",1)
		ChangePlayer("Scharfsch",1)
		Move("Scharfsch","Sch")
end


-- Gespr?ch Scout
function CreateBriefingScout()
	BriefingScout = {}
	BriefingScout.restoreCamera = true
	-- call on end of briefing
	BriefingScout.finished = BriefingScoutFinished
	local page = 0
-- page #1
		page = page + 1
		BriefingScout[page] = {}
		BriefingScout[page].title = "Scout"
		BriefingScout[page].text = "Ich werde euch jetzt begleiten."
		BriefingScout[page].position = GetPosition("StartPos")
		BriefingScout[page].dialogCamera = true

		-- setup table for npc
		local npcScout = {}
		npcScout.name = "Scout"
		npcScout.briefing = BriefingScout
		-- create npc
		CreateNPC(npcScout)
end

-- +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


-- KI Gegen-Spieler erzeugen
function CreateBarbaren()
	Barbaren = {}
	Barbaren.id = 2
	local description = {}
	description.serfLimit = 6
	description.constructing = enable
	description.repairing = enable
	SetupPlayerAi(Barbaren.id,description)
    SetAIUnitsToBuild( 2, {UpgradeCategories.LeaderBarbarian})
end


-- Gespr?ch Dieb
function CreateBriefingThief()
	BriefingThief = {}
	BriefingThief.restoreCamera = true
	-- call on end of briefing
	BriefingThief.finished = BriefingThiefFinished
	local page = 0
-- page #1
		page = page + 1
		BriefingThief[page] = {}
		BriefingThief[page].title = "Dieb"
		BriefingThief[page].text = "Guten Tag! Schön euch zu treffen."
		BriefingThief[page].position = GetPosition("Thief")
		BriefingThief[page].dialogCamera = true
-- page #2
		page = page + 1
		BriefingThief[page] = {}
		BriefingThief[page].title = "Dieb"
		BriefingThief[page].text = "Ich habe die Brücke im Südwesten zerstört."
		BriefingThief[page].position = GetPosition("Thief")

-- page #3
		page = page + 1
		BriefingThief[page] = {}
		BriefingThief[page].title = "Dieb"
		BriefingThief[page].text = "Dadurch können die Barbaren sich nicht gegenseitig unterstützen und ihr könnt in Ruhe ein Lager von den Barbaren zerstören"
		BriefingThief[page].position = GetPosition("Thief")
-- page #4
		page = page + 1
		BriefingThief[page] = {}
		BriefingThief[page].title = "Dieb"
		BriefingThief[page].text = "Um dort hin zu kommen, muesst ihr durch das Tor im Westen."
		BriefingThief[page].position = GetPosition("Tor")
		BriefingThief[page].marker = ANIMATED_MARKER
		BriefingThief[page].explore = BRIEFING_EXPLORATION_RANGE

		-- setup table for npc
		local npcThief = {}
		npcThief.name = "Thief"
		npcThief.briefing = Umlaute(BriefingThief)
		-- create npc
		CreateNPC(npcThief)
end

-- Feindliche Armee2
function BriefingThiefFinished()
	Armee2 = {}
	Armee2.player = 2
	Armee2.id = 2
	Armee2.strenght = 2
	Armee2.position = GetPosition("Armee2")
	Armee2.rodeLenght = 1000
	SetupArmy(Armee2)
	local troopDescription = {
		maxNumberOfSoldiers = 8,
		minMumberOfSoldiers = 3,
		experiencePionts = HIGH_EXPERIENCE,
	}
	troopDescription.leaderType = Entities.CU_Barbarian_LeaderClub2
	EnlargeArmy(Armee2,troopDescription)
	EnlargeArmy(Armee2,troopDescription)
	EnlargeArmy(Armee2,troopDescription)
	EnlargeArmy(Armee2,troopDescription)
	Defend(Armee2)
end

-- Gespr?ch Schertk?mpfer
function CreateBriefingBishop()
	BriefingBishop = {}
	BriefingBishop.restoreCamera = true
	-- call on end of briefing
	BriefingBishop.finished = BriefingBishopFinished
	local page = 0
-- page #1
		page = page + 1
		BriefingBishop[page] = {}
		BriefingBishop[page].title = "Ritter"
		BriefingBishop[page].text = "Hallo! Ich habe schon auf euch gewartet."
		BriefingBishop[page].position = GetPosition("Bishop")
		BriefingBishop[page].dialogCamera = true
-- page #2
		page = page + 1
		BriefingBishop[page] = {}
		BriefingBishop[page].title = "Ritter"
		BriefingBishop[page].text = "Ich habe erfahren, dass ihr die Barbaren vernichten wollt, die hier ihr Unwesen treiben."
		BriefingBishop[page].position = GetPosition("Bishop")
		BriefingBishop[page].marker = ANIMATED_MARKER
-- page #4
		page = page + 1
		BriefingBishop[page] = {}
		BriefingBishop[page].title = "Ritter"
		BriefingBishop[page].text = "Deshalb möchte ich euch einige meiner Truppen zur Seite stellen."
		BriefingBishop[page].position = GetPosition("Bishop")
		-- setup table for npc
		local npcBishop= {}
		npcBishop.name = "Bishop"
		npcBishop.briefing = Umlaute(BriefingBishop)
		-- create npc
		CreateNPC(npcBishop)
end

-- Verb?ndete VArmee1
function BriefingBishopFinished()
	VArmee1 = {}
	VArmee1.player = 3
	VArmee1.id = 1
	VArmee1.strenght = 2
	VArmee1.position = GetPosition("VArmee1")
	VArmee1.rodeLenght = 9999
	SetupArmy(VArmee1)
	local troopDescription = {
		maxNumberOfSoldiers = 6,
		minMumberOfSoldiers = 3,
		experiencePionts = VERYHIGH_EXPERIENCE,
	}
	troopDescription.leaderType = Entities.PU_LeaderSword3
	EnlargeArmy(VArmee1,troopDescription)
	EnlargeArmy(VArmee1,troopDescription)
	EnlargeArmy(VArmee1,troopDescription)
	Defend(VArmee1)
end

-- Feindliche Armee1
function CreateArmee1()
	Armee1 = {}
	Armee1.player = 2
	Armee1.id = 2
	Armee1.strenght = 2
	Armee1.position = GetPosition("Armee1")
	Armee1.rodeLenght = 500
	SetupArmy(Armee1)
	local troopDescription = {
		maxNumberOfSoldiers = 8,
		minMumberOfSoldiers = 3,
		experiencePionts = HIGH_EXPERIENCE,
	}
	troopDescription.leaderType = Entities.CU_Barbarian_LeaderClub2
	EnlargeArmy(Armee1,troopDescription)
	EnlargeArmy(Armee1,troopDescription)
	EnlargeArmy(Armee1,troopDescription)
	EnlargeArmy(Armee1,troopDescription)
	Attack("Armee1","StartPos3")
end

function Nachschub()
	if IsExisting("Turm1") then
		if IsDestroyed("Armee1") then
			local pos = GetPosition("Armee1")
			SetEntityName(AI.Entity_CreateFormation(2, Entities.CU_Barbarian_LeaderClub2,0,8,pos.X,pos.Y,0,0,2,0),"Armee1") 
			Move("Armee1","StartPos")
			Attack("Armee1","StartPos")
		end
	end
end

-- Feindliche Armee3
function CreateArmee3()
	Armee3 = {}
	Armee3.player = 2
	Armee3.id = 2
	Armee3.strenght = 3
	Armee3.position = GetPosition("Armee3")
	Armee3.rodeLenght = 3000
	SetupArmy(Armee3)
	local troopDescription = {
		maxNumberOfSoldiers = 8,
		minMumberOfSoldiers = 3,
		experiencePionts = HIGH_EXPERIENCE,
	}
	troopDescription.leaderType = Entities.CU_Barbarian_LeaderClub2
	EnlargeArmy(Armee3,troopDescription)
	EnlargeArmy(Armee3,troopDescription)
	EnlargeArmy(Armee3,troopDescription)
	EnlargeArmy(Armee3,troopDescription)
	Defend(Armee3)
end

-- Feindliche Armee4
function CreateArmee4()
	Armee4 = {}
	Armee4.player = 2
	Armee4.id = 2
	Armee4.strenght = 3
	Armee4.position = GetPosition("Armee4")
	Armee4.rodeLenght = 2000
	SetupArmy(Armee4)
	local troopDescription = {
		maxNumberOfSoldiers = 8,
		minMumberOfSoldiers = 3,
		experiencePionts = HIGH_EXPERIENCE,
	}
	troopDescription.leaderType = Entities.CU_Barbarian_LeaderClub2
	EnlargeArmy(Armee4,troopDescription)
	EnlargeArmy(Armee4,troopDescription)
	EnlargeArmy(Armee4,troopDescription)
	EnlargeArmy(Armee4,troopDescription)
	EnlargeArmy(Armee4,troopDescription)
	EnlargeArmy(Armee4,troopDescription)
	Defend(Armee4)
end

-- Feindliche Armee5
function CreateArmee5()
	Armee5 = {}
	Armee5.player = 2
	Armee5.id = 2
	Armee5.strenght = 3
	Armee5.position = GetPosition("Armee5")
	Armee5.rodeLenght = 500
	setupArmy(Armee5)
	local troopDescription = {
		maxNumberOfSoldiers = 8,
		minMumberOfSoldiers = 5,
		experiencePionts = HIGH_EXPERIENCE,
	}
	troopDescription.leaderType = Entities.CU_Barbarian_LeaderClub2
	EnlargeArmy(Armee5,troopDescription)
	EnlargeArmy(Armee5,troopDescription)
	EnlargeArmy(Armee5,troopDescription)
	EnlargeArmy(Armee5,troopDescription)
	EnlargeArmy(Armee5,troopDescription)
	EnlargeArmy(Armee5,troopDescription)
	Defend(Armee5)
end

-- Spiel Ende
function VictoryJob()
	if IsDead("Barbaren") then
		Victory()
	end
end
-- Schatztruhen
-- Schatztruhe 1
function CreateChest1()
	CreateRandomGoldChest(GetPosition("Chest1"))
	CreateChestOpener("Helias")
	CreateChestOpener("Erec")
	CreateChestOpener("Drake")
	CreateChestOpener("Ari")
	CreateChestOpener("Pilgrim")
	CreateChestOpener("Dario")
	StartChestQuest()
end

-- Schatztruhe 2
function CreateChest2()
	CreateRandomGoldChest(GetPosition("Chest2"))
	CreateChestOpener("Helias")
	CreateChestOpener("Erec")
	CreateChestOpener("Drake")
	CreateChestOpener("Ari")
	CreateChestOpener("Pilgrim")
	CreateChestOpener("Dario")
	StartChestQuest()
end

-- Schatztruhe 3
function CreateChest3()
	CreateRandomGoldChest(GetPosition("Chest3"))
	CreateChestOpener("Helias")
	CreateChestOpener("Erec")
	CreateChestOpener("Drake")
	CreateChestOpener("Ari")
	CreateChestOpener("Pilgrim")
	CreateChestOpener("Dario")
	StartChestQuest()
end

-- Schatztruhe 4
function CreateChest4()
	CreateRandomGoldChest(GetPosition("Chest4"))
	CreateChestOpener("Helias")
	CreateChestOpener("Erec")
	CreateChestOpener("Drake")
	CreateChestOpener("Ari")
	CreateChestOpener("Pilgrim")
	CreateChestOpener("Dario")
	StartChestQuest()
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

-- Quest data
MapEditor_QuestTitle				= "Vernichten sie alle Barbaren"
MapEditor_QuestDescription 	= "Vernichten sie die Barbaren, indem sie die Banditentürme zerstören"