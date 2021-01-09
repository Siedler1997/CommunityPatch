createBriefingPietrar = function ()


BriefingPietrar = 	{}

	BriefingPietrar.finished = BriefingPietrarFinished
	local price = (500 + 500 * 0.6 * CP_Difficulty)

	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingPietrar[page] 					= 	{}
		BriefingPietrar[page].title				= 	String.Key("BriefingPietrar.title") 
		BriefingPietrar[page].text				=	string.format(XGUIEng.GetStringTableText("CM06_01_RestoringTheFaith/BriefingPietrar.text"), price)
		BriefingPietrar[page].position				=	GetPosition("pietrar")
		--BriefingPietrar[page].explore				=	2000


	--	page 2
	
		page = page+1
	
		BriefingPietrar[page] 					= 	{}
		BriefingPietrar[page].title				= 	String.Key("BriefingPietrar[1].title") 
		BriefingPietrar[page].text				=	String.Key("BriefingPietrar[1].text")
		BriefingPietrar[page].position				=	GetPosition("brother1")
		BriefingPietrar[page].explore				=	6000

	--	page 2
	
		page = page+1
	
		BriefingPietrar[page] 					= 	{}
		BriefingPietrar[page].title				= 	String.Key("BriefingPietrar[2].title") 
		BriefingPietrar[page].text				=	String.Key("BriefingPietrar[2].text")
		BriefingPietrar[page].position				=	GetPosition("Dario")
		--BriefingPietrar[page].explore				=	6000

		BriefingPietrar[page].quest				=	{}
		BriefingPietrar[page].quest.id				=	3
		BriefingPietrar[page].quest.type	    		=	MAINQUEST_OPEN
		BriefingPietrar[page].quest.title			=	String.MainKey.."briefingPietrar[2].quest.title"
		BriefingPietrar[page].quest.text	    		=	String.MainKey.."briefingPietrar[2].quest.text"


briefingTerminatPietrar = BriefingPietrar[page]

StartBriefing(BriefingPietrar)
		
end
	
BriefingPietrarFinished = function()

ResolveBriefing(briefingTerminatpart2)
CreateNPCBrother()
local x,y=Tools.GetPosition("brother1")
GUI.CreateMinimapPulse(x,y)
	
end
