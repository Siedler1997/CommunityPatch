createBriefingKidnapper = function()
BriefingKidnapper = 	{}	


	BriefingKidnapper.finished = BriefingKidnapperFinished
	local page = 0

	--	page 1
	
	if talkedToMarket1NPC == 1 then
		ResolveBriefing(FindRobbersBriefing)
		--BriefingMarket1Rescue
	else
		ResolveBriefing(PreludeMarketWest)
	end

	page = page +1

	BriefingKidnapper[page] 						= 	{}
	BriefingKidnapper[page].title				= String.Key("BriefingKidnapper[1].title")
	BriefingKidnapper[page].text				=	String.Key("BriefingKidnapper[1].text")
	BriefingKidnapper[page].position 		= 	GetPosition("kidnapper_boss")
	BriefingKidnapper[page].marker				=	ANIMATED_MARKER
	BriefingKidnapper[page].dialogCamera 	= 	true
	--BriefingKidnapper[page].explore				=	3000
		
	BriefingKidnapper[page].quest				=	{}
	BriefingKidnapper[page].quest.id			=	2
	BriefingKidnapper[page].quest.type			=	SUBQUEST_OPEN
	BriefingKidnapper[page].quest.title			=	String.MainKey.."BriefingKidnapper[1].quest.title"
	BriefingKidnapper[page].quest.text			=	String.MainKey.."BriefingKidnapper[1].quest.text"
	BriefingKidnapper[page].position 			= 	GetPosition("kidnapper_boss")
	BriefingKidnapper[page].explore				=	500
	
	BriefingKidnapperQuest = BriefingKidnapper[page]

	--	page 2

	page = page +1

	BriefingKidnapper[page] 					= 	{}
	BriefingKidnapper[page].title				= String.Key("BriefingKidnapper[1].title")
	BriefingKidnapper[page].text				=	String.Key("BriefingKidnapper[2].text")
	BriefingKidnapper[page].position 			= 	GetPosition("kidnapper_boss")
	

	

	--	go!
	
	StartBriefing(BriefingKidnapper)
end
	
