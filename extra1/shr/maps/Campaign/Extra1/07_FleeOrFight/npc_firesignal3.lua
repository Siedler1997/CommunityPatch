
function CreateNPCFireSignal3()
		
	-- setup table for npc
	NPCFireSignal3				=	{}
	NPCFireSignal3.name 		=	"NPCFireSignal3"
	NPCFireSignal3.callback		=	CreateNPCFireSignal3Briefing
	        
	-- create npc
	CreateNPC(NPCFireSignal3)
	
	local markerPos3 = GetPosition("FireSignalPos3")
	GUI.CreateMinimapMarker(markerPos3.X, markerPos3.Y, 1)
end

function CreateNPCFireSignal3Briefing()

	NPCFireSignal3Briefing					=	{}
	NPCFireSignal3Briefing.restoreCamera	=	true
	NPCFireSignal3Briefing.finished			=	NPCFireSignal3BriefingFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		NPCFireSignal3Briefing[page] 							= 	{}
		NPCFireSignal3Briefing[page].mc							= 	{}
		NPCFireSignal3Briefing[page].mc.title					= 	String.Key("NPCFireSignal3Briefing[1].mc.title")
		NPCFireSignal3Briefing[page].mc.text					=	String.Key("NPCFireSignal3Briefing[1].mc.text")
		
		NPCFireSignal3Briefing[page].mc.firstText				=	String.Key("NPCFireSignal3Briefing[1].mc.firstText")
		NPCFireSignal3Briefing[page].mc.firstSelectedCallback	=	NPCFireSignal3FirstSelected
	
		NPCFireSignal3Briefing[page].mc.secondText				=	String.Key("NPCFireSignal3Briefing[1].mc.secondText")
		NPCFireSignal3Briefing[page].mc.secondSelected			=	2
		
		NPCFireSignal3Briefing[page].position 					=	GetPosition("NPCFireSignal3")
		NPCFireSignal3Briefing[page].dialogCamera				=	true

		NPCFireSignal3BriefingMC								=	NPCFireSignal3Briefing[page]
		

	--	page 2
	
		page = page +1
	
		NPCFireSignal3Briefing[page] 				= 	{}
		NPCFireSignal3Briefing[page].title			= 	String.Key("NPCFireSignal3Briefing[2].title")
		NPCFireSignal3Briefing[page].text			=	String.Key("NPCFireSignal3Briefing[2].text")
		
		NPCFireSignal3Briefing[page].position 		=	GetPosition("NPCFireSignal3")
		NPCFireSignal3Briefing[page].dialogCamera	=	true
				
	--	page 4
		
		page = page +2
	
		NPCFireSignal3Briefing[page] 				= 	{}
		NPCFireSignal3Briefing[page].title			= 	String.Key("NPCFireSignal3Briefing[2].title")
		NPCFireSignal3Briefing[page].text			=	String.Key("NPCFireSignal3Briefing[4].text")
		
		NPCFireSignal3Briefing[page].position 		=	GetPosition("FireSignalPos3")
		NPCFireSignal3Briefing[page].explore 		=	1000

	--	page 5
		--[[
		page = page +1
	
		NPCFireSignal3Briefing[page] 				= 	{}
		NPCFireSignal3Briefing[page].title			= 	String.Key("NPCFireSignal3Briefing[2].title")
		NPCFireSignal3Briefing[page].text			=	String.Key("NPCFireSignal3Briefing[5].text")
		
		NPCFireSignal3Briefing[page].position 		=	GetPosition("FireSignalPos4")
		NPCFireSignal3Briefing[page].marker			=	ANIMATED_MARKER
		NPCFireSignal3Briefing[page].noScrolling	=	true
		
		NPCFireSignal3BriefingShowFirePos4			=	NPCFireSignal3Briefing[page]
		--]]
										
	--	page 7
	
		page = page +2

		NPCFireSignal3Briefing[page] 				= 	{}
		NPCFireSignal3Briefing[page].title			= 	String.Key("NPCFireSignal3Briefing[2].title")
		NPCFireSignal3Briefing[page].text			=	String.Key("NPCFireSignal3Briefing[7].text")

		NPCFireSignal3Briefing[page].position 		=	GetPosition("NPCFireSignal3")

	--	go

	StartBriefing(NPCFireSignal3Briefing)

end

function NPCFireSignal3FirstSelected()

	-- Enough money
	if GetStone() >= 2000 then

		-- Paid
		AddStone(-2000)
		
		-- enlight fire
		ReplaceEntity("FireSignalPos3", Entities.XD_SingnalFireOn)

		PlayerPayedForSignal3 = true
		
		ResolveBriefing(NPCJohannesBriefingShowFirePos3)
		
		return 4
	
	else
	
		-- Not enough money
		return 6
	
	end		

end

function NPCFireSignal3BriefingFinished()
	if PlayerPayedForSignal3 ~= true then
		-- Reinit NPC
		CreateNPCFireSignal3()
	else
		local markerPos3 = GetPosition("FireSignalPos3")
		GUI.DestroyMinimapPulse(markerPos3.X, markerPos3.Y)

		UpdateQuestSignalFires()
	end
end

function DestroyNPCFireSignal3()
	if NPCFireSignal3 ~= nil and PlayerPayedForSignal3 ~= true then
		local markerPos3 = GetPosition("FireSignalPos3")
		GUI.DestroyMinimapPulse(markerPos3.X, markerPos3.Y)
	
		DestroyNPC(NPCHermit)
		
		if NPCJohannesBriefingShowFirePos3 ~= nil then
			ResolveBriefing(NPCJohannesBriefingShowFirePos3)
		end
	end
end