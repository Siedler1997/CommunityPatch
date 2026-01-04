createBriefingDryVillage = function()

	briefingDryVillage = 	{}	

	
		briefingDryVillage.finished = briefingDryVillageFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingDryVillage[page] 					= 	{}
--		briefingDryVillage[page].title				= 	COLOR2.."< Serf >"
--		briefingDryVillage[page].text				=	"Thank you for helping us, take this resources as a gift."
		briefingDryVillage[page].title				= 	String.GenericKey("Serf")
		briefingDryVillage[page].text				=	String.Key("briefingDryVillage1.text")
		briefingDryVillage[page].position 			= 	GetPosition("SnowNPC")
		briefingDryVillage[page].explore			=	1000

	--	page 2

		page = page +1
	
		briefingDryVillage[page] 					= 	{}
--		briefingDryVillage[page].title				= 	"Help Village"
--		briefingDryVillage[page].text				=	"There is another Village in the north.\n"
		briefingDryVillage[page].position 			= 	GetPosition("DeadTree")	
		briefingDryVillage[page].title				= 	String.Key("briefingDryVillage2.title")
		briefingDryVillage[page].text				=	String.Key("briefingDryVillage2.text")
		briefingDryVillage[page].marker			=	ANIMATED_MARKER
		briefingDryVillage[page].explore		=	1500

--		briefingDryVillage[page].quest				=	{}
--		briefingDryVillage[page].quest.id			=	2
--		briefingDryVillage[page].quest.type		=	MAINQUEST_OPEN
--		briefingDryVillage[page].quest.title		=	"CM01_19_Wasteland_Txt/mainquest002_name_DryVillage"
--		briefingDryVillage[page].quest.text		=	"CM01_19_Wasteland_Txt/mainquest002_desc_DryVillage"

	--	page 3
	
		page = page +1
	
		briefingDryVillage[page] 					= 	{}
--		briefingDryVillage[page].title				= 	"Help Village"
--		briefingDryVillage[page].text				=	"They need your help to get back their lost hope.\n"
		briefingDryVillage[page].title				= 	String.Key("briefingDryVillage3.title")
		briefingDryVillage[page].text				=	String.Key("briefingDryVillage3.text")

	--	page 4

		page = page + 1

		briefingDryVillage[page] 					= 	{}
--		briefingDryVillage[page].title				= 	COLOR2.."< Serf >"
--		briefingDryVillage[page].text				=	"Talk to the man near the tree."
		briefingDryVillage[page].title				= 	String.GenericKey("Serf")
		briefingDryVillage[page].text				=	String.Key("briefingDryVillage4.text")

	--	page 5

		page = page + 1

		briefingDryVillage[page] 					= 	{}
--		briefingDryVillage[page].title				= 	COLOR2.."< Serf >"
--		briefingDryVillage[page].text				=	"I'm sure you can solve their problem."
		briefingDryVillage[page].title				= 	String.GenericKey("Serf")
		briefingDryVillage[page].text				=	String.Key("briefingDryVillage5.text")
		briefingDryVillage[page].position 			= 	GetPosition("SnowNPC")

	--	go!
	
		StartBriefing(briefingDryVillage)
	
	end


briefingDryVillageFinished = function()

	Report("disabled SnowNPC")
	DisableNpcMarker("SnowNPC")
	--InitNPC("SnowNPC")
	--Move("SnowNPC", "SnowNPCPos")

	-- Give resources to player
	Tools.GiveResouces(gvMission.PlayerID, 1000, 1000, 1000, 1000, 1000, 1000)
	
	local playerId = 3
	Logic.SetDiplomacyState( 1, playerId, Diplomacy.Friendly )
	Logic.SetShareExplorationWithPlayerFlag(1, playerId, 1)

	-- Clear exploration of serf
	ResolveBriefing(briefingDryVillage[1])

	-- end quest 
	end2ndQuest()
end