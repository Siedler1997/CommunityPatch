-------------------- Chapter IV quests 



----------- CApture the leader

createNPCLeader = function ()


local leader = {}
	leader.name = "leader"
	leader.callback  = leader4th


	CreateNPC(leader)

end


leader4th  = function()
local x,y=Tools.GetPosition("leader")
		GUI.DestroyMinimapPulse(x,y)
		--GUI.CreateMinimapMarker(x,y)
		local x,y=Tools.GetPosition("keep")
		GUI.CreateMinimapPulse(x,y)
		--GUI.CreateMinimapMarker(x,y)
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 8, 6, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Neutral )
	createBriefingDarioLeader()


end




------------- Gate Guard

createNPCGuard  = function()

local npc = {}
	npc.name = "guardone"
	npc.callback  = guardian


	CreateNPC(npc)

end


guardian  = function()

	createBriefingGuardian()


end



createBriefingGuardian = function()


BriefingGuardian = 	{}

	BriefingGuardian.finished = BriefingGuardianFinished


		local page = 0 

	--	page 1
	
		page = page + 1
	
		BriefingGuardian[page] 						= 	{}
		BriefingGuardian[page].title					= 	String.Key("BriefingGuardian[1].title") 
		BriefingGuardian[page].text					=	String.Key("BriefingGuardian[1].text")
		BriefingGuardian[page].position					=	GetPosition("Dario")
		--BriefingGuardian[page].explore				=	2000

	--	page 2
	
		page = page + 1
	
		BriefingGuardian[page] 						= 	{}
		BriefingGuardian[page].title					= 	String.Key("BriefingGuardian[2].title") 
		BriefingGuardian[page].text					=	String.Key("BriefingGuardian[2].text")
		BriefingGuardian[page].position					=	GetPosition("guardone")
		--BriefingGuardian[page].explore				=	6000

		
		
	
	

StartBriefing(BriefingGuardian)
		
end

	
BriefingGuardianFinished = function()

	MakeVulnerable("guardone")
	ReplaceEntity("gate2", Entities.XD_WallStraightGate)
	spawnTemplarArmy()
	TemplarsAppear()

end





--====================================================
TemplarsAppear = function()
BriefingTemplarsAppear = 	{}

	BriefingTemplarsAppear.finished = BriefingTemplarsAppearFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingTemplarsAppear[page] 						= 	{}
		BriefingTemplarsAppear[page].title					= 	String.Key("BriefingTemplarsAppear[1].title") 
		BriefingTemplarsAppear[page].text					=	String.Key("BriefingTemplarsAppear[1].text")
		BriefingTemplarsAppear[page].position					=	GetPosition("templarcav1")
		BriefingTemplarsAppear[page].explore					=	5000


	--	page 2
	
		page = page +1
	
		BriefingTemplarsAppear[page] 						= 	{}
		BriefingTemplarsAppear[page].title					= 	String.Key("BriefingTemplarsAppear[2].title") 
		BriefingTemplarsAppear[page].text					=	String.Key("BriefingTemplarsAppear[2].text")
		BriefingTemplarsAppear[page].position					=	GetPosition("Drake")
		--BriefingTemplarsAppear[page].explore					=	5000
	

briefingTerminatTemplarsAppear = BriefingTemplarsAppear[page]

StartBriefing(BriefingTemplarsAppear)
		
end

BriefingTemplarsAppearFinished = function()


end


------------ Hermit 

createNPCHermit = function()

loner = CreateEntity(8,Entities.PU_Serf,GetPosition("hermit"),"Hermit")

local hermit  = {}
	hermit.name = "Hermit"
	hermit.callback  = Hermit


	CreateNPC(hermit)

end


Hermit = function()
	local x,y=Tools.GetPosition("Hermit")
	GUI.DestroyMinimapPulse(x,y)
	createBriefingHermit()


end


createBriefingHermit = function ()
BriefingHermit = 	{}

	BriefingHermit.finished = BriefingHermitFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[1].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[1].text")
		BriefingHermit[page].position					=	GetPosition("Hermit")
		BriefingHermit[page].explore					=	5000


	--	page 2
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[2].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[2].text")
		BriefingHermit[page].position					=	GetPosition("Dario")
		--BriefingHermit[page].explore					=	5000
	

	--	page 3
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[3].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[3].text")
		BriefingHermit[page].position					=	GetPosition("Hermit")
		--BriefingHermit[page].explore					=	5000


	--	page 4
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[4].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[4].text")
		BriefingHermit[page].position					=	GetPosition("Dario")
		--BriefingHermit[page].explore					=	5000


	--	page 5
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[5].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[5].text")
		BriefingHermit[page].position					=	GetPosition("Hermit")
		--BriefingHermit[page].explore					=	5000



	--	page 6
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[6].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[6].text")
		BriefingHermit[page].position					=	GetPosition("Dario")
		--BriefingHermit[page].explore					=	5000


	--	page 7
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[7].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[7].text")
		BriefingHermit[page].position					=	GetPosition("Hermit")
		--BriefingHermit[page].explore					=	5000


	--	page 8
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[8].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[8].text")
		BriefingHermit[page].position					=	GetPosition("Dario")
		--BriefingHermit[page].explore					=	5000



	--	page 9
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[9].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[9].text")
		BriefingHermit[page].position					=	GetPosition("Hermit")
		--BriefingHermit[page].explore					=	5000



	--	page 10
	
		page = page +1
	
		BriefingHermit[page] 						= 	{}
		BriefingHermit[page].title					= 	String.Key("BriefingHermit[10].title") 
		BriefingHermit[page].text					=	String.Key("BriefingHermit[10].text")
		BriefingHermit[page].position					=	GetPosition("Dario")
		--BriefingHermit[page].explore					=	5000




briefingTerminatHermit = BriefingHermit[page]

StartBriefing(BriefingHermit)
		
end

BriefingHermitFinished = function()

StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)
end
