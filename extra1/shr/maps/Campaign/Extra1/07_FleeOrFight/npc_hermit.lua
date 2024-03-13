
function CreateNPCHermit()
	-- setup table for npc
	NPCHermit			=	{}
	NPCHermit.name 		=	"P6_Hermit_NPC"
	NPCHermit.callback	=	CreateNPCHermitBriefing
	        
	-- create npc
	CreateNPC(NPCHermit)
	
	local markerPos1 = GetPosition("FireSignalPos1")
	GUI.CreateMinimapMarker(markerPos1.X, markerPos1.Y, 1)
end

function CreateNPCHermitBriefing()

	NPCHermitBriefing					=	{}
	NPCHermitBriefing.restoreCamera		=	true
	NPCHermitBriefing.finished			=	NPCHermitBriefingFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		NPCHermitBriefing[page] 							= 	{}
		NPCHermitBriefing[page].mc							= 	{}
		NPCHermitBriefing[page].mc.title					= 	String.Key("NPCHermitBriefing[1].mc.title")
		NPCHermitBriefing[page].mc.text						=	String.Key("NPCHermitBriefing[1].mc.text")
		
		NPCHermitBriefing[page].mc.firstText				=	String.Key("NPCHermitBriefing[1].mc.firstText")
		NPCHermitBriefing[page].mc.firstSelectedCallback	=	NPCHermitFirstSelected
	
		NPCHermitBriefing[page].mc.secondText				=	String.Key("NPCHermitBriefing[1].mc.secondText")
		NPCHermitBriefing[page].mc.secondSelected			=	7
		
		NPCHermitBriefing[page].position 					=	GetPosition("P6_Hermit_NPC")
		NPCHermitBriefing[page].dialogCamera				=	true

		NPCHermitBriefingMC									=	NPCHermitBriefing[page]
		

	--	page 2
	
		page = page +1
	
		NPCHermitBriefing[page] 					= 	{}
		NPCHermitBriefing[page].title				= 	String.Key("NPCHermitBriefing[2].title")
		NPCHermitBriefing[page].text				=	String.Key("NPCHermitBriefing[2].text")
		
		NPCHermitBriefing[page].position 			=	GetPosition("FireSignalPos1")
		NPCHermitBriefing[page].explore 			=	1000

	--	page 3
		--[[
		page = page +1
	
		NPCHermitBriefing[page] 					= 	{}
		NPCHermitBriefing[page].title				= 	String.Key("NPCHermitBriefing[2].title")
		NPCHermitBriefing[page].text				=	String.Key("NPCHermitBriefing[3].text")
		
		NPCHermitBriefing[page].position 			=	GetPosition("FireSignalPos2")
		NPCHermitBriefing[page].marker				=	ANIMATED_MARKER
		NPCHermitBriefing[page].noScrolling			=	true
		
		NPCHermitBriefingShowFirePos2				=	NPCHermitBriefing[page]
		--]]	
		
	--	page 4
		
		page = page +2
	
		NPCHermitBriefing[page] 					= 	{}
		NPCHermitBriefing[page].title				= 	String.Key("NPCHermitBriefing[2].title")
		NPCHermitBriefing[page].text				=	String.Key("NPCHermitBriefing[5].text")
		
		NPCHermitBriefing[page].position 			=	GetPosition("P6_Hermit_NPC")

	--	page 5

		page = page +1

		NPCHermitBriefing[page] 					= 	{}
		NPCHermitBriefing[page].title				= 	String.Key("NPCHermitBriefing[2].title")
		NPCHermitBriefing[page].text				=	String.Key("NPCHermitBriefing[6].text")

		NPCHermitBriefing[page].position 			=	GetPosition("IronPit")
		NPCHermitBriefing[page].marker				=	STATIC_MARKER
		NPCHermitBriefing[page].noScrolling			=	true
		
		NPCHermitBriefingShowIronMine1				=	NPCHermitBriefing[page]
	
	--	page 7
		
		page = page +2
	
		NPCHermitBriefing[page] 					= 	{}
		NPCHermitBriefing[page].title				= 	String.Key("NPCHermitBriefing[2].title")
		NPCHermitBriefing[page].text				=	String.Key("NPCHermitBriefing[8].text")
		
		NPCHermitBriefing[page].position 			=	GetPosition("P6_Hermit_NPC")

	--	page 8
	
		page = page +1

		NPCHermitBriefing[page] 					= 	{}
		NPCHermitBriefing[page].title				= 	String.Key("NPCHermitBriefing[2].title")
		NPCHermitBriefing[page].text				=	String.Key("NPCHermitBriefing[9].text")

		NPCHermitBriefing[page].position 			=	GetPosition("IronPit")
		NPCHermitBriefing[page].marker				=	STATIC_MARKER
		NPCHermitBriefing[page].noScrolling			=	true
		
		NPCHermitBriefingShowIronMine2				=	NPCHermitBriefing[page]
		
	--	go
	
	StartBriefing(NPCHermitBriefing)
end

function NPCHermitFirstSelected()

	-- Enough money
	if GetIron() >= 2000 then

		-- Paid
		AddIron(-2000)
		
		-- enlight fire
		ReplaceEntity("FireSignalPos1", Entities.XD_SingnalFireOn)

		PlayerPayedForSignal1 = true

		ResolveBriefing(NPCEastVillageBriefingShowPos1)
		ResolveBriefing(NPCHermitBriefingShowIronMine1)
		ResolveBriefing(NPCHermitBriefingShowIronMine2)
		
		return 2
	
	else
	
		-- Not enough money
		return 4
	
	end		

end

function NPCHermitBriefingFinished()
	if PlayerPayedForSignal1 ~= true then
		-- Reinit NPC
		CreateNPCHermit()
	else
		local markerPos1 = GetPosition("FireSignalPos1")
		GUI.DestroyMinimapPulse(markerPos1.X, markerPos1.Y)

		UpdateQuestSignalFires()
	end
end

function DestroyNPCHermit()
	if NPCHermit ~= nil and PlayerPayedForSignal1 ~= true then
		local markerPos1 = GetPosition("FireSignalPos1")
		GUI.DestroyMinimapPulse(markerPos1.X, markerPos1.Y)

		DestroyNPC(NPCHermit)
		
		if NPCEastVillageBriefingShowPos1 ~= nil then
			ResolveBriefing(NPCEastVillageBriefingShowPos1)
			
			if NPCHermitBriefingShowIronMine1 ~= nil then
				ResolveBriefing(NPCHermitBriefingShowIronMine1)
				ResolveBriefing(NPCHermitBriefingShowIronMine2)
			end
		end	
	end
end