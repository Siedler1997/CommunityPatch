createBriefingPrelude = function()
	
	briefingPrelude = 	{}	

	--	create refugee
	
		briefingPrelude.finished = BriefingPreludeFinished
	
		local page = 0

	--	page 
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Mentor")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		briefingPrelude[page].position		= GetPosition("Dario")
		
		

	--	page 

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 			= 	GetPosition("Cathedral")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			= 1500
		
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[2].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[2].quest.text" 
		
		PreludeMainquest = briefingPrelude[page]
		
	--	page 

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 			= 	GetPosition("Trader2")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[3].text")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			= 1200
		
		PreludeMarketEast = briefingPrelude[page]
		
			--	page 

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 			= 	GetPosition("Trader1")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[4].text")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			= 1200
		
		PreludeMarketWest = briefingPrelude[page]
		
		
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Dario")
		briefingPrelude[page].position 			= 	GetPosition("Dario")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[5].text")
		briefingPrelude[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingPrelude)
end


BriefingPreludeFinished = function()
	Report("Prelude Briefing finished!")
end