---------------------------------------------------------------------------------------------
function createBriefingOpenGate()

	briefingOpenGate = {}

    briefingOpenGate.finished = briefingOpenGateFinished

    briefingOpenGate.restoreCamera = true

	local page = 0

	--	page #1

		page = page + 1

		briefingOpenGate[page] 				= 	{}
		briefingOpenGate[page].title		= 	String.Key("briefingOpenGate[1].title")
		briefingOpenGate[page].text			=	String.Key("briefingOpenGate[1].text")
		briefingOpenGate[page].position		=	GetPosition("gateKeeper")
        briefingOpenGate[page].dialogCamera =	true

    --  go

        --StartBriefing(briefingOpenGate)
    	local npc 				=	{}
    	npc.name 				=	"gateKeeper"
    	npc.briefing			=	briefingOpenGate

        CreateNPC(npc)

	end
---------------------------------------------------------------------------------------------
function briefingOpenGateFinished()
    ReplaceEntity("gate",Entities.XD_WallStraightGate)
    endChapterFive()
end