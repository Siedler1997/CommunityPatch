createBriefingSalim = function()

	BriefingSalim					= 	{}	
	BriefingSalim.restoreCamera = true                                
	BriefingSalim.finished 			=	BriefingSalimFinished
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	BriefingSalim[page] 			= 	{}
	BriefingSalim[page].title		=	String.Key("salim.title")
	BriefingSalim[page].text		=	String.Key("salim")
	BriefingSalim[page].position 	= 	GetPosition("construct2")

	BriefingSalim[page].quest			=	{}
	BriefingSalim[page].quest.id		=	5
	BriefingSalim[page].quest.type	=	MAINQUEST_OPEN
	BriefingSalim[page].quest.title	=	String.Key("quest5.")
	BriefingSalim[page].quest.text	=	String.Key("quest5.text")

	BriefingSalimQuest 				= 	BriefingSalim[page]	

	StartBriefing(BriefingSalim)

	end
