---------------------------------------------------------------------------------------------
function createBriefingLab()

	local npcLabId = CreateEntity(4,Entities.CU_EngineerIdle,GetPosition("npcLabStart"),"npcLab")

	Move("npcLab","npcLabTarget")

	briefingLab = {}

	briefingLab.restoreCamera = true

	local page = 0

	--	page #1

		page = page + 1

		briefingLab[page] 				= 	{}
		briefingLab[page].title		    = 	String.Key("briefingLab[1].title")
		briefingLab[page].text			=	String.Key("briefingLab[1].text")
		briefingLab[page].position 	    = 	GetPosition("npcLabTarget")
		briefingLab[page].dialogCamera	=	true
		briefingLab[page].explore       =   4000

		briefingLab[page].quest			=	{}
		briefingLab[page].quest.id		=	3
		briefingLab[page].quest.type	=	MAINQUEST_OPEN
		briefingLab[page].quest.title	=	String.MainKey.."briefingLab[1].quest.title"
		briefingLab[page].quest.text	=	String.MainKey.."briefingLab[1].quest.text"

		briefingChangeWeather 		=	page

	--	page #2

		page = page + 1

		briefingLab[page] 				= 	{}
		briefingLab[page].title		    = 	String.Key("briefingLab[1].title")
		briefingLab[page].text			=	String.Key("briefingLab[2].text")
		briefingLab[page].position 	    = 	GetPosition("scout1")

	--	page #3

		page = page + 1

		briefingLab[page] 				= 	{}
		briefingLab[page].title		    = 	String.Key("briefingLab[1].title")
		briefingLab[page].text			=	String.Key("briefingLab[3].text")
		briefingLab[page].position 	    = 	GetPosition("scout2")

	--	page #4

		page = page + 1

		briefingLab[page] 				= 	{}
		briefingLab[page].title		    = 	String.Key("briefingLab[1].title")
		briefingLab[page].text			=	String.Key("briefingLab[4].text")
		briefingLab[page].position 	    = 	GetPosition("scout3")

	--	page #5

		page = page + 1

		briefingLab[page] 				= 	{}
		briefingLab[page].title		    = 	String.Key("briefingLab[1].title")
		briefingLab[page].text			=	String.Key("briefingLab[5].text")
		briefingLab[page].position 	    = 	GetPosition("npcLabTarget")
		briefingLab[page].dialogCamera	=	true

	--  go!

        StartBriefing(briefingLab)

    end
