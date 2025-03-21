
createBriefingReinforcementArrives = function()

	briefingReinforcementArrives = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingReinforcementArrives[page] 			= 	{}
		briefingReinforcementArrives[page].title	= 	String.GenericKey("Mentor")
		briefingReinforcementArrives[page].text		=	String.Key("briefingReinforcementArrives[1].text")
		briefingReinforcementArrives[page].position	=	GetPosition("deployEnd1")
		briefingReinforcementArrives[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefingReinforcementArrives[page] 			= 	{}
		briefingReinforcementArrives[page].title	= 	String.GenericKey("Mentor")
		briefingReinforcementArrives[page].text		=	String.Key("briefingReinforcementArrives[2].text")
		briefingReinforcementArrives[page].position	=	GetPosition("deployEnd2")
		briefingReinforcementArrives[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingReinforcementArrives)
		
	end
	
	
createBriefingReinforcementArrives2 = function()

	briefingReinforcementArrives2 = 	{}	

	briefingReinforcementArrives2.restoreCamera = true

	local page = 0

	--	page
	
		page = page +1
	
		briefingReinforcementArrives2[page] 			= 	{}
		briefingReinforcementArrives2[page].title		= 	String.GenericKey("Dovbar")
		briefingReinforcementArrives2[page].text		=	String.Key("briefingReinforcementArrives[3].text")
		briefingReinforcementArrives2[page].position	=	GetPosition("supportB3")
		briefingReinforcementArrives2[page].explore		=	1000

	--	go!
	
		StartBriefing(briefingReinforcementArrives2)
		
	end