
---------------------------------------------------------------------------------------------
function CreateBriefingPrelude()

	briefingPrelude 							= 	{}	
	briefingPrelude.finished					=	BriefingPreludeFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude[1].title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		
		briefingPrelude[page].position 			=	GetPosition("ShowSerfs")
		
	--	page 2
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude[1].title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		
		briefingPrelude[page].position 			=	GetPosition("P1_Headquarter")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[2].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[2].quest.text"
		
		briefingPreludeRescueSerfs				=	briefingPrelude[page]
		
	--	page 3
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude[1].title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[3].text")
		
		briefingPrelude[page].position 			=	GetPosition("ConnectionBridge")
		
	--	page 4
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude[1].title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[4].text")
		
		briefingPrelude[page].position 			=	GetPosition("P4_Headquarter_NPC")

		
	--	page 	5
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[5].text")

		
		briefingPrelude[page].position 			= 	GetPosition("Dario")

	--	go!

	StartBriefing(briefingPrelude)

end

function BriefingPreludeFinished()

	-- Move princess near fire signal
	--MoveAndVanish("P4_SouthVillage_NPC", "P2_Army_South_SpawnPoint2")
	
	StartCountdown(15, BriefingPreludeStartBattleOnTheMap, false)
end

function BriefingPreludeStartBattleOnTheMap()
	LocalMusic.BattlesOnTheMap = 2
end