--------------------------------------------------------------------------------
-- MapName: WinterDays
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()

  Logic.SetDiplomacyState(1, 2, Diplomacy.Neutral)
  Logic.SetDiplomacyState(3, 4, Diplomacy.Hostile)
  Logic.SetDiplomacyState(1, 4, Diplomacy.Hostile)
  Logic.SetDiplomacyState(1, 3, Diplomacy.Neutral)
  Logic.SetDiplomacyState(1, 5, Diplomacy.Hostile)
  Logic.SetDiplomacyState(4, 6, Diplomacy.Hostile)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function InitResources()
end

---++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Blacksmith, 0)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Stables, 0)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 0)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast, 0)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather, 0)

  ResearchAllMilitaryTechs(4)
  ResearchAllMilitaryTechs(5)
  
	ResearchAnimalTechs(4, true)
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

  Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)  -- Sommer
  Logic.AddWeatherElement(2, 50, 1, 2, 5, 10)   -- Foggy with Rain
  Logic.AddWeatherElement(1, 320, 1, 1, 5, 10)  -- Sommer
  Logic.AddWeatherElement(2, 80, 1, 2, 5, 10)    -- Foggy with Rain

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()

  -- Set Colors
  BLUE = 1
  RED = 2

	Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())
  Display.SetPlayerColorMapping(2, 4)
  Display.SetPlayerColorMapping(3, CLEYCOURT_COLOR)
  Display.SetPlayerColorMapping(4, ROBBERS_COLOR)
  Display.SetPlayerColorMapping(5, ROBBERS_COLOR)
  Display.SetPlayerColorMapping(6, 6)
  Display.SetPlayerColorMapping(8, NPC_COLOR)
      
end

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

function Mission_InitMerchants()

  local mercenaryId = Logic.GetEntityIDByName("merchant")
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderBow1, 1, ResourceType.Gold, 100)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderBow2, 1, ResourceType.Gold, 150)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderBow3, 1, ResourceType.Gold, 250)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Scout, 2, ResourceType.Gold, 150)

  local mercenaryId = Logic.GetEntityIDByName("merchant1")
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderSword1, 1, ResourceType.Iron, 150)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderSword2, 1, ResourceType.Iron, 200)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderSword3, 1, ResourceType.Iron, 250)
  Logic.AddMercenaryOffer(mercenaryId, Entities.PU_LeaderSword4, 1, ResourceType.Iron, 300)
  
end
  
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function FirstMapAction()
  
  createPlayer1()
  createPlayer2()
  createPlayer3()
  createPlayer4()
  createPlayer5()
  
  SetPlayerName(4, "Banditen")

  Mission_InitMerchants()
	
  ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
  ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree
  
  -- Set Music-Set
  LocalMusic.UseSet = DARKMOORMUSIC

  -- Start time line
  TimeLine.Start()

  --  the openers
  start1stQuest()
  
	RaidersCreate({player = 4, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
	RaidersCreate({player = 4, pos = "bearpos1", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})

  --Tools.ExploreArea(-1, -1, 900)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
TIMER = 0
SPAWNTIME = 3*60
Qice_done = false
DEFEND = 1
ATTACK = 2
ADVANCE = 3
globalRespawnTimer2 = 0  
  
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
simpleDefendBehaviour = function(_army)

  if _army.control.mode == DEFEND then
    Defend(_army)
    if _army.control.delay <= 0 then  
      _army.control.mode = DEFEND        
      _army.control.delay = 10 + Logic.GetRandom(10)      
    end
  elseif _army.control.mode == ATTACK then    
    FrontalAttack(_army)    
    if _army.control.delay <= 0 then    
      Redeploy(_army,_army.control.defendPosition)      
      _army.control.mode = ADVANCE      
      _army.control.delay = 50 + Logic.GetRandom(20)      
    end
  end    
  _army.control.delay = _army.control.delay -1    
  return false    

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createArmy = function(_playerId,_id,_army,_strength,_position,_experience,_troops)

  _army.player                  = _playerId
  _army.id                      = _id
  _army.position                = GetPosition(_position)
  _army.rodeLength              = 1000
  _army.strength                = _strength
  _army.control                 = {}
  _army.control.mode            = DEFEND
  _army.control.defendPosition  = _army.position
  _army.control.delay           = 20

  SetupArmy(_army)

  local troopDescription = 
  {
    maxNumberOfSoldiers  = 20,
    minNumberOfSoldiers  = 0,
    experiencePoints   = _experience,
  }      

  for i = 0 , _army.strength , 1 do  
    troopDescription.leaderType = _troops[Logic.GetRandom(table.getn(_troops))+1]      
    EnlargeArmy(_army,troopDescription)
  end
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createArmySpawn = function()

  troops1 = 
  {   
    Entities.CU_BanditLeaderSword2,
    Entities.CU_Barbarian_LeaderClub2,
    Entities.CU_BanditLeaderBow2,
    Entities.CU_LeaderOutlaw1
  }
  
  armyp4_1  = {}
  createArmy(4, 3, armyp4_1, 7, "ap_1", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp4_1")

  armyp4_2  = {}
  createArmy(4, 4, armyp4_2, 7, "ap_2", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp4_2")

  armyp4_3  = {}
  createArmy(4, 5, armyp4_3, 7, "ap_3", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp4_3")

  armyp4_4  = {}
  createArmy(4, 6, armyp4_4, 7, "ap_4", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp4_4")

  armyp4_5  = {}
  createArmy(4, 7, armyp4_5, 7, "ap_5", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp4_5")

  armyp4_6  = {}
  createArmy(4, 8, armyp4_6, 7, "ap_6", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp4_6")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp4_1 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_Controlarmyp4_1 = function()

  return simpleDefendBehaviour(armyp4_1)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp4_2 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_Controlarmyp4_2 = function()

  return simpleDefendBehaviour(armyp4_2)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp4_3 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
Action_Controlarmyp4_3 = function()

  return simpleDefendBehaviour(armyp4_3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp4_4 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_Controlarmyp4_4 = function()

  return simpleDefendBehaviour(armyp4_4)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp4_5 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_Controlarmyp4_5 = function()

  return simpleDefendBehaviour(armyp4_5)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp4_6 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_Controlarmyp4_6 = function()

  return simpleDefendBehaviour(armyp4_6)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
spwnGroup = function()

  armyp5_0  = {}
  createArmy(5, 0, armyp5_0, 3, "ap_0", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp5_0")

  armyp5_1  = {}
  createArmy(5, 1, armyp5_1, 1, "bp_1", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp5_1")

  armyp5_2  = {}
  createArmy(5, 2, armyp5_2, 1, "bp_2", HIGH_EXPERIENCE, troops1)
  StartJob("Controlarmyp5_2")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp5_0 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_Controlarmyp5_0 = function()

  return simpleDefendBehaviour(armyp5_0)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp5_1 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_Controlarmyp5_1 = function()

  return simpleDefendBehaviour(armyp5_1)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_Controlarmyp5_2 = function()

  return true  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_Controlarmyp5_2 = function()

  return simpleDefendBehaviour(armyp5_2)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function createArmyVillage()

  -- Init army
  ArmyVillage              = {}
  ArmyVillage.player       = 4
  ArmyVillage.id           = 1
  ArmyVillage.strength     = 20
  ArmyVillage.position     = GetPosition("b_spwn")
  ArmyVillage.rodeLength   = 10000
  ArmyVillage.beAgressive  = true
  
  ArmyVillage.retreatStrength    = 0
  ArmyVillage.baseDefenseRange   = 10000
  ArmyVillage.outerDefenseRange  = 10000
  ArmyVillage.AttackAllowed      = true
  ArmyVillage.pulse              = true
    
  SetupArmy(ArmyVillage)

  troops = 
  {   
    Entities.CU_BanditLeaderSword2,
    Entities.CU_Barbarian_LeaderClub2,
    Entities.CU_BanditLeaderBow2,
  }
          
  troopDescription = 
  {
    maxNumberOfSoldiers  = 8,
    minNumberOfSoldiers  = 0,
    experiencePoints   = HIGH_EXPERIENCE,
  }      
  
  RandomUnit={}

  for h=1,3,1 do

    RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]
    troopDescription.leaderType = RandomUnit[h]
    EnlargeArmy(ArmyVillage,troopDescription)
    Redeploy(ArmyVillage, ArmyVillage.position)
  
  end

  StartSimpleJob("ControlArmyVillage")
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ControlArmyVillage = function()

  TickOffensiveAIController(ArmyVillage)
  ArmyVillage.position =  GetPosition("b_attack")
  Redeploy(ArmyVillage, ArmyVillage.position)

  if IsDead(ArmyVillage) then
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function createArmyAttack()

  -- Init army
  ArmyAttack               = {}
  ArmyAttack.player        = 4
  ArmyAttack.id            = 1
  ArmyAttack.strength      = 20
  ArmyAttack.position      = GetPosition("b_base")
  ArmyAttack.rodeLength    = 10000
  ArmyAttack.beAgressive   = true
  
  ArmyAttack.retreatStrength    =  0
  ArmyAttack.baseDefenseRange   =  10000
  ArmyAttack.outerDefenseRange  =  10000
  ArmyAttack.AttackAllowed      =  true
  ArmyAttack.pulse              =  true
  
  SetupArmy(ArmyAttack)

  troops = 
  {   
    Entities.CU_BanditLeaderSword2,
    Entities.CU_Barbarian_LeaderClub2,
    Entities.CU_BanditLeaderBow2,
  }
          
  troopDescription = 
  {
    maxNumberOfSoldiers = 8,
    minNumberOfSoldiers = 0,
    experiencePoints = HIGH_EXPERIENCE,
  }      
  
  RandomUnit={}

  for h=1,4,1 do

    RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]
    troopDescription.leaderType = RandomUnit[h]
    EnlargeArmy(ArmyAttack,troopDescription)
    Redeploy(ArmyAttack, ArmyAttack.position)
  
  end

  StartSimpleJob("ControlArmyAttack")
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ControlArmyAttack()

  if Counter.Tick2("ControlArmyAttack", 10) then

    if IsDead(ArmyAttack) then

      if TIMER < SPAWNTIME then
        TIMER=TIMER+10
      else
        TIMER=0
        ArmyAttack.position = GetPosition("b_base")
        for h=1,4,1 do
          RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]
          troopDescription.leaderType = RandomUnit[h]
          EnlargeArmy(ArmyAttack,troopDescription)
        end
        Redeploy(ArmyAttack, ArmyAttack.position)
      end
    end
  end
  
  TickOffensiveAIController(ArmyAttack)
  ArmyAttack.position = GetPosition("b_attack")
  Redeploy(ArmyAttack, ArmyAttack.position)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function createArmyLake()

  -- Init army
  ArmyLake                    = {}
  ArmyLake.player             = 4
  ArmyLake.id                 = 0
  ArmyLake.strength           = 20
  ArmyLake.position           = GetPosition("b_base")
  ArmyLake.rodeLength         = 10000
  ArmyLake.beAgressive        = true  
  ArmyLake.retreatStrength    = 0
  ArmyLake.baseDefenseRange   = 10000
  ArmyLake.outerDefenseRange  = 10000
  ArmyLake.AttackAllowed      = true
  ArmyLake.pulse              = true
    
  SetupArmy(ArmyLake)

  ArmyLake1                   = {}
  ArmyLake1.player            = 4
  ArmyLake1.id                = 2
  ArmyLake1.strength          = 20
  ArmyLake1.position          = GetPosition("b_base")
  ArmyLake1.rodeLength        = 10000
  ArmyLake1.beAgressive       = true
  ArmyLake1.retreatStrength   = 0
  ArmyLake1.baseDefenseRange  = 10000
  ArmyLake1.outerDefenseRange = 10000
  ArmyLake1.AttackAllowed     = true
  ArmyLake1.pulse             = true
    
  SetupArmy(ArmyLake1)

  troops = 
  {   
    Entities.CU_BanditLeaderSword2,
    Entities.CU_Barbarian_LeaderClub2,
    Entities.CU_BanditLeaderBow2,
  }
          
  troopDescription = 
  {
    maxNumberOfSoldiers  = 8,
    minNumberOfSoldiers  = 0,
    experiencePoints = HIGH_EXPERIENCE,
  }      
  
  RandomUnit={}

  for h=1,8,1 do
    RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]
    troopDescription.leaderType = RandomUnit[h]
    EnlargeArmy(ArmyLake,troopDescription)
    EnlargeArmy(ArmyLake1,troopDescription)
    Redeploy(ArmyLake, ArmyLake.position)
    Redeploy(ArmyLake1, ArmyLake1.position)
  end

  StartSimpleJob("ControlArmyLake")
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ControlArmyLake()

  if Qice_done==true then
    return true
  end

  if Counter.Tick2("ControlArmyLake", 10) then

    if IsDead(ArmyLake) then
      ArmyLake.position  =  GetPosition("b_base")
      for h=1,8,1 do
        RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]
        troopDescription.leaderType = RandomUnit[h]
        EnlargeArmy(ArmyLake,troopDescription)
      end
      Redeploy(ArmyLake, ArmyLake.position)
    end

    if IsDead(ArmyLake1) then
      ArmyLake1.position =  GetPosition("b_base")
      for h=1,8,1 do
        RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]
        troopDescription.leaderType = RandomUnit[h]
        EnlargeArmy(ArmyLake1,troopDescription)
      end
      Redeploy(ArmyLake1, ArmyLake1.position)
    end    
  end
  
  TickOffensiveAIController(ArmyLake)
  TickOffensiveAIController(ArmyLake1)
  
  ArmyLake.position  =  GetPosition("b_axe")
  ArmyLake1.position = GetPosition("village")

  Advance(ArmyLake)
  Advance(ArmyLake1)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingBrakeIce = function()

  Explore.Show("axe","b_axe",1500)
  BriefingBrakeIce = {}
  BriefingBrakeIce.finished = BriefingBrakeIceFinished

  -- page
  local page = 0

  page = page + 1
  BriefingBrakeIce[page]              = {}
  BriefingBrakeIce[page].title        = "Pilgrim"
  BriefingBrakeIce[page].position     = GetPosition("b_axe")  
  BriefingBrakeIce[page].text         = "Freunde, wir m\195\188ssen die Banditen unbedingt von der Burg fernhalten! Ich werde versuchen, das Eis mit meiner Axt aufzubrechen. Macht euch keine Sorgen um mich, lauft in Richtung Ufer. Und beeilt euch, der Feind ist nahe!"
  BriefingBrakeIce[page].dialogCamera = true
  BriefingBrakeIce[page].pointer      = GetPosition("b_axe")
  BriefingBrakeIce[page].quest        = {}
  BriefingBrakeIce[page].quest.id     = 6
  BriefingBrakeIce[page].quest.type   = MAINQUEST_OPEN
  BriefingBrakeIce[page].quest.title  = "Der Held des Tages"
  BriefingBrakeIce[page].quest.text   = "Eine gro\195\159e Gruppe Banditen folgt Euch \195\188ber den gefrorenen See. Sie d\195\188rfen das Ufer nicht erreichen, sonst ist Eure Burg in gro\195\159er Gefahr! @cr Lauft mit Pilgrim zu der Axt, die auf dem Eis liegt - die gr\195\188ne Markierung auf der Minimap - und haltet ihn 30 Sekunden lang am Leben, damit er das Eis aufbrechen kann. So k\195\182nnt Ihr die Invasion stoppen. Bringt Helias, Erec und Dario in der Zwischenzeit sicher ans andere Ufer - die wei\195\159e Markierung auf der Minimap - sonst scheitert Ihr an der Aufgabe."

  briefing_Q6 = BriefingBrakeIce[page]
  StartBriefing(BriefingBrakeIce)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingBrakeIceFinished = function()

  local x,y = Tools.GetPosition("b_axe")
  GUI.CreateMinimapMarker(x,y)

  local x,y = Tools.GetPosition("safe")
  GUI.CreateMinimapMarker(x,y,2)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Heroes_care = 0

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingHelias = function()

  Explore.Show("briemerch", "merchant1", 1500)
  BriefingHelias = {}
  BriefingHelias.finished = BriefingHeliasFinished

  -- page
  local page = 0

  page = page + 1
  BriefingHelias[page]              = {}
  BriefingHelias[page].title        = "Helias"
  BriefingHelias[page].position     = GetPosition("helias")  
  BriefingHelias[page].text         = "Ich bin froh, dass Ihr es geschafft habt! Diese Banditen brennen alles nieder, weil die Bauern so arm sind, dass sie ihnen nichts geben k\195\182nnen. Ich habe geh\195\182rt, dass sie ein gro\195\159es Lagern im Osten in den bewaldeten H\195\188geln errichtet haben. Sie werden immer weiter machen, wenn sie nichts finden, was sie rauben k\195\182nnen. Ich muss Dovbar warnen! Lasst uns gehen!"
  BriefingHelias[page].dialogCamera = true

  page = page + 1
  BriefingHelias[page]                = {}
  BriefingHelias[page].title          = "Helias"
  BriefingHelias[page].position       = GetPosition("merchant1")  
  BriefingHelias[page].text           = "Es gibt auch einige S\195\182ldner, die wir anheuern k\195\182nnen, wenn es n\195\182tig wird."
  BriefingHelias[page].dialogCamera   = true      
  BriefingHelias[page].quest          = {}
  BriefingHelias[page].quest.id       = 4
  BriefingHelias[page].quest.type     = MAINQUEST_OPEN
  BriefingHelias[page].quest.title    = "Die Banditen"
  BriefingHelias[page].quest.text     = "Die Gefahr, die von den Banditen ausgeht, ist gr\195\182\195\159er als Ihr gedacht habt.Sie kamen in gro\195\159er Zahl und ein Angriff in den anderen Regionen steht kurz bevor! Dovbar muss unbedingt davon in Kenntnis gesetzt werden. @cr Geht mit Heilas zur\195\188ck zu Dovbar. In dieser Mission darf keiner Eurer vier Helden (Dario, Erec, Pilgrim oder Helias) sterben. Gebt also auf sie acht und nutzt jeden Trick, um sie heil nach Hause zu bringen."

  briefing_Q4 = BriefingHelias[page]  
  StartBriefing(BriefingHelias)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingHeliasFinished = function()

  Explore.Hide("briemerch")

  ChangePlayer("helias",1)
  for i=1,3,1 do
    CreateEntity(0,Entities.XD_RockMedium7,GetPosition("rock"..i),"rock"..i)
  end
  CreateEntity(0,Entities.XD_RockMedium7,GetPosition("spotting"),"rock4")
  StartSimpleJob("detectHeroes")
  StartSimpleJob("canionAttack")
  StartSimpleJob("axe")

  Logic.AddWeatherElement(3, 5000, 0, 3, 5, 10)

  Heroes_care = 1
  StartSimpleJob("Loose")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingIce = function()

  Heroes_care = 0
  Qice_done = true
  SetPosition("helias",GetPosition("d_end"))
  SetPosition("dario",GetPosition("d_end3"))
  SetPosition("erec",GetPosition("e_end3"))
  SetPosition("pilgrim",GetPosition("p_end3"))
  LookAt("helias","dovbar")
  LookAt("dovbar","helias")

  BriefingIce = {}
  BriefingIce.finished = BriefingIceFinished

  -- page
  local page = 0

  page = page + 1
  
  BriefingIce[page]               = {}
  BriefingIce[page].title         = "Pilgrim"
  BriefingIce[page].position      = GetPosition("b_axe")  
  BriefingIce[page].text          = "Geschafft! Das Eis ist aufgebrochen. Nun aber schnell zum anderen Ufer"
  BriefingIce[page].dialogCamera  = false

  page = page + 1
  BriefingIce[page]              = {}
  BriefingIce[page].title        = "Dovbar"
  BriefingIce[page].position     = GetPosition("dovbar")  
  BriefingIce[page].text         = "Das h\195\182rt sich schlimm an. Wir m\195\188ssen Ma\195\159nahmen ergreifen. Ich werde einen Trupp Soldaten aussenden, um sie aufzuhalten. Dario soll sich bereit halten! Ich habe ihm bereits all unsere Milit\195\164rgeb\195\164ude unterstellt. Nutzt sie, wie es Euch am besten erscheint!"
  BriefingIce[page].dialogCamera = false      
  BriefingIce[page].quest        = {}
  BriefingIce[page].quest.id     = 5
  BriefingIce[page].quest.type   = MAINQUEST_OPEN
  BriefingIce[page].quest.title  = "Besiegt die Banditen"
  BriefingIce[page].quest.text   = "Dovbar hat zugestimmt, dass die Banditen gestoppt werden m\195\188ssen. Die Situation ist zu schwierig, sie m\195\188ssen vernichtet werden! Aber denkt daran, dass Ihr sie nur \195\188ber den gefrorenen See erreichen k\195\182nnt. Euch stehen nun neue Milit\195\164rgeb\195\164ude und Technologien zur Verf\195\188gung. R\195\188stet Eure Armee auf und \195\188berquert den See, wenn er zugefroren ist. Zerst\195\182rt alle feindlichen Geb\195\164ude, um den Sieg davon zu tragen!"

  briefing_Q5 = BriefingIce[page]
  StartBriefing(BriefingIce)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingIceFinished = function()

  Explore.Hide("axe")

  ChangePlayer("barracks", 1)
  ChangePlayer("archery", 1)
  ChangePlayer("blacksmith", 1)

  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Blacksmith, 2)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Stables, 2)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 2)

  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast, 2)
  Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather, 2)

  DestroyNPC(NPCsalim)
  ChangePlayer("salim",1)
  ChangePlayer("village_2",1)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingPrelude = function()

  briefingPrelude = {}
  briefingPrelude.finished = BriefingPreludeFinished

  dario = Logic.GetEntityIDByName("dario")
  Move("dario","d_end",  10)
  LookAt("dovbar", "dario")
  Move("erec","e_end",  10)
  LookAt("dovbar", "erec")
  Move("pilgrim","p_end",  10)
  LookAt("dovbar", "pilgrim")
  Move("salim","s_end",  10)
  LookAt("dovbar", "salim")
  
  for i=1,6,1 do
    Move("s"..i,"s"..i.."_end",  10)
    LookAt("dovbar", "s"..i) 
  end  

  -- page
  local page = 0

  page = page + 1
  briefingPrelude[page]                = {}
  briefingPrelude[page].title          = "Mentor"
  briefingPrelude[page].text           = "Die K\195\164mpfe an den Grenzen sind beendet und unsere Helden machen sich auf den Weg nach Hause..."
  briefingPrelude[page].dialogCamera   = false
  briefingPrelude[page].npc            = {}
  briefingPrelude[page].npc.id         = dario
  briefingPrelude[page].npc.isObserved = true
  
  page = page + 1
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Dario"
  briefingPrelude[page].position      = GetPosition("d_end")  
  briefingPrelude[page].text          = "Wir bringen gute Nachrichten, Sir. Der Feind ist geschlagen und die s\195\188dlichen L\195\164ndereien sind wieder sicher!"
  briefingPrelude[page].dialogCamera  = true

  page = page + 1
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Dovbar"
  briefingPrelude[page].position      = GetPosition("dovbar")  
  briefingPrelude[page].text          = "Willkommen daheim meine Helden. Ich habe viel von Euren tapferen Taten im Krieg geh\195\182rt. Ich uns meine Landsm\195\164nner sind Euch in Dank verbunden. Wir werden uns nie geb\195\188hrend revanchieren k\195\182nnen..."
  briefingPrelude[page].dialogCamera  = true

  page = page + 1
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Dovbar"
  briefingPrelude[page].position      = GetPosition("village")  
  briefingPrelude[page].text          = "...Dennoch, bitte akzeptiert diese Burg und das Land darum herum als Zeichen unserer Dankbarkeit. Es ist nicht viel, aber ich bin sicher, Ihr habt gute Verwendung daf\195\188r. Doch habe ich noch eine Sache, um die ich Euch bitten m\195\182chte."
  briefingPrelude[page].dialogCamera  = false

  page = page + 1
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Dovbar"
  briefingPrelude[page].position      = GetPosition("dovbar")  
  briefingPrelude[page].text          = "Seit der krieg begonnen hat, leben die Menschen hier in gro\195\159er Armut. Wir haben alle Rohstoffe und Nahrungsmittel aufgebraucht. Unseren Freunden im Norden geht es noch schlechter. Bitte sammelt einige Rohstoffe und Nahrungsmittel und organisiert einen Transport \195\188ber die Berge. Helias ist bereits dorthin aufgebrochen, um sich die Situation anzusehen."
  briefingPrelude[page].dialogCamera  = true

  page = page + 1
  briefingPrelude[page]              = {}
  briefingPrelude[page].title        = "Pilgrim"
  briefingPrelude[page].position     = GetPosition("p_end")  
  briefingPrelude[page].text         = "Dario, ich und Salim werden vorausgehen, um in der Burg alles f\195\188r Eure Ankunft vorzubereiten. Und ich sollte die Bauern \195\188ber unser Vorhaben informieren."
  briefingPrelude[page].dialogCamera = true
  briefingPrelude[page].quest        = {}
  briefingPrelude[page].quest.id     = 1
  briefingPrelude[page].quest.type   = MAINQUEST_OPEN
  briefingPrelude[page].quest.title  = "Lebensmittellieferung"
  briefingPrelude[page].quest.text   = "Der Krieg hat so viel Leid \195\188ber die Leute gebracht. Nun, da er vor\195\188ber ist, scheint die Sonne wieder in ihre Herzen, doch was zur\195\188ck bleibt ist umso schrecklicher: Armut und der Mangel an t\195\164glich ben\195\182tigten Dingen. Im Norden ist die Situation noch schlimmer. Helias ist bereits aufgbrochen, um dort zu helfen. Ihr m\195\188sste einen Transport organisieren um diesen Menschen zu helfen. @cr @cr Treibt 25 Schafe zusammen, um den Transport zu organisieren. Ihr k\195\182nnt sie am Pferch bekommen, an jedem Zahltag 5. Ihr werdet sie mit Rohstoffen bezahlen m\195\188ssen, aber Pilgrim erkl\195\164rt Euch das genauer. Sprecht mit ihm."

  briefing_p = briefingPrelude[page]
  StartBriefing(briefingPrelude)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingPreludeFinished = function()

  if IsValid(dario) then
    DisableNpcMarker(dario)
  end

  ChangePlayer("pilgrim", 2)
  ChangePlayer("salim", 2)
  ChangePlayer("s1", 2)
  ChangePlayer("s2", 3)
  ChangePlayer("s3", 3)
  Move("pilgrim","p_end2", 10)
  Move("salim","s_end2", 10)
  Move("s1","s1_end2", 10)
  Move("s2","s2_end2", 10)
  Move("s3","s3_end2", 10)

  StartSimpleJob("prepareNPC")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function createGeneralBriefing(_position,_string,_title)

  Explore.Show("briefgen", _position, 1500)

  briefingGeneral  = {}
  briefingGeneral.finished = GeneralBriefingFinished
  briefingGeneral.restoreCamera  =  true

  -- page
  local page = 0

  page = page + 1
  briefingGeneral[page] = {}
  if _title~= nil then
    briefingGeneral[page].title = _title
  end
  briefingGeneral[page].text = _string
  briefingGeneral[page].position = GetPosition(_position)

  StartBriefing(briefingGeneral)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
GeneralBriefingFinished = function()

  Explore.Hide("briefgen")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
PAY = false
SHEEPNO = 0
w_attack = false

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function createBriefingPilgrim()

    BriefingPilgrim = {}
    BriefingPilgrim.finished = BriefingPilgrimFinished
  
    -- page
    local page = 0

    page = page + 1  
    if PAY == false then
      BriefingPilgrim[page]                          = {}
      BriefingPilgrim[page].position                 = GetPosition("p_end2")
      BriefingPilgrim[page].mc                       = {}
      BriefingPilgrim[page].mc.title                 = "Pilgrim"
      BriefingPilgrim[page].mc.text                  = "Willkommen, Freunde. Die Bauern haben zugestimmt, uns an jedem Zahltag 5 Schafe zu verkaufen. Sie verlangen 100 Taler, Holz und Stein, um weitere zu z\195\188chten. Soll ich sie jetzt bezahlen oder sp\195\164ter?"
      BriefingPilgrim[page].mc.firstText             = "Jetzt bezahlen, wir brauchen die Schafe"
      BriefingPilgrim[page].mc.secondText            = "Sp\195\164ter bezahlen, wir haben ja noch Zeit."
      BriefingPilgrim[page].mc.firstSelectedCallback = ThiefMCCallback
      BriefingPilgrim[page].mc.secondSelected        = 5  
      BriefingPilgrimMCPage                          = BriefingPilgrim[page]
    else     
      BriefingPilgrim[page]          = {}
      BriefingPilgrim[page].title    = "Pilgrim"
      BriefingPilgrim[page].position = GetPosition("p_end2")    
      BriefingPilgrim[page].text     = "Ich habe heute schon Schafe gekauft. Die Bauern m\195\188ssen erst neue z\195\188chten. Kommt morgen wieder."
    end
    
    page = 5
    BriefingPilgrim[page]          = {}
    BriefingPilgrim[page].title    = "Pilgrim"
    BriefingPilgrim[page].position = GetPosition("p_end2")    
    BriefingPilgrim[page].text     = "Wir k\195\182nnen die Schafe sp\195\164ter kaufen. Der Tag is noch jung."
    
    page = 7
    BriefingPilgrim[page]          = {}
    BriefingPilgrim[page].title    = "Pilgrim"
    BriefingPilgrim[page].position = GetPosition("sheep_go")    
    BriefingPilgrim[page].text     = "Sind sie nicht nieldich, mein Freund? Ich mag das Schwarze besonders, sie hat mir einen Gefallen getan, HihHihHih!"

    page = 9
    BriefingPilgrim[page]          = {}
    BriefingPilgrim[page].title    = "Pilgrim"
    BriefingPilgrim[page].position = GetPosition("p_end2")    
    BriefingPilgrim[page].text     = "Ich f\195\188rchte, die Bauern werden unserem Preis nicht zustimmen. Wir werden mehr Rohstoffe brauchen. Erinnert Euch: 100 Taler, Holz und Steine!"

    StartBriefing(BriefingPilgrim)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ThiefMCCallback = function()
  
  if GetGold()<100 or GetStone()<100 or GetWood()<100 then
    return 9
  else
    AddGold(-100)
    AddWood(-100)
    AddStone(-100)

    sheeps  =   
    {  
      Entities.CU_Sheep,
      Entities.CU_Sheep2,
      Entities.CU_Sheep3,
    }
    
    points =   
    {  
      "sheep_go",
      "sheep_go1",
      "sheep_go2",
      "sheep_go3",
    }
  
    for i = SHEEPNO+1,SHEEPNO+5,1 do
      local RandomSheep  =  sheeps[Logic.GetRandom(table.getn(sheeps))+1]
      local RandomPoint  =  points[Logic.GetRandom(table.getn(points))+1]
      sheep = CreateEntity(6,RandomSheep,GetPosition("sheep_spw"),"sheep"..i)
      Move("sheep"..i,RandomPoint, 100)
    end
  
    SHEEPNO = SHEEPNO + 5
    local SHEEPN = 0
    for s=1,SHEEPNO,1 do
      if IsAlive("sheep"..s) then
        SHEEPN=SHEEPN + 1
      end
    end

    Message( "@color:150,32,128 IHR HABT DERZEIT "..SHEEPN.."/25 SCHAFE") 
    PAY=true
    return 7
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingPilgrimFinished = function()

  DestroyNPC(NPCpilgrim)
  NPCpilgrim =  {}
  NPCpilgrim.name = "pilgrim"
  NPCpilgrim.callback   =  createBriefingPilgrim
  CreateNPC(NPCpilgrim)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingQ2 = function()

  ChangePlayer("pilgrim",1)
  
  briefingQ2 = {}
  briefingQ2.finished = briefingQ2Finished

  -- page
  local page = 0

  page = page + 1
  briefingQ2[page]               = {}
  briefingQ2[page].title         = "Pilgrim"
  briefingQ2[page].position      = GetPosition("p_end2")  
  briefingQ2[page].text          = "Wir haben nun genug Schafe, Dario. Ich werde sie zusammentreiben, dann k\195\182nnen wir los. Wir sollten einige bewaffnete M\195\164nner mitnehmen, man kann ja nie wissen!"
  briefingQ2[page].dialogCamera  = false
  briefingQ2[page].quest         = {}
  briefingQ2[page].quest.id      = 2
  briefingQ2[page].quest.type    = MAINQUEST_OPEN
  briefingQ2[page].quest.title   = "\195\188ber die Berge"
  briefingQ2[page].quest.text    = "Ihr habt alle Schafe beisammen. Die Kolonne ist bereit, Pilgrim wird sie begleiten. Nehmt alle verf\195\188gbaren Soldaten und Helden mit und eskortiert ihn \195\188ber die Berge. Die Strasse \195\188ber die Berge ist unwegsam und gef\195\164hrlich. Vor allem jetzt, wo der Winter vor der T\195\188r steht. Pilgrim sollte die Hindernisse aus Steinen aus dem Weg r\195\164umen k\195\182nnen. Das Besch\195\188tzen liegt ganz bei Euch. Viel Gl\195\188ck!"

  briefing_Q2 = briefingQ2[page]
  StartBriefing(briefingQ2)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
briefingQ2Finished = function()

  DestroyNPC(NPCpilgrim)
  local x,y = Tools.GetPosition("herd")
  GUI.CreateMinimapMarker(x,y,2)  

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingQ3 = function()

  SetHealth("b_1",30)
  SetHealth("b_2",30)
  createArmyVillage()
  Explore.Show("briefq3","b_1",1500)

  briefingQ3 =   {}
  briefingQ3.finished = briefingQ3Finished

  -- page
  local page = 0

  page = page + 1  
  briefingQ3[page]              = {}
  briefingQ3[page].title        = "Pilgrim"
  briefingQ3[page].position     = GetPosition("spotting")  
  briefingQ3[page].text         = "Hmm, was ist das? Seht nur, Feuer und Rauch!"
  briefingQ3[page].dialogCamera = true

  page = page + 1
  briefingQ3[page]               =  {}
  briefingQ3[page].title         =  "Pilgrim"
  briefingQ3[page].position      =  GetPosition("b_1")  
  briefingQ3[page].text          =  "Oh nein, das Dorf brennt! Irgendjemand greift die armen Bauer an. Lasst uns diesen Taugenichtsen ein paar Manieren beibringen!"
  briefingQ3[page].dialogCamera  =  false
  briefingQ3[page].quest         =  {}
  briefingQ3[page].quest.id      =  3
  briefingQ3[page].quest.type    =  MAINQUEST_OPEN
  briefingQ3[page].quest.title   =  "Angriff auf das Dorf"
  briefingQ3[page].quest.text    =  "Barbaren greifen das Dorf an! Es scheint, als k\195\164met Ihr gerade zur rechten Zeit, um den Bauern zu Hilfe zu eilen. @cr Wenn das geschafft ist, sucht Helias auf und sprecht mit ihm. Er kann Euch sagen, was als n\195\164chstes zu tun ist."

  briefing_Q3 = briefingQ3[page]
  StartBriefing(briefingQ3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
briefingQ3Finished = function()

  StartSimpleJob("briefingAttackEnd")

  SHEEPOK = true
  for s=1,SHEEPNO,1 do
    if IsAlive("sheep"..s) then
      Move("sheep"..s,"herd",500)
    end
  end

  local x,y = Tools.GetPosition("herd")
  GUI.DestroyMinimapPulse(x,y)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
start1stQuest = function()

  Logic.SetShareExplorationWithPlayerFlag(1, 2, 1)
  Logic.SetShareExplorationWithPlayerFlag(1, 6, 1)

  createBriefingPrelude()  
  createArmySpawn()
  
  StartSimpleJob("Win_game")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end1stQuest = function()
  
  ResolveBriefing(briefing_p)
  start2ndQuest()
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
start2ndQuest = function()
  
  createBriefingQ2()
  StartSimpleJob("mountainAttack")
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end2ndQuest = function()

  ResolveBriefing(briefing_Q2)
  start3rdQuest()
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
start3rdQuest = function()

  createBriefingQ3()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end3rdQuest = function()

  ResolveBriefing(briefing_Q3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createPlayer1 = function()

  local playerId = 1
  Tools.GiveResouces(playerId, 1000, 800, 600, 600, 400, 0) 

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createPlayer2 = function()

  --  describe the player structure
  local playerId = 2
  
  Player2     = {}
  Player2.id  = playerId

  --  set up default information
  local description = 
  {    
    serfLimit =  0,
    extracting =  true,
    resources = 
    {
      gold    =  100000,
      clay    =  100000,
      iron    =  100000,
      sulfur  =  100000,
      stone   =  100000,
      wood    =  100000
    },

    refresh = 
    {
      gold        =  5,
      clay        =  5,
      iron        =  5,
      sulfur      =  5,
      stone       =  5,
      wood        =  5,
      updateTime  =  15
    },
  }  
  SetupPlayerAi(Player2.id,description)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createPlayer3 = function()

  --  describe the player structure
  local playerId   = 3
  Player3          = {}
  Player3.id       = playerId

  --  set up default information
  local description = 
  {
    serfLimit    =  5,
    extracting   =  false,
    
    resources = 
    {
      gold        =  100000,
      clay        =  100000,
      iron        =  100000,
      sulfur      =  100000,
      stone       =  100000,
      wood        =  100000
    },

    refresh = 
    {
      gold        =  5,
      clay        =  5,
      iron        =  5,
      sulfur      =  5,
      stone       =  5,
      wood        =  5,
      updateTime  =  15
    },

    rebuild  =  
    {
        delay       =  20,
        randomTime  =  10
      },    
  }
  
  SetupPlayerAi(Player3.id, description)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createPlayer4 = function()

  -- describe the player structure
  local playerId   = 4
  Player4          = {}
  Player4.id       = playerId

  --set up default information
  local description = 
  {
  
    serfLimit    =  0,
    extracting   =  false,
    resources = 
    {
      gold        =  5000,
      clay        =  5000,
      iron        =  5000,
      sulfur      =  5000,
      stone       =  5000,
      wood        =  5000
    },
    
    refresh = 
    {
      gold        =  5,
      clay        =  5,
      iron        =  5,
      sulfur      =  5,
      stone       =  5,
      wood        =  5,
      updateTime  =  15
    },
  }
  
  SetupPlayerAi(Player4.id,description)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createPlayer5 = function()

  --  describe the player structure
  local playerId   = 5  
  Player5         = {}
  Player5.id       = playerId

  --  set up default information
  local description = 
  {
  
    serfLimit    =  0,
    extracting  =  false,
    
    resources = 
    {
      gold        =  5000,
      clay        =  5000,
      iron        =  5000,
      sulfur      =  5000,
      stone       =  5000,
      wood        =  5000
    },

    refresh = 
    {
      gold        =  5,
      clay        =  5,
      iron        =  5,
      sulfur      =  5,
      stone       =  5,
      wood        =  5,
      updateTime  =  15
    },
  }
  
  SetupPlayerAi(Player5.id,description)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SHEEPOK = false

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
prepareNPC = function()

  if IsNear("pilgrim","p_end2",100) then
    InitNPCs()
    StartSimpleJob("Payday")
    StartSimpleJob("WolfAttack")
    return true    
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitNPCs()

  NPCpilgrim =  {}
  NPCpilgrim.name  =  "pilgrim"
  NPCpilgrim.callback  =  createBriefingPilgrim
  CreateNPC(NPCpilgrim)

  NPCsalim =  {}
  NPCsalim.name  =  "salim"
  NPCsalim.callback  =  createBriefingSalim
  CreateNPC(NPCsalim)

  NPCsoldier =  {}
  NPCsoldier.name  =  "s1"
  NPCsoldier.callback   =  createBriefingSoldier
  CreateNPC(NPCsoldier)

  NPCmonk  =  {}
  NPCmonk.name =  "monk"
  NPCmonk.callback =  createBriefingMonk
  CreateNPC(NPCmonk)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingSalim = function()

  createGeneralBriefing("s_end2","Ich habe mit Bruder Carlo gesprochen. Er hat mir ein paar sehr interessante Einblicke in Euren Glauben gegeben. Ich glaube, ich werde noch etwas hierbleiben. Wir sprechen uns sp\195\164ter.","Salim")
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingMonk = function()

  createGeneralBriefing("monk","Guten Morgen, mein Sohn. Ich habe Salim just die kanonischen Unterschiede zwischen unserer Religion und der orientalischen dargelegt. Wenn Ihr Interesse habt, seid Ihr herzlich eingeladen, zu bleiben.","Carlo")
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingSoldier = function()

  createGeneralBriefing("s1_end2","Ich muss ja zugeben, dass es ziemlich langweilig ist, Schafe zu beobachten... aber immer noch besser, als Krieg vor der Haust\195\188r. Und ich jage viele W\195\182lfe. Diese Biester trauen sich jeden Tag n\195\164her heran!","Barlok")
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- resets pay counter 4 briefing Pilgrim-------
function Payday()

  local PlayerID = GUI.GetPlayerID()
  local PaydayTimeLeft = Logic.GetPlayerPaydayTimeLeft(PlayerID)

  if PaydayTimeLeft < 200 then
    PAY=false
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- wolfs attack sheeps when SHEEPNO>19--------
function WolfAttack()

  if SHEEPNO > 19 then

    for j=1,5,1 do
      local wolf = CreateEntity(4,Entities.CU_AggressiveWolf_Grey,GetPosition("w_spwn"),"wolf"..j)
      SetEntityName(wolf1,"wolf"..j)
      Move("wolf"..j,"sheep_go")
    end
    StartSimpleJob("briefingWolfAttack")
    StartSimpleJob("countSheeps")
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function briefingWolfAttack()

  if IsNear("wolf1","sheep_go3",500) or IsNear("wolf2","sheep_go3",500) or IsNear("wolf3","sheep_go3",500) or IsNear("wolf4","sheep_go3",500) then
    createGeneralBriefing("sheep_go3","Achtung! W\195\182lfe greifen unsere Schafe an. Na wartet!","Barlok")
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- alive sheeps after wolf attack-----
function countSheeps()

  ALIVESHEEP=0

  for s=1,SHEEPNO,1 do
    if IsAlive("sheep"..s) then
      ALIVESHEEP = ALIVESHEEP + 1
    end
  end

  if ALIVESHEEP > 24 then
    end1stQuest()
    StartSimpleJob("moveSheep")
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- sheeps follow Pilgrim
function moveSheep()

  if SHEEPOK == true then
    return true
  end

  for s=1,SHEEPNO,1 do
    if IsAlive("sheep"..s) then
      Move("sheep"..s,"pilgrim",350)
    end
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- wolf attack in the mountains
mountainAttack = function()

  if IsNear("pilgrim","w_att",1500) then
    for j=1,5,1 do
      local wolf = CreateEntity(4,Entities.CU_AggressiveWolf_Black,GetPosition("w_spwn1"),"wolf_"..j)
      SetEntityName(wolf1,"wolf_"..j)
      Attack("wolf_"..j,"w_att")
    end
    StartSimpleJob("startBarbarianAttack")
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
startBarbarianAttack = function()

  if IsNear("pilgrim","spotting",270) or IsNear("dario","spotting",270) or IsNear("erec","spotting",270) then
    end2ndQuest()
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
briefingAttackEnd = function()

  if IsDead(ArmyVillage) then

    Logic.AddWeatherElement(2, 5000,0, 5, 5, 10)
    createArmyAttack()

    NPChelias =  {}
    NPChelias.name =  "helias"
    NPChelias.callback  =  createBriefingHelias
    CreateNPC(NPChelias)
    end3rdQuest()
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
COUNTER = 20

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
detectHeroes = function()

  if IsNear("dario","spotting",1000) or IsNear("helias","spotting",1000) or IsNear("erec","spotting",1000) or IsNear("pilgrim","spotting",1000) then  
    createGeneralBriefing("spotting","Es scheint, als h\195\164tte die lawine den schmalen Bergpfad versch\195\188ttet. Jetzt haben wir nur noch eine M\195\182glichkeit: \195\188ber den gefrorenen See!")
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
canionAttack = function()

  if IsNear("dario","h_detect1",3000) or IsNear("erec","h_detect1",3000) or IsNear("pilgrim","h_detect1",3000) or IsNear("helias","h_detect1",3000) then
    Logic.SetDiplomacyState( 3, 4, Diplomacy.Neutral)
    spwnGroup()
    createArmyLake()
    StartSimpleJob("Loose2")
    createGeneralBriefing("canion_attack","Gebt acht, Freunde. Die Banditen greifen an. Schnell zum See, vielleicht trauen sie sich nicht \195\188ber das Eis!")
    return true
  end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
axe = function()

  if IsNear("pilgrim","b_axe",7000) then
    ResolveBriefing(briefing_Q4)
    createBriefingBrakeIce()
    StartJob("breakIce")
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_breakIce = function()

  if IsBriefingActive() then
    return false
  end

  local UnlockTime = 30

  if IsNear("pilgrim", "b_axe", 500) then
    
    -- Start count
    if breakIce == nil then
      
      breakIce = 0
      Message( "@color:150,32,128 Pilgrim bricht die Eisdecke auf...")
      MapLocal_StartCountDown(UnlockTime)
      
    end
  
    breakIce = breakIce + 1    
    return breakIce >= UnlockTime
    
  elseif breakIce ~= nil then

    MapLocal_StopCountDown()
    Message( "@color:150,32,128 Nehmt die Axt wieder und brecht die Eisdecke auf!")
    breakIce = nil
    return false  
      
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_breakIce = function()

  MapLocal_StopCountDown()
  
  Logic.AddWeatherElement(2, 80, 0, 5, 5, 10)
  ResolveBriefing(briefing_Q6)

  local x,y = Tools.GetPosition("b_axe")
  GUI.DestroyMinimapPulse(x,y)
  local x,y = Tools.GetPosition("safe")
  GUI.DestroyMinimapPulse(x,y)

  if ( IsNear("helias","safe",3250) and IsNear("dario","safe",3250) and IsNear("erec","safe",3250) ) 
  or ( IsNear("helias","safe_1",7000) and IsNear("dario","safe_1",7000) and IsNear("erec","safe_1",7000) ) then
    createBriefingIce()
  return true
  else 
    Defeat()
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
IceRun = function()

  if COUNTER > 0 then
    COUNTER = COUNTER - 1
  else
    createBriefingIce()
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Loose = function()

  if Heroes_care==1 then
    if IsDead("helias") or IsDead("dario") or IsDead("pilgrim") or IsDead("erec") then
      Defeat()
      return true
    end
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Win_game= function()

  if IsDead("c1") and IsDead("c2") and IsDead("c3") and IsDead("c4") and IsDead("c5") and IsDead("c6") and IsDead("c7") and IsDead("c8") and IsDead("c9") and IsDead("10") and IsDead("c11") and IsDead("c12") and IsDead("c13") then 
    Victory()
    return true
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Loose2 = function()

  if IsDead("village") then
    Defeat()
    return true
  end

end