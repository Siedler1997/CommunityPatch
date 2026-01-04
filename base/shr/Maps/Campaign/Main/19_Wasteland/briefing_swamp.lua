createBriefingSwamp = function()

	if BiefingSwampDone == nil then
		BiefingSwampDone = 1
		
		briefingSwamp = 	{}	
		briefingSwamp.finished = briefingSwampFinished
	
		local page = 0
	
		--	page 1
		
		page = page +1
	
		briefingSwamp[page] 					= 	{}
	--	briefingSwamp[page].title				= 	COLOR2.."< Banned Serf >"
	--	briefingSwamp[page].text				=	"All hail my friends."
		briefingSwamp[page].title				=	String.GenericKey("Serf")
		briefingSwamp[page].text				=	String.Key("briefingSwamp1.text")
		briefingSwamp[page].position 			= 	GetPosition("Banned_Info_NPC")
		briefingSwamp[page].explore			=	3000
	
		--	page 2
		
		page = page +1
	
		briefingSwamp[page] 					= 	{}
	--	briefingSwamp[page].title				= 	COLOR2.."< Banned Serf >"
	--	briefingSwamp[page].text				=	"Please help us in our misery."
		briefingSwamp[page].title				=	String.GenericKey("Serf")
		briefingSwamp[page].text				=	String.Key("briefingSwamp2.text")
		briefingSwamp[page].position 			= 	GetPosition("Banned_Info_NPC")
	
		--	page 3
		
		page = page +1
	
		briefingSwamp[page] 					= 	{}
	--	briefingSwamp[page].title				= 	COLOR2.."< Banned Serf >"
	--	briefingSwamp[page].text				=	"Our village is trapped by a swamp."
		briefingSwamp[page].title				=	String.GenericKey("Serf")
		briefingSwamp[page].text				=	String.Key("briefingSwamp3.text")
		briefingSwamp[page].position 			= 	GetPosition("SnowNPCPos")
		briefingSwamp[page].marker			=	ANIMATED_MARKER
		briefingSwamp[page].explore			=	1500
	
		--	page 4
		
		page = page +1
	
		briefingSwamp[page] 					= 	{}
	--	briefingSwamp[page].title				= 	COLOR2.."< Banned Serf >"
	--	briefingSwamp[page].text				=	"We will support you with some resources after we are free again."
		briefingSwamp[page].title				=	String.GenericKey("Serf")
		briefingSwamp[page].text				=	String.Key("briefingSwamp4.text")
		briefingSwamp[page].position 			= 	GetPosition("Banned_Info_NPC")
	
	
		--	page 5
		
		page = page +1
	
		briefingSwamp[page] 					= 	{}
	--	briefingSwamp[page].title				= 	MISSION_OBJECTIVES
	--	briefingSwamp[page].text				=	COLOR0.."1)"..COLOR1.."Freeze the swamp to free the village."
		briefingSwamp[page].title				=	String.GenericKey("MissionObjectives")
		briefingSwamp[page].text				=	String.Key("briefingSwamp5.text")
		briefingSwamp[page].position 			= 	{}
		briefingSwamp[page].position.X,briefingSwamp[page].position.Y = Camera.ScrollGetLookAt()
	
		--	go!
		
		StartBriefing(briefingSwamp)

	end

end

briefingSwampFinished = function()
	DisableNpcMarker("Banned_Info_NPC")
--	InitNPCLookAt("Banned_Info_NPC")
	talkedToSwampNPC = true

	-- Remove exploration
	--ResolveBriefing(briefingSwamp[3])
	ResolveBriefing(briefingSwamp[1])

	--Start quest
	start2ndQuest()
end