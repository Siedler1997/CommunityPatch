function CreateNPC3()

	-- setup table for npc
	NPC3				=	{}
	NPC3.name 			=	"npc3"
	NPC3.callback		=	CreateNPC3Briefing
	        
	-- create npc
	CreateNPC(NPC3)
	   	
end

function CreateNPC3Briefing()

	briefingNPC3					= 	{}	
	briefingNPC3.restoreCamera 		= 	true                                
	briefingNPC3.finished			=	end4thQuestSubChapterOneHalf                  
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	briefingNPC3[page] 				= 	{}
	briefingNPC3[page].title		=	String.Key("npc3.title")
	briefingNPC3[page].text			=	String.Key("npc3")
	briefingNPC3[page].position 	= 	GetPosition("npc3")

	StartBriefing(briefingNPC3)

end