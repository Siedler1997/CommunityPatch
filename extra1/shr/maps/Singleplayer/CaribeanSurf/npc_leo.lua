function CreateNPCLeo()

	-- setup table for npc
	NPCLeo				=	{}
	NPCLeo.name 		=	"leo"
	NPCLeo.callback		=	CreateNPCLeoBriefing
	        
	-- create npc
	CreateNPC(NPCLeo)
	
end

function CreateNPCLeoBriefing()

	briefingLeo					= 	{}	
	briefingLeo.finished 			=	briefingLeoFinished
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	briefingLeo[page] 			= 	{}
	briefingLeo[page].title		=	String.Key("leo.title")
	briefingLeo[page].text		=	String.Key("leo[1]")
	briefingLeo[page].position 	= 	GetPosition("leo")

	page = page +1                  	
                                    	
	briefingLeo[page] 			= 	{}
	briefingLeo[page].title		=	String.Key("leo.title")
	briefingLeo[page].text		=	String.Key("leo[2]")
	briefingLeo[page].position 	= 	GetPosition("mines")
	briefingLeo[page].explore 	= 	1500

	briefingLeoShowMinesQuest	=	briefingLeo[page]

	page = page +1                  	
                                   	
	briefingLeo[page] 			= 	{}
	briefingLeo[page].title		=	String.Key("leo.title")
	briefingLeo[page].text		=	String.Key("leo[3]")
	briefingLeo[page].position 	= 	GetPosition("stoneblock1")
	briefingLeo[page].explore 	= 	500


	briefingLeo[page].quest			=	{}
	briefingLeo[page].quest.id		=	3
	briefingLeo[page].quest.type	=	MAINQUEST_OPEN
	briefingLeo[page].quest.title	=	String.Key("quest3")
	briefingLeo[page].quest.text	=	String.Key("quest3.text")

	briefingLeoQuest				=	briefingLeo[page]
	
	StartBriefing(briefingLeo)
	
end


briefingLeoFinished = function()

	Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("stoneblock1").X, GetPosition("stoneblock1").Y,0)		--EXPLODE
	DestroyEntity("stoneblock1")
		
	end6thQuestSubChapterOne()
	
end
