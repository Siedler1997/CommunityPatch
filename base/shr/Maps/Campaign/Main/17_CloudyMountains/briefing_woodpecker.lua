
createBriefingWoodpecker = function()

		briefingWoodpecker							= 	{}	
	
		briefingWoodpecker.finished = BriefingWoodpeckerFinished

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingWoodpecker[page] 					= 	{}
		briefingWoodpecker[page].title				=	String.Key("briefingNPC[1].title")
		briefingWoodpecker[page].text				=	String.Key("briefingNPC[1].text")
		briefingWoodpecker[page].position 			= 	GetPosition("Woodpecker")
		briefingWoodpecker[page].explore			=	2000
		

	--	go!
	
		StartBriefing(briefingWoodpecker)
	
end

BriefingWoodpeckerFinished = function()

	local ID = GetID("Woodpecker")
	
	MoveAndVanish(ID,"WoodpeckerExit")

	DisableNpcMarker("Woodpecker")
end