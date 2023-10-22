createBriefingIntro = function ()
	LookAt("Helias","Priest")
	LookAt("Drake","Priest")

BriefingIntro = 	{}

	BriefingIntro.finished = BriefingIntroFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingIntro[page] 					= 	{}
		BriefingIntro[page].title				= 	String.Key("BriefingIntro[1].title") 
		BriefingIntro[page].text				=	String.Key("BriefingIntro[1].text")
		BriefingIntro[page].position				=	GetPosition("Priest")
		--BriefingIntro[page].explore				=	10000


	
		--	page 2
		page = page +1
	
	
		BriefingIntro[page] 					= 	{}
		BriefingIntro[page].title				= 	String.Key("BriefingIntro[2].title") 
		BriefingIntro[page].text				=	String.Key("BriefingIntro[2].text")
		BriefingIntro[page].position				=	GetPosition("Dario")
		BriefingIntro[page].explore				=	1000


		page = page +1
		--	page 3
	
	
		BriefingIntro[page] 					= 	{}
		BriefingIntro[page].title				= 	String.Key("BriefingIntro[3].title") 
		BriefingIntro[page].text				=	String.Key("BriefingIntro[3].text")
		BriefingIntro[page].position				=	GetPosition("Ragnar")
		BriefingIntro[page].explore				=	2000





briefingTerminatIntro = BriefingIntro[page]

StartBriefing(BriefingIntro)
		
end


BriefingIntroFinished = function ()

createNpcRagnarCh1()
	LookAt("Helias","Drake")
	LookAt("Drake","Helias")
	DestroyEntity("Priest")
end