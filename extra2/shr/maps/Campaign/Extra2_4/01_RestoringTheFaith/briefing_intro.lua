function createBriefingChapterI()

-- createBriefingChapterI = function()

	briefingIntro = 	{}

	briefingIntro.finished = BriefingIntroFinished


		local page = 0

	--	page 1
	
		page = page +1
	
		briefingIntro[page] 				= 	{}
		briefingIntro[page].title			= 	String.Key("briefingIntro[1].title") 
		briefingIntro[page].text			=	String.Key("briefingIntro[1].text")
		briefingIntro[page].position			=	GetPosition("Primaru")
		--briefingIntro[page].explore			=	2000

	--	page 2
	
		page = page +1
	
		briefingIntro[page] 				= 	{}
		briefingIntro[page].title			= 	String.Key("briefingIntro[2].title") 
		briefingIntro[page].text			=	String.Key("briefingIntro[2].text")
		briefingIntro[page].position			=	GetPosition("defense1")
		briefingIntro[page].explore			=	5000
		



	

	--	page 4
	
		page = page +1
	
		briefingIntro[page] 				= 	{}
		briefingIntro[page].title			= 	String.Key("briefingIntro[3].title") 
		briefingIntro[page].text			=	String.Key("briefingIntro[3].text")
		briefingIntro[page].position			=	GetPosition("ruin")
		--briefingIntro[page].explore			=	2000

	--	page 5
	
		page = page +1
	
		briefingIntro[page] 				= 	{}
		briefingIntro[page].title			= 	String.Key("briefingIntro[4].title") 
		briefingIntro[page].text			=	String.Key("briefingIntro[4].text")
		briefingIntro[page].position			=	GetPosition("Primaru")
		--briefingIntro[page].explore			=	5000

	--	page 6
	
		page = page +1
	
		briefingIntro[page] 				= 	{}
		briefingIntro[page].title			= 	String.Key("briefingIntro[6].title") 
		briefingIntro[page].text			=	String.Key("briefingIntro[6].text")
		briefingIntro[page].position			=	GetPosition("Primaru")
		--briefingIntro[page].explore			=	5000

	--	page 6
	
		page = page +1
	
		briefingIntro[page] 				= 	{}
		briefingIntro[page].title			= 	String.Key("briefingIntro[6].title") 
		briefingIntro[page].text			=	String.Key("briefingIntro[6].text")
		briefingIntro[page].position			=	GetPosition("Primaru")
		--briefingIntro[page].explore			=	5000
	
	

		
		briefingIntro[page].quest			=	{}
		briefingIntro[page].quest.id			=	1
		briefingIntro[page].quest.type	    		=	MAINQUEST_OPEN
		briefingIntro[page].quest.title			=	String.MainKey.."briefingIntro[1].quest.title"
		briefingIntro[page].quest.text	    		=	String.MainKey.."briefingIntro[1].quest.text"


		
		
                briefingTerminat = briefingIntro[page]
	
		StartBriefing(briefingIntro)
		
end
	
BriefingIntroFinished = function()
	createBriefingChapterIpart2()
	
	if CP_Difficulty == 0 then
		AddGold(1500)
		AddStone(600)
		AddWood(1000)
	end
	SetHealth("ruin",25)
end

createBriefingChapterIpart2 = function()




------------------------------
----- part 2 of first briefing - made to create the quest to talk to the bombs guy



briefingIntropart2 = 	{}

	briefingIntropart2.finished = BriefingIntropart2Finished



local page = 0
page = page +1
	
		briefingIntropart2[page] 				= {}
		briefingIntropart2[page].title				= String.Key("briefingIntro2[1].title") 
		briefingIntropart2[page].text				= String.Key("briefingIntro2[1].text")
		briefingIntropart2[page].position			= GetPosition("pietrar")
		-- briefingIntro[page].explore				= 2000


		briefingIntropart2[page].quest			=	{}
		briefingIntropart2[page].quest.id			=	2
		briefingIntropart2[page].quest.type	    		=	MAINQUEST_OPEN
		briefingIntropart2[page].quest.title			=	String.MainKey.."briefingIntro2[1].quest.title"
		briefingIntropart2[page].quest.text	    		=	String.MainKey.."briefingIntro2[1].quest.text"

briefingTerminatpart2 = briefingIntropart2[page]

StartBriefing(briefingIntropart2)


end


BriefingIntropart2Finished = function()


	
end