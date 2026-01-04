createBriefingFugitive2 = function()

	BriefingFugitive2 = 	{}	

	BriefingFugitive2.finished = BriefingFugitive2Finished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingFugitive2[page] 					= 	{}
	BriefingFugitive2[page].title				=	String.Key("briefingNPC[1].title")
	BriefingFugitive2[page].text				=	String.Key("briefingNPC[1].text")
	BriefingFugitive2[page].position 			= 	GetPosition("Fugitive2")

	--	go!
	
	StartBriefing(BriefingFugitive2)

end

BriefingFugitive2Finished = function()
	ChangePlayer("Fugitive2", 1)
	DisableNpcMarker("Fugitive2")
	SetNPCLookAtTarget("Fugitive2",0)
end