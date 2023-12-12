---------------------------------------------------------------------------------------------
function createPreludeBriefing()

	preludeBriefing = {}
	preludeBriefing.finished =	PreludeBriefingFinished

	local page = 0

	--	page #1

		page = page + 1

		preludeBriefing[page] 				= 	{}
		preludeBriefing[page].title			= 	String.Key("preludeBriefing[1].title")
		preludeBriefing[page].text			=	String.Key("preludeBriefing[1].text")
		preludeBriefing[page].position 		= 	GetPosition("player1")

	--	page #2

		page = page + 1

		preludeBriefing[page] 				= 	{}
		preludeBriefing[page].title			= 	String.Key("preludeBriefing[1].title")
		preludeBriefing[page].text			=	String.Key("preludeBriefing[2].text")

	--	page #3

		page = page + 1

		preludeBriefing[page] 				= 	{}
		preludeBriefing[page].text			=	String.Key("preludeBriefing[3].text")
		preludeBriefing[page].position 		= 	GetPosition("briefing2")

	--	page #4

		page = page + 1

		preludeBriefing[page] 				= 	{}
		preludeBriefing[page].text			=	String.Key("preludeBriefing[4].text")
		preludeBriefing[page].position 		= 	GetPosition("briefing1")

	--	page #5

		page = page + 1

		preludeBriefing[page] 				= 	{}
		preludeBriefing[page].text			=	String.Key("preludeBriefing[5].text")
		preludeBriefing[page].position 		= 	GetPosition("player2")
		preludeBriefing[page].explore       =   4000

	--	page #6

		page = page + 1

		preludeBriefing[page] 				= 	{}
		preludeBriefing[page].title			= 	String.Key("preludeBriefing[6].title")
		preludeBriefing[page].text			=	String.Key("preludeBriefing[6].text")
        preludeBriefing[page].position 		= 	GetPosition("player2")
		preludeBriefing[page].marker		=	STATIC_MARKER

		preludeBriefing[page].quest			=	{}
		preludeBriefing[page].quest.id		=	1
		preludeBriefing[page].quest.type	=	MAINQUEST_OPEN
		preludeBriefing[page].quest.title	=	String.MainKey.."preludeBriefing[6].quest.title"
		preludeBriefing[page].quest.text	=	String.MainKey.."preludeBriefing[6].quest.text"

		preludeBriefingDestroyCastlePage    =	page

	--	page #7

		page = page + 1

		preludeBriefing[page] 				= 	{}
		preludeBriefing[page].title			= 	String.Key("preludeBriefing[1].title")
		preludeBriefing[page].text			=	String.Key("preludeBriefing[7].text")
		preludeBriefing[page].position 		= 	GetPosition("Dario")

	--	go!

		StartBriefing(preludeBriefing)

		createTemplarNpc()

	end
---------------------------------------------------------------------------------------------
function PreludeBriefingFinished()
    createAssaultArmies()
end

function destroyPreludeBriefing()

    ResolveBriefing(preludeBriefing[preludeBriefingDestroyCastlePage])

    end
---------------------------------------------------------------------------------------------
function createTemplarNpc()

	-- Create briefing for npc

	TemplarBriefing = {}
	TemplarBriefing.restoreCamera = true

	TemplarBriefing.finished =	TemplarBriefingFinished

	page = 0

	--	page #1

		page = page + 1

		TemplarBriefing[page] 				= 	{}

		TemplarBriefing[page].title			= 	String.Key("TemplarBriefing[1].title")
		TemplarBriefing[page].text			=	String.Key("TemplarBriefing[1].text")

		TemplarBriefing[page].position		=	GetPosition("npcFriendlyTroops")
		TemplarBriefing[page].dialogCamera	=	true

	--	page #2

		page = page + 1

		TemplarBriefing[page] 				    = 	{}
		TemplarBriefing[page].mc                =	{}
        	TemplarBriefing[page].mc.title			= 	String.Key("TemplarBriefing[2].mc.title")
		TemplarBriefing[page].mc.text			=	String.Key("TemplarBriefing[2].mc.text")
		TemplarBriefing[page].mc.firstText		=	String.Key("TemplarBriefing[2].mc.firstText")
		TemplarBriefing[page].mc.secondText		=	String.Key("TemplarBriefing[2].mc.secondText")
		TemplarBriefing[page].mc.firstSelected	=	3
		TemplarBriefing[page].mc.secondSelected	=	5

		TemplarBriefingPage = page

	--	page #3

		page = page + 1

		TemplarBriefing[page] 				= 	{}

		TemplarBriefing[page].text			=	String.Key("TemplarBriefing[3].text")

	--	page #5

		page = page + 2

		TemplarBriefing[page] 				= 	{}

		TemplarBriefing[page].text			=	String.Key("TemplarBriefing[4].text")

	--  setup table for npc

    	local npc 				=	{}
    	npc.name 				=	"npcFriendlyTroops"
    	npc.briefing			=	TemplarBriefing

        CreateNPC(npc)

    end

function TemplarBriefingFinished()

    if GetSelectedBriefingMCButton(TemplarBriefing[TemplarBriefingPage]) == 1 then

        armyFriendly1.control.defendPosition = GetPosition("assaultOneOccupy")
        armyFriendly2.control.defendPosition = GetPosition("assaultOneOccupy")

    else

        armyFriendly1.control.defendPosition = GetPosition("assaultTwoOccupy")
        armyFriendly2.control.defendPosition = GetPosition("assaultTwoOccupy")

        end

    end