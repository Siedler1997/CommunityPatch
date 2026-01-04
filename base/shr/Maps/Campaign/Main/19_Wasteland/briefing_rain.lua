
createBriefingRain = function(_heroId)

	briefingRain = 	{}	

	--	create refugee
	
		briefingRain.finished = briefingRainFinished

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingRain[page] 					= 	{}
--		briefingRain[page].title				= 	COLOR2.."< Serf >"
--		briefingRain[page].text				=	"All is lost, our tree of live has died."
		briefingRain[page].title				=	String.GenericKey("Serf")
		briefingRain[page].text				=	String.Key("briefingRain1.text")
		briefingRain[page].position 			= 	GetPosition("RainNPC")	

	--	page 2

		page = page +1
	
		briefingRain[page] 					= 	{}
--		briefingRain[page].title				= 	MISSION_OBJECTIVES
--		briefingRain[page].text				=	COLOR0.."1)"..COLOR1.."The tree needs water.!"
		briefingRain[page].title				=	String.GenericKey("MissionObjectives")
		briefingRain[page].text				=	String.Key("briefingRain2.text")
		briefingRain[page].position 			= 	GetPosition(_heroId)	
		
	--	go!
	
		StartBriefing(briefingRain)
	
	end


briefingRainFinished = function()
	DisableNpcMarker("RainNPC")
	SetNPCLookAtTarget("RainNPC",0)
	--InitNPCLookAt("RainNPC")

end