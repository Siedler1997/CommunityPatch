
function CreateNPCJohannes()

	-- setup table for npc
	NPCJohannes				=	{}
	NPCJohannes.name 		=	"P6_Johannes_NPC"
	NPCJohannes.callback	=	CreateNPCJohannesBriefing
	        
	-- create npc
	CreateNPC(NPCJohannes)
	
	local markerPos2 = GetPosition("FireSignalPos2")
	GUI.CreateMinimapMarker(markerPos2.X, markerPos2.Y, 1)
end

function CreateNPCJohannesBriefing()

	NPCJohannesBriefing						=	{}
	NPCJohannesBriefing.restoreCamera		=	true
	NPCJohannesBriefing.finished			=	NPCJohannesBriefingFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		NPCJohannesBriefing[page] 							= 	{}
		NPCJohannesBriefing[page].mc						= 	{}
		NPCJohannesBriefing[page].mc.title					= 	String.Key("NPCJohannesBriefing[1].mc.title")
		NPCJohannesBriefing[page].mc.text					=	String.Key("NPCJohannesBriefing[1].mc.text")
		
		NPCJohannesBriefing[page].mc.firstText				=	String.Key("NPCJohannesBriefing[1].mc.firstText")
		NPCJohannesBriefing[page].mc.firstSelectedCallback	=	NPCJohannesFirstSelected
	
		NPCJohannesBriefing[page].mc.secondText				=	String.Key("NPCJohannesBriefing[1].mc.secondText")
		NPCJohannesBriefing[page].mc.secondSelected			=	7
		
		NPCJohannesBriefing[page].position 					=	GetPosition("P6_Johannes_NPC")
		NPCJohannesBriefing[page].dialogCamera				=	true

		NPCJohannesBriefingMC								=	NPCJohannesBriefing[page]
		

	--	page 2
	
		page = page +1
	
		NPCJohannesBriefing[page] 					= 	{}
		NPCJohannesBriefing[page].title				= 	String.Key("NPCJohannesBriefing[2].title")
		NPCJohannesBriefing[page].text				=	String.Key("NPCJohannesBriefing[2].text")
		
		NPCJohannesBriefing[page].position 			=	GetPosition("FireSignalPos2")
		NPCJohannesBriefing[page].explore 			=	1000

	--	page 3
		--[[
		page = page +1
	
		NPCJohannesBriefing[page] 					= 	{}
		NPCJohannesBriefing[page].title				= 	String.Key("NPCJohannesBriefing[2].title")
		NPCJohannesBriefing[page].text				=	String.Key("NPCJohannesBriefing[3].text")
		
		NPCJohannesBriefing[page].position 			=	GetPosition("FireSignalPos3")
		NPCJohannesBriefing[page].marker			=	ANIMATED_MARKER
		NPCJohannesBriefing[page].noScrolling		=	true
				
		NPCJohannesBriefingShowFirePos3				=	NPCJohannesBriefing[page]
		--]]	
		
	--	page 4
		
		page = page +2
	
		NPCJohannesBriefing[page] 					= 	{}
		NPCJohannesBriefing[page].title				= 	String.Key("NPCJohannesBriefing[2].title")
		NPCJohannesBriefing[page].text				=	String.Key("NPCJohannesBriefing[5].text")
		
		NPCJohannesBriefing[page].position 			=	GetPosition("P6_Johannes_NPC")

	--	page 5
	
		page = page +1

		NPCJohannesBriefing[page] 					= 	{}
		NPCJohannesBriefing[page].title				= 	String.Key("NPCJohannesBriefing[2].title")
		NPCJohannesBriefing[page].text				=	String.Key("NPCJohannesBriefing[6].text")

		NPCJohannesBriefing[page].position 			=	GetPosition("SulfurPit")
		NPCJohannesBriefing[page].marker			=	STATIC_MARKER
		NPCJohannesBriefing[page].noScrolling		=	true
		
		NPCJohannesBriefingShowSulfurPit1			=	NPCJohannesBriefing[page]
		
	--	page 7
		
		page = page +2
	
		NPCJohannesBriefing[page] 					= 	{}
		NPCJohannesBriefing[page].title				= 	String.Key("NPCJohannesBriefing[2].title")
		NPCJohannesBriefing[page].text				=	String.Key("NPCJohannesBriefing[8].text")
		
		NPCJohannesBriefing[page].position 			=	GetPosition("P6_Johannes_NPC")
	
	--	page 8
	
		page = page +1
	
		NPCJohannesBriefing[page] 					= 	{}
		NPCJohannesBriefing[page].title				= 	String.Key("NPCJohannesBriefing[2].title")
		NPCJohannesBriefing[page].text				=	String.Key("NPCJohannesBriefing[9].text")
	
		NPCJohannesBriefing[page].position 			=	GetPosition("SulfurPit")
		NPCJohannesBriefing[page].marker			=	STATIC_MARKER
		NPCJohannesBriefing[page].noScrolling		=	true
		
		NPCJohannesBriefingShowSulfurPit2			=	NPCJohannesBriefing[page]
	
	--	go
	
	StartBriefing(NPCJohannesBriefing)
	
end
function NPCJohannesFirstSelected()

	-- Enough money
	if GetSulfur() >= 2000 then

		-- Paid
		AddSulfur(-2000)
		
		-- enlight fire
		ReplaceEntity("FireSignalPos2", Entities.XD_SingnalFireOn)

		PlayerPayedForSignal2 = true

		ResolveBriefing(NPCHermitBriefingShowFirePos2)
		ResolveBriefing(NPCJohannesBriefingShowSulfurPit1)
		ResolveBriefing(NPCJohannesBriefingShowSulfurPit2)
		
		return 2
	
	else
	
		-- Not enough money
		return 4
	
	end		

end

function NPCJohannesBriefingFinished()
	if PlayerPayedForSignal2 ~= true then
		-- Reinit NPC
		CreateNPCJohannes()
	else
		local markerPos2 = GetPosition("FireSignalPos2")
		GUI.DestroyMinimapPulse(markerPos2.X, markerPos2.Y)

		UpdateQuestSignalFires()
	end
end

function DestroyNPCJohannes()
	if NPCJohannes ~= nil and PlayerPayedForSignal2 ~= true then
		local markerPos2 = GetPosition("FireSignalPos2")
		GUI.DestroyMinimapPulse(markerPos2.X, markerPos2.Y)
	
		DestroyNPC(NPCJohannes)
		
		if NPCHermitBriefingShowFirePos2 ~= nil then
			ResolveBriefing(NPCHermitBriefingShowFirePos2)
			
			if NPCJohannesBriefingShowSulfurPit1 ~= nil then
				ResolveBriefing(NPCJohannesBriefingShowSulfurPit1)
				ResolveBriefing(NPCJohannesBriefingShowSulfurPit2)
			end
		end	
	end
end