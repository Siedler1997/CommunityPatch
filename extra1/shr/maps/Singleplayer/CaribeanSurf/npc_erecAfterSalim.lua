function CreateNPCErecAfterSalim()

	-- setup table for npc
	NPCErecAfterSalim				=	{}
	NPCErecAfterSalim.name 			=	"erec"
	NPCErecAfterSalim.callback		=	CreateNPCErecAfterSalimBriefing
	        
	-- create npc
	CreateNPC(NPCErecAfterSalim)
	   	
end

function CreateNPCErecAfterSalimBriefing()

	if briefingPreludeQuest.isResolved ~= true then
		ResolveBriefing(briefingPreludeQuest)
	end

	erec2after					= 	{}	
	erec2after.restoreCamera 	= 	true                                
	erec2after.finished 		=	briefingErec2afterFinished
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	erec2after[page] 			= 	{}
	erec2after[page].title		=	String.Key("erec.title")
	erec2after[page].text		=	String.Key("erec2[1]")
	erec2after[page].position 	= 	GetPosition("erec")

	page = page +1                  	
                                    	
	erec2after[page] 			= 	{}
	erec2after[page].title		=	String.Key("erec.title")
	erec2after[page].text		=	String.Key("erec2[2]")
	erec2after[page].position 	= 	GetPosition("leo")
	erec2after[page].explore 	= 	1500
	
	erec2afterShowLeo			=	erec2after[page]
	
	StartBriefing(erec2after)

end

function briefingErec2afterFinished()

	end6thQuest()
	
end