------------------------------------------------------------------------------------------------------------------------------------
function beginChapterOne()

    Report("begin chapter one")

	-- set NPCs to "not visited"
	maverickVisited = 0
	survivorVisited = 0
	militiaVisited = 0

    -- Logic.SetPlayerPaysLeaderFlag(1,0)

    CreateRandomGoldChests()
    CreateRandomChests()
    CreateChestOpener("Dario")
    CreateChestOpener("Drake")
    CreateChestOpener("Yuki")
    StartChestQuest()

	if CP_Difficulty == 0 then
		-- create some troops for the player
		local troopDescription1 = {

			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 9,
			experiencePoints 	= VERYLOW_EXPERIENCE,
			leaderType          = Entities.PU_LeaderSword1,
			position            = GetPosition("troops1")
		}

		local troopDescription2 = {

			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 9,
			experiencePoints 	= VERYLOW_EXPERIENCE,
			leaderType          = Entities.PU_LeaderBow1,
			position            = GetPosition("troops2")
		}

		local army = {}

		local troops1 = CreateTroop(army,troopDescription1)
		local troops2 = CreateTroop(army,troopDescription2)
	end


    -- create some militia
    local troopDescription3 = {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYLOW_EXPERIENCE,
		leaderType          = Entities.PU_LeaderPoleArm1,
		position            = GetPosition("troops3")
	}
	
	local troopDescription4 = {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYLOW_EXPERIENCE,
		leaderType          = Entities.PU_LeaderBow1,
		position            = GetPosition("troops4")
	}
	
    local armyMilitia		= {}
	armyMilitia.player		= 7

    troops3 = CreateTroop(armyMilitia,troopDescription3)
    troops4 = CreateTroop(armyMilitia,troopDescription4)


	-- create a merchant
    local merchant = Logic.GetEntityIDByName("merchantTent")

    Logic.AddMercenaryOffer(merchant,Entities.PU_Thief,2,ResourceType.Gold,200)
    Logic.AddMercenaryOffer(merchant,Entities.PU_Scout,4,ResourceType.Gold,150)

	-- create AI armies
    createArmyDefender()
    createArmyPatrol1()
    createArmyPatrol2()
    createArmyAmbush1()
    createArmyAmbush2()
    
    
    -- create briefings
	StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)
	createBriefingSurvivor()
	createBriefingScout()
	createBriefingMilitia()
	createBriefingMaverick()
	
	-- create victory conditions
	createQuestVictory()
	createQuestDefeat()
	
	-- control patrols
	createAlarmSystem()

end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()

	ResolveBriefing(briefingPrelude[briefingPreludeQuestPage])

	-- beginChapterTwo()

end
------------------------------------------------------------------------------------------------------------------------------------
