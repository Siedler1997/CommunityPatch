function CreateNPCLeo2()

	-- setup table for npc
	NPCLeo2				=	{}
	NPCLeo2.name 		=	"leo"
	NPCLeo2.callback	=	CreateNPCLeo2Briefing
	        
	-- create npc
	CreateNPC(NPCLeo2)
	
end

function CreateNPCLeo2Briefing()

	
	briefingLeo2					= 	{}	
	briefingLeo2.finished 			=	briefingLeo2Finished
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	briefingLeo2[page] 				= 	{}
	briefingLeo2[page].title		=	String.Key("leo.title")
	briefingLeo2[page].text			=	String.Key("leo[4]")
	briefingLeo2[page].position 	= 	GetPosition("leo")

	page = page +1                  	
                                   	
	briefingLeo2[page] 				= 	{}
	briefingLeo2[page].title		=	String.Key("leo.title")
	briefingLeo2[page].text			=	String.Key("leo[5]")
	briefingLeo2[page].position 	= 	GetPosition("stoneblock3")
	briefingLeo2[page].explore 		= 	500

	briefingLeo2[page].quest		=	{}
	briefingLeo2[page].quest.id		=	4
	briefingLeo2[page].quest.type	=	MAINQUEST_OPEN
	briefingLeo2[page].quest.title	=	String.Key("quest4.")
	briefingLeo2[page].quest.text	=	String.Key("quest4.text")

	briefingLeo2Quest				=	briefingLeo2[page]
	
	StartBriefing(briefingLeo2)
	
end


briefingLeo2Finished = function()

	end6thQuestSubChapterThree()
		
end
