spawnDrake = function()

Drake = CreateEntity(8,Entities.PU_Hero10,GetPosition("CUTSCENE_INTRO_E1"),"Drake")
MakeInvulnerable("Drake")

end


createNpcDrakeLast = function()

	local npc	= {}
	npc.name = "Drake"
	npc.callback  = BriefingFinal


	CreateNPC(npc)


end


BriefingFinal = function ()

BriefingFinal= {}
BriefingFinal.finished = BriefingFinalFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingFinal[page] 						= 	{}
		BriefingFinal[page].title					= 	String.Key("BriefingFinal[1].title") 
		BriefingFinal[page].text					=	String.Key("BriefingFinal[1].text")
		BriefingFinal[page].position					=	GetPosition("Drake")
		--BriefingFinal[page].explore					=	1000


	--	page 2
	
		page = page +1
	
		BriefingFinal[page] 						= 	{}
		BriefingFinal[page].title					= 	String.Key("BriefingFinal[2].title") 
		BriefingFinal[page].text					=	String.Key("BriefingFinal[2].text")
		BriefingFinal[page].position					=	GetPosition("Dario")
		--BriefingFinal[page].explore					=	1000

	--	page 3
	
		page = page +1
	
		BriefingFinal[page] 						= 	{}
		BriefingFinal[page].title					= 	String.Key("BriefingFinal[3].title") 
		BriefingFinal[page].text					=	String.Key("BriefingFinal[3].text")
		BriefingFinal[page].position					=	GetPosition("Drake")
		--BriefingFinal[page].explore					=	1000

	--	page 4
	
		page = page +1
	
		BriefingFinal[page] 						= 	{}
		BriefingFinal[page].title					= 	String.Key("BriefingFinal[4].title") 
		BriefingFinal[page].text					=	String.Key("BriefingFinal[4].text")
		BriefingFinal[page].position					=	GetPosition("Drake")
		--BriefingFinal[page].explore					=	1000

	--	page 5
	
		page = page +1
	
		BriefingFinal[page] 						= 	{}
		BriefingFinal[page].title					= 	String.Key("BriefingFinal[5].title") 
		BriefingFinal[page].text					=	String.Key("BriefingFinal[5].text")
		BriefingFinal[page].position					=	GetPosition("Dario")
		--BriefingFinal[page].explore					=	1000
	
	
		
briefingTerminatFinal = BriefingFinal[page]

StartBriefing(BriefingFinal)




end


BriefingFinalFinished = function ()

StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],victory)


end

victory = function()

Victory()
end



createBriefingDrakeEnter = function()

BriefingDrakeEnter= {}
BriefingDrakeEnter.finished = BriefingDrakeEnterFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingDrakeEnter[page] 							= 	{}
		BriefingDrakeEnter[page].title							= 	String.Key("BriefingDrakeEnter[1].title") 
		BriefingDrakeEnter[page].text							=	String.Key("BriefingDrakeEnter[1].text")
		BriefingDrakeEnter[page].position						=	GetPosition("keep1")
		--BriefingDrakeEnter[page].explore						=	2000

	--	page 2
	
		page = page +1
	
		BriefingDrakeEnter[page] 							= 	{}
		BriefingDrakeEnter[page].title							= 	String.Key("BriefingDrakeEnter[2].title") 
		BriefingDrakeEnter[page].text							=	String.Key("BriefingDrakeEnter[2].text")
		BriefingDrakeEnter[page].position						=	GetPosition("keep1")
		--BriefingDrakeEnter[page].explore						=	2000

briefingTerminatDrakeEnter = BriefingDrakeEnter[page]

StartBriefing(BriefingDrakeEnter)

end

BriefingDrakeEnterFinished=  function()
createBriefingDrakeEnforce()


end