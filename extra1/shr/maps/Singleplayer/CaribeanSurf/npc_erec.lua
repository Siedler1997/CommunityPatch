function CreateNPCErec()

	-- setup table for npc
	NPCErec					=	{}
	NPCErec.name 			=	"erec"
	NPCErec.callback		=	CreateNPCErecBriefing
	        
	-- create npc
	CreateNPC(NPCErec)
	   	
end

function CreateNPCErecBriefing()

	ResolveBriefing(briefingPreludeQuest)

	briefingNPCErec					= 	{}	
	briefingNPCErec.restoreCamera 		= true                                
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	briefingNPCErec[page] 				= 	{}
	briefingNPCErec[page].title			=	String.Key("erec.title")
	briefingNPCErec[page].text			=	String.Key("erec")
	briefingNPCErec[page].position 		= 	GetPosition("erec")

	StartBriefing(briefingNPCErec)

end

function DestroyNPCErec()

	DestroyNPC(NPCErec)

end