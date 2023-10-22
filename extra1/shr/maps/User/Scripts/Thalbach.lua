--------------------------------------------------------------------------------
-- MapName: Thalbach
--
-- Author: Sven Jaginiak
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()
  SetNeutral(1,3)
  SetHostile(1,4)
  SetFriendly(1,2)
  SetNeutral(3,4)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function InitResources()
    -- set some resources
    AddGold  (1000)
    AddSulfur(500)
    AddIron  (600)
    AddWood  (1000)	
    AddStone (800)	
    AddClay  (1000)	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function InitTechnologies()
  ResearchAllMilitaryTechsAddOn(2)
  ResearchAllMilitaryTechsAddOn(3)
  ResearchAllMilitaryTechsAddOn(4, true)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function InitWeatherGfxSets()
	SetupMoorWeatherGfxSet()
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
	if p1color == 2 then
		Display.SetPlayerColorMapping(4, 6)		
  else
		Display.SetPlayerColorMapping(4, 2)		
	end
	if p1color == 3 then
		Display.SetPlayerColorMapping(3, 1)			
	end
	if p1color == 4 then
		Display.SetPlayerColorMapping(2, 9)		
  else
		Display.SetPlayerColorMapping(2, 4)		
	end
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function FirstMapAction()
	LocalMusic.UseSet = DARKMOORMUSIC

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
		MapEditor_SetupDestroyVictoryCondition(3)
	end

	-- Level 0 is deactivated...ignore
	MapEditor_SetupAI(2, 2, 50000, 2, "StTropez", 1, 0)
	MapEditor_SetupAI(3, 3, 60000, 3, "DarkCastle", 3, 5400)
	MapEditor_SetupAI(4, 3, 70000, 0, "Nebelvolk", 3, 0)
	MapEditor_SetupAI(5, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(6, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(7, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(8, 0, 0, 0, "", 0, 0)

  SetNeutral(1,3)
  SetFriendly(1,2)

	-- HQ Defeat Condition
	MapEditor_CreateHQDefeatCondition()

	createBriefingHelias()
	createBriefingBergmann()
	createBriefingSoldat()
	createBriefingKundschafter()
	createPlayer2()
	createPlayer3()
	createPlayer4()
	createArmyone()
	createArmytwo()
	createArmythree()
	createArmyfour()
	createArmyfive()
	createArmysix()
	createArmyseven()
	createArmyallone()
	createArmyalltwo()
	createArmyallthree()
	createArmyreiterone()
	createArmyreitertwo()
	createArmybogenone()
	createArmybogentwo()
	createArmyschwertone()
	createArmyschwerttwo()
	StartSimpleJob("vicone")
	--createBriefingHeliastwo()
	StartSimpleJob("VictoryJob")
	StartSimpleJob("DefeatJob")
	
	local pos = GetPosition("dario")
	Camera.ScrollSetLookAt(pos.X, pos.Y)
  
  StartCountdown(90 * 60, MakeP2Hostile, true)
	
	--CP_ActivateEvilMod(1, 1, 1)
  --Tools.ExploreArea(-1, -1, 900)
end

function MakeP2Hostile()
  SetHostile(1,3)
end

function createBriefingHelias()

  BriefingHelias				= {}
  BriefingHelias.restoreCamera  		= true

 local page = 0

	page = page + 1

	BriefingHelias[page]			= {}
	BriefingHelias[page].title		= "Helias"
	BriefingHelias[page].text		= "Seid gegrüßt alter Freund!"
	BriefingHelias[page].position		= GetPosition("Helias")
	BriefingHelias[page].dialogCamera	= true

	page = page + 1

	BriefingHelias[page]			= {}
	BriefingHelias[page].title		= "Helias"
	BriefingHelias[page].text		= "Dieses Dorf wird bereits seit Jahren vom Nebelvolk bedroht, doch bisher konnte es sich immer selbst sehr gut verteidigen!"
	BriefingHelias[page].position		= GetPosition("Helias")
	
	page = page + 1

	BriefingHelias[page]			= {}
	BriefingHelias[page].title		= "Helias"
	BriefingHelias[page].text		= "Aber vor Kurzem ist der einst mächtige Anführer der Dorfbewohner im Kampf gestorben!"
	BriefingHelias[page].position		= GetPosition("Helias")

	page = page + 1

	BriefingHelias[page]			= {}
	BriefingHelias[page].title		= "Helias"
	BriefingHelias[page].text		= "Bitte helft uns und zerstört das Hauptquartier des Nebelvolkes!"
	BriefingHelias[page].position		= GetPosition("Nebelvolk")
	BriefingHelias[page].explore		= BRIEFING_EXPLORATION_RANGE
	BriefingHelias[page].marker		= ANIMATED_MARKER

	page = page + 1

	BriefingHelias[page]			= {}
	BriefingHelias[page].title		= "Helias"
	BriefingHelias[page].text		= "Kommt wieder zu mir, sobald ihr diese Bedrohung beseitig habt!"
	BriefingHelias[page].position		= GetPosition("Helias")

	local npcHelias				= {}
	npcHelias.name				= "Helias"
	npcHelias.briefing			= BriefingHelias

	CreateNPC(npcHelias)

end

function createBriefingBergmann()

  BriefingBergmann				= {}
  BriefingBergmann.restoreCamera  		= true

 local page = 0

	page = page + 1

	BriefingBergmann[page]			= {}
	BriefingBergmann[page].title		= "Bergmann"
	BriefingBergmann[page].text		= "Glück auf edler Herr!"
	BriefingBergmann[page].position		= GetPosition("Bergmann")
	BriefingBergmann[page].dialogCamera	= true

	page = page + 1

	BriefingBergmann[page]			= {}
	BriefingBergmann[page].title		= "Bergmann"
	BriefingBergmann[page].text		= "Diese Brücke wurde schon vor vielen Jahren gesprengt, denn auf der anderen Seite Hausen die roten Teufel, der Schrecken aller Bergmänner!"
	BriefingBergmann[page].position		= GetPosition("Bergmann")
	BriefingBergmann[page].explore		= BRIEFING_EXPLORATION_RANGE
	BriefingBergmann[page].marker		= ANIMATED_MARKER
	
	page = page + 1

	BriefingBergmann[page]			= {}
	BriefingBergmann[page].title		= "Bergmann"
	BriefingBergmann[page].text		= "Seht euch vor, falls ihr vorhabt, das Ufer zu überqueren!"
	BriefingBergmann[page].position		= GetPosition("Bergmann")

	local npcBergmann			= {}
	npcBergmann.name			= "Bergmann"
	npcBergmann.briefing			= BriefingBergmann

	CreateNPC(npcBergmann)

end

function createBriefingSoldat()

  BriefingSoldat				= {}
  BriefingSoldat.restoreCamera  		= true

 local page = 0

	page = page + 1

	BriefingSoldat[page]			= {}
	BriefingSoldat[page].title		= "Soldat"
	BriefingSoldat[page].text		= "Gut, das ich euch antreffe Herr!"
	BriefingSoldat[page].position		= GetPosition("Soldat")
	BriefingSoldat[page].dialogCamera	= true

	page = page + 1

	BriefingSoldat[page]			= {}
	BriefingSoldat[page].title		= "Soldat"
	BriefingSoldat[page].text		= "Ich warne euch eindringlich, betretet dieses Tal nicht! Dort wartet der Tod!"
	BriefingSoldat[page].position		= GetPosition("Soldat")
	BriefingSoldat[page].dialogCamera	= false
	
	page = page + 1

	local npcSoldat				= {}
	npcSoldat.name				= "Soldat"
	npcSoldat.briefing			= BriefingSoldat

	CreateNPC(npcSoldat)

end 


function createBriefingKundschafter()

  BriefingKundschafter					= {}
  BriefingKundschafter.restoreCamera  			= true

  local page = 0

	page = page + 1

	BriefingKundschafter[page]			= {}
	BriefingKundschafter[page].title		= "Kundschafter"
	BriefingKundschafter[page].text			= "Was verschlägt euch denn in diese Gegend?"
	BriefingKundschafter[page].position		= GetPosition("Kundschafter")
	BriefingKundschafter[page].dialogCamera		= true

	page = page + 1

	BriefingKundschafter[page]			= {}
	BriefingKundschafter[page].title		= "Kundschafter"
	BriefingKundschafter[page].text			= "Naja, wir sollten nicht zuviel Zeit verschwenden, ich konnte auf der anderen Seite des Flusses reiche Rohstoffvorkommen ausmachen!"
	BriefingKundschafter[page].position		= GetPosition("Kundschafter")
	BriefingKundschafter[page].dialogCamera		= false
	
	local npcKundschafter				= {}
	npcKundschafter.name				= "Kundschafter"
	npcKundschafter.briefing			= BriefingKundschafter

	CreateNPC(npcKundschafter)

end


function createPlayer2()

  player2		= {}
  player2.id		= 2
  
  SetPlayerName(2, "St. Tropez")

  local description	= {serflimit = 10}

  SetupPlayerAi(player2.id,description)

end

function createPlayer3()

  player3		= {}
  player3.id		= 3
  
  SetPlayerName(3, "Avignon")

  local description	= {serflimit = 15}

  SetupPlayerAi(player3.id,description)

end

function createPlayer4()

  player4		= {}
  player4.id		= 4

  SetPlayerName(4, "Nebelvolk")

  local description	= {serflimit = 0}

  SetupPlayerAi(player4.id, description)

end


function createArmyone()

  armyone		= {}

  armyone.player	= 4
  armyone.id		= 1
  armyone.strength	= 3
  armyone.position	= GetPosition("Armyone")
  armyone.rodelenght	= 60000

  SetupArmy(armyone)

  local troopDescription	= {
    leaderType	= Entities.CU_Evil_LeaderBearman1,
    maxNumberOfSoldiers	= 16,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armyone,troopDescription)
  EnlargeArmy(armyone,troopDescription)
  EnlargeArmy(armyone,troopDescription)

  Defend(armyone)

end

function createArmytwo()

  armytwo		= {}

  armytwo.player	= 4
  armytwo.id		= 2
  armytwo.strength	= 3
  armytwo.position	= GetPosition("Armytwo")
  armytwo.rodelenght	= 60000

  SetupArmy(armytwo)

  local troopDescription	= {
    leaderType	= Entities.CU_Evil_LeaderBearman1,
    maxNumberOfSoldiers	= 16,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armytwo,troopDescription)
  EnlargeArmy(armytwo,troopDescription)
  EnlargeArmy(armytwo,troopDescription)

  Defend(armytwo)

end

function createArmythree()

  armythree		= {}

  armythree.player	= 4
  armythree.id		= 3
  armythree.strength	= 3
  armythree.position	= GetPosition("Armythree")
  armythree.rodelenght	= 60000

  SetupArmy(armythree)

  local troopDescription	= {
    leaderType	= Entities.CU_Evil_LeaderSkirmisher1,
    maxNumberOfSoldiers	= 16,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armythree,troopDescription)
  EnlargeArmy(armythree,troopDescription)
  EnlargeArmy(armythree,troopDescription)

  Defend(armythree)

end

function createArmyfour()

  armyfour		= {}

  armyfour.player	= 4
  armyfour.id		= 4
  armyfour.strength	= 3
  armyfour.position	= GetPosition("Armyfour")
  armyfour.rodelenght	= 60000

  SetupArmy(armyfour)

  local troopDescription	= {
    leaderType	= Entities.CU_Evil_LeaderBearman1,
    maxNumberOfSoldiers	= 16,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armyfour,troopDescription)
  EnlargeArmy(armyfour,troopDescription)
  EnlargeArmy(armyfour,troopDescription)

  Defend(armyfour)

end

function createArmyfive()

  armyfive		= {}

  armyfive.player	= 4
  armyfive.id		= 5
  armyfive.strength	= 3
  armyfive.position	= GetPosition("Armyfive")
  armyfive.rodelenght	= 60000

  SetupArmy(armyfive)

  local troopDescription	= {
    leaderType	= Entities.CU_Evil_LeaderBearman1,
    maxNumberOfSoldiers	= 16,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE,
  }

  EnlargeArmy(armyfive,troopDescription)
  EnlargeArmy(armyfive,troopDescription)
  EnlargeArmy(armyfive,troopDescription)

  Defend(armyfive)

end

function createArmysix()

  armysix		= {}

  armysix.player	= 4
  armysix.id		= 6
  armysix.strength	= 3
  armysix.position	= GetPosition("Armysix")
  armysix.rodelenght	= 60000

  SetupArmy(armysix)

  local troopDescription	= {
    leaderType	= Entities.CU_Evil_LeaderBearman1,
    maxNumberOfSoldiers	= 16,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armysix,troopDescription)
  EnlargeArmy(armysix,troopDescription)
  EnlargeArmy(armysix,troopDescription)

  Defend(armysix)

end

function createArmyseven()

  armyseven		= {}

  armyseven.player	= 4
  armyseven.id		= 7
  armyseven.strength	= 3
  armyseven.position	= GetPosition("Armyseven")
  armyseven.rodelenght	= 60000

  SetupArmy(armyseven)

  local troopDescription	= {
    leaderType	= Entities.CU_Evil_LeaderSkirmisher1,
    maxNumberOfSoldiers	= 16,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armyseven,troopDescription)
  EnlargeArmy(armyseven,troopDescription)
  EnlargeArmy(armyseven,troopDescription)

  Defend(armyseven)

end

function createArmyallone()

  armyallone		= {}

  armyallone.player	= 3
  armyallone.id		= 8
  armyallone.strength	= 3
  armyallone.position	= GetPosition("Armyall")
  armyallone.rodelenght	= 60000

  SetupArmy(armyallone)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderBow4,
    maxNumberOfSoldiers	= 8,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armyallone,troopDescription)
  EnlargeArmy(armyallone,troopDescription)
  EnlargeArmy(armyallone,troopDescription)

  Defend(armyallone)

end

function createArmyalltwo()

  armyalltwo		= {}

  armyalltwo.player	= 3
  armyalltwo.id		= 9
  armyalltwo.strength	= 3
  armyalltwo.position	= GetPosition("Armyall")
  armyalltwo.rodelenght	= 60000

  SetupArmy(armyalltwo)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderPoleArm4,
    maxNumberOfSoldiers	= 8,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armyalltwo,troopDescription)
  EnlargeArmy(armyalltwo,troopDescription)
  EnlargeArmy(armyalltwo,troopDescription)

  Defend(armyallone)

end

function createArmyallthree()

  armyallthree		= {}

  armyallthree.player	= 3
  armyallthree.id	= 10
  armyallthree.strength	= 3
  armyallthree.position	= GetPosition("Armyall")
  armyallthree.rodelenght	= 60000

  SetupArmy(armyallthree)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderHeavyCavalry2,
    maxNumberOfSoldiers	= 3,
    minNumberOfSoldiers	= 3,
    experiencePoints	= VERYHIGH_EXPERIENCE,
  }

  EnlargeArmy(armyallthree,troopDescription)
  EnlargeArmy(armyallthree,troopDescription)
  EnlargeArmy(armyallthree,troopDescription)

  Defend(armyallthree)

end

function createArmyreiterone()

  armyreiterone			= {}

  armyreiterone.player		= 3
  armyreiterone.id		= 11
  armyreiterone.strength	= 3
  armyreiterone.position		= GetPosition("Reiterone")
  armyreiterone.rodelenght	= 60000

  SetupArmy(armyreiterone)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderHeavyCavalry2,
    maxNumberOfSoldiers	= 3,
    minNumberOfSoldiers	= 3,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armyreiterone,troopDescription)
  EnlargeArmy(armyreiterone,troopDescription)
  EnlargeArmy(armyreiterone,troopDescription)

  Defend(armyreiterone)

end

function createArmyreitertwo()

  armyreitertwo			= {}

  armyreitertwo.player		= 3
  armyreitertwo.id		= 12
  armyreitertwo.strength	= 3
  armyreitertwo.position		= GetPosition("Reitertwo")
  armyreitertwo.rodelenght	= 60000

  SetupArmy(armyreitertwo)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderHeavyCavalry2,
    maxNumberOfSoldiers	= 3,
    minNumberOfSoldiers	= 3,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

  EnlargeArmy(armyreitertwo,troopDescription)
  EnlargeArmy(armyreitertwo,troopDescription)
  EnlargeArmy(armyreitertwo,troopDescription)

  Defend(armyreitertwo)

end

function createArmybogenone()

  armybogenone			= {}
	
  armybogenone.player		= 3
  armybogenone.id		= 13
  armybogenone.strength		= 3
  armybogenone.position		= GetPosition("Bogenone")
  armybogenone.rodelenght	= 60000

  SetupArmy(armybogenone)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderBow4,
    maxNumberOfSoldiers	= 8,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armybogenone,troopDescription)
  EnlargeArmy(armybogenone,troopDescription)
  EnlargeArmy(armybogenone,troopDescription)

  Defend(armybogenone)

end

function createArmybogentwo()

  armybogentwo			= {}
	
  armybogentwo.player		= 3
  armybogentwo.id		= 14
  armybogentwo.strength		= 3
  armybogentwo.position		= GetPosition("Bogentwo")
  armybogentwo.rodelenght	= 60000

  SetupArmy(armybogentwo)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderBow4,
    maxNumberOfSoldiers	= 8,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armybogentwo,troopDescription)
  EnlargeArmy(armybogentwo,troopDescription)
  EnlargeArmy(armybogentwo,troopDescription)

  Defend(armybogentwo)

end

function createArmyschwertone()

  armySchwertone		= {}

  armySchwertone.player		= 3
  armySchwertone.id		= 15
  armySchwertone.strength	= 3
  armySchwertone.position	= GetPosition("Schwertone")
  armySchwertone.rodelenght	= 60000

  SetupArmy(armySchwertone)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderSword4,
    maxNumberOfSoldiers	= 8,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armySchwertone,troopDescription)
  EnlargeArmy(armySchwertone,troopDescription)
  EnlargeArmy(armySchwertone,troopDescription)

  Defend(armySchwertone)

end

function createArmyschwerttwo()

  armySchwerttwo		= {}

  armySchwerttwo.player	= 3
  armySchwerttwo.id		= 16
  armySchwerttwo.strength	= 3
  armySchwerttwo.position	= GetPosition("Schwerttwo")
  armySchwerttwo.rodelenght	= 60000

  SetupArmy(armySchwerttwo)

  local troopDescription	= {
    leaderType	= Entities.PU_LeaderSword4,
    maxNumberOfSoldiers	= 8,
    minNumberOfSoldiers	= 4,
    experiencePoints	= VERYHIGH_EXPERIENCE
  }

  EnlargeArmy(armySchwerttwo,troopDescription)
  EnlargeArmy(armySchwerttwo,troopDescription)
  EnlargeArmy(armySchwerttwo,troopDescription)

  Defend(armySchwerttwo)

end


function vicone()
  if IsDead("Nebelvolk") then
    createBriefingHeliastwo()
    return true
  end
end

function createBriefingHeliastwo()

  BriefingHeliastwo				= {}
  BriefingHeliastwo.restoreCamera  		= true
  BriefingHeliastwo.finished       		= BriefingHeliastwoFinished

 local page = 0

	page = page + 1

	BriefingHeliastwo[page]			= {}
	BriefingHeliastwo[page].title		= "Helias"
	BriefingHeliastwo[page].text		= "Ich danke euch Dario! Ich wusste, das ich auf unsere alte Freundschaft bauen kann!"
	BriefingHeliastwo[page].position	= GetPosition("Helias")
	BriefingHeliastwo[page].dialogCamera	= true

	page = page + 1

	BriefingHeliastwo[page]			= {}
	BriefingHeliastwo[page].title		= "Helias"
	BriefingHeliastwo[page].text		= "Allerdings hat dieses Dorf ein weiteres Problem: Wir werden von der großen Stadt Avignon tyranniesiert und zu Frondiensten gezwungen!"
	BriefingHeliastwo[page].position	= GetPosition("DarkCastle")
	BriefingHeliastwo[page].explore		= BRIEFING_EXPLORATION_RANGE
	BriefingHeliastwo[page].marker		= ANIMATED_MARKER
	
	page = page + 1

	BriefingHeliastwo[page]			= {}
	BriefingHeliastwo[page].title		= "Helias"
	BriefingHeliastwo[page].text		= "Biite helft uns und Vernichtet die schwarze Festung von Avignon, damit sich dieses Dorf wieder zu einer blühenden Metropole entwickeln kann!"
	BriefingHeliastwo[page].position	= GetPosition("Helias")

	local npcHelias				= {}
	npcHelias.name				= "Helias"
	npcHelias.briefing			= BriefingHeliastwo

	CreateNPC(npcHelias)

end

function BriefingHeliastwoFinished()
  SetHostile(2,3)
end


function VictoryJob()
  if IsDead("DarkCastle") then
	  Victory()
    return true
  end
end

function DefeatJob()
  if IsDead("StTropez") then
	  Defeat()
    return true
  end
end

-- Quest data
MapEditor_QuestTitle				= "Befreit das Dorf von allen Gefahren"
MapEditor_QuestDescription 	= "Eure Aufgabe ist es, das kleine Dorf, welches im gefährlichen Nebeltal liegt, von der Bedrohung des Nebelvolkes zu befreien und es anschleißend aus der Regentschaft der Stadt Avignon zu erlösen. Da die Stadt Avignon selbst ein Interesse an der Vertreibung des Nebelvolkes besitzt, gewährt es euch einen Waffenstillstand von 1,5 Stunden, bevor es euch als Bedrohung ansieht." 