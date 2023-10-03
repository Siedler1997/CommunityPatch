--------------------------------------------------------------------------------
-- MapName: Volcano
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

  Logic.SetDiplomacyState(1, 2, Diplomacy.Hostile)
  Logic.SetDiplomacyState(1, 3, Diplomacy.Friendly)
  Logic.SetDiplomacyState(1, 4, Diplomacy.Friendly)
  Logic.SetDiplomacyState(1, 5, Diplomacy.Neutral)
  Logic.SetDiplomacyState(1, 7, Diplomacy.Hostile)
  Logic.SetDiplomacyState(1, 8, Diplomacy.Neutral)
  Logic.SetDiplomacyState(3, 7, Diplomacy.Hostile)

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
  ResearchAllMilitaryTechs(7)
  
	ResearchAnimalTechs(7)
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

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

  Logic.SetupGfxSet(1)

  Logic.AddWeatherElement(1, 800, 1, 1, 5, 10)  -- summer

end
  
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
  -- set player colors
  local p1color = GetPlayerPreferredColor()
  Display.SetPlayerColorMapping(1, p1color)
  Display.SetPlayerColorMapping(3, 15)
  if p1color == 2 then
    Display.SetPlayerColorMapping(2, 6)		
  end
  Display.SetPlayerColorMapping(7, ROBBERS_COLOR)
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

  -- chest handling
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

  -- exploring
  Logic.SetShareExplorationWithPlayerFlag(1, 5, 1)

  -- resources
  AddGold(0)
  AddWood(0)
  AddClay(0)
  AddStone(0)
  AddIron(0)
  AddSulfur(0)

  -- Variables
  StopTheDamnBrief = 0
  TheyHaveABase = 0
  StopShacking = 0
  GoldGiven = 0
  IronGiven = 0
  WoodGiven = 0
  ClayGiven = 0
  StoneGiven = 0
  SulfurGiven = 0
  IsMine1Built = 0
  IsMine2Built = 0
  IsMine3Built = 0
  VarChapter4 = 0
  VarChapter5 = 0
  VarChapter6 = 0
	
  ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_DarkTree)
  ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_DarkTree

  -- Set Player Name
  SetPlayerName(2, "Barbaren")
  SetPlayerName(4, "Erec")

  -- Set Music-Set
	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
  LocalMusic.UseSet = EUROPEMUSIC

  -- start quest
  start1stChapter()
  
	RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
       
  --Tools.ExploreArea(-1, -1, 900)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingHQCreation = function()

  briefingHQCreation = {}  
  briefingHQCreation.finished = BriefingHQCreationFinished

  -- page
  local page = 0

  page = page + 1
  briefingHQCreation[page]           = {}
  briefingHQCreation[page].title     = "Salim"
  briefingHQCreation[page].text      = "Ich denke, dies hier w\195\164re ein guter Platz f\195\188r unsere Basis."
  briefingHQCreation[page].position  = GetPosition("Salim")

  page = page + 1
  briefingHQCreation[page] = {}
  briefingHQCreation[page].title     = "Dario"
  briefingHQCreation[page].text      = "Aber wie errichten wir eine Burg?"
  briefingHQCreation[page].position  = GetPosition("Dario")

  page = page + 1
  briefingHQCreation[page]           = {}
  briefingHQCreation[page].title     = "Helias"
  briefingHQCreation[page].text      = "Ich habe keine Ahnung..."
  briefingHQCreation[page].position  = GetPosition("Helias")

  page = page + 1
  briefingHQCreation[page]           = {}
  briefingHQCreation[page].title     = "Ari"
  briefingHQCreation[page].text      = "Ich bin mit Werkzeugen v\195\182llig ungeschickt! Also, was machen wir?"
  briefingHQCreation[page].position  = GetPosition("Ari")

  page = page + 1
  briefingHQCreation[page]           = {}
  briefingHQCreation[page].title     = "Salim"
  briefingHQCreation[page].text      = "Ich werde uns retten! Ich kenne einen magischen Trick, der uns helfen wird."
  briefingHQCreation[page].position  = GetPosition("Salim")

  page = page + 1
  briefingHQCreation[page]           = {}
  briefingHQCreation[page].title     = "Salim"
  briefingHQCreation[page].text      = "Augen zu! Sonst funktioniert es nicht.."
  briefingHQCreation[page].position  = GetPosition("Salim")

  page = page +1
  briefingHQCreation[page]           = {}
  briefingHQCreation[page].title     = "Salim"
  briefingHQCreation[page].text      = "Hokus Pokus..."
  briefingHQCreation[page].position  = GetPosition("HQSpawn")
  briefingHQCreation[page].explore   = 2000

  StartBriefing(briefingHQCreation)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingHQCreationFinished = function()
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingHQPlaced = function()

  briefingHQPlaced = {}  
  briefingHQPlaced.finished = BriefingHQPlacedFinished

  -- page
  local page = 0

  page = page + 1
  briefingHQPlaced[page]           = {}
  briefingHQPlaced[page].title     = "Salim"
  briefingHQPlaced[page].text      = "Und da ist es!"
  briefingHQPlaced[page].position  = GetPosition("HQSpawn")

  page = page + 1
  briefingHQPlaced[page]           = {}
  briefingHQPlaced[page].title     = "Dario"
  briefingHQPlaced[page].text      = "Woooow...Du bist wirklich ein Zauberer... habe ich bisher gar nicht gewu\195\159t."
  briefingHQPlaced[page].position  = GetPosition("Dario")

  page = page + 1
  briefingHQPlaced[page]           = {}
  briefingHQPlaced[page].title     = "Salim"
  briefingHQPlaced[page].text      = "Wollt Ihr sehen, was ich aus Euch machen kann? Hi hi hi...verwandeln wir Pilgrim in ein s\195\188\195\159es kleines H\195\164schen! Hi hi hi..."
  briefingHQPlaced[page].position  = GetPosition("Salim")

  page = page + 1
  briefingHQPlaced[page]           = {}
  briefingHQPlaced[page].title     = "Pilgrim"
  briefingHQPlaced[page].text      = "Soll ich Ihr eine Bombe in die Hose schieben? Hi hi hi..."
  briefingHQPlaced[page].position  = GetPosition("Pilgrim")

  page = page + 1
  briefingHQPlaced[page]           = {}
  briefingHQPlaced[page].title     = "Ari"
  briefingHQPlaced[page].text      = "Kommt Jungs... ihr seid erwachsen.!"
  briefingHQPlaced[page].position  = GetPosition("Ari")

  StartBriefing(briefingHQPlaced)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingHQPlacedFinished = function()

  end1stChapter()
  TheyHaveABase=1
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingInsaneNPC = function()

  briefingInsaneNPC = {}  
  briefingInsaneNPC.finished = BriefingInsaneNPCFinished

  -- page
  local page = 0

  page = page + 1
  briefingInsaneNPC[page]           = {}
  briefingInsaneNPC[page].title     = "Einer der Helden"
  briefingInsaneNPC[page].text      = "He, alter Mann. Wisst ihr wo wir..."
  briefingInsaneNPC[page].position  = GetPosition("InsaneNPC")
  briefingInsaneNPC[page].explore   = 1500

  page = page + 1
  briefingInsaneNPC[page]           = {}
  briefingInsaneNPC[page].title     = "alter Mann"
  briefingInsaneNPC[page].text      = "Ohh... meine Ohren... wir sch\195\182n und jung... als ich noch in Eurem Alter war, habe ich gegen Drachen gek\195\164mpft..."
  briefingInsaneNPC[page].position  = GetPosition("InsaneNPC")

  page = page + 1
  briefingInsaneNPC[page]           = {}
  briefingInsaneNPC[page].title     = "alter Mann"
  briefingInsaneNPC[page].text      = "In der N\195\164he ist eine Br\195\188cke. Alles, was Ihr braucht, findet ihr auf der anderen Seite."
  briefingInsaneNPC[page].position  = GetPosition("FakeBridgeTarget")
  briefingInsaneNPC[page].explore   = 1000

  StartBriefing(briefingInsaneNPC)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingInsaneNPCFinished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingMakeRain = function()

  briefingMakeRain = {}  
  briefingMakeRain.finished =  BriefingMakeRainFinished

  --  page
  local page = 0

  page = page + 1
  briefingMakeRain[page]             = {}
  briefingMakeRain[page].title       = "Erec"
  briefingMakeRain[page].text        = "Endlich haben wir die Pl\195\164ne f\195\188r das Wetterkraftwerk. Baut bitte ein Kraftwerk, damit es regnen lassen k\195\182nnen. Das sollte den Vulkan abk\195\188hlen!"
  briefingMakeRain[page].position    = GetPosition("Erec")
  
  briefingMakeRain[page].quest        = {}
  briefingMakeRain[page].quest.id     = 7
  briefingMakeRain[page].quest.type   = MAINQUEST_OPEN
  briefingMakeRain[page].quest.title  = "Stoppt den Vulkan"
  briefingMakeRain[page].quest.text   = "Errichtet ein Wetterkraftwerk und lasst es regnen." 
  
  briefingRainMade = briefingMakeRain[page]
  StartBriefing(briefingMakeRain)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingMakeRainFinished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingMines = function()

  briefingMines =  {}  
  briefingMines.finished = BriefingMinesFinished

  --  page
  local page = 0

  page = page + 1
  briefingMines[page]           = {}
  briefingMines[page].title     = "Arbeitsloser Bergmann"
  briefingMines[page].text      = "Ich habe in den Schwefelminen gearbeitet."
  briefingMines[page].position  = GetPosition("NPCQuest3")

  page = page + 1
  briefingMines[page]           = {}
  briefingMines[page].title     = "Arbeitsloser Bergmann"
  briefingMines[page].text      = "Aber als der Vulkan ausbrach, wurde die Mine mit Lava \195\188berschwemmt."
  briefingMines[page].position  = GetPosition("SulfTarget")
  briefingMines[page].explore   = 2000
  briefingMines[page].marker    = ANIMATED_MARKER

  page = page + 1
  briefingMines[page]           = {}
  briefingMines[page].title     = "Arbeitsloser Bergmann"
  briefingMines[page].text      = "Seitdem habe ich keine Arbeit mehr. K\195\182nnt ihr die Sch\195\164chte wieder freilegen und neue Minen errichten? Jeder hier wird Euch daf\195\188r danken!"
  briefingMines[page].position  = GetPosition("NPCQuest3")

  briefingMines[page].quest       = {}
  briefingMines[page].quest.id    = 3
  briefingMines[page].quest.type  = MAINQUEST_OPEN
  briefingMines[page].quest.title = "Die Schwefelminen"
  briefingMines[page].quest.text  = "Legt drei Sch\195\164chte frei und errichtet darauf Schwefelminen." 

  briefingMinesBuilt = briefingMines[page]
  StartBriefing(briefingMines)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
BriefingMinesFinished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingNPC1 = function()

  briefingNPC1 = {}  
  briefingNPC1.finished = BriefingNPC1Finished

  --  page
  local page = 0

  page = page + 1
  briefingNPC1[page]           = {}
  briefingNPC1[page].title     = "Leuchtturm W\195\164chter"
  briefingNPC1[page].text      = "Es ist schwierig, in diesen Zeiten, auch nur das n\195\182tigste an Essen zu finden. K\195\182nnt Ihr einen Bauernhof f\195\188r mich errichten? Daf\195\188r w\195\164re ich Euch sehr verbunden und k\195\182nnte den Leuchtturm wieder in Betrieb nehmen."
  briefingNPC1[page].position  = GetPosition("LightMan1")

  briefingNPC1[page].quest        = {}
  briefingNPC1[page].quest.id     = 4
  briefingNPC1[page].quest.type   = MAINQUEST_OPEN
  briefingNPC1[page].quest.title  = "Errichtet einen Bauernhof"
  briefingNPC1[page].quest.text   = "Errichtet einen Bauernhof in dem Gebiet, welche wei\195\159 markiert ist." 

  briefingFarmBuilt = briefingNPC1[page]
  StartBriefing(briefingNPC1)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingNPC1Finished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingNPC2 = function()

  briefingNPC2 = {}  
  briefingNPC2.finished = BriefingNPC2Finished

  --  page
  local page = 0

  page = page + 1
  briefingNPC2[page]           = {}
  briefingNPC2[page].title     = "Leuchtturm W\195\164chter"
  briefingNPC2[page].text      = "Ich kann den Leuchtturm nicht \195\182ffnen, weil ich den ganzen Tag friere... k\195\182nnt Ihr mir ein Wohnhaus bauen?"
  briefingNPC2[page].position  = GetPosition("LightMan2")

  briefingNPC2[page].quest        = {}
  briefingNPC2[page].quest.id     = 5
  briefingNPC2[page].quest.type   = MAINQUEST_OPEN
  briefingNPC2[page].quest.title  = "Errichtet ein Wohnhaus"
  briefingNPC2[page].quest.text   = "Errichtet an der Stelle, welche rot markiert ist, ein Wohnhaus." 

  briefingHouseBuilt = briefingNPC2[page]
  StartBriefing(briefingNPC2)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingNPC2Finished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingNPC3 = function()

  briefingNPC3 = {}  
  briefingNPC3.finished =  BriefingNPC3Finished

  --  page
  local page = 0

  page = page + 1
  briefingNPC3[page]           = {}
  briefingNPC3[page].title     = "Leuchtturm W\195\164chter"
  briefingNPC3[page].text      = "Die Reisenden sind m\195\188de, wenn sie \195\188ber die See kommen und w\195\188rden gern in einer Taverne einkehren k\195\182nnen. W\195\164ret Ihr so nett und baut eine Taverne f\195\188r uns? Unter den jetztigen Umst\195\164nden kann ich unm\195\182glich arbeiten."
  briefingNPC3[page].position  = GetPosition("LightMan3")

  briefingNPC3[page].quest        = {}
  briefingNPC3[page].quest.id     = 6
  briefingNPC3[page].quest.type   = MAINQUEST_OPEN
  briefingNPC3[page].quest.title  = "Errichtet eine Taverne."
  briefingNPC3[page].quest.text   = "Errichtet an der blau markierten Stelle eine Taverne." 

  briefingTavernBuilt = briefingNPC3[page]
  StartBriefing(briefingNPC3)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
BriefingNPC3Finished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingPrelude = function()

  briefingPrelude = {}  
  briefingPrelude.finished = BriefingPreludeFinished

  -- page
  local page = 0

  page = page + 1
  briefingPrelude[page]           = {}
  briefingPrelude[page].title     = "Erz\195\164hler"
  briefingPrelude[page].text      = "Der Vulkanausbruch dauert nun schon einige Tage an und es sieht nicht so aus, als w\195\188rde sich das bald \195\164ndern."
  briefingPrelude[page].position  = GetPosition("VolcanoTarget")
  briefingPrelude[page].explore   = 3500

  page = page + 1
  briefingPrelude[page]           = {}
  briefingPrelude[page].title     = "Erz\195\164hler"
  briefingPrelude[page].text      = "Er hat bereits viel Schaden angerichtet und Erec sitzt auf einer Insel fest."
  briefingPrelude[page].position  = GetPosition("Erec")
  briefingPrelude[page].explore   = 2000

  page = page + 1  
  briefingPrelude[page]           = {}
  briefingPrelude[page].title     = "Erz\195\164hler"
  briefingPrelude[page].text      = "Als er begann auszubrechen, bebte die ganze Erde und es h\195\182rt einfach nicht auf. Unsere Freunde sind in dem betroffenen Gebiet angekommen um sich die Situation genauer an zu sehen."
  briefingPrelude[page].position  = GetPosition("StartTarget")

  page = page + 1
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Dario"
  briefingPrelude[page].text          = "Wir m\195\188ssen das stoppen, irgendwie..."
  briefingPrelude[page].position      = GetPosition("Dario")
  briefingPrelude[page].dialogCamera  = true

  page = page + 1  
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Ari"
  briefingPrelude[page].text          = "In der Tat. Blo\195\159 wie?"
  briefingPrelude[page].position      = GetPosition("Ari")
  briefingPrelude[page].dialogCamera  = true

  page = page + 1
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Drake"
  briefingPrelude[page].text          = "Ich wei\195\159 es nicht, aber wir sollte zuerst ein mal zu Erec gehen. Vielleicht wei\195\159 er Rat."
  briefingPrelude[page].position      = GetPosition("Drake")
  briefingPrelude[page].dialogCamera  = true

  page = page + 1  
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Salim"
  briefingPrelude[page].text          = "Das d\195\188rfte nicht so einfach werden. Vielleicht sollten wir erst einmal eine Basis errichten. Irgendwo an einem geeigneten Ort."
  briefingPrelude[page].position      = GetPosition("Salim")
  briefingPrelude[page].dialogCamera  = true

  page = page +1  
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Pilgrim"
  briefingPrelude[page].text          = "Fein, auf gehts!"
  briefingPrelude[page].position      = GetPosition("Pilgrim")
  briefingPrelude[page].dialogCamera  = true

  page = page +1  
  briefingPrelude[page]               = {}
  briefingPrelude[page].title         = "Helias"
  briefingPrelude[page].text          = "Gehen wir."
  briefingPrelude[page].position      = GetPosition("Helias")
  briefingPrelude[page].dialogCamera  = true
  briefingPrelude[page].quest         = {}
  briefingPrelude[page].quest.id      = 1
  briefingPrelude[page].quest.type    = MAINQUEST_OPEN
  briefingPrelude[page].quest.title   = "Errichtet eine Basis"
  briefingPrelude[page].quest.text    = "Findet einen geeigneten Platz und baut dort eine Basis auf." 

  briefingYouGotHQ = briefingPrelude[page]
  StartBriefing(briefingPrelude)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
BriefingPreludeFinished = function()

  StartJob("TimeControler")
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingSaneNPC = function()

  briefingSaneNPC = {}  
  briefingSaneNPC.finished = BriefingSaneNPCFinished

  -- page
  local page = 0

  page = page + 1  
  briefingSaneNPC[page]           = {}
  briefingSaneNPC[page].title     = "Einer der Helden"
  briefingSaneNPC[page].text      = "Ist hier irgendwo eine Br\195\188cke? Ein alter Mann erz\195\164hlte uns dies."
  briefingSaneNPC[page].position  = GetPosition("SaneNPC")
  briefingSaneNPC[page].explore   = 2000

  page = page + 1
  briefingSaneNPC[page]           = {}
  briefingSaneNPC[page].title     = "Fischer"
  briefingSaneNPC[page].text      = "Der Vulkanausbruch hat die Br\195\188cke zerst\195\182rt. Der alte Mann hat... Schwierigkeiten mit seinem Ged\195\164chtnis..."
  briefingSaneNPC[page].position  = GetPosition("SaneNPC")

  page = page + 1
  briefingSaneNPC[page]           = {}
  briefingSaneNPC[page].title     = "Fischer"
  briefingSaneNPC[page].text      = "Der einzige Weg f\195\188hrt durch die Berge, aber nehmt Euch vor den W\195\182lfen in acht!"
  briefingSaneNPC[page].position  = GetPosition("MountainsTarget")
  briefingSaneNPC[page].explore   = 1000

  StartBriefing(briefingSaneNPC)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingSaneNPCFinished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingStartQ2 = function()

  briefingStartQ2 =  {}  
  briefingStartQ2.finished = BriefingStartQ2Finished

  -- page
  local page = 0

  page = page + 1  
  briefingStartQ2[page]           = {}
  briefingStartQ2[page].title     = "Erz\195\164hler"
  briefingStartQ2[page].text      = "Ihr solltet mit diesem Mann sprechen."
  briefingStartQ2[page].position  = GetPosition("NPCQuest2")
  briefingStartQ2[page].explore   = 1500
  briefingStartQ2[page].marker    = ANIMATED_MARKER

  StartBriefing(briefingStartQ2)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingStartQ2Finished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingSulfurErec = function()

  briefingSulfurErec = {}  
  briefingSulfurErec.finished =  BriefingSulfurErecFinished

  -- page
  local page = 0

  page = page + 1
  briefingSulfurErec[page]          = {}
  briefingSulfurErec[page].title    = "Bauer"
  briefingSulfurErec[page].text     = "Mir ist es gestern gelungen, durch den Flu\195\159 zu schwimmen und hier her zu gelangen. Ich habe geh\195\182rt, dass Ritter Erec den Vulkan durch Regen stoppen will. Aber er ben\195\182tigt 15.000 Schwefel, um den Ingenieur zu bezahlen, der die Pl\195\164ne f\195\188r ein Wetterkraftwerk hat."
  briefingSulfurErec[page].position = GetPosition("NPCQuest2")

  page = page + 1
  briefingSulfurErec[page]          = {}
  briefingSulfurErec[page].title    = "Einer der Helden"
  briefingSulfurErec[page].text     = "...15.000 Schwefel sagst du..."
  briefingSulfurErec[page].position = GetPosition("NPCQuest2")

  page = page +1
  briefingSulfurErec[page]          = {}
  briefingSulfurErec[page].title    = "Einer der Helden"
  briefingSulfurErec[page].text     = "Wir werden alles tun, um diese Menge bereitstellen zu k\195\182nnen."
  briefingSulfurErec[page].position = GetPosition("NPCQuest2")

  briefingSulfurErec[page].quest        = {}
  briefingSulfurErec[page].quest.id     = 2
  briefingSulfurErec[page].quest.type   = MAINQUEST_OPEN
  briefingSulfurErec[page].quest.title  = "Schwefellieferung"
  briefingSulfurErec[page].quest.text   = "Besorgt 15.000 Schwefel f\195\188r Erec. Dann sprecht mit ihm." 

  briefingMoneyPaid = briefingSulfurErec[page]
  StartBriefing(briefingSulfurErec)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingSulfurErecFinished = function()

  -- destroy minimap marker
  local x, y = Tools.GetPosition("NPCQuest2")
  GUI.DestroyMinimapPulse(x, y)
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createBriefingVulcan = function()

  briefingVulcan = {}  
  briefingVulcan.finished = BriefingVulcanFinished

  -- page
  local page = 0

  page = page + 1
  briefingVulcan[page]           = {}
  briefingVulcan[page].title     = "Vagabund"
  briefingVulcan[page].text      = "Dieser Vulkan bringt mich noch um! Ich glaube, ich werde mich hier bald aus dem Staub machen. Nach jedem Erdbeben muss ich mein Haus wieder aufbauen! Ich sollte mir eine andere Stelle f\195\188r mein Haus suchen...!"
  briefingVulcan[page].position  = GetPosition("Vulcan")
  briefingVulcan[page].explore   = 2000

  StartBriefing(briefingVulcan)
    
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BriefingVulcanFinished = function()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function start1stChapter()

  StartChapter1()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function end1stChapter()
  
  ResolveBriefing(briefingYouGotHQ)
  StopTheDamnBrief=1
  start2ndChapter()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function start2ndChapter()

  StartChapter2()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function end2ndChapter()

  ResolveBriefing(briefingMoneyPaid)
  start7thChapter()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function start3rdChapter()

  StartChapter3()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function end3rdChapter()
  
  ResolveBriefing(briefingMinesBuilt)

  -- destroy minimap marker
  local x, y = Tools.GetPosition("SulfTarget")
  GUI.DestroyMinimapPulse(x, y)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function start4thChapter()

  StartChapter4()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function end4thChapter()
  
  ResolveBriefing(briefingFarmBuilt)
  VarChapter4 = 2
  ReplaceEntity("Lighth1", Entities.CB_LighthouseActivated)
  ChangePlayer("Lighth1", 5)
  
  -- destroy minimap marker
  local x, y = Tools.GetPosition("FarmSpot")
  GUI.DestroyMinimapPulse(x, y)

  pos1 = GetPosition("FarmSpot")
  Unknown1,Var1 = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Farm1, pos1.X, pos1.Y, 8000, 1)
  ChangePlayer(Var1, 5)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function start5thChapter()

  StartChapter5()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function end5thChapter()
  
  ResolveBriefing(briefingHouseBuilt)
  VarChapter5 = 2
  ReplaceEntity("Lighth2", Entities.CB_LighthouseActivated)
  ChangePlayer("Lighth2", 5)

  -- destroy minimap marker
  local x, y = Tools.GetPosition("HouseSpot")
  GUI.DestroyMinimapPulse(x, y)

  pos2 = GetPosition("HouseSpot")
  Unknown2,Var2 = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Residence1, pos2.X, pos2.Y, 8000, 1)
  ChangePlayer(Var2, 5)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function start6thChapter()

  StartChapter6()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function end6thChapter()
  
  ResolveBriefing(briefingTavernBuilt)
  VarChapter6 = 2
  ReplaceEntity("Lighth3", Entities.CB_LighthouseActivated)
  ChangePlayer("Lighth3", 5)
  
  -- destroy minimap marker
  local x, y = Tools.GetPosition("TavernSpot")
  GUI.DestroyMinimapPulse(x, y)

  pos3 = GetPosition("TavernSpot")
  Unknown3,Var3 = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tavern1, pos3.X, pos3.Y, 8000, 1)
  ChangePlayer(Var3, 5)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function start7thChapter()

  StartChapter7()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function end7thChapter()
  
  delayVictory = 0
  ResolveBriefing(briefingRainMade)
  StartJob("CanIWin")

end

----------------------------------------------------------------------------------------------
--
--  JOB: "CanIWin"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_CanIWin = function()

  return VarChapter4~=1 and VarChapter5~=1 and VarChapter6~=1

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_CanIWin = function()

  if delayVictory > 5 then
    Victory()
    return true
  else
    delayVictory = delayVictory + 1
    return false
  end

  return true

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function CaravanFollowers()

    CreateEntity(3, Entities.PU_Travelling_Salesman, GetPosition("MMSpawn1"), "Follower1")
    CreateEntity(3, Entities.PU_Travelling_Salesman, GetPosition("MMSpawn2"), "Follower2")
    CreateEntity(3, Entities.PU_Travelling_Salesman, GetPosition("MMSpawn3"), "Follower3")
    CreateEntity(3, Entities.PU_Travelling_Salesman, GetPosition("MMSpawn4"), "Follower4")
    CreateEntity(3, Entities.PU_Travelling_Salesman, GetPosition("MMSpawn5"), "Follower5")
    CreateEntity(3, Entities.PU_Travelling_Salesman, GetPosition("MMSpawn6"), "Follower6")

    MakeInvulnerable("Follower1")
    MakeInvulnerable("Follower2")
    MakeInvulnerable("Follower3")
    MakeInvulnerable("Follower4")
    MakeInvulnerable("Follower5")
    MakeInvulnerable("Follower6")

    StartJob("AreTheyThereYet")

end

----------------------------------------------------------------------------------------------
--
--  JOB: "TimeControler"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
QUESTFollow_DELAY = 5
QUESTFollow_COUNTER  =  QUESTFollow_DELAY  

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_TimeControler = function()

  if QUESTFollow_COUNTER > 0 and TheyHaveABase==0 then
    QUESTFollow_COUNTER = QUESTFollow_COUNTER - 1
    return false
  elseif QUESTFollow_COUNTER==0 then 
    return true
  end
  
end
    
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_TimeControler = function()

  ControlMMSupport()

  QUESTFollow_DELAY = 5
  QUESTFollow_COUNTER = QUESTFollow_DELAY

  StartJob("TimeControler")

  return true

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ControlMMSupport()

  if IsAlive("Follower1") then

    pos1 = GetPosition("Pilgrim")
    pos1.X = pos1.X-700
    pos1.Y = pos1.Y-700

    Move("Follower1",pos1)

  end

  if IsAlive("Follower2") then

    pos2 = GetPosition("Ari")
    pos2.X = pos2.X-700
    pos2.Y = pos2.Y-700

    Move("Follower2",pos2)

  end

  if IsAlive("Follower3") then

    pos3 = GetPosition("Drake")
    pos3.X = pos3.X-700
    pos3.Y = pos3.Y-700

    Move("Follower3",pos3)

  end

  if IsAlive("Follower4") then

    pos4 = GetPosition("Dario")
    pos4.X = pos4.X-700
    pos4.Y = pos4.Y-700

    Move("Follower4",pos4)

  end

  if IsAlive("Follower5") then

    pos5 = GetPosition("Helias")
    pos5.X = pos5.X-700
    pos5.Y = pos5.Y-700

    Move("Follower5",pos5)

  end

  if IsAlive("Follower6") then

    pos6 = GetPosition("Salim")
    pos6.X = pos6.X-700
    pos6.Y = pos6.Y-700

    Move("Follower6",pos6)

  end

end

----------------------------------------------------------------------------------------------
--
--  JOB: "AreTheyThereYet"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_AreTheyThereYet = function()

  return TheyHaveABase==1 and StopShacking==0

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_AreTheyThereYet = function()

  Move("Follower1","HQSpawn")
  Move("Follower2","HQSpawn")
  Move("Follower3","HQSpawn")
  Move("Follower4","HQSpawn")
  Move("Follower5","HQSpawn")
  Move("Follower6","HQSpawn")

  StartJob("RewardGold")
  StartJob("RewardWood")
  StartJob("RewardSulfur")
  StartJob("RewardStone")
  StartJob("RewardClay")
  StartJob("RewardIron")

  TheSerfs()

end

----------------------------------------------------------------------------------------------
--
--  JOB: "RewardGold"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_RewardGold = function()
               
  return IsNear("Follower1", "HQSpawn", 1500) and GoldGiven==0

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_RewardGold = function()

  AddGold(1000)
  ReplaceEntity("Follower1",Entities.PU_Serf)
  GoldGiven=1
  return true

end

----------------------------------------------------------------------------------------------
--
--  JOB: "RewardWood"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_RewardWood = function()
                
  return IsNear("Follower2", "HQSpawn", 1500) and WoodGiven==0

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_RewardWood = function()

  AddWood(1000)
  ReplaceEntity("Follower2",Entities.PU_Serf)
  WoodGiven=1
  return true

end

----------------------------------------------------------------------------------------------
--
--  JOB: "RewardSulfur"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_RewardSulfur = function()
                
  return IsNear("Follower3","HQSpawn",1500) and SulfurGiven==0

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_RewardSulfur = function()

  AddSulfur(2000)
  ReplaceEntity("Follower3",Entities.PU_Serf)
  SulfurGiven = 1
  return true

end

----------------------------------------------------------------------------------------------
--
--  JOB: "RewardStone"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_RewardStone = function()
               
  return IsNear("Follower4","HQSpawn",1500) and StoneGiven==0

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_RewardStone = function()

  AddStone(1000)
  ReplaceEntity("Follower4",Entities.PU_Serf)
  StoneGiven = 1
  return true

end

----------------------------------------------------------------------------------------------
--
--  JOB: "RewardClay"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_RewardClay = function()
               
  return IsNear("Follower5","HQSpawn",1500) and ClayGiven==0

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_RewardClay = function()

  AddClay(1500)
  ReplaceEntity("Follower5",Entities.PU_Serf)
  ClayGiven = 1
  return true

end

----------------------------------------------------------------------------------------------
--
--  JOB: "RewardIron"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_RewardIron = function()
             
  return IsNear("Follower6", "HQSpawn", 1500) and IronGiven==0

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_RewardIron = function()

  AddIron(1000)
  ReplaceEntity("Follower6", Entities.PU_Serf)
  IronGiven = 1
  return true
  
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
TheSerfs = function()

  local quest = {}  
  quest.EntityTypes =  { {Entities.PU_Serf,6} }
  quest.Callback = TheSerfAreThere
  SetupEstablish(quest)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
TheSerfAreThere = function()

  StopShacking = 1  
  return true

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function StartChapter1()

  createBriefingPrelude()
  NPCInsane()
  StartJob("IsSalimThereYet")
  CaravanFollowers()
  SpawnArmy()

end

----------------------------------------------------------------------------------------------
--
--  JOB: "SecondNPCCreation"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_SecondNPCCreation = function()

  return IsBriefingActive() == false

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_SecondNPCCreation = function()

  NPCSane()
  return true

end

----------------------------------------------------------------------------------------------
--
--  JOB: "IsSalimThereYet"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_IsSalimThereYet = function()

  return IsNear("Salim", "DetectHQSpawn",2500) or IsNear("Pilgrim", "DetectHQSpawn",2500) or IsNear("Dario", "DetectHQSpawn",2500) or IsNear("Drake", "DetectHQSpawn",2500) or IsNear("Helias", "DetectHQSpawn",2500) or IsNear("Ari", "DetectHQSpawn",2500)

end
    
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_IsSalimThereYet = function()

  createBriefingHQCreation()
  if StopTheDamnBrief==0 then

    local pos = GetPosition("HQSpawn")
    CreateHQ = Tools.CreateGroup(1, Entities.PB_Headquarters1, 0, pos.X, pos.Y, 0)
    SetEntityName(CreateHQ, "player1")

  end

  createBriefingHQPlaced()
  return true

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCInsane()

  -- setup table for npc
  local NPCInsane  =  {}
  NPCInsane.name = "InsaneNPC"
  NPCInsane.callback =  NPC1Spoken
          
  -- create npc
  CreateNPC(NPCInsane)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPC1Spoken()

  local pos = GetPosition("SecondNPCSpawn")
  SecNPC = Tools.CreateGroup(8, Entities.CU_Hermit, 0, pos.X, pos.Y, 180)
  SetEntityName(SecNPC, "SaneNPC")

  createBriefingInsaneNPC()
  StartJob("SecondNPCCreation")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCSane()

  -- setup table for npc
  local NPCSane  =  {}
  NPCSane.name = "SaneNPC"
  NPCSane.callback =  NPC2Spoken
          
  -- create npc
  CreateNPC(NPCSane)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPC2Spoken()

  DestroyEntity("PizdaMatii1")
  createBriefingSaneNPC()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function SpawnArmy()

  local pos = GetPosition("B1Spawn1")
  Guard11 = AI.Entity_CreateFormation(2, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0)
  SetEntityName(Guard11, "Guard11")

  local pos = GetPosition("B1Spawn2")
  Guard12 = AI.Entity_CreateFormation(2, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos.X,pos.Y,0,0,2,0)
  SetEntityName(Guard12, "Guard12")

  local pos = GetPosition("B2Spawn1")
  Guard21 = AI.Entity_CreateFormation(2, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0)
  SetEntityName(Guard21, "Guard21")

  local pos = GetPosition("B2Spawn2")
  Guard22 = AI.Entity_CreateFormation(2, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos.X,pos.Y,0,0,2,0)
  SetEntityName(Guard22, "Guard22")

  local pos = GetPosition("B3Spawn1")
  Guard31 = AI.Entity_CreateFormation(2, Entities.CU_Evil_LeaderBearman1,0,16,pos.X,pos.Y,0,0,2,0)
  SetEntityName(Guard31, "Guard31")

  local pos = GetPosition("B3Spawn2")
  Guard32 = AI.Entity_CreateFormation(2, Entities.CU_Evil_LeaderSkirmisher1,0,16,pos.X,pos.Y,0,0,2,0)
  SetEntityName(Guard32, "Guard32")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function StartChapter2()

  StartJob("BeginQ2")
  NPC2ndQuest()
  NPC3rdQuest()
  NPC1LightMan()
  NPC2LightMan()
  NPC3LightMan()
  NPCVulcan()

end

----------------------------------------------------------------------------------------------
--
--  JOB: "BeginQ2"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_BeginQ2 = function()

  return IsBriefingActive() == false

end
    
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_BeginQ2 = function()

  TheyHaveABase=1
  createBriefingStartQ2()
  return true

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPC2ndQuest()

  -- setup table for npc
  local NPC2ndQuest =  {}
  NPC2ndQuest.name =  "NPCQuest2"
  NPC2ndQuest.callback =  SpokenNPCQ2
          
  -- create npc
  CreateNPC(NPC2ndQuest)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function SpokenNPCQ2()

  createBriefingSulfurErec()
  NPCErec()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCVulcan()

  -- setup table for npc
  local NPCVulcan  =  {}
  NPCVulcan.name = "Vulcan"
  NPCVulcan.callback =  createBriefingVulcan
          
  -- create npc
  CreateNPC(NPCVulcan)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCErec()

  -- setup table for npc
  local NPCErec  =  {}
  NPCErec.name = "Erec"
  NPCErec.callback =  NPCErecSelect
          
  -- create npc
  CreateNPC(NPCErec)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
NPCErecSelect = function()

  NPCSelect3Briefing = {}
  NPCSelect3Briefing.restoreCamera = true
  NPCSelect3Briefing.finished  =  NPCSelect3BriefingFinished

  --  page
  page = 0
  
  page = page + 1
  NPCSelect3Briefing[page]                     = {}
  NPCSelect3Briefing[page].mc                  =  {}
  NPCSelect3Briefing[page].mc.title            = "Erec"
  NPCSelect3Briefing[page].mc.text            =  "Der Schwefel wird uns retten! Damit k\195\182nnen wir die Pl\195\164ne f\195\188r das Wetterkraftwerk bezahlen."
  NPCSelect3Briefing[page].mc.firstText        =  "15.000 Schwefel \195\188bergeben."
  NPCSelect3Briefing[page].mc.secondText      =  "Sp\195\164ter bezahlen."
  NPCSelect3Briefing[page].mc.firstSelected    =  3
  NPCSelect3Briefing[page].mc.secondSelected  =  5
  NPCSelect3BriefingMCPage =  NPCSelect3Briefing[page]

  page = 3
  NPCSelect3Briefing[page]         =  {}
  NPCSelect3Briefing[page].title  =  "Erec"
  NPCSelect3Briefing[page].text    =  "Habt Dank, meine Freunde!"

  page = 5
  NPCSelect3Briefing[page]         =   {}
  NPCSelect3Briefing[page].title  =  "Erec"
  NPCSelect3Briefing[page].text    =  "Dann behaltet es doch f\195\188r Euch selbst..."
    
  StartBriefing(NPCSelect3Briefing)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCSelect3BriefingFinished()

  if GetSelectedBriefingMCButton(NPCSelect3BriefingMCPage) == 1 then
    Option311()
  else
    Option321()
  end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Option311 = function()

  local Player1Money = GetSulfur()
  if Player1Money >= 15000 then

    AddSulfur(-15000)
    end2ndChapter()
          Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Weathermachine, 2)
          Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_PowerPlant, 2)
          Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast, 2)
          Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather, 2)
  
  else

    Message("@color:248,197,18 Ihr habt nicht genug Schwefel!") 
    NPCErec()

  end
  
  return true

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Option321 = function()

  NPCErec()
  return true

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPC3rdQuest()

  -- setup table for npc
  local NPC3rdQuest  =  {}
  NPC3rdQuest.name = "NPCQuest3"
  NPC3rdQuest.callback =  NPCSpoken3
          
  -- create npc
  CreateNPC(NPC3rdQuest)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCSpoken3()

  start3rdChapter()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPC1LightMan()

  -- setup table for npc
  local NPC1LightMan = {}
  NPC1LightMan.name =  "LightMan1"
  NPC1LightMan.callback =  NPCLSpoken1
          
  -- create npc
  CreateNPC(NPC1LightMan)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCLSpoken1()

  start4thChapter()
  VarChapter4 = 1

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPC2LightMan()

  -- setup table for npc
  local NPC2LightMan = {}
  NPC2LightMan.name =  "LightMan2"
  NPC2LightMan.callback  =  NPCLSpoken2
          
  -- create npc
  CreateNPC(NPC2LightMan)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCLSpoken2()

  start5thChapter()
  VarChapter5 = 1

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPC3LightMan()

  -- setup table for npc
  local NPC3LightMan = {}
  NPC3LightMan.name =  "LightMan3"
  NPC3LightMan.callback  =  NPCLSpoken3
          
  -- create npc
  CreateNPC(NPC3LightMan)
       
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function NPCLSpoken3()

  start6thChapter()
  VarChapter6 = 1

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function StartChapter3()

  createBriefingMines()
  BuildMines1()
  BuildMines2()
  BuildMines3()
  DestroyEntity("Rock1")
  DestroyEntity("Rock2")
  StartJob("MinesReady")

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BuildMines1()

  local Quest = {}
  Quest.AreaPos = "SMine1"
  Quest.AreaSize = 1000
  Quest.EntityTypes = { { Entities.PB_SulfurMine1, 1}}
  Quest.Callback = Mine1Built
  SetupEstablish(Quest)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Mine1Built()

  IsMine1Built=1

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BuildMines2()

  local Quest = {}
  Quest.AreaPos = "SMine2"
  Quest.AreaSize = 1000
  Quest.EntityTypes = { { Entities.PB_SulfurMine1, 1}}
  Quest.Callback = Mine2Built
  SetupEstablish(Quest)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Mine2Built()

  IsMine2Built=1

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BuildMines3()

  local Quest = {}
  Quest.AreaPos = "SMine3"
  Quest.AreaSize = 1000
  Quest.EntityTypes = { { Entities.PB_SulfurMine1, 1}}
  Quest.Callback = Mine3Built
  SetupEstablish(Quest)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Mine3Built()

  IsMine3Built=1

end

----------------------------------------------------------------------------------------------
--
--  JOB: "MinesReady"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_MinesReady = function()

  return IsMine1Built==1 and IsMine2Built==1 and IsMine3Built==1

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_MinesReady = function()

  end3rdChapter()
  return true
  
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function StartChapter4()

  createBriefingNPC1()
  BuildFarm()

  -- create minimap marker
  local x, y = Tools.GetPosition("FarmSpot")
  GUI.CreateMinimapPulse(x, y, 2)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BuildFarm()

  local Quest = {}
  Quest.AreaPos = "FarmSpot"
  Quest.AreaSize = 8000
  Quest.EntityTypes = { { Entities.PB_Farm1, 1}}
  Quest.Callback = FarmBuilt
  SetupEstablish(Quest)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function FarmBuilt()

  end4thChapter()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function StartChapter5()

  createBriefingNPC2()
  BuildHouse()

-- create minimap marker
  local x, y = Tools.GetPosition("HouseSpot")
  GUI.CreateMinimapPulse(x, y, 3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BuildHouse()

  local Quest = {}
  Quest.AreaPos = "HouseSpot"
  Quest.AreaSize = 8000
  Quest.EntityTypes = { { Entities.PB_Residence1, 1}}
  Quest.Callback = HouseBuilt
  SetupEstablish(Quest)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function HouseBuilt()

  end5thChapter()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function StartChapter6()

  createBriefingNPC3()
  BuildTavern()

  -- create minimap marker
  local x, y = Tools.GetPosition("TavernSpot")
  GUI.CreateMinimapPulse(x, y, 1)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BuildTavern()

  local Quest = {}
  Quest.AreaPos = "TavernSpot"
  Quest.AreaSize = 8000
  Quest.EntityTypes = { { Entities.PB_Tavern1, 1}}
  Quest.Callback = TavernBuilt
  SetupEstablish(Quest)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function TavernBuilt()

  end6thChapter()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function StartChapter7()

  createBriefingMakeRain()
  createQuestSnow()

end

----------------------------------------------------------------------------------------------
--
--  JOB: "IsThereRain"
--
----------------------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Condition_IsThereRain = function()

  return GfxState == 2

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Action_IsThereRain = function()

  end7thChapter()
  return true

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
createQuestSnow = function()

  -- Create weather change quest
  Trigger.RequestTrigger( Events.LOGIC_EVENT_WEATHER_STATE_CHANGED, nil, "SnowQuest", 1)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SnowQuest = function()

  -- Is new state snow
  if Event.GetNewWeatherState() == 2 then
    
    end7thChapter()
    
    -- Quest done
    return true
    
  end

end