function CreateNPCBandits1()

	-- setup table for npc
	NPCBandits1				=	{}
	NPCBandits1.name 			=	"npc1"
	NPCBandits1.callback		=	CreateNPCBandits1Briefing
	        
	-- create npc
	CreateNPC(NPCBandits1)
	   	
end

function CreateNPCBandits1Briefing()

	end1stQuestSubChapterOne()
	
	briefingBandits1					= 	{}	
	briefingBandits1.restoreCamera 	= true                                
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	briefingBandits1[page] 				= 	{}
	briefingBandits1[page].title		=	String.Key("pirates1.title")
	briefingBandits1[page].text			=	String.Key("pirates1[1].text")
	briefingBandits1[page].position 	= 	GetPosition("pirates1")

	page = page +1                  	
                                    	
	briefingBandits1[page] 				= 	{}
	briefingBandits1[page].title		=	String.Key("pirates1.title")
	briefingBandits1[page].text			=	String.Key("pirates1[2].text")
	briefingBandits1[page].position 	= 	GetPosition("pirates2")
	briefingBandits1[page].explore 		= 	1500
	
	briefingBandits1ShowPirateLeader	=	briefingBandits1[page]
	
	StartBriefing(briefingBandits1)

end
