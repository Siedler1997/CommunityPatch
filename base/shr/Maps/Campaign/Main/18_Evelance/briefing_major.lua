
createBriefingMajor = function()

	BriefingMajor= 	{}	

		BriefingMajor.finished = BriefingMajorFinished
	
		local page = 0

	--	page 1

		page = page +1
	
		BriefingMajor[page] 				= 	{}
		BriefingMajor[page].title			= 	String.GenericKey("Regent")
		BriefingMajor[page].text			=	String.Key("BriefingMajor[1].text")
		BriefingMajor[page].position 		= 	GetPosition("Major")
--		BriefingMajor[page].dialogCamera 	= 	true

	--	page 2
	
		page = page +1
	
		BriefingMajor[page] 				= 	{}
		BriefingMajor[page].title			= 	String.GenericKey("Regent")
		BriefingMajor[page].text			=	String.Key("BriefingMajor[2].text")
		BriefingMajor[page].position 		= 	GetPosition("dario")
		BriefingMajor[page].dialogCamera 	= 	true

	--	page 3
	
		page = page +1
	
		BriefingMajor[page] 				= 	{}
		BriefingMajor[page].title			= 	String.GenericKey("Regent")
		BriefingMajor[page].text			=	String.Key("BriefingMajor[3].text")
		BriefingMajor[page].position 		= 	GetPosition("Major")
--		BriefingMajor[page].dialogCamera 	= 	true

	--	page 4

		page = page +1
		MajorPrincessFreed = page
	
		BriefingMajor[page] 				= 	{}
		BriefingMajor[page].title			= 	String.GenericKey("Regent")
		if CP_Difficulty == 2 then
			BriefingMajor[page].position 		= 	GetPosition("P5DefenseGenerator1")	
		else
			BriefingMajor[page].position 		= 	GetPosition("Prison")	
		end
		BriefingMajor[page].text			=	String.Key("BriefingMajor[4].text")
		BriefingMajor[page].explore			=	1000
		BriefingMajor[page].marker			=	ANIMATED_MARKER
		
		BriefingMajor[page].quest				=	{}
		BriefingMajor[page].quest.id			=	2
		BriefingMajor[page].quest.type		=	MAINQUEST_OPEN
		BriefingMajor[page].quest.title		=	String.MainKey.."BriefingMajor[4].quest.title"
		BriefingMajor[page].quest.text		=	String.MainKey.."BriefingMajor[4].quest.text"
	
	--	page 5

		page = page +1
		MajorCathedralBuilt = page
	
		BriefingMajor[page] 				= 	{}
		BriefingMajor[page].title			= 	String.GenericKey("Regent")
		BriefingMajor[page].position 		= 	GetPosition("CathedralPos")	
		BriefingMajor[page].text			=	String.Key("BriefingMajor[5].text")
		BriefingMajor[page].explore			=	6400
		BriefingMajor[page].marker			=	ANIMATED_MARKER
		BriefingMajor[page].pointer			=	GetPosition("CathedralPos")

		BriefingMajor[page].quest			=	{}
		BriefingMajor[page].quest.id			=	1
		BriefingMajor[page].quest.type		=	MAINQUEST_OPEN
		BriefingMajor[page].quest.title		=	String.MainKey.."BriefingMajor[5].quest.title"
		BriefingMajor[page].quest.text		=	String.MainKey.."BriefingMajor[5].quest.text"
		
	
	--	page 6

		page = page + 1

		BriefingMajor[page] 				= 	{}
		BriefingMajor[page].title			= 	String.GenericKey("MissionObjectives")
		BriefingMajor[page].position 		= 	{}
		BriefingMajor[page].position.X,
		BriefingMajor[page].position.Y 		= 	Camera.ScrollGetLookAt()
		BriefingMajor[page].text			=	String.Key("BriefingMajor[tasks].text")

	--	go!
	
		StartBriefing(BriefingMajor)
	
	end


BriefingMajorFinished = function()

	DisableNpcMarker("Major")
	
end