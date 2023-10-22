
function CreateNPCHQ2()

	NPCHQ2Briefing					=	{}
	NPCHQ2Briefing.restoreCamera	=	true
	NPCHQ2Briefing.finished			=	NPCHQ2BriefingFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		NPCHQ2Briefing[page] 					= 	{}
		
		NPCHQ2Briefing[page].mc					= 	{}
		NPCHQ2Briefing[page].mc.title			= 	String.GenericKey("Serf")
		NPCHQ2Briefing[page].mc.text			=	String.Key("NPCHQ2Briefing[1].mc.text")
		
		NPCHQ2Briefing[page].mc.firstText		=	String.Key("NPCHQ2Briefing[1].mc.firstText")
		NPCHQ2Briefing[page].mc.firstSelected	=	2
	
		NPCHQ2Briefing[page].mc.secondText		=	String.Key("NPCHQ2Briefing[1].mc.secondText")
		NPCHQ2Briefing[page].mc.secondSelected	=	4
		
		NPCHQ2Briefing[page].position 			=	GetPosition("NPCHQ2")
		NPCHQ2Briefing[page].dialogCamera		=	true

		NPCHQ2BriefingMC						=	NPCHQ2Briefing[page]
		

	--	page 2
	
		page = page +1
	
		NPCHQ2Briefing[page] 					= 	{}
		NPCHQ2Briefing[page].title				= 	String.GenericKey("Serf")
		NPCHQ2Briefing[page].text				=	String.Key("NPCHQ2Briefing[2].text")

		NPCHQ2Briefing[page].position 			=	GetPosition("HQ2")
		
		
	--	page 4
		
		page = page +2
	
		NPCHQ2Briefing[page] 					= 	{}
		NPCHQ2Briefing[page].title				= 	String.GenericKey("Serf")
		NPCHQ2Briefing[page].text				=	String.Key("NPCHQ2Briefing[4].text")
		
		NPCHQ2Briefing[page].position 			=	GetPosition("NPCHQ2")
						
	-- setup table for npc
	NPCHQ2				=	{}
	NPCHQ2.name 		=	"NPCHQ2"
	NPCHQ2.briefing		=	NPCHQ2Briefing
	        
	-- create npc
	CreateNPC(NPCHQ2)
	
end

function NPCHQ2BriefingFinished()

	if GetSelectedBriefingMCButton(NPCHQ2BriefingMC) == 1 then

		Logic.SetEntityName(GetEntityId("HQ2"),"PlayerHQ")
		ChangePlayer("NPCHQ2",1)
		
		ResearchTechnology(Technologies.GT_Construction	)
		ResearchTechnology(Technologies.GT_Alchemy)
	
		local i = 1

		while true do

			if IsExisting("2_Entity"..i) then
				ChangePlayer("2_Entity"..i, 1)
			else
				break
			end

			i = i + 1
		
		end

		GlobalMissionScripting.GiveResouces(1, 1000, 500, 1000, 500, 0, 0)
		
		end1stChapter()
					
	else
		
		CreateNPCHQ2()
		
	end

end

function DestroyNPCHQ2()

	if GetPlayer("NPCHQ2") ~= 1  then
	
		DestroyNPC(NPCHQ2)
		
		MoveAndVanish("NPCHQ2",GetPosition("HQ2"))
		
		CreateArmyDestroyHQ(2)
		
		DestroyEntity("2_Entity10")
		DestroyEntity("2_Entity11")
		
	end

end