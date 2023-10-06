--------------------------------------------------------------------------------
-- MapName: Darkpyramide
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua")
IncludeGlobals("MapEditorTools")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()

  SetHostile(1,2)
  SetHostile(1,3)
  SetHostile(1,4)
  SetNeutral(1,5)
  SetHostile(1,6)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function InitResources()

  -- set some resources
	GlobalMissionScripting.GiveResouces(1, 10000, 5000, 5000, 5000, 5000, 5000)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function InitTechnologies()

  ResearchTechnology(Technologies.GT_Mathematics)
  ResearchTechnology(Technologies.GT_Construction)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function InitWeatherGfxSets()

  SetupEvelanceWeatherGfxSet() 
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function InitWeather()

  AddPeriodicSummer(1200) 
  AddPeriodicWinter(300) 
  AddPeriodicSummer(600) 
  AddPeriodicWinter(300) 
  AddPeriodicRain(120)
  AddPeriodicSummer(600) 
  AddPeriodicWinter(300)
  AddPeriodicSummer(600) 
  AddPeriodicWinter(300) 
  AddPeriodicSummer(600) 
  AddPeriodicWinter(300) 
  AddPeriodicRain(120)
  AddPeriodicSummer(600) 
  AddPeriodicWinter(300)
  AddPeriodicSummer(600) 
  AddPeriodicWinter(300) 
  AddPeriodicSummer(600) 
  AddPeriodicWinter(300) 
  AddPeriodicRain(120)
 
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function InitPlayerColorMapping()
	Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())
    Display.SetPlayerColorMapping(2, 6)
    Display.SetPlayerColorMapping(3, 5)
    Display.SetPlayerColorMapping(4, KERBEROS_COLOR)
    Display.SetPlayerColorMapping(5, NPC_COLOR)
	--Display.SetPlayerColorMapping(8, NPC_COLOR)
  
end
  
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function FirstMapAction()

  CreatePreludeBriefing()

  MapEditor_SetupDestroyVictoryCondition(2)
  MapEditor_SetupDestroyVictoryCondition(3)
  MapEditor_SetupDestroyVictoryCondition(4)
  MapEditor_CreateHQDefeatCondition()

  StartSimpleJob("VictoryJob");
  --StartSimpleJob("enablePyramidennebel");
  StartSimpleJob("Help");
  StartSimpleJob("Bonus1");
  StartSimpleJob("Bonus2");
  StartSimpleJob("Kermit");
  LocalMusic.UseSet = EVELANCEMUSIC 
	
  ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_Evelance)
  ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_Evelance

    local description = {
    
        serfLimit				=	8,
        --------------------------------------------------
        extracting				=	false,
        --------------------------------------------------
        repairing				=	true,
        --------------------------------------------------
        rebuild = {
            delay				=	5,
            randomTime			=	15
        },
        --------------------------------------------------
        resources = {
            gold				=	3000,
            clay				=	3000,
            iron				=	3000,
            sulfur				=	3000,
            stone				=	3000,
            wood				=	3000
        },
        --------------------------------------------------
        refresh = {
            gold				=	200,
            clay				=	100,
            iron				=	100,
            sulfur				=	100,
            stone				=	100,
            wood				=	150,
            updateTime			=	5
        },
    }
  
  -- AI2    
  local aiID = 2;
  local strength = 3;
  local range = 10000000;
  local techlevel = 3;
  local position = "P2_AI_HQ";
  local aggressiveness = 3;
  local peacetime = 800;
  MapEditor_SetupAI(aiID, strength, range, techlevel, position, aggressiveness, peacetime);
  SetupPlayerAi(aiID, description);
  SetPlayerName(aiID, "juja mary");

  -- AI3
  local aiID = 3;
  local strength = 3;
  local range = 1000000;
  local techlevel = 3;
  local position = "P3_AI_HQ";
  local aggressiveness = 3;
  local peacetime = 1600;
  MapEditor_SetupAI( aiID, strength, range, techlevel, position, aggressiveness, peacetime);
  SetupPlayerAi(aiID, description);
  SetPlayerName(aiID, "Varg SpiderFive");

  -- AI4
  local aiID = 4;
  local strength = 3;
  local range = 100000;
  local techlevel = 3;    
  local position = "P4_AI_HQ";
  local aggressiveness = 3;   
  local peacetime = 2400;  
  MapEditor_SetupAI(aiID, strength, range, techlevel, position, aggressiveness, peacetime);
  SetupPlayerAi(aiID, description);
  SetPlayerName(aiID, "Kerberos Bangolos");

  -- Mercenary
  local mercTent = GetEntityId("MercTent1");
  Logic.AddMercenaryOffer(mercTent, Entities.PU_LeaderBow4, 13, ResourceType.Gold, 750);
  Logic.AddMercenaryOffer(mercTent, Entities.PU_LeaderRifle2, 10, ResourceType.Stone, 1000);
  Logic.AddMercenaryOffer(mercTent, Entities.PU_LeaderRifle2, 10, ResourceType.Wood, 750);
  Logic.AddMercenaryOffer(mercTent, Entities.PU_LeaderHeavyCavalry2, 10, ResourceType.Wood, 750);
  
	StartSimpleJob("ControlEnemyHeroes")

  --Tools.ExploreArea(-1, -1, 900)
end


function ControlEnemyHeroes()
	if Counter.Tick2("ControlBossesWinterAttack", 5) then
		--Varg
		--Deactivated for Varg because I'm too lazy to prevent him from drowning after usage
		if IsAlive("varg") then
			if AreEnemiesInArea(GetPlayer("varg"), GetPosition("varg"), 2000) then
				local HeroID = GetEntityId("varg")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerSummon(HeroID)
				end

				GUI.SettlerAffectUnitsInArea(HeroID)
			end
		end
		--Mary
		if IsAlive("mary") then
			if AreEnemiesInArea(GetPlayer("mary"), GetPosition("mary"), 1000) then
				local HeroID = GetEntityId("mary")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerAffectUnitsInArea(HeroID)
				end
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.8) then
					GUI.SettlerCircularAttack(HeroID)
				end
			end
		end
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
function CreatePreludeBriefing()

  PreludeBriefing = {}
  PreludeBriefing.finished = PreludeBriefingFinished

  -- pages
  page = 0

  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 Hiob"
  PreludeBriefing[page].text = "@color:17,207,255 Willkommen, edler Held! Ich bin Hiob."
  PreludeBriefing[page].npc = {}
  PreludeBriefing[page].npc.id = GetEntityId("Kermit")
  CreateEffect(2, GGL_Effects.FXBuildingSmokeLarge, "Kermit");
  CreateEffect(2, GGL_Effects.FXBuildingSmokeLarge, "Kermit");
  CreateEffect(2, GGL_Effects.FXBuildingSmokeLarge, "Kermit");
  CreateEffect(2, GGL_Effects.FXBuildingSmokeLarge, "Kermit");
  PreludeBriefing[page].npc.isObserved = true
  PreludeBriefing[page].dialogCamera = true
  PreludeBriefingShowKermit = PreludeBriefing[page]

  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 Hiob"
  PreludeBriefing[page].text = "@color:0,255,0 Ihr seid hier in einer recht d\195\188steren Gegend gelandet @cr um Euer Gl\195\188ck als Held zu suchen. @cr Das Land jenseits des Flusses wird von einem recht gef\195\164hrlichen Trio beherrscht."

  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 Hiob"
  PreludeBriefing[page].text = "@color:0,255,0 Kerbereos, Varg und Mary de Mortfichet @cr Ihre drei m\195\164chtigen Festungen m\195\188sst ihr zerst\195\182ren @cr um das Land von Ihrer Herrschaft zu befreien.."
    
  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 1. Missionsziel"
  PreludeBriefing[page].text = "@color:0,255,0 Hier haust die gef\195\164hrliche Mary de Mortfichet"
  PreludeBriefing[page].position = GetPosition("P2_AI_HQ")
  PreludeBriefing[page].marker = STATIC_MARKER 
  PreludeBriefing[page].explore =  BRIEFING_EXPLORATION_RANGE
  PreludeBriefingShowkermit =  PreludeBriefing[page]
  --CreateEffect(2, GGL_Effects.FXMaryPoison, "P2_AI_HQ");
  --CreateEffect(2, GGL_Effects.FXMaryPoison, "P2_AI_HQ");    
  CreateEffect(2, GGL_Effects.FXMaryPoison, "P2_AI_HQ");
  BriefingMonkMarker = PreludeBriefing[page]
  
  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 2. Missionsziel"
  PreludeBriefing[page].text = "@color:0,255,0 Hier hat der verschlagene Kerberos sein Domizil!"
  PreludeBriefing[page].position = GetPosition("P4_AI_HQ")
  PreludeBriefing[page].marker = STATIC_MARKER 
  PreludeBriefing[page].explore = BRIEFING_EXPLORATION_RANGE
  --CreateEffect(2, GGL_Effects.FXMaryPoison, "P4_AI_HQ");
  --CreateEffect(2, GGL_Effects.FXMaryPoison, "P4_AI_HQ");
  CreateEffect(2, GGL_Effects.FXMaryPoison, "P4_AI_HQ");
  BriefingMonk1Marker = PreludeBriefing[page]
  PreludeBriefingShowkermit = PreludeBriefing[page]
    
  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 3. Missionsziel"
  PreludeBriefing[page].text = "@color:0,255,0 Die Grosse Pyramidenfestung des m\195\164chtigen Varg"
  PreludeBriefing[page].position = GetPosition("P3_AI_HQ")
  PreludeBriefing[page].marker = STATIC_MARKER 
  PreludeBriefing[page].explore = BRIEFING_EXPLORATION_RANGE
  --CreateEffect(2, GGL_Effects.FXMaryPoison, "P3_AI_HQ");
  --CreateEffect(2, GGL_Effects.FXMaryPoison, "P3_AI_HQ");
  CreateEffect(2, GGL_Effects.FXMaryPoison, "P3_AI_HQ");
  BriefingMonk2Marker = PreludeBriefing[page]
  PreludeBriefingShowkermit = PreludeBriefing[page]

  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 Geheimgang"
  PreludeBriefing[page].text = "@color:0,255,0 Ach ich Schussel, beinahe h\195\164tte ich ja vergessen Euch dies zu zeigen."
  PreludeBriefing[page].position = GetPosition("stone")
  PreludeBriefing[page].explore = BRIEFING_EXPLORATION_RANGE

  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 Die Mauer"
  PreludeBriefing[page].text = "@color:0,255,0 Hmm wenn ihr nur die Mauer zerst\195\182ren k\195\182nntet, @cr vielleicht nagt ja der Zahn der Zeit an ihr .."
  PreludeBriefing[page].position = GetPosition("wall5")
  PreludeBriefing[page].explore = BRIEFING_EXPLORATION_RANGE
  BriefingMonk4Marker = PreludeBriefing[page]
  PreludeBriefingShowkermit = PreludeBriefing[page]
  
  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 Emmas L\195\164dchen"
  PreludeBriefing[page].text = "@color:0,255,0 Hier k\195\182nnt ihr Euch mit ein paar Truppen versorgen ..."
  PreludeBriefing[page].position = GetPosition("MercTent1")
  PreludeBriefing[page].explore = BRIEFING_EXPLORATION_RANGE
  BriefingMonk5Marker = PreludeBriefing[page]
  
  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 Hiob"
  PreludeBriefing[page].text = "@color:0,255,0 Und zu guter Letzt: Das hier ist Eure Burg."
  PreludeBriefing[page].position = GetPosition("P1_AI_HQ")
  PreludeBriefing[page].explore = BRIEFING_EXPLORATION_RANGE

  page = page + 1
  PreludeBriefing[page] = {}
  PreludeBriefing[page].title = "@color:255,255,0 Hiob"
  PreludeBriefing[page].text = "@color:0,255,0 Verschwendet nicht soviel Zeit! @cr recht bald werdet ihr Euer Land verteidigen m\195\188ssen."
  PreludeBriefing[page].position = GetPosition("drake")
  PreludeBriefing[page].dialogCamera = true

  -- start briefing
  StartBriefing(PreludeBriefing)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function PreludeBriefingFinished()

  ResolveBriefing(PreludeBriefingShowKermit)
  ResolveBriefing(BriefingMonkMarker)
  ResolveBriefing(BriefingMonk1Marker)
  ResolveBriefing(BriefingMonk2Marker)
  ResolveBriefing(BriefingMonk4Marker)
  ResolveBriefing(BriefingMonk5Marker)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function CreateEffect( _player, _type, _position )

  assert(type(_player) == "number" and _player >= 1 and _player <= 8 and type(_type) == "number", "fatal error: wrong input: _player or _type (function CreateEffect())");
  assert((type(_position) == "table" and type(_position.X) == "number" and type(_position.Y) == "number") or type(_position) == "number" or type(_position) == "string", "fatal error: wrong input: _position (function CreateEffect())");
 
  if type(_position) == "table" then
    assert(_position.X >= 0 and _position.Y >= 0 and _position.X < Logic.WorldGetSize() and _position.Y < Logic.WorldGetSize(), "error: wrong position-statement (function CreateEffect())");
    local effect = Logic.CreateEffect(_type, _position.X, _position.Y, _player);
    return effect;
  elseif type(_position) == "string" then
    local id = GetEntityId(_position);
    assert(not IsDead(id), "error: entity is dead or not existing (function CreateEffect())");
    local position = GetPosition(id);
    local effect = Logic.CreateEffect(_type, position.X, position.Y, _player);
    return effect;
  else
    assert(not IsDead(_position), "error: entity is dead or not existing (function CreateEffect())");
    local position = GetPosition(_position);
    local effect = Logic.CreateEffect(_type, position.X, position.Y, _player);
    return effect;
  end
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function DestroyEffect( _effect )

  assert(type(_effect) == "number", "fatal error: wrong input: _effect (function DestroyEffect()");
  Logic.DestroyEffect( _effect );

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function pyramidennebelA()

  if AreEntitiesInArea(1, 0, GetPosition("PyramideA1"), 2000, 1) or 
    AreEntitiesInArea(1, 0, GetPosition("PyramideA2"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideA3"), 2000, 1) or 
    AreEntitiesInArea(1, 0, GetPosition("PyramideA4"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideA5"), 2000, 1) then
    
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideA1")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideA2")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideA3")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideA4")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideA5")
  end
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function pyramidennebelB()

  if AreEntitiesInArea(1, 0, GetPosition("PyramideB1"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideB2"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideB3"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideB4"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideB5"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideB6"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideB7"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideB8"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideB9"), 2000, 1) then
    
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB1")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB2")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB3")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB4")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB5")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB6")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB7")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB8")
    CreateEffect( 2, GGL_Effects.FXMaryPoison, "PyramideB9")
  end
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function pyramidennebelC()

  if AreEntitiesInArea(1, 0, GetPosition("PyramideC1"), 2000, 1) or 
    AreEntitiesInArea(1, 0, GetPosition("PyramideC2"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideC3"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideC4"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideC5"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideC6"), 2000, 1) then
    
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideC1")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideC2")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideC3")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideC4")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideC5")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideC6")
  end
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function pyramidennebelD()

  if AreEntitiesInArea(1, 0, GetPosition("PyramideD1"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideD2"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideD3"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideD4"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideD5"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideD6"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideD7"), 2000, 1) or
    AreEntitiesInArea(1, 0, GetPosition("PyramideD8"), 2000, 1) then
    
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideD1")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideD2")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideD3")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideD4")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideD5")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideD6")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideD7")
    CreateEffect( 2, GGL_Effects.FXKalaPoison, "PyramideD8")
  end
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function enablePyramidennebel()

  pyramidennebelA();
  pyramidennebelB();
  pyramidennebelC();
  pyramidennebelD();
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Help()

  if Logic.GetTime() == 3600 then
    ChangePlayer("wall1", 4)
    ChangePlayer("wall2", 4)
    ChangePlayer("wall3", 4)
    Message("@color:255,255,0 pssst es scheint die Mauer ist ");
    Message("@color:255,255,0 etwas br\195\188chig geworden ");
    Message("@color:255,255,0 vielleicht k\195\182nnen wir sie nun zerst\195\182ren");
    
		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(3)
		ResearchAllMilitaryTechs(4)
    return true
  end
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Kermit()

  if Logic.GetTime() == 180 then
    DestroyEntity("Kermit")
    Message("@color:255,255,0 Hiob: Ich geh dann mal ");
    return true
  end
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Bonus1()

  if IsDead("P3_AI_HQ") or IsDead("P4_AI_HQ") then
    AddGold(5252)
    AddSulfur(5252)
    Message("@color:255,255,0 Ihr habt 5252 Gold und 5252 Schwefel f\195\188r die Vernichtung des Hauptquartiers erhalten");
    return true          
  end
  
end 

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Bonus2()

  if IsDead("P2_AI_HQ") then
    AddGold(4444)
    AddSulfur(4444)
    Message("@color:255,255,0 Ihr habt 4444 Gold und 4444 Schwefel f\195\188r die Vernichtung des Hauptquartiers erhalten");
    return true
  end  
  
end 

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function VictoryJob()

  if IsDead("P2_AI_HQ")and IsDead("P3_AI_HQ") and IsDead("P4_AI_HQ") then
     Victory() 
     return true
  end

end 

-- Quest data
MapEditor_QuestTitle = "Zerst\195\182re 3 Dunklen Festungen"
MapEditor_QuestDescription = "Zerst\195\182re die 3 Dunklen Festungen von Kerbereos, Varg und Mary de Mortfichet" 