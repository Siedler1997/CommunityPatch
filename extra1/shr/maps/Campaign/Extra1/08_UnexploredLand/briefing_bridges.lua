function CreateDelayedBriefingBridges()

	StartSimpleJob("DelayBriefingBridges")

end

function DelayBriefingBridges()

	if Counter.Tick2("DelayBriefingBridges",10) then
		
		CreateBriefingBridges()
		return true
		
	end

end

function CreateBriefingBridges()

	briefingBridges								= 	{}	
	briefingBridges.restoreCamera				=	true
	
	local page = 0

	--	page 1
	
		page = page +1
	
		briefingBridges[page] 					= 	{}
		briefingBridges[page].title				= 	String.GenericKey("Mentor")
		briefingBridges[page].text				=	String.Key("briefingBridges[1].text")

		briefingBridges[page].position			=	GetPosition("PlayerHQ")
		
	--	page 2
	
		page = page +1
	
		briefingBridges[page] 					= 	{}
		briefingBridges[page].title				= 	String.Key("Chief")
		briefingBridges[page].text				=	String.Key("briefingBridges[2].text")

		briefingBridges[page].position			=	GetPosition("PlayerHQ")
		
	--	page 3
	
		page = page +1
	
		briefingBridges[page] 					= 	{}
		briefingBridges[page].title				= 	String.Key("Chief")
		briefingBridges[page].text				=	String.Key("briefingBridges[3].text")

		briefingBridges[page].position			=	GetPosition("Bridge1")
		briefingBridges[page].explore			=	2000
		briefingBridges[page].marker			=	STATIC_MARKER

		briefingBridgesShowBridge1				=	briefingBridges[page]

	--	page 4
	
		page = page +1
	
		briefingBridges[page] 					= 	{}
		briefingBridges[page].title				= 	String.Key("Chief")
		briefingBridges[page].text				=	String.Key("briefingBridges[4].text")

		briefingBridges[page].position			=	GetPosition("Bridge2")
		briefingBridges[page].explore			=	2000
		briefingBridges[page].marker			=	STATIC_MARKER

		briefingBridgesShowBridge2				=	briefingBridges[page]

	--	page 5
	
		page = page +1
	
		briefingBridges[page] 					= 	{}
		briefingBridges[page].title				= 	String.Key("Chief")
		briefingBridges[page].text				=	String.Key("briefingBridges[5].text")

		briefingBridges[page].position			=	GetPosition("Bridge3")
		briefingBridges[page].explore			=	2000
		briefingBridges[page].marker			=	STATIC_MARKER

		briefingBridgesShowBridge3				=	briefingBridges[page]

	--	page 6
	
		page = page +1
	
		briefingBridges[page] 					= 	{}
		briefingBridges[page].title				= 	String.Key("Chief")
		briefingBridges[page].text				=	String.Key("briefingBridges[6].text")

		briefingBridges[page].position			=	GetPosition("Bridge4")
		briefingBridges[page].explore			=	2000
		briefingBridges[page].marker			=	STATIC_MARKER

		briefingBridgesShowBridge4				=	briefingBridges[page]

	--	page 7
		--[[
		page = page +1
	
		briefingBridges[page] 					= 	{}
		briefingBridges[page].title				= 	String.Key("Chief")
		briefingBridges[page].text				=	String.Key("briefingBridges[6b].text")

		briefingBridges[page].position			=	GetPosition("Bridge5")
		briefingBridges[page].explore			=	2000
		briefingBridges[page].marker			=	STATIC_MARKER

		briefingBridgesShowBridge5				=	briefingBridges[page]
		--]]
	--	page 8
	
		page = page +1
	
		briefingBridges[page] 					= 	{}
		briefingBridges[page].title				= 	String.GenericKey("MissionObjectives")
		briefingBridges[page].text	 			= 	String.Key("briefingBridges[7].text")

		briefingBridges[page].position			=	GetPosition("PlayerHQ")

		briefingBridges[page].quest				=	{}
		briefingBridges[page].quest.id			=	2
		briefingBridges[page].quest.type		=	MAINQUEST_OPEN
		briefingBridges[page].quest.title		=	String.MainKey.."briefingBridges[7].quest.title"
		briefingBridges[page].quest.text		=	String.MainKey.."briefingBridges[7].quest.text"

		briefingBridgesQuest					=	briefingBridges[page]

	-- go

		StartBriefing(briefingBridges)		

end