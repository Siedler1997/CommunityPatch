createBriefingBandits2_prisonner = function()

	briefingBandits2				= 	{}	
	briefingBandits2.restoreCamera 	= true                                
                                
	local page = 0                  	
                                    	
	page = page +1                  	
                                    	
	briefingBandits2[page] 			= 	{}
	briefingBandits2[page].title	= 	String.Key("pirates2.title")
	briefingBandits2[page].text		=	String.Key("pirates2.prisonner")
	briefingBandits2[page].position = 	GetPosition("pirateleader")

	page = page +1                  	
                                    	
	briefingBandits2[page] 			= 	{}
	briefingBandits2[page].title	= 	String.Key("pirates2.title")
	briefingBandits2[page].text		=	String.Key("pirates2[3].text")
	briefingBandits2[page].position = 	GetPosition("cave1")
	briefingBandits2[page].explore 	= 	1500
	
	briefingBandits2ShowCave		=	briefingBandits2[page]

	StartBriefing(briefingBandits2)
	
end