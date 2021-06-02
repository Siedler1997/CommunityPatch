

createBriefingPrelude = function()

	briefingPrelude = 	{}	

	briefingPrelude.finished = briefingPreludeFinished

		local page = 0

	--	page1
	
		page = page +1

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Mentor")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		briefingPrelude[page].position			=	GetPosition("dario")
		briefingPrelude[page].dialogCamera 		= 	true

	--	page2

		page = page +1

		page_preludeCastle = page

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Mentor")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		briefingPrelude[page].position			=	GetPosition("lionsDen")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			=	2000			

		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	2
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[2].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[2].quest.text"

	--	page3

		page = page +1

		page_preludeOutpost = page

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Mentor")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[3].text")
		briefingPrelude[page].position			=	GetPosition("outpost") 
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			=	2000			

		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[3].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[3].quest.text"
		
	--	page4

		page = page +1

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Mentor")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[4].text")
		briefingPrelude[page].position			=	GetPosition("army1") 

	--	page5

		page = page +1

		page_preludeReinforcements = page

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Mentor")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[5].text")
		briefingPrelude[page].position			=	GetPosition("deployEnd1")
		briefingPrelude[page].marker			=	STATIC_MARKER
		briefingPrelude[page].explore			=	1500			

	--	page6

		page = page +1

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Mentor")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[6].text")
		briefingPrelude[page].position			=	GetPosition("IceAttack") 
		briefingPrelude[page].explore			=	2000			


	--	page6

		page = page +1

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[7].text")
		briefingPrelude[page].position			=	GetPosition("dario")
		briefingPrelude[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingPrelude)

	end
	
briefingPreludeFinished = function()
	-- Remove exploration
	ResolveBriefing(briefingPrelude[6])
end
