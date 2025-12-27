function CoinacMoveToDario()
	if Counter.Tick2("CoinacMoveToDario",5) then
		if not IsNear("TendrelSerf", "Dario", 300) then
			Move("TendrelSerf", "Dario")
		else
			createBriefingCoinac()
			return true
		end
	end
end


createBriefingCoinac = function()

	briefingCoinac = 	{}
	
	briefingCoinac.refugee  = GetID("TendrelSerf")

	--	change serf player id

		briefingCoinac.finished = BriefingCoinacFinished

		local page = 0

	--	page 1

		page = page +1

		briefingCoinac[page] 			       = 	{}
		briefingCoinac[page].title		       = 	String.GenericKey("Messenger")
		briefingCoinac[page].text		       =	String.Key("briefingCoinac[1].text")
		briefingCoinac[page].npc		       =	{}
		briefingCoinac[page].npc.id		       =	briefingCoinac.refugee
		briefingCoinac[page].npc.isObserved	       =	true


	--	page 2

		page = page +1

		briefingCoinac[page] 				= 	{}
		briefingCoinac[page].title			= 	String.GenericKey("Messenger")
		briefingCoinac[page].position 			= 	GetPosition("base3")
		briefingCoinac[page].text			=	String.Key("briefingCoinac[2].text")
		briefingCoinac[page].marker			=	STATIC_MARKER
		briefingCoinac[page].explore 			= 	1000
	--	briefingCoinac[page].marker			=	ANIMATED_MARKER



	--	page 3

		page = page +1

		briefingCoinac[page] 				= 	{}
		briefingCoinac[page].title			= 	String.GenericKey("Messenger")
		briefingCoinac[page].position 			= 	GetPosition("base4")
		briefingCoinac[page].text			=	String.Key("briefingCoinac[3].text")
		briefingCoinac[page].marker			=	STATIC_MARKER
		briefingCoinac[page].explore 			= 	1000


	--	page 4

		page = page +1

		briefingCoinac[page] 				= 	{}
		briefingCoinac[page].title			= 	String.MainKey.."briefingCoinac.quest.title"
		briefingCoinac[page].position 			= 	GetPosition("Dario")
		briefingCoinac[page].text			=	String.MainKey.."briefingCoinac.quest.text"
		briefingCoinac[page].explore 			= 	1000


		-- Quest

		briefingCoinac[page].quest			=	{}
		briefingCoinac[page].quest.id			=	2
		briefingCoinac[page].quest.type		        =	SUBQUEST_OPEN
		briefingCoinac[page].quest.title		=	String.MainKey.."briefingCoinac.quest.title"
		briefingCoinac[page].quest.text		        =	String.MainKey.."briefingCoinac.quest.text"

		briefingzloboz = briefingCoinac[page]


		page_Coinac = page

		StartBriefing(briefingCoinac)

	end


BriefingCoinacFinished = function()

	DisableNpcMarker("TendrelSerf")

	-- Move
	Move("TendrelSerf", "TargetPt")

end






