------------------------------------------------------------------------------------------------------------------
createBriefingPrelude = function()

	briefingPrelude = 	{}

	local page = 0

	--	page - objectives

		page = page +1

		briefingPrelude[page] 				= 	{}
		briefingPrelude[page].title			= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 		= 	GetPosition("braveheart")
		briefingPrelude[page].text			=	String.Key("briefing.text")

		briefingPrelude[page].quest			=	{}
		briefingPrelude[page].quest.id		=	1
		briefingPrelude[page].quest.type	=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title	=	String.Key("briefing[1].quest.title")
		briefingPrelude[page].quest.text	=	String.Key("briefing[1].quest.text")

		page_prelude = page

		StartBriefing(briefingPrelude)

	end
------------------------------------------------------------------------------------------------------------------
function createBriefing2ndQuest()

	briefing2ndQuest = 	{}

	local page = 0

	--	page - destroy castle 1

        if IsDead("p3castle") == false then

    		page = page +1

    		briefing2ndQuest[page] 				= 	{}
    		briefing2ndQuest[page].title		= 	String.Key("briefingQ2")
    		briefing2ndQuest[page].position 	= 	GetPosition("p3castle")
    		briefing2ndQuest[page].text			=	String.Key("briefingQ2.text")
    		briefing2ndQuest[page].explore		=	2000

            end

	--	page - destroy castle 2

        if IsDead("p4_castle1") == false then

    		page = page +1

    		briefing2ndQuest[page] 				= 	{}
    		briefing2ndQuest[page].title		= 	String.Key("briefingQ2")
    		briefing2ndQuest[page].position 	= 	GetPosition("p4_castle1")
    		briefing2ndQuest[page].text			=	String.Key("briefingQ2.text")
    		briefing2ndQuest[page].explore		=	2000

            end

	--	page - destroy castle 3

        if IsDead("p4_castle2") == false then

    		page = page +1

    		briefing2ndQuest[page] 				= 	{}
    		briefing2ndQuest[page].title		= 	String.Key("briefingQ2")
    		briefing2ndQuest[page].position 	= 	GetPosition("p4_castle2")
    		briefing2ndQuest[page].text			=	String.Key("briefingQ2.text")
    		briefing2ndQuest[page].explore		=	2000

    		page_prelude = page

            end

	--	page

        page = page +1

    	briefing2ndQuest[page] 				= 	{}
    	briefing2ndQuest[page].title		= 	String.GenericKey("MissionObjectives")
    	briefing2ndQuest[page].position 	= 	GetPosition("braveheart")

    	
    	briefing2ndQuest[page].text			=	String.Key("briefingQ4.text")



    	briefing2ndQuest[page].explore		=	2000

    	briefing2ndQuest[page].quest		=	{}
    	briefing2ndQuest[page].quest.id		=	2
    	briefing2ndQuest[page].quest.type	=	MAINQUEST_OPEN
    	briefing2ndQuest[page].quest.title	=	String.Key("briefingQ2")
    	briefing2ndQuest[page].quest.text	=	String.Key("briefingQ2.text")

    	briefing2ndQuestPage = page

    --  go!

	    StartBriefing(briefing2ndQuest)

	end
------------------------------------------------------------------------------------------------------------------
createBriefingMerchant1 = function()

	briefingMerchant1					= 	{}

	local page = 0

	page = page +1

	briefingMerchant1[page] 			= 	{}
	--briefingMerchant1[page].title		= 	String.Key("merchant1")
	briefingMerchant1[page].text		=	String.Key("merchant1.text")
	briefingMerchant1[page].position 	= 	GetPosition("merchant1")

	StartBriefing(briefingMerchant1)

	end
------------------------------------------------------------------------------------------------------------------
function createBriefing3rdQuest()

	briefing3rdquest = 	{}

	local page = 0

	--	page - destroy enemy4 castle 1

		page = page +1

		briefing3rdquest[page] 				= 	{}
		briefing3rdquest[page].title		= 	String.Key("briefingQ3")
		briefing3rdquest[page].position 	= 	GetPosition("p5_spawn1")
		briefing3rdquest[page].text			=	String.Key("briefingQ3[1].text")
		briefing3rdquest[page].explore		=	1000

	--	page - talk 2 Hermit

		page = page +1

		briefing3rdquest[page] 				= 	{}
		briefing3rdquest[page].position 	= 	GetPosition("rat")
		briefing3rdquest[page].text			=	String.Key("briefingQ3[2].text")
		briefing3rdquest[page].explore		=	2000


		briefing3rdquest[page].quest		=	{}
		briefing3rdquest[page].quest.id		=	3
		briefing3rdquest[page].quest.type	=	MAINQUEST_OPEN
		briefing3rdquest[page].quest.title	=	String.Key("briefingQ3")
		briefing3rdquest[page].quest.text	=	String.Key("briefingQ3[1].text")

		page_prelude = page

    --  go!

		StartBriefing(briefing3rdquest)

	end
------------------------------------------------------------------------------------------------------------------
function createGeneralBriefing(_position,_string, _title)

	briefingRat					= 	{}

	local page = 0

	page = page +1

	briefingRat[page] 			= 	{}
	if _title ~= nil then
		briefingRat[page].title		=	String.Key(_title)
	end
	briefingRat[page].text		=	String.Key(_string)
	briefingRat[page].position 	= 	GetPosition(_position)

	StartBriefing(briefingRat)

	end
------------------------------------------------------------------------------------------------------------------
function createViewBriefing(_position,_string)

	briefingRat					= 	{}

	local page = 0

	page = page +1

	briefingRat[page] 			= 	{}
	briefingRat[page].text		=	String.Key(_string)
	briefingRat[page].position 	= 	GetPosition(_position)
	briefingRat[page].explore	=	3500

	StartBriefing(briefingRat)

	end
------------------------------------------------------------------------------------------------------------------
function createBriefingWaterfall2(_position,_string)

	briefingRat					= 	{}

	local page = 0

	page = page +1

	briefingRat[page] 			= 	{}
	briefingRat[page].text		=	String.Key(_string)
	briefingRat[page].position 	= 	GetPosition(_position)
	briefingRat[page].explore	=	2500

	page = page +1

	briefingRat[page] 			= 	{}
	briefingRat[page].text		=	String.Key(_string)
	briefingRat[page].position 	= 	GetPosition("waterfall2_2")
	briefingRat[page].explore	=	2500

	StartBriefing(briefingRat)

	end

-----------4 the problem with completing q2 before 1

createGeneralBriefing1 = function(_position,_string)

	briefingRat					    = 	{}

	local page = 0

	page = page +1

	briefingRat[page] 			    = 	{}
	briefingRat[page].title		    =	String.Key("briefingQ2")
	briefingRat[page].text		    =	String.Key(_string)
	briefingRat[page].position 	    = 	GetPosition(_position)
	briefingRat[page].explore		=	2000

	briefingRat[page].quest			=	{}
	briefingRat[page].quest.id		=	1
	briefingRat[page].quest.type	=	MAINQUEST_OPEN
	briefingRat[page].quest.title	=	String.Key("briefingQ2")
	briefingRat[page].quest.text	=	String.Key("briefingQ2.text")

	page_prelude = page

	StartBriefing(briefingRat)

	end

createGeneralBriefing2= function(_position1,_string1,_position2,_string2)

	briefingRat					    = 	{}

	local page = 0

	page = page +1

	briefingRat[page] 			    = 	{}
	briefingRat[page].title		    =	String.Key("briefingQ2")
	briefingRat[page].text		    =	String.Key(_string1)
	briefingRat[page].position 	    = 	GetPosition(_position1)
	briefingRat[page].explore	    =	2000

	page = page +1

	briefingRat[page] 			    = 	{}
	briefingRat[page].title		    =	String.Key("briefingQ2")
	briefingRat[page].text		    =	String.Key(_string2)
	briefingRat[page].position 	    = 	GetPosition(_position2)
	briefingRat[page].explore	    =	2000

	briefingRat[page].quest			=	{}
	briefingRat[page].quest.id		=	1
	briefingRat[page].quest.type	=	MAINQUEST_OPEN
	briefingRat[page].quest.title	=	String.Key("briefingQ2")
	briefingRat[page].quest.text	=	String.Key("briefingQ2.text")

	page_prelude = page

	StartBriefing(briefingRat)

	end