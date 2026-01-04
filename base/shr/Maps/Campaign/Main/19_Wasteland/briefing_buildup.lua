
createBriefingBuildUp = function()

	briefingBuildUp= 	{}	

		briefingBuildUp.finished = briefingBuildUpFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingBuildUp[page] 					= 	{}
		briefingBuildUp[page].title				= 	String.GenericKey("Serf")
		briefingBuildUp[page].text				=	String.Key("briefingBuildUp1.text")
		briefingBuildUp[page].position 			= 	GetPosition("BuildUpNPC")
		briefingBuildUp[page].explore			=	1000

	--	page 2

		page = page +1
	
		briefingBuildUp[page] 					= 	{}
		briefingBuildUp[page].position 			= 	GetPosition("BuildUpQuestPos")	
		briefingBuildUp[page].title				= 	String.Key("briefingBuildUp2.title")
		briefingBuildUp[page].text				=	String.Key("briefingBuildUp2.text")
		briefingBuildUp[page].explore			=	6400
		briefingBuildUp[page].marker			=	ANIMATED_MARKER
		
		briefingBuildUp[page].quest				=	{}
		briefingBuildUp[page].quest.id			=	5
		briefingBuildUp[page].quest.type		=	MAINQUEST_OPEN
		briefingBuildUp[page].quest.title		=	"CM01_19_Wasteland_Txt/mainquest001_name_BuildUp"
		briefingBuildUp[page].quest.text		=	"CM01_19_Wasteland_Txt/mainquest001_desc_BuildUp"
		

	--	page 3

		page = page + 1

		briefingBuildUp[page] 					= 	{}
		briefingBuildUp[page].position 			= 	{}
		briefingBuildUp[page].title				=	String.GenericKey("MissionObjectives")
		briefingBuildUp[page].text				=	String.Key("briefingBuildUp3.text")
		briefingBuildUp[page].position.X,briefingBuildUp[page].position.Y = Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingBuildUp)
	
	end


briefingBuildUpFinished = function()
	DisableNpcMarker("BuildUpNPC")
	SetNPCLookAtTarget("BuildUpNPC",0)
	--	InitNPC("BuildUpNPC")
	--	Move("BuildUpNPC", "BuildUpQuestPos")
	ResolveBriefing(briefingBuildUp[1])
end