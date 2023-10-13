spawnHelias = function ()

	Helias = CreateEntity(8,Entities.PU_Hero6,GetPosition("CUTSCENE_INTRO_E2"),"Helias")
	MakeInvulnerable("Helias")
end



createNpcHelias2 = function ()

	local npc	= {}
	npc.name = "Helias"
	npc.callback  = BriefingSecondMiracle


	CreateNPC(npc)


end


BriefingSecondMiracle = function()

BriefingSecondMiracle= {}
BriefingSecondMiracle.finished = BriefingSecondMiracleFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingSecondMiracle[page] 						= 	{}
		BriefingSecondMiracle[page].title					= 	String.Key("BriefingSecondMiracle[1].title") 
		BriefingSecondMiracle[page].text					=	String.Key("BriefingSecondMiracle[1].text")
		BriefingSecondMiracle[page].position					=	GetPosition("Helias")
		--BriefingSecondMiracle[page].explore					=	10000


	--	page 2
	
		page = page +1
	
		BriefingSecondMiracle[page] 						= 	{}
		BriefingSecondMiracle[page].title					= 	String.Key("BriefingSecondMiracle[2].title") 
		BriefingSecondMiracle[page].text					=	String.Key("BriefingSecondMiracle[2].text")
		BriefingSecondMiracle[page].position					=	GetPosition("Dario")
		--BriefingSecondMiracle[page].explore					=	10000


	--	page 3
	
		page = page +1
	
		BriefingSecondMiracle[page] 						= 	{}
		BriefingSecondMiracle[page].title					= 	String.Key("BriefingSecondMiracle[3].title") 
		BriefingSecondMiracle[page].text					=	String.Key("BriefingSecondMiracle[3].text")
		BriefingSecondMiracle[page].position					=	GetPosition("path2")
		BriefingSecondMiracle[page].explore					=	2000
	
	--	page 4
	
		page = page +1
	
		BriefingSecondMiracle[page] 						= 	{}
		BriefingSecondMiracle[page].title					= 	String.Key("BriefingSecondMiracle[4].title") 
		BriefingSecondMiracle[page].text					=	String.Key("BriefingSecondMiracle[4].text")
		BriefingSecondMiracle[page].position					=	GetPosition("Dario")
		--BriefingSecondMiracle[page].explore					=	10000


		BriefingSecondMiracle[page].quest					=	{}
		BriefingSecondMiracle[page].quest.id					=	3
		BriefingSecondMiracle[page].quest.type	    				=	MAINQUEST_OPEN
		BriefingSecondMiracle[page].quest.title					=	String.MainKey.."briefingSecondMiracle.quest.title"
		BriefingSecondMiracle[page].quest.text	    				=	String.MainKey.."briefingSecondMiracle.quest.text"
	
		
briefingTerminatSecondMiracle = BriefingSecondMiracle[page]

StartBriefing(BriefingSecondMiracle)

end


BriefingSecondMiracleFinished = function()

StartSimpleJob("IsDarioNearSummon")


end


IsDarioNearSummon = function ()

if IsNear("Dario","dariosummons",500) then 
createBriefingSummonKeeper()
return true
end
end