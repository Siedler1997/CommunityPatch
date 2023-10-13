function CreateNPC2()

	-- setup table for npc
	NPC2				=	{}
	NPC2.name 			=	"npc2"
	NPC2.callback		=	CreateNPC2Briefing
	        
	-- create npc
	CreateNPC(NPC2)
	   	
end

function CreateNPC2Briefing()

	briefingNPC2					= 	{}	
	briefingNPC2.restoreCamera 		= 	true                                
    briefingNPC2.finished			=	end4thQuestSubChapterHalf
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	briefingNPC2[page] 				= 	{}
	briefingNPC2[page].title		=	String.Key("npc2.title")
	briefingNPC2[page].text			=	String.Key("npc2")
	briefingNPC2[page].position 	= 	GetPosition("npc2")

	StartBriefing(briefingNPC2)


end