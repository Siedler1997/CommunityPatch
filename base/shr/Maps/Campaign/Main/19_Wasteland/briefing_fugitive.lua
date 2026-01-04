createBriefingFugitive = function()

	BriefingFugitive = 	{}	

	BriefingFugitive.finished = BriefingFugitiveFinished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingFugitive[page] 					= 	{}
	BriefingFugitive[page].title				=	String.GenericKey("Serf")
	BriefingFugitive[page].text				=	String.Key("BriefingFugitive1.text")
	BriefingFugitive[page].position 			= 	GetPosition("Fugitive")

	--	page 2
	
	page = page +1

	BriefingFugitive[page] 					= 	{}
	BriefingFugitive[page].title				=	String.GenericKey("Serf")
	BriefingFugitive[page].text				=	String.Key("BriefingFugitive2.text")
	BriefingFugitive[page].position 			= 	GetPosition("VillagersRescuePos")
	BriefingFugitive[page].marker			=	ANIMATED_MARKER
	BriefingFugitive[page].explore			=	1500

	--	page 3
	
	page = page +1

	BriefingFugitive[page] 					= 	{}
	BriefingFugitive[page].title				=	String.GenericKey("Serf")
	BriefingFugitive[page].text				=	String.Key("BriefingFugitive3.text")
	BriefingFugitive[page].position 			= 	GetPosition("VillagersRescuePos")


	--	page 4
	
	page = page +1

	BriefingFugitive[page] 					= 	{}
	BriefingFugitive[page].title				=	String.GenericKey("Serf")
	BriefingFugitive[page].text				=	String.Key("BriefingFugitive4.text")
	BriefingFugitive[page].position 			= 	GetPosition("Fugitive")

	--	go!
	
	StartBriefing(BriefingFugitive)


end

BriefingFugitiveFinished = function()
	
	-- Add new quest
	Logic.AddQuest(
		1,									
		3,						
		MAINQUEST_OPEN,		
		"CM01_19_Wasteland_Txt/mainquest003_name_RescueVillagers",
		"CM01_19_Wasteland_Txt/mainquest003_desc_RescueVillagers",			
		1	
	)

	DisableNpcMarker("Fugitive")
	SetNPCLookAtTarget("Fugitive",0)
--	InitNPC("Banned_Info_NPC")
	
	-- Remove exploration
	--ResolveBriefing(BriefingFugitive[2])

	Move("Fugitive","FugitiveTarget")
end