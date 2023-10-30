--------------------------------------------------------------------------------
-- MapName: CoastLands
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

  Logic.SetDiplomacyState( 1, 2, Diplomacy.Neutral )
  Logic.SetDiplomacyState( 1, 3, Diplomacy.Neutral )
  Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )
  Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
	SetHostile(1,7)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Weathermachine, 0)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_PowerPlant, 0)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast, 0)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather, 0)

  ResearchAllMilitaryTechs(2)
  ResearchAllMilitaryTechs(5)
  ResearchAllMilitaryTechs(7)
	ResearchAnimalTechs(7)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Mission_InitMerchants()
  
  local mercenaryId = Logic.GetEntityIDByName("merchant1")
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderRifle1, 5, ResourceType.Iron, 250)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderSword3, 5, ResourceType.Iron, 450)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderPoleArm3, 5, ResourceType.Gold, 250)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderBow3, 5, ResourceType.Gold, 450)

  local mercenaryId = Logic.GetEntityIDByName("merchant2")
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderRifle1, 5, ResourceType.Iron, 250)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderSword3, 5, ResourceType.Iron, 450)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderPoleArm3, 5, ResourceType.Gold, 250)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderBow3, 5, ResourceType.Gold, 450)
  
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

  Display.SetRenderUseGfxSets(1)
  
  WeatherSets_SetupNormal(1)
  WeatherSets_SetupRain(2)
  WeatherSets_SetupSnow(3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

  Logic.SetupGfxSet(1)
  Logic.AddWeatherElement(1, 800, 1, 1, 5, 10)  -- Sommer
  Logic.AddWeatherElement(2, 120, 1, 2, 5, 10)	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
    -- set player colors
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
    if p1color == 2 then
        Display.SetPlayerColorMapping(2, 6)
    elseif p1color == 3 then
        Display.SetPlayerColorMapping(3, 1)
    elseif p1color == 5 then
        Display.SetPlayerColorMapping(5, 4)
    end
    Display.SetPlayerColorMapping(7, ROBBERS_COLOR)
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

  --  chest handling
  CreateChestOpener("Dario")
  CreateChestOpener("Erec")
  CreateChestOpener("Helias")
  CreateChestOpener("Ari")
  CreateChestOpener("Pilgrim")
  CreateChestOpener("Salim")
  CreateChestOpener("Drake")
  CreateRandomGoldChests()
  CreateRandomChests()
  StartChestQuest()
  

  --  resources
	GlobalMissionScripting.GiveResouces(1, 1000, 800, 800, 500, 500, 500)

  --  Variables
  StoneM1 = 0
  StoneM2 = 0
  StoneM3 = 0
  IronM1 = 0
  IronM2 = 0
  IronM3 = 0
  IronM4 = 0
  ClayM1 = 0
  ClayM2 = 0
  SulfurM1 = 0
  SulfurM2 = 0
  TowerB1 = 0
  TowerB2 = 0
  TowerB3 = 0
  Baracs = 0
  Arceriu = 0
  Staulu = 0
  Blacsmisu = 0
  Tavernas = 0
  Farmsas = 0
  Chapter4 = 0
  Chapter5 = 0
	
  ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
  ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree

  --  Set Player Name
  SetPlayerName(2, "Bergbewohner")
  SetPlayerName(5, "Bergbewohner")

  --   Set Music-Set
  LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
  LocalMusic.UseSet = EUROPEMUSIC
  
  --  start quest
  start1stChapter()

	RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 4000, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
	RaidersCreate({player = 7, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
	RaidersCreate({player = 7, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1", "rudelpos3_wp2"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})

	RaidersCreate({player = 7, pos = "bearpos1", revier = 2000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
	RaidersCreate({player = 7, pos = "bearpos2", revier = 2000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})

  --Tools.ExploreArea(-1, -1, 900)
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function CreateArmiesBase1()

  local pos = GetPosition("Enemy1Spawn1")
	B1Group1 = AI.Entity_CreateFormation(2, Entities.PU_LeaderBow2,0,4,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B1Group1, "B1Group1")

  local pos = GetPosition("Enemy1Spawn2")
  B1Group2 = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword2,0,4,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B1Group2, "B1Group2")

  local pos = GetPosition("Enemy1Spawn3")
  B1Group3 = AI.Entity_CreateFormation(2, Entities.PU_LeaderPoleArm2,0,4,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B1Group3, "B1Group3")

  local pos = GetPosition("Enemy1Spawn1")
  B1Group11 = AI.Entity_CreateFormation(2, Entities.PU_LeaderBow2,0,4,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B1Group11, "B1Group11")

  local pos = GetPosition("Enemy1Spawn2")
  B1Group21 = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword2,0,4,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B1Group21, "B1Group21")

  local pos = GetPosition("Enemy1Spawn3")
  B1Group31 = AI.Entity_CreateFormation(2, Entities.PU_LeaderPoleArm2,0,4,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B1Group31, "B1Group31")

  StartJob("StatusArmy1")

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function CreateArmiesBase2()

  local pos = GetPosition("Enemy2Spawn1")
  B2Group1 = AI.Entity_CreateFormation(5, Entities.CU_BanditLeaderSword2,0,8,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B2Group1, "B2Group1")

  local pos = GetPosition("Enemy2Spawn2")
  B2Group2 = AI.Entity_CreateFormation(5, Entities.CU_BanditLeaderSword2,0,8,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B2Group2, "B2Group2")

  local pos = GetPosition("Enemy2Spawn3")
  B2Group3 = AI.Entity_CreateFormation(5, Entities.CU_BanditLeaderBow2,0,8,pos.X,pos.Y,0,0,2,0)
  SetEntityName(B2Group3, "B2Group3")

  StartJob("StatusArmy2")

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "StatusArmy1"
Condition_StatusArmy1 = function()

  return IsDead("B1Group1") 
    and IsDead("B1Group2") 
    and IsDead("B1Group3") 
    and IsDead("B1Group11") 
    and IsDead("B1Group21") 
    and IsDead("B1Group31")
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Action_StatusArmy1 = function()

  CampArmy1_DELAY = 240
  CampArmy1_COUNTER  =  CampArmy1_DELAY
  StartJob("TimerCampArmy1")

  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "TimerCampArmy1"
Condition_TimerCampArmy1 = function()

  if IsAlive("player2") then                
    if CampArmy1_COUNTER > 0 then
      CampArmy1_COUNTER = CampArmy1_COUNTER - 1
      return false
    elseif CampArmy1_COUNTER==0 then 
      return true                                                   
    end
  end
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Action_TimerCampArmy1 = function()

  CreateArmiesBase1()

  Attack("B1Group1","player1")
  Attack("B1Group2","player1")
  Attack("B1Group3","player1")
  Attack("B1Group11","player1")
  Attack("B1Group21","player1")
  Attack("B1Group31","player1")

  return true
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "StatusArmy2"
Condition_StatusArmy2 = function()
  return IsDead("B2Group1") 
    and IsDead("B2Group2") 
    and IsDead("B2Group3")
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Action_StatusArmy2 = function()

  CampArmy2_DELAY = 240
  CampArmy2_COUNTER =  CampArmy2_DELAY
  StartJob("TimerCampArmy2")

  return true
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "TimerCampArmy2"
Condition_TimerCampArmy2 = function()

  if IsAlive("player5") then                
    if CampArmy2_COUNTER > 0 then
      CampArmy2_COUNTER = CampArmy2_COUNTER - 1
      return false
    elseif CampArmy2_COUNTER==0 then 
      return true                                                      
    end
  end

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Action_TimerCampArmy2 = function()

  CreateArmiesBase2()

  Attack("B2Group1","player1")
  Attack("B2Group2","player1")
  Attack("B2Group3","player1")

  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
createBriefingAllies = function()

  briefingAllies  = {}  
  briefingAllies.finished = BriefingAlliesFinished

  -- page
  local page = 0
  
  page = page + 1
  briefingAllies[page]           = {}
  briefingAllies[page].title     = "Bauer"
  briefingAllies[page].text      = "Als Belohnung gebe ich Euch zwei Truppen Bogensch\195\188tzen mit, die Euch bei Eurer Aufgabe unterst\195\188tzen k\195\182nnen."
  briefingAllies[page].position  = GetPosition("Farmer")

  StartBriefing(briefingAllies)
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
BriefingAlliesFinished = function()
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
createBriefingBuildings = function()

  briefingBuildings = {}  
  briefingBuildings.finished = BriefingBuildingsFinished

  -- page
  local page = 0
  
  page = page + 1
  briefingBuildings[page]           = {}
  briefingBuildings[page].title     = "Pilgrim"
  briefingBuildings[page].text      = "Nun brauchen wir ein paar Milit\195\164rgeb\195\164ude und einen Schmied."
  briefingBuildings[page].position  = GetPosition("Pilgrim")

  page = page + 1
  briefingBuildings[page]           = {}
  briefingBuildings[page].title     = "Pilgrim"
  briefingBuildings[page].text      = "Lasst uns auf diesem Plateau eine Kaserne, einen Schie\195\159platz, einen Stall und eine Grobschmiede bauen."
  briefingBuildings[page].position  = GetPosition("Plateau")
  briefingBuildings[page].explore   = 3000
  briefingBuildings[page].marker    = ANIMATED_MARKER

  briefingBuildings[page].quest       = {}
  briefingBuildings[page].quest.id    = 2
  briefingBuildings[page].quest.type  = MAINQUEST_OPEN
  briefingBuildings[page].quest.title = "Die Milit\195\164rgeb\195\164ude"
  briefingBuildings[page].quest.text  = "Errichtet: @cr 1. eine Kaserne @cr 2. einen Schie\195\159platz @cr 3. einen Stall und @cr 4. eine Grobschmiede."


  briefingBuildingsBuild = briefingBuildings[page]
  StartBriefing(briefingBuildings)
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
BriefingBuildingsFinished = function()
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
createBriefingFarms = function()

  briefingFarms =  {}  
  briefingFarms.finished = BriefingFarmsFinished

  -- page
  local page = 0
  
  page = page + 1
  briefingFarms[page]           = {}
  briefingFarms[page].title     = "Bauer"
  briefingFarms[page].text      = "Die Leute wollen nicht mehr arbeiten, weil sie keine Bauernh\195\182fe an ihren Feldern haben. K\195\182nnt Ihr bitte zwei Bauernh\195\182fe f\195\188r mich errichten? Ich werde Euch daf\195\188r entlohnen!"
  briefingFarms[page].position  = GetPosition("Farmer")

  briefingFarms[page].quest       = {}
  briefingFarms[page].quest.id    = 5
  briefingFarms[page].quest.type  = MAINQUEST_OPEN
  briefingFarms[page].quest.title = "Das Anliegen des Bauern"
  briefingFarms[page].quest.text  = "Errichtet zwei Bauernh\195\182fe in der N\195\164he des Bauern." 

  briefingFarmsBuild = briefingFarms[page]
  StartBriefing(briefingFarms)
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
BriefingFarmsFinished = function()
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
createBriefingGift = function()

  briefingGift = {}  
  briefingGift.finished =  BriefingGiftFinished

  --page
  local page = 0
  
  page = page + 1
  briefingGift[page]           = {}
  briefingGift[page].title     = "B\195\188rgermeister"
  briefingGift[page].text      = "Nehmt als Belohnung ein Dorfzentrum."
  briefingGift[page].position  = GetPosition("Burger")

  StartBriefing(briefingGift)
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
BriefingGiftFinished = function()
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
createBriefingMines = function()

  briefingMines = {}  
  briefingMines.finished = BriefingMinesFinished

  -- page
  local page = 0

  page = page + 1
  briefingMines[page]           = {}
  briefingMines[page].title     = "Pilgrim"
  briefingMines[page].text      = "Der letzte Schritt ist, viele Rohstoffe zu besorgen. Wir m\195\188ssen die Gegend mit den vielen Sch\195\164chten finden und dort 3 Steinminen, 4 Eisenminen, 2 Lehmminen und 2 Schwefelminen bauen."
  briefingMines[page].position  = GetPosition("Pilgrim")

  briefingMines[page].quest       = {}
  briefingMines[page].quest.id    = 3
  briefingMines[page].quest.type  = MAINQUEST_OPEN
  briefingMines[page].quest.title = "Das Rohstoff Feld"
  briefingMines[page].quest.text  = "Findet das gebiet mit den Rohstoffen und errichtet @cr 1. drei Steinminen @cr 2. vier Eisenminen @cr 3. zwei Lehmminen und @cr 4. zwei Schwefelminen." 

  briefingMinesBuild = briefingMines[page]
  StartBriefing(briefingMines)
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
BriefingMinesFinished = function()
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
createBriefingPrelude = function()

  briefingPrelude =  {}  
  briefingPrelude.finished = BriefingPreludeFinished

  --page
  local page = 0

  page = page + 1
  briefingPrelude[page]           = {}
  briefingPrelude[page].title     = "Pilgrim"
  briefingPrelude[page].text      = "Wir wollen einen Landekopf aufbauen, doch daf\195\188r m\195\188ssen wir unsere Position an der K\195\188ste festigen."
  briefingPrelude[page].position  = GetPosition("Pilgrim")


  page = page + 1
  briefingPrelude[page]           = {}
  briefingPrelude[page].title     = "Pilgrim"
  briefingPrelude[page].text      = "Wir m\195\188ssen in diesem Gebiet drei Ballistat\195\188rme errichten."
  briefingPrelude[page].position  = GetPosition("tower")
  briefingPrelude[page].explore   = 3000
  briefingPrelude[page].pointer   = GetPosition("tower")

  briefingPrelude[page].quest       = {}
  briefingPrelude[page].quest.id    = 1
  briefingPrelude[page].quest.type  = MAINQUEST_OPEN
  briefingPrelude[page].quest.title = "Sichert die K\195\188ste"
  briefingPrelude[page].quest.text  = "Errichtet im markierten Gebiet drei Ballistat\195\188rme." 

  briefingTowersBuild = briefingPrelude[page]
  StartBriefing(briefingPrelude)
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
BriefingPreludeFinished = function()
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
createBriefingTavern = function()

  briefingTavern = {}  
  briefingTavern.finished = BriefingTavernFinished

--  page
  local page = 0

  page = page + 1
  briefingTavern[page]          = {}
  briefingTavern[page].title    = "B\195\188rgermeister"
  briefingTavern[page].text     = "Wir ben\195\182tigen eine Taverne in unserem Dorf, damit sich die Bauern ausruhen k\195\182nnen. K\195\182nnt Ihr eine Taverne f\195\188r mich errichten? Ich werde Euch entlohnen."
  briefingTavern[page].position = GetPosition("Burger")

  briefingTavern[page].quest       = {}
  briefingTavern[page].quest.id    = 4
  briefingTavern[page].quest.type  = MAINQUEST_OPEN
  briefingTavern[page].quest.title = "Eine Taverne f\195\188r die Bauern"
  briefingTavern[page].quest.text  = "Errichtet eine Taverne in der Siedlung." 

  briefingTavernBuild = briefingTavern[page]
  StartBriefing(briefingTavern)
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
BriefingTavernFinished = function()
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
createBriefingVillage = function()

  briefingVillage = {}  
  briefingVillage.finished = BriefingVillageFinished

  -- page
  local page = 0

  page = page + 1
  briefingVillage[page]          = {}
  briefingVillage[page].title    = "Bauer"
  briefingVillage[page].text     = "Seht Euch unser Dorf genau an, wie in der Toskana! Ihr seid jederzeit willkommen!"
  briefingVillage[page].position = GetPosition("Village")

  StartBriefing(briefingVillage)
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
BriefingVillageFinished = function()
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StartChapter1()

  Mission_InitMerchants()
  createBriefingPrelude()
  NPCVillage()
  CreateArmiesBase1()
  CreateArmiesBase2()
  startQuestDefeat()
  --Tower()
  --StartJob("TowersBuild")
  
  StartSimpleJob("TowersBuild2")
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Tower()

  local Quest = {}
  Quest.AreaPos = "tower"
  Quest.AreaSize = 6000
  Quest.EntityTypes = { { Entities.PB_Tower2, 3}}
  Quest.Callback = Tower1Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Tower1Build()

  TowerB1 = 1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Tower2()

  local Quest = {}
  Quest.AreaPos = "tower"
  Quest.AreaSize = 6000
  Quest.EntityTypes = { { Entities.PB_Tower2, 1}}
  Quest.Callback = Tower2Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Tower2Build()

  TowerB2=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Tower3()

  local Quest = {}
  Quest.AreaPos = "tower"
  Quest.AreaSize = 6000
  Quest.EntityTypes = { { Entities.PB_Tower2, 1}}
  Quest.Callback = Tower3Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Tower3Build()

  TowerB3=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "TowersBuild"
Condition_TowersBuild = function()
            
  return TowerB1==1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Action_TowersBuild = function()

    end1stChapter()
    return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function TowersBuild2()
	if Counter.Tick2("TowersBuild2", 3) then
		if CountTowers() >= 3 then
            end1stChapter()
			return true
		end
	end
end

function CountTowers()
	local pos = GetPosition("tower")
	local towerCount1 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower2, pos.X, pos.Y, 6000, 6)}
	local towerCount2 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower2, pos.X, pos.Y, 6000, 6)}
	local towerCount3 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower3, pos.X, pos.Y, 6000, 6)}
	local towerCount4 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower3, pos.X, pos.Y, 6000, 6)}

	return (towerCount1[1] + towerCount2[1] + towerCount3[1] + towerCount4[1])
end
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StartChapter2()

  createBriefingBuildings()
  Baraca()
  Arceri()
  Staul()
  Blacsmis()
  StartJob("BuildingsBuild")

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Baraca()

  local Quest = {}
  Quest.AreaPos = "Plateau"
  Quest.AreaSize = 6000
  Quest.EntityTypes = { { Entities.PB_Barracks1, 1}}
  Quest.Callback = BaracaBuild
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function BaracaBuild()

  Baracs=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Arceri()

  local Quest = {}
  Quest.AreaPos = "Plateau"
  Quest.AreaSize = 6000
  Quest.EntityTypes = { { Entities.PB_Archery1, 1}}
  Quest.Callback = ArceriBuild
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function ArceriBuild()

  Arceriu=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Staul()

  local Quest = {}
  Quest.AreaPos = "Plateau"
  Quest.AreaSize = 6000
  Quest.EntityTypes = { { Entities.PB_Stable1, 1}}
  Quest.Callback = StaulBuild
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StaulBuild()

  Staulu=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Blacsmis()

  local Quest = {}
  Quest.AreaPos = "Plateau"
  Quest.AreaSize = 6000
  Quest.EntityTypes = { { Entities.PB_Blacksmith1, 1}}
  Quest.Callback = BlacsmisBuild
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function BlacsmisBuild()

  Blacsmisu=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "BuildingsBuild"
Condition_BuildingsBuild = function()

  return Blacsmisu==1 and Staulu==1 and Arceriu==1 and Baracs==1

end


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_BuildingsBuild = function()

  end2ndChapter()
  return true
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StartChapter3()

  NPCGuard1()
  NPCGuard2()
  NPCGarda1()
  NPCGarda2()
  createBriefingMines()
  StoneMine1()
  StoneMine2()
  StoneMine3()
  IronMine1()
  IronMine2()
  IronMine3()
  IronMine4()
  ClayMine1()
  ClayMine2()
  SulfurMine1()
  SulfurMine2()
  StartJob("MinesAreBuild")

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StoneMine1()

  local Quest = {}
  Quest.AreaPos = "Stone1"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_StoneMine1, 1}}
  Quest.Callback = StoneMine1Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StoneMine1Build()

  StoneM1=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StoneMine2()

  local Quest = {}
  Quest.AreaPos = "Stone2"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_StoneMine1, 1}}
  Quest.Callback = StoneMine2Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StoneMine2Build()

  StoneM2=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StoneMine3()

  local Quest = {}
  Quest.AreaPos = "Stone3"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_StoneMine1, 1}}
  Quest.Callback = StoneMine3Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StoneMine3Build()

  StoneM3=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function IronMine1()

  local Quest = {}
  Quest.AreaPos = "Iron1"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_IronMine1, 1}}
  Quest.Callback = IronMine1Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function IronMine1Build()

  IronM1=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function IronMine2()

  local Quest = {}
  Quest.AreaPos = "Iron2"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_IronMine1, 1}}
  Quest.Callback = IronMine2Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function IronMine2Build()

  IronM2=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function IronMine3()

  local Quest = {}
  Quest.AreaPos = "Iron3"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_IronMine1, 1}}
  Quest.Callback = IronMine3Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function IronMine3Build()

  IronM3=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function IronMine4()

  local Quest = {}
  Quest.AreaPos = "Iron4"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_IronMine1, 1}}
  Quest.Callback = IronMine4Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function IronMine4Build()

  IronM4=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function ClayMine1()

  local Quest = {}
  Quest.AreaPos = "Clay1"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_ClayMine1, 1}}
  Quest.Callback = ClayMine1Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function ClayMine1Build()

  ClayM1=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function ClayMine2()

  local Quest = {}
  Quest.AreaPos = "Clay2"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_ClayMine1, 1}}
  Quest.Callback = ClayMine2Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function ClayMine2Build()

  ClayM2=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function SulfurMine1()

  local Quest = {}
  Quest.AreaPos = "Sulfur1"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_SulfurMine1, 1}}
  Quest.Callback = SulfurMine1Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function SulfurMine1Build()

  SulfurM1=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function SulfurMine2()

  local Quest = {}
  Quest.AreaPos = "Sulfur2"
  Quest.AreaSize = 2000
  Quest.EntityTypes = { { Entities.PB_SulfurMine1, 1}}
  Quest.Callback = SulfurMine2Build
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function SulfurMine2Build()

  SulfurM2=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "MinesAreBuild"
Condition_MinesAreBuild = function()

  return StoneM1==1 
    and StoneM2==1 
    and StoneM3==1 
    and IronM1==1 
    and IronM2==1 
    and IronM3==1 
    and IronM4==1 
    and ClayM1==1 
    and ClayM2==1 
    and SulfurM1==1 
    and SulfurM2==1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Action_MinesAreBuild = function()

    end3rdChapter()
    return true
    
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StartChapter4()

  NPCTavern()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function StartChapter5()

  NPCFarms()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function start1stChapter()

  StartChapter1()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function end1stChapter()

  ResolveBriefing(briefingTowersBuild)
  start2ndChapter()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function start2ndChapter()

  StartChapter2()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function end2ndChapter()

  -- Destroy minimap marker
  local a, s = Tools.GetPosition("Plateau")
  GUI.DestroyMinimapPulse(a, s)

  ResolveBriefing(briefingBuildingsBuild)
  start3rdChapter()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function start3rdChapter()

  StartChapter3()
  start4thChapter()
  start5thChapter()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function end3rdChapter()
  
  delayVictory = 0
  ResolveBriefing(briefingMinesBuild)
  StartJob("CanIWin")

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function start4thChapter()

  StartChapter4()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function end4thChapter()
  
  ResolveBriefing(briefingTavernBuild)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function start5thChapter()

  StartChapter5()

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function end5thChapter()
  
  ResolveBriefing(briefingFarmsBuild)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "CanIWin"
Condition_CanIWin = function()

  return Chapter4~=1 and Chapter5~=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Action_CanIWin = function()

  if delayVictory > 3 then
    Victory()
    return true
  else
    delayVictory = delayVictory +1
    return false
  end
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function NPCFarms()

  -- setup table for npc
  local NPCFarms    = {}
  NPCFarms.name     = "Farmer"
  NPCFarms.callback = FarmsSpoken
          
  -- create npc
  CreateNPC(NPCFarms)
       
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function FarmsSpoken()

  createBriefingFarms()
  Chapter5=1
  Ferme()
  StartJob("EGataFarmsa")

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function Ferme()

  local Quest       = {}
  Quest.AreaPos     = "Farms"
  Quest.AreaSize    = 5000
  Quest.EntityTypes = { { Entities.PB_Farm1, 2}}
  Quest.Callback    = FermeBuild
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function FermeBuild()

  Farmsas=1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--  JOB: "EGataFarmsa"
Condition_EGataFarmsa = function()

  return Farmsas==1

end
    
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Action_EGataFarmsa = function()

  createBriefingAllies()
  SpawnAllies()
  Chapter5=2
  end5thChapter()

  pos = GetPosition("Farms")
  cacat,kkt1,kkt2 = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Farm1, pos.X, pos.Y, 5000, 2)
  ChangePlayer(kkt1,8)
  ChangePlayer(kkt2,8)

  return true
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function SpawnAllies()

  local pos = GetPosition("AllySpawn1")
  Allied1 = Tools.CreateGroup(1, Entities.PU_LeaderBow2, 4, pos.X, pos.Y, 180)
  SetEntityName(Allied1, "Allied1")

  local pos = GetPosition("AllySpawn2")
  Allied2 = Tools.CreateGroup(1, Entities.PU_LeaderBow2, 4, pos.X, pos.Y, 180)
  SetEntityName(Allied2, "Allied2")

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function NPCGarda1()

  -- setup table for npc
  local NPCGarda1    = {}
  NPCGarda1.name     = "Garda1"
  NPCGarda1.callback = NPCGarda12Select
          
  -- create npc
  CreateNPC(NPCGarda1)
       
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
NPCGarda12Select = function()

  NPCSelect21Briefing =  {}
  NPCSelect21Briefing.restoreCamera =  true
  NPCSelect21Briefing.finished =  NPCSelect21BriefingFinished

  -- page 
  page = 0

  page = page + 1
  NPCSelect21Briefing[page]                   = {}
  NPCSelect21Briefing[page].mc                = {}
  NPCSelect21Briefing[page].mc.title          = "Wache"
  NPCSelect21Briefing[page].mc.text           = "Wenn Ihr passieren wollt, kostet Euch das 3000 Taler. Ansonsten habt Ihr 10 Sekunden, um von hier zu verschwinden, sonst vergessen wir unsere Freundlichkeit!"
  NPCSelect21Briefing[page].mc.firstText      = "3000 Taler f\195\188r die Passage bezahlen."
  NPCSelect21Briefing[page].mc.secondText     = "Nichts zahlen... und RENNEN."
  NPCSelect21Briefing[page].mc.firstSelected  = 3
  NPCSelect21Briefing[page].mc.secondSelected = 5
  NPCSelect21BriefingMCPage =  NPCSelect21Briefing[page]

  page = 3
  NPCSelect21Briefing[page]       = {}
  NPCSelect21Briefing[page].title = "Wache"
  NPCSelect21Briefing[page].text  = "Gut... Ihr k\195\182nnt passieren."

  page = 5
  NPCSelect21Briefing[page]       = {}
  NPCSelect21Briefing[page].title = "Wache"
  NPCSelect21Briefing[page].text  = "Wenn Ihr in 10 Sekunden nicht verschwunden seid, werden wir Euch angreifen."

  StartBriefing(NPCSelect21Briefing)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function NPCSelect21BriefingFinished()

    if GetSelectedBriefingMCButton(NPCSelect21BriefingMCPage) == 1 then      
      Option1()
    else
      Option2()
    end

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Option1 = function()

  local Player1Money = GetGold()
  if Player1Money >= 3000 then
    AddGold(-3000)
    ReplaceEntity("Gate1", Entities.XD_WallStraightGate)
    ReplaceEntity("Gate1_1", Entities.XD_WallStraightGate)
    DestroyEntity("Guard1")
  else
    Message("@color:248,197,18 Ihr habt nicht genug Taler.")
    NPCGarda1()
  end  
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Option2 = function()

  StartJob("BriefActiv12")
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
--  JOB: "BriefActiv12"
Condition_BriefActiv12 = function()

  return IsBriefingActive() == false

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
Action_BriefActiv12 = function()

  StartJob("TimeCounter12")
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   

QUESTCounter12_DELAY = 10
QUESTCounter12_COUNTER = QUESTCounter12_DELAY 

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Condition_TimeCounter12 = function()

  if QUESTCounter12_COUNTER > 0 then
    QUESTCounter12_COUNTER = QUESTCounter12_COUNTER - 1
    MapLocal_StartCountDown(QUESTCounter12_COUNTER)
    Report("Time remaining : "..QUESTCounter12_COUNTER.." seconds")
    return false
  elseif QUESTCounter12_COUNTER==0 then 
    return true                    
  else
    MapLocal_StopCountDown(0)
  end

end
  
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_TimeCounter12 = function()

  MapLocal_StopCountDown(0)
  if IsNear("Pilgrim","Garda1",3000) then
  
    Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
    ReplaceEntity("Gate1", Entities.XD_WallStraightGate)
    ReplaceEntity("Gate1_1", Entities.XD_WallStraightGate)
    DestroyEntity("Guard1")

    Attack("B1Group1","player1")
    Attack("B1Group2","player1")
    Attack("B1Group3","player1")
    Attack("B1Group11","player1")
    Attack("B1Group21","player1")
    Attack("B1Group31","player1")

  else

    QUESTCounter12_DELAY = 10
    QUESTCounter12_COUNTER =  QUESTCounter12_DELAY 
    NPCGarda1()

  end
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function NPCGarda2()

  -- setup table for npc
  local NPCGarda2 = {}
  NPCGarda2.name = "Garda2"
  NPCGarda2.callback = NPCGarda21Select
          
  -- create npc
  CreateNPC(NPCGarda2)
       
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
NPCGarda21Select = function()

  NPCSelect31Briefing =  {}
  NPCSelect31Briefing.restoreCamera =  true
  NPCSelect31Briefing.finished =  NPCSelect31BriefingFinished

  -- page
  page = 0

  page = page + 1
  NPCSelect31Briefing[page]                   = {}
  NPCSelect31Briefing[page].mc                = {}
  NPCSelect31Briefing[page].mc.title          = "Wache"
  NPCSelect31Briefing[page].mc.text           = "Wenn Ihr passieren wollt, kostet Euch das 3000 Taler. Ansonsten habt Ihr 10 Sekunden, um von hier zu verschwinden, sonst vergessen wir unsere Freundlichkeit!"
  NPCSelect31Briefing[page].mc.firstText      = "3000 Taler zahlen und passieren.."
  NPCSelect31Briefing[page].mc.secondText     = "Nichts bezahlen und verschwinden."
  NPCSelect31Briefing[page].mc.firstSelected  = 3
  NPCSelect31Briefing[page].mc.secondSelected = 5
  NPCSelect31BriefingMCPage =  NPCSelect31Briefing[page]

  page = 3
  NPCSelect31Briefing[page]       = {}
  NPCSelect31Briefing[page].title = "Wache"
  NPCSelect31Briefing[page].text  = "Nun gut, Ihr d\195\188rft passieren."

  page = 5
  NPCSelect31Briefing[page]       = {}
  NPCSelect31Briefing[page].title = "Wache"
  NPCSelect31Briefing[page].text  = "Wenn ich Euch in 10 Sekunden noch hier sehe, greifen wir an."
    
  StartBriefing(NPCSelect31Briefing)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function NPCSelect31BriefingFinished()

    if GetSelectedBriefingMCButton(NPCSelect31BriefingMCPage) == 1 then      
      Option21()
    else
      Option22()
    end

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Option21 = function()

  local Player1Money = GetGold()
  if Player1Money >= 3000 then

    AddGold(-3000)
    ReplaceEntity("Gate2_1", Entities.XD_WallStraightGate)
    ReplaceEntity("Gate2", Entities.XD_WallStraightGate)
    DestroyEntity("Guard2")
  
  else

    Message("@color:248,197,18 Ihr habt nicht genug Taler.")
    NPCGarda2()

  end
  return true
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Option22 = function()

  StartJob("BriefActiv21")
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
--  JOB: "BriefActiv21"
Condition_BriefActiv21 = function()

  return IsBriefingActive() == false

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_BriefActiv21 = function()

  StartJob("TimeCounter21")
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     

QUESTCounter21_DELAY = 10
QUESTCounter21_COUNTER =  QUESTCounter21_DELAY 

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
-- JOB: "TimeCounter21"
Condition_TimeCounter21 = function()

  if QUESTCounter21_COUNTER > 0 then
    QUESTCounter21_COUNTER = QUESTCounter21_COUNTER - 1
    MapLocal_StartCountDown(QUESTCounter21_COUNTER)
    Report("Time remaining : "..QUESTCounter21_COUNTER.." seconds")
    return false
  elseif QUESTCounter21_COUNTER==0 then 
    return true
  else
    MapLocal_StopCountDown(0)
  end

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_TimeCounter21 = function()

  MapLocal_StopCountDown(0)
  if IsNear("Pilgrim","Garda2",3000) then
    Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
    ReplaceEntity("Gate2_1", Entities.XD_WallStraightGate)
    ReplaceEntity("Gate2", Entities.XD_WallStraightGate)
    DestroyEntity("Guard2")

    Attack("B2Group1","player1")
    Attack("B2Group2","player1")
    Attack("B2Group3","player1")
  else
    QUESTCounter21_DELAY     =       10
    QUESTCounter21_COUNTER     =  QUESTCounter21_DELAY 
    NPCGarda2()
  end
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function NPCGuard1()

  -- setup table for npc

  local NPCGuard1 =  {}
  NPCGuard1.name = "Guard1"
  NPCGuard1.callback =  NPCGuard1Select
          
  -- create npc
  CreateNPC(NPCGuard1)
       
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
NPCGuard1Select = function()

  NPCSelect2Briefing = {}
  NPCSelect2Briefing.restoreCamera = true
  NPCSelect2Briefing.finished = NPCSelect2BriefingFinished

  -- page
  page = 0

  page = page + 1
  NPCSelect2Briefing[page] = {}
  NPCSelect2Briefing[page].mc                = {}
  NPCSelect2Briefing[page].mc.title          = "Wache"
  NPCSelect2Briefing[page].mc.text           = "Wenn Ihr passieren wollt, kostet Euch das 3000 Taler. Ansonsten habt Ihr 10 Sekunden, um von hier zu verschwinden, sonst vergessen wir unsere Freundlichkeit!"
  NPCSelect2Briefing[page].mc.firstText      = "3000 Taler zahlen und passieren."
  NPCSelect2Briefing[page].mc.secondText     = "Nichts bezahlen und das Weite suchen."
  NPCSelect2Briefing[page].mc.firstSelected  = 3
  NPCSelect2Briefing[page].mc.secondSelected = 5
  NPCSelect2BriefingMCPage =  NPCSelect2Briefing[page]

  page = 3
  NPCSelect2Briefing[page]       = {}
  NPCSelect2Briefing[page].title = "Wache"
  NPCSelect2Briefing[page].text  = "Gut, Ihr d\195\188rft passieren."

  page = 5
  NPCSelect2Briefing[page]       = {}
  NPCSelect2Briefing[page].title = "Wache"
  NPCSelect2Briefing[page].text  = "Ihr habt 10 Sekunden, um von hier zu verschwinden, sonst greifen wir an."
    
  StartBriefing(NPCSelect2Briefing)
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function NPCSelect2BriefingFinished()

    if GetSelectedBriefingMCButton(NPCSelect2BriefingMCPage) == 1 then      
      Option31()
    else
      Option32()
    end

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Option31 = function()

  local Player1Money = GetGold()
  if Player1Money >= 3000 then
    AddGold(-3000)
    ReplaceEntity("Gate1", Entities.XD_WallStraightGate)
    ReplaceEntity("Gate1_1", Entities.XD_WallStraightGate)
    DestroyEntity("Garda1")
  else
    Message("@color:248,197,18 Ihr habt nicht genug Taler.")
    NPCGuard1()
  end
  
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Option32 = function()

  StartJob("BriefActiv1")
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Condition_BriefActiv1 = function()

  return IsBriefingActive() == false
  
end
  
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_BriefActiv1 = function()

  StartJob("TimeCounter1")
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
QUESTCounter1_DELAY = 10
QUESTCounter1_COUNTER  =  QUESTCounter1_DELAY 

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
--  JOB: "TimeCounter1"
Condition_TimeCounter1 = function()

  if QUESTCounter1_COUNTER > 0 then
    QUESTCounter1_COUNTER = QUESTCounter1_COUNTER - 1
    MapLocal_StartCountDown(QUESTCounter1_COUNTER)
    Report("Time remaining : "..QUESTCounter1_COUNTER.." seconds")
    return false
   elseif QUESTCounter1_COUNTER==0 then 
    return true                    
  else
    MapLocal_StopCountDown(0)
  end

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_TimeCounter1 = function()

  MapLocal_StopCountDown(0)
  if IsNear("Pilgrim","Guard1",3000) then
    Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
    ReplaceEntity("Gate1", Entities.XD_WallStraightGate)
    ReplaceEntity("Gate1_1", Entities.XD_WallStraightGate)
    DestroyEntity("Garda1")

    Attack("B1Group1","player1")
    Attack("B1Group2","player1")
    Attack("B1Group3","player1")
    Attack("B1Group11","player1")
    Attack("B1Group21","player1")
    Attack("B1Group31","player1")
  else
    QUESTCounter1_DELAY     =       10
    QUESTCounter1_COUNTER     =  QUESTCounter1_DELAY 
    NPCGuard1()
  end

  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function NPCGuard2()

  -- setup table for npc
  local NPCGuard2  =  {}
  NPCGuard2.name = "Guard2"
  NPCGuard2.callback =  NPCGuard2Select
          
  -- create npc
  CreateNPC(NPCGuard2)
       
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
NPCGuard2Select = function()

  NPCSelect3Briefing = {}
  NPCSelect3Briefing.restoreCamera = true
  NPCSelect3Briefing.finished  =  NPCSelect3BriefingFinished

  -- page
  page = 0

  page = page + 1
  NPCSelect3Briefing[page]                   = {}
  NPCSelect3Briefing[page].mc                = {}
  NPCSelect3Briefing[page].mc.title          = "Wache"
  NPCSelect3Briefing[page].mc.text           = "Wenn Ihr passieren wollt, kostet Euch das 3000 Taler. Ansonsten habt Ihr 10 Sekunden, um von hier zu verschwinden, sonst vergessen wir unsere Freundlichkeit!"
  NPCSelect3Briefing[page].mc.firstText      = "3000 Taler zahlen und passieren."
  NPCSelect3Briefing[page].mc.secondText     = "Nichts zahlen und verschwinden."
  NPCSelect3Briefing[page].mc.firstSelected  = 3
  NPCSelect3Briefing[page].mc.secondSelected = 5
  NPCSelect3BriefingMCPage = NPCSelect3Briefing[page]

  page = 3
  NPCSelect3Briefing[page]       = {}
  NPCSelect3Briefing[page].title = "Wache"
  NPCSelect3Briefing[page].text  = "Gut, Ihr d\195\188rft passieren."

  page = 5
  NPCSelect3Briefing[page]       = {}
  NPCSelect3Briefing[page].title = "Wache"
  NPCSelect3Briefing[page].text  = "Ihr habt 10 Sekunden Zeit, um zu verschwinden. Danach werden wir Euch angreifen."
    
  StartBriefing(NPCSelect3Briefing)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function NPCSelect3BriefingFinished()

    if GetSelectedBriefingMCButton(NPCSelect3BriefingMCPage) == 1 then      
      Option311()
    else
      Option321()
    end

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Option311 = function()

  local Player1Money = GetGold()
  if Player1Money >= 3000 then
    AddGold(-3000)
    ReplaceEntity("Gate2", Entities.XD_WallStraightGate)
    ReplaceEntity("Gate2_1", Entities.XD_WallStraightGate)
    DestroyEntity("Garda2")
  else
    Message("@color:248,197,18 Ihr habt nicht genug Taler.")
    NPCGuard2()
  end
  
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Option321 = function()

  StartJob("BriefActiv2")
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
--  JOB: "BriefActiv2"
Condition_BriefActiv2 = function()

  return IsBriefingActive() == false

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_BriefActiv2 = function()

  StartJob("TimeCounter2")
  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
QUESTCounter2_DELAY = 10
QUESTCounter2_COUNTER =  QUESTCounter2_DELAY 

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
--  JOB: "TimeCounter2"
Condition_TimeCounter2 = function()
  
  if QUESTCounter2_COUNTER > 0 then
    QUESTCounter2_COUNTER = QUESTCounter2_COUNTER - 1
    MapLocal_StartCountDown(QUESTCounter2_COUNTER)
    Report("Time remaining : "..QUESTCounter2_COUNTER.." seconds")
    return false
  elseif QUESTCounter2_COUNTER==0 then 
    return true
  else
    MapLocal_StopCountDown(0)
  end

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_TimeCounter2 = function()

  MapLocal_StopCountDown(0)
  if IsNear("Pilgrim","Guard2",3000) then
    Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
    ReplaceEntity("Gate2", Entities.XD_WallStraightGate)
    ReplaceEntity("Gate2_1", Entities.XD_WallStraightGate)
    DestroyEntity("Garda2")

    Attack("B2Group1","player1")
    Attack("B2Group2","player1")
    Attack("B2Group3","player1")
  else
    QUESTCounter2_DELAY     =       10
    QUESTCounter2_COUNTER     =  QUESTCounter2_DELAY 
    NPCGuard2()
  end

  return true

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function NPCTavern()

  -- setup table for npc
  local NPCTavern = {}
  NPCTavern.name = "Burger"
  NPCTavern.callback = TavernSpoken
          
  -- create npc
  CreateNPC(NPCTavern)
       
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function TavernSpoken()

  createBriefingTavern()
  Chapter4=1
  Taverna()
  StartJob("EGataTaverna")

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function Taverna()

  local Quest = {}
  Quest.AreaPos = "tavern"
  Quest.AreaSize = 3000
  Quest.EntityTypes = { { Entities.PB_Tavern1, 1}}
  Quest.Callback = TavernaBuild
  SetupEstablish(Quest)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function TavernaBuild()

  Tavernas = 1

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
--  JOB: "EGataTaverna"
Condition_EGataTaverna = function()
  
  return Tavernas==1
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_EGataTaverna = function()

  createBriefingGift()
  ChangePlayer("village_1",1)
  Chapter4 = 2
  end4thChapter()
  pos1 = GetPosition("tavern")
  Var1,Var2 = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tavern1, pos1.X, pos1.Y, 3000, 1)
  ChangePlayer(Var2,8)
  return true
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function NPCVillage()

  -- setup table for npc
  local NPCVillage = {}
  NPCVillage.name = "Village"
  NPCVillage.callback = VillageSpoken
          
  -- create npc
  CreateNPC(NPCVillage)
       
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
function VillageSpoken()

  createBriefingVillage()
  Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
startQuestDefeat = function()

  StartJob("QuestDefeat")
  
end
  
  
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Condition_QuestDefeat = function()

  return IsDead("player1")
  
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     
Action_QuestDefeat = function()

  Logic.SetDiplomacyState( 1, 2, Diplomacy.Friendly )
  Logic.SetDiplomacyState( 1, 5, Diplomacy.Friendly )

  Defeat()
  return true
  
end