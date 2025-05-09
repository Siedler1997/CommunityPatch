createBriefingOrb = function()

	briefingOrb = 	{}	

	briefingOrb.finished = briefingOrbFinished

		-- give weather machine technology
		ResearchTechnology(Technologies.T_ChangeWeather)
		ResearchTechnology(Technologies.T_WeatherForecast)
		ResearchTechnology(Technologies.B_Weathermachine)
		ResearchTechnology(Technologies.B_PowerPlant)
		
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingOrb[page] 					= 	{}
--		briefingOrb[page].title				= 	COLOR2.."< Leonardo >"
--		briefingOrb[page].text				=	"I knew where we can get it!"
		briefingOrb[page].title				=	String.GenericKey("Leonardo")
		briefingOrb[page].text				=	String.Key("briefingOrb1.text")
		briefingOrb[page].position 			= 	GetPosition("Leonardo")	
		briefingOrb[page].explore			=	1000 

		LeoExplore = briefingOrb[1]

	--	page 2

		page = page +1
	
		briefingOrb[page] 					= 	{}
--		briefingOrb[page].title				= 	COLOR2.."< Leonardo >"
--		briefingOrb[page].text				=	"But there is a lake in our way."
		briefingOrb[page].title				=	String.GenericKey("Leonardo")
		briefingOrb[page].text				=	String.Key("briefingOrb2.text")
		briefingOrb[page].position 			= 	GetPosition("Water")	
		briefingOrb[page].explore			=	1000

		SeeExplorationPage = briefingOrb[2]

	--	page 3

		page = page +1
	
		briefingOrb[page] 					= 	{}
--		briefingOrb[page].title				= 	COLOR2.."< Leonardo >"
--		briefingOrb[page].text				=	"Take my contruction plans for the weathermachine and freeze it."
		briefingOrb[page].title				=	String.GenericKey("Leonardo")
		briefingOrb[page].text				=	String.Key("briefingOrb3.text")
		briefingOrb[page].position 			= 	GetPosition("Leonardo")	

		briefingOrb[page].quest				=	{}
		briefingOrb[page].quest.id			=	2
		briefingOrb[page].quest.type		=	MAINQUEST_OPEN
		briefingOrb[page].quest.title		=	"CM01_17_CloudyMountains_Txt/mainquest004_name_Orb"
		briefingOrb[page].quest.text		=	"CM01_17_CloudyMountains_Txt/mainquest004_desc_Orb"
		SnowQuestPage = briefingOrb[3]

	--	page 4
	
		page = page +1
	
		briefingOrb[page] 					= 	{}
--		briefingOrb[page].title				= 	MISSION_OBJECTIVES
--		briefingOrb[page].text				=	COLOR0.."1)"..COLOR1.."Freeze the lake.\n"
		briefingOrb[page].title				=	String.GenericKey("MissionObjectives")
		briefingOrb[page].text				=	String.Key("briefingOrb4.text")
		briefingOrb[page].position 			= 	{}
		briefingOrb[page].position.X,
		briefingOrb[page].position.Y 		=	Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingOrb)
	
end

briefingOrbFinished = function()

	ResolveBriefing(LeoExplore)
end