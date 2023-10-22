
createBriefingPrelude = function()

	briefingPrelude = 	{}	

	local page = 0

	--	page - briefieng 1
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.Key("briefing")
		briefingPrelude[page].position 		= 	GetPosition("player4")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[2].text")
		briefingPrelude[page].explore		=	1000

	--	page - briefieng 2
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.Key("briefing")
		briefingPrelude[page].position 		= 	GetPosition("player3")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[3].text")
		briefingPrelude[page].explore		=	1000


	--	page - briefieng 1
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.Key("briefing")
		briefingPrelude[page].position 		= 	GetPosition("target1")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[4].text")
		briefingPrelude[page].explore		=	1000

	--	page - briefieng 2
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.Key("briefing")
		briefingPrelude[page].position 		= 	GetPosition("player5")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[5].text")
		briefingPrelude[page].explore		=	1000
		briefingPrelude[page].marker		=	STATIC_MARKER


	--	page - briefieng 2
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.Key("briefing")
		briefingPrelude[page].position 		= 	GetPosition("player6")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[6].text")
		briefingPrelude[page].explore		=	1000
		briefingPrelude[page].marker		=	STATIC_MARKER


	--	page - objectives
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 		= 	GetPosition("player1")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[7].text")
		briefingPrelude[page].explore		=	BRIEFING_EXPLORATION_RANGE

		briefingPrelude[page].quest		=	{}
		briefingPrelude[page].quest.id		=	1
		briefingPrelude[page].quest.type	=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title	=	String.Key("briefingPrelude[5].quest.title")
		briefingPrelude[page].quest.text	=	String.Key("briefingPrelude[5].quest.text")

		page_prelude = page

		StartBriefing(briefingPrelude)
	
	end

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------


createBriefingtrade1 = function()
            briefingtrade1                            =          {}          
            briefingtrade1.finished                   =          briefingtrade1Finished

            local page = 0                            
            page = page +1                         

            briefingtrade1[page]                      =          {}
            briefingtrade1[page].title                 =          String.Key("trade.title")
            briefingtrade1[page].text                 =          String.Key("trade1.text")
            briefingtrade1[page].position             =          GetPosition("trade1")

            StartBriefing(briefingtrade1)

            end

briefingtrade1Finished = function()

 

            end



-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------


createBriefingtrade2 = function()
            briefingtrade2                            =          {}          
            briefingtrade2.finished                   =          briefingtrade2Finished

            local page = 0                            
            page = page +1                         

            briefingtrade2[page]                      =          {}
            briefingtrade2[page].title                 =          String.Key("trade.title")
            briefingtrade2[page].text                 =          String.Key("trade2.text")
            briefingtrade2[page].position             =          GetPosition("trade2")

            StartBriefing(briefingtrade2)

            end

briefingtrade2Finished = function()

 

            end



