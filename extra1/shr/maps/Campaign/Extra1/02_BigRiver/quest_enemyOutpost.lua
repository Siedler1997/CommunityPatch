---------------------------------------------------------------------------------------------
function createQuestEnemyOutpost()

	briefingBandits = {}

	local page = 0

	--	page #1

		page = page + 1

		briefingBandits[page] 				= 	{}
		briefingBandits[page].title			= 	String.Key("briefingBandits[1].title")
		briefingBandits[page].text			=	String.Key("briefingBandits[1].text")
		briefingBandits[page].position 		= 	GetPosition("banditLeader")
		briefingBandits[page].explore        = 	4000
		briefingBandits[page].dialogCamera	=	true

	--	page #2

		page = page + 1

		briefingBandits[page] 				= 	{}
		briefingBandits[page].text			=	String.Key("briefingBandits[2].text")
		briefingBandits[page].position 		= 	GetPosition("enemyHq")
		briefingBandits[page].explore        = 	4000
		briefingBandits[page].dialogCamera	=	true

	--	page #3

		page = page + 1

		briefingBandits[page] 				= 	{}
		briefingBandits[page].text			=	String.Key("briefingBandits[3].text")
		briefingBandits[page].position 		= 	GetPosition("soldier1")
		briefingBandits[page].dialogCamera	=	true

	--	page #4

		page = page + 1

		briefingBandits[page] 				= 	{}
		briefingBandits[page].text			=	String.Key("briefingBandits[4].text")
		briefingBandits[page].position 		= 	GetPosition("banditLeader")
		briefingBandits[page].dialogCamera	=	true

	--  setup table for npc

    	npcBandit 				=	{}
    	npcBandit.name 			=	"banditLeader"
    	npcBandit.briefing		=	briefingBandits

        CreateNPC(npcBandit)

    StartSimpleJob("controlEnemyOutpost")

    end
---------------------------------------------------------------------------------------------
function controlEnemyOutpost()

    for soldier = 1,6,1 do
        if IsDead("soldier"..soldier) then
            createBanditLeaderDialog_Defeat()
            SetHostile(1,6)
            DestroyNPC(npcBandit)
            armyBandit1.control.job = 2
            return true
            end
        end

    if IsDead("enemyHq") then
        createBanditLeaderDialog_Victory()
        DestroyNPC(npcBandit)
        SetFriendly(1,6)
        SetFriendly(1,5)
        SetHostile(6,2)
        SetHostile(5,2)
        SetHostile(6,8)
        SetHostile(5,8)
        for s = 1,6,1 do
            if IsDead("soldier"..s) == false then
                Move("soldier"..s,"banditTower",1000)
                end
           end
        armyBandit1.control.job = 3
        return true
        end

    end


function createBanditLeaderDialog_Defeat()

	briefingBandits_Defeat = {}

	local page = 0

	--	page #1

		page = page + 1

		briefingBandits_Defeat[page] 				= 	{}
		briefingBandits_Defeat[page].title			= 	String.Key("briefingBandits_Defeat[1].title")
		briefingBandits_Defeat[page].text			=	String.Key("briefingBandits_Defeat[1].text")
		briefingBandits_Defeat[page].position 		= 	GetPosition("banditLeader1")
		briefingBandits_Defeat[page].dialogCamera	=	true
		briefingBandits_Defeat[page].explore        =   2000

        StartBriefing(briefingBandits_Defeat)

    end

function createBanditLeaderDialog_Victory()

	briefingBandits_Victory = {}

	local page = 0

	--	page #1

		page = page + 1

		briefingBandits_Victory[page] 				= 	{}
		briefingBandits_Victory[page].title			= 	String.Key("briefingBandits_Victory[1].title")
		briefingBandits_Victory[page].text			=	String.Key("briefingBandits_Victory[1].text")
		briefingBandits_Victory[page].position 		= 	GetPosition("banditLeader2")
		briefingBandits_Victory[page].dialogCamera	=	true
		briefingBandits_Victory[page].explore        =   2000

        StartBriefing(briefingBandits_Victory)

    end