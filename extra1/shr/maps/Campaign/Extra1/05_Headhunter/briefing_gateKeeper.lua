---------------------------------------------------------------------------------------------
function createBriefingGateKeeper()

	briefingGateKeeper = {}

	briefingGateKeeper.restoreCamera = true

    briefingGateKeeper.finished = briefingGateKeeperFinished

	local page = 0

	--	page #1

		page = page + 1

		briefingGateKeeper[page] 				= 	{}
		briefingGateKeeper[page].title		    = 	String.Key("briefingGateKeeper[1].title")
		briefingGateKeeper[page].text			=	String.Key("briefingGateKeeper[1].text")
		briefingGateKeeper[page].position 	    = 	GetPosition("gateKeeper")
		briefingGateKeeper[page].dialogCamera	=	true
		briefingGateKeeper[page].npc			=	{}
		briefingGateKeeper[page].npc.id			=	"gateKeeper"
		briefingGateKeeper[page].npc.isObserved	=	true
		briefingGateKeeper[page].explore        = 	1000

	--	page #2

		page = page + 1

		briefingGateKeeper[page] 				= 	{}
		briefingGateKeeper[page].title		    = 	String.Key("briefingGateKeeper[2].title")
		briefingGateKeeper[page].text			=	String.Key("briefingGateKeeper[2].text")
		briefingGateKeeper[page].position 	    = 	GetPosition("gateKeeper")

	--  go!

        StartBriefing(briefingGateKeeper)

    end

function briefingGateKeeperFinished()
    Move("gateKeeper","keyKeeper")

    createBriefingKeyKeeper_GateKeeperIsOnTheWay()

    DisableNpcMarker("gateKeeper")

    createQuestOpenGate()
end