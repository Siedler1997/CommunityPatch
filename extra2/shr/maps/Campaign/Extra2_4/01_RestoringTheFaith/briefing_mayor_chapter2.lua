-----------------------------------------
----- Mayor second chapter briefing -----
---




createBriefingMayorChapter2 = function ()



BriefingMayorChapter2 = 	{}
BriefingMayorChapter2.finished = BriefingMayorChapter2Finished


local page=0	

	--	page 1
	
		page = page +1
	
		BriefingMayorChapter2[page] 					= 	{}
		BriefingMayorChapter2[page].title				= 	String.Key("BriefingMayorChapter2[1].title") 
		BriefingMayorChapter2[page].text				=	String.Key("BriefingMayorChapter2[1].text")
		BriefingMayorChapter2[page].position				=	GetPosition("Dario")
		--BriefingMayorChapter2[page].explore				=	2000


	--	page 2
	
		page = page+1
	
		BriefingMayorChapter2[page] 					= 	{}
		BriefingMayorChapter2[page].title				= 	String.Key("BriefingMayorChapter2[2].title") 
		BriefingMayorChapter2[page].text				=	String.Key("BriefingMayorChapter2[2].text")
		BriefingMayorChapter2[page].position				=	GetPosition("Primaru")
		--BriefingMayorChapter2[page].explore				=	2000

		
		
		BriefingMayorChapter2[page].quest				=	{}
		BriefingMayorChapter2[page].quest.id				=	4
		BriefingMayorChapter2[page].quest.type	    			=	MAINQUEST_OPEN
		BriefingMayorChapter2[page].quest.title				=	String.MainKey.."briefingMayorChapter2.quest.title"
		BriefingMayorChapter2[page].quest.text	    			=	String.MainKey.."briefingMayorChapter2.quest.text"


briefingTerminatMayorChapter2 = BriefingMayorChapter2[page]

StartBriefing(BriefingMayorChapter2)
		
end

	


BriefingMayorChapter2Finished = function()
LeaderNeutral()
end	


------------------------------------------------
----- Mayor second chapter ending briefing -----

createBriefingEnd2ndChapter = function ()



BriefingEnd2ndChapter = 	{}
BriefingEnd2ndChapter.finished = BriefingEnd2ndChapterFinished


local page=0	

	--	page 1
	
		page = page +1
	
		BriefingEnd2ndChapter[page] 					= 	{}
		BriefingEnd2ndChapter[page].title				= 	String.Key("BriefingEnd2ndChapter[1].title") 
		BriefingEnd2ndChapter[page].text				=	String.Key("BriefingEnd2ndChapter[1].text")
		BriefingEnd2ndChapter[page].position				=	GetPosition("Dario")
		--BriefingEnd2ndChapter[page].explore				=	2000


	--	page 2
	
		page = page+1
	
		BriefingEnd2ndChapter[page] 					= 	{}
		BriefingEnd2ndChapter[page].title				= 	String.Key("BriefingEnd2ndChapter[2].title") 
		BriefingEnd2ndChapter[page].text				=	String.Key("BriefingEnd2ndChapter[2].text")
		BriefingEnd2ndChapter[page].position				=	GetPosition("Primaru")
		--BriefingEnd2ndChapter[page].explore				=	2000

		
		
		BriefingEnd2ndChapter[page].quest				=	{}
		BriefingEnd2ndChapter[page].quest.id				=	5
		BriefingEnd2ndChapter[page].quest.type	    			=	MAINQUEST_OPEN
		BriefingEnd2ndChapter[page].quest.title				=	String.MainKey.."BriefingEnd2ndChapter.quest.title"
		BriefingEnd2ndChapter[page].quest.text	    			=	String.MainKey.."BriefingEnd2ndChapter.quest.text"


briefingTerminatBriefingEnd2ndChapter = BriefingEnd2ndChapter[page]

StartBriefing(BriefingEnd2ndChapter)
		
end

	


BriefingEnd2ndChapterFinished = function()
ResolveBriefing(briefingTerminatMayorChapter2)

Start3rdChapter()
end	



------------------------------------------------
----- Mayor third chapter ending briefing -----

createBriefingMayorChapter3end = function ()



BriefingMayorChapter3end = 	{}
BriefingMayorChapter3end.finished = BriefingMayorChapter3endFinished


local page = 0	

	--	page 1
	
		page = page +1
	
		BriefingMayorChapter3end[page] 					= 	{}
		BriefingMayorChapter3end[page].title				= 	String.Key("BriefingMayorChapter3end[1].title") 
		BriefingMayorChapter3end[page].text				=	String.Key("BriefingMayorChapter3end[1].text")
		BriefingMayorChapter3end[page].position				=	GetPosition("Dario")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000


	--	page 2
	
		page = page+1
	
		BriefingMayorChapter3end[page] 					= 	{}
		BriefingMayorChapter3end[page].title				= 	String.Key("BriefingMayorChapter3end[2].title") 
		BriefingMayorChapter3end[page].text				=	String.Key("BriefingMayorChapter3end[2].text")
		BriefingMayorChapter3end[page].position				=	GetPosition("Bombjack")
		BriefingMayorChapter3end[page].explore				=	2000

	--	page 2
	
		page = page+1
	
		BriefingMayorChapter3end[page] 					= 	{}
		BriefingMayorChapter3end[page].title				= 	String.Key("BriefingMayorChapter3end[3].title") 
		if CP_Difficulty == 0 then
			BriefingMayorChapter3end[page].text				=	String.Key("BriefingMayorChapter3end[3].text")
		else
			BriefingMayorChapter3end[page].text				=	String.Key("BriefingMayorChapter3end[3].text2")
		end
		BriefingMayorChapter3end[page].position				=	GetPosition("Primaru")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000

	--	page 2
	
		page = page+1
	
		BriefingMayorChapter3end[page] 					= 	{}
		BriefingMayorChapter3end[page].title				= 	String.Key("BriefingMayorChapter3end[4].title") 
		BriefingMayorChapter3end[page].text				=	String.Key("BriefingMayorChapter3end[4].text")
		BriefingMayorChapter3end[page].position				=	GetPosition("Dario")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000

	--	page 2
	
		page = page+1
	
		BriefingMayorChapter3end[page] 					= 	{}
		BriefingMayorChapter3end[page].title				= 	String.Key("BriefingMayorChapter3end[5].title") 
		BriefingMayorChapter3end[page].text				=	String.Key("BriefingMayorChapter3end[5].text")
		BriefingMayorChapter3end[page].position				=	GetPosition("Primaru")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000


	--	page 2
	
		page = page+1
	
		BriefingMayorChapter3end[page] 					= 	{}
		BriefingMayorChapter3end[page].title				= 	String.Key("BriefingMayorChapter3end[6].title") 
		BriefingMayorChapter3end[page].text				=	String.Key("BriefingMayorChapter3end[6].text")
		BriefingMayorChapter3end[page].position				=	GetPosition("Dario")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000
		
		BriefingMayorChapter3end[page].quest				=	{}
		BriefingMayorChapter3end[page].quest.id				=	6
		BriefingMayorChapter3end[page].quest.type	    		=	MAINQUEST_OPEN
		BriefingMayorChapter3end[page].quest.title			=	String.MainKey.."briefingEnd3rdChapter.quest.title"
		if CP_Difficulty == 0 then
			BriefingMayorChapter3end[page].quest.text	    		=	String.MainKey.."briefingEnd3rdChapter.quest.text"
		else
			BriefingMayorChapter3end[page].quest.text	    		=	String.MainKey.."briefingEnd3rdChapter.quest.text2"
		end
		

briefingTerminatBriefingMayorChapter3end = BriefingMayorChapter3end[page]

StartBriefing(BriefingMayorChapter3end)

		
end

	


BriefingMayorChapter3endFinished = function()
ResolveBriefing(briefingTerminatBriefingEnd2ndChapter)
Start4thChapter()
local x,y=Tools.GetPosition("Bombjack")
GUI.CreateMinimapPulse(x,y)
end	



------------------------------------------------
----- Mayor fourth chapter ending briefing -----

createBriefingMayorChapter4end = function ()



BriefingMayorChapter4end = 	{}
BriefingMayorChapter4end.finished = BriefingMayorChapter4endFinished


local page=0	

	--	page 1
	
		page = page +1
	
		BriefingMayorChapter4end[page] 					= 	{}
		BriefingMayorChapter4end[page].title				= 	String.Key("BriefingMayorChapter4end[1].title") 
		BriefingMayorChapter4end[page].text				=	String.Key("BriefingMayorChapter4end[1].text")
		BriefingMayorChapter4end[page].position				=	GetPosition("Dario")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000


	--	page 2
	
		page = page+1
	
		BriefingMayorChapter4end[page] 					= 	{}
		BriefingMayorChapter4end[page].title				= 	String.Key("BriefingMayorChapter4end[2].title") 
		BriefingMayorChapter4end[page].text				=	string.format(XGUIEng.GetStringTableText("CM06_01_RestoringTheFaith/BriefingMayorChapter4end[2].text"), (1000 + 1000 * 0.5 * CP_Difficulty))
		BriefingMayorChapter4end[page].position				=	GetPosition("Primaru")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000

	--	page 2
	
		page = page+1
	
		BriefingMayorChapter4end[page] 					= 	{}
		BriefingMayorChapter4end[page].title				= 	String.Key("BriefingMayorChapter4end[3].title") 
		BriefingMayorChapter4end[page].text				=	String.Key("BriefingMayorChapter4end[3].text")
		BriefingMayorChapter4end[page].position				=	GetPosition("Primaru")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000


	--	page 2
	
		page = page+1
	
		BriefingMayorChapter4end[page] 					= 	{}
		BriefingMayorChapter4end[page].title				= 	String.Key("BriefingMayorChapter4end[4].title") 
		BriefingMayorChapter4end[page].text				=	string.format(XGUIEng.GetStringTableText("CM06_01_RestoringTheFaith/BriefingMayorChapter4end[4].text"), (1000 + 1000 * 0.5 * CP_Difficulty))
		BriefingMayorChapter4end[page].position				=	GetPosition("Primaru")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000


		BriefingMayorChapter4end[page].quest				=	{}
		BriefingMayorChapter4end[page].quest.id				=	7
		BriefingMayorChapter4end[page].quest.type	    			=	MAINQUEST_OPEN
		BriefingMayorChapter4end[page].quest.title				=	String.MainKey.."briefingEnd4ndChapter.quest.title"
		BriefingMayorChapter4end[page].quest.text	    			=	string.format(XGUIEng.GetStringTableText("CM06_01_RestoringTheFaith/briefingEnd4ndChapter.quest.text"), (1000 + 1000 * 0.5 * CP_Difficulty))
		
		

briefingTerminatBriefingMayorChapter4end = BriefingMayorChapter4end[page]

StartBriefing(BriefingMayorChapter4end)
		
end

	


BriefingMayorChapter4endFinished = function()
ResolveBriefing(briefingTerminatBriefingMayorChapter3end)
Start5thChapter()
end	




------------------------------------------------
----- Mayor fifth chapter ending briefing -----


createBriefingMayorChapter5end = function ()



BriefingMayorChapter5end = 	{}
BriefingMayorChapter5end.finished = BriefingMayorChapter5endFinished


local page=0	

	--	page 1
	
		page = page +1
	
		BriefingMayorChapter5end[page] 					= 	{}
		BriefingMayorChapter5end[page].title				= 	String.Key("BriefingMayorChapter5end[1].title") 
		BriefingMayorChapter5end[page].text				=	String.Key("BriefingMayorChapter5end[1].text")
		BriefingMayorChapter5end[page].position				=	GetPosition("Dario")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000


	--	page 2
	
		page = page+1
	
		BriefingMayorChapter5end[page] 					= 	{}
		BriefingMayorChapter5end[page].title				= 	String.Key("BriefingMayorChapter5end[2].title") 
		BriefingMayorChapter5end[page].text				=	String.Key("BriefingMayorChapter5end[2].text")
		BriefingMayorChapter5end[page].position				=	GetPosition("Primaru")
		--BriefingBriefingMayorChapter3end[page].explore		=	2000

		
		
		

briefingTerminatBriefingMayorChapter5end = BriefingMayorChapter5end[page]

StartBriefing(BriefingMayorChapter5end)
		
end

	


BriefingMayorChapter5endFinished = function()
StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)
end	