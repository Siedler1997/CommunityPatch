---------------------------------------------------------------------------------------------
function createPriestBriefing()

	briefingPriest = {}

    briefingPriest.finished = priestBriefingFinished

	local page = 0

	--	page #1

		page = page + 1

		briefingPriest[page] 				= 	{}
		briefingPriest[page].title			= 	String.Key("briefingPriest[1].title")
		briefingPriest[page].text			=	String.Key("briefingPriest[1].text")
		briefingPriest[page].position 		= 	GetPosition("npcPriest")
		briefingPriest[page].explore        = 	2000

	--	go!

		StartBriefing(briefingPriest)

	end
---------------------------------------------------------------------------------------------
function priestBriefingFinished()

    Move("npcPriest","npcFriendlyTroops",800)

    timePriestSupport = 60 * 3

    StartSimpleJob("controlPriestSupportQest")

    end
---------------------------------------------------------------------------------------------
function controlPriestSupportQest()

    if timePriestSupport > 0 then
        timePriestSupport = timePriestSupport -1
        return false
        end

    if IsDead("npcPriest") then
        return true
        end

	briefingPriest2 = {}

    briefingPriest2.finished = priestBriefing2Finished

	local page = 0

	--	page #1

		page = page + 1

		briefingPriest2[page] 				= 	{}
		briefingPriest2[page].title			= 	String.Key("briefingPriest2[1].title")
		briefingPriest2[page].text			=	String.Key("briefingPriest2[1].text")
		briefingPriest2[page].position 		= 	GetPosition("supply1")
		briefingPriest2[page].explore       = 	2000

	--  setup table for npc

    	local npc 				=	{}
    	npc.name 				=	"npcPriest"
    	npc.briefing			=	briefingPriest2

        CreateNPC(npc)

    return true

    end
---------------------------------------------------------------------------------------------
function priestBriefing2Finished()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(3, true)	--No enemy, but has to be useful
		ResearchAllMilitaryTechsAddOn(7, true)
		ResearchAllMilitaryTechsAddOn(8, true)
	end

    armySupport = {}

    armySupport.player = 1

	local troopDescription = {
		maxNumberOfSoldiers	= 9,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
		leaderType          = Entities.PU_LeaderHeavyCavalry2
	}

    armySupport.position = GetPosition("supply1")
    CreateTroop(armySupport,troopDescription)
    armySupport.position = GetPosition("supply2")
    CreateTroop(armySupport,troopDescription)
    armySupport.position = GetPosition("supply3")
    CreateTroop(armySupport,troopDescription)
    armySupport.position = GetPosition("supply4")
    CreateTroop(armySupport,troopDescription)

    end