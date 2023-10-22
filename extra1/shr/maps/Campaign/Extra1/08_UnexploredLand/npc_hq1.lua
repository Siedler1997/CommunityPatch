
function CreateNPCHQ1()

	NPCHQ1Briefing					=	{}
	NPCHQ1Briefing.restoreCamera	=	true
	NPCHQ1Briefing.finished			=	NPCHQ1BriefingFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		NPCHQ1Briefing[page] 					= 	{}
		
		NPCHQ1Briefing[page].mc					= 	{}
		NPCHQ1Briefing[page].mc.title			= 	String.GenericKey("Serf")
		NPCHQ1Briefing[page].mc.text			=	String.Key("NPCHQ1Briefing[1].mc.text")
		
		NPCHQ1Briefing[page].mc.firstText		=	String.Key("NPCHQ1Briefing[1].mc.firstText")
		NPCHQ1Briefing[page].mc.firstSelected	=	2
	
		NPCHQ1Briefing[page].mc.secondText		=	String.Key("NPCHQ1Briefing[1].mc.secondText")
		NPCHQ1Briefing[page].mc.secondSelected	=	4
		
		NPCHQ1Briefing[page].position 			=	GetPosition("NPCHQ1")
		NPCHQ1Briefing[page].dialogCamera		=	true

		NPCHQ1BriefingMC						=	NPCHQ1Briefing[page]
		

	--	page 2
	
		page = page +1
	
		NPCHQ1Briefing[page] 					= 	{}
		NPCHQ1Briefing[page].title				= 	String.GenericKey("Serf")
		NPCHQ1Briefing[page].text				=	String.Key("NPCHQ1Briefing[2].text")

		NPCHQ1Briefing[page].position 			=	GetPosition("HQ1")
		
		
	--	page 4
		
		page = page +2
	
		NPCHQ1Briefing[page] 					= 	{}
		NPCHQ1Briefing[page].title				= 	String.GenericKey("Serf")
		NPCHQ1Briefing[page].text				=	String.Key("NPCHQ1Briefing[4].text")
		
		NPCHQ1Briefing[page].position 			=	GetPosition("NPCHQ1")
						
	-- setup table for npc
	NPCHQ1				=	{}
	NPCHQ1.name 		=	"NPCHQ1"
	NPCHQ1.briefing		=	NPCHQ1Briefing
	        
	-- create npc
	CreateNPC(NPCHQ1)
	
end

function NPCHQ1BriefingFinished()

	if GetSelectedBriefingMCButton(NPCHQ1BriefingMC) == 1 then

		Logic.SetEntityName(GetEntityId("HQ1"),"PlayerHQ")
		ChangePlayer("NPCHQ1",1)
		
	
		ResearchTechnology(Technologies.GT_Construction	)
		ResearchTechnology(Technologies.GT_GearWheel)
	
		ResearchTechnology(Technologies.GT_Literacy)
		ResearchTechnology(Technologies.GT_Trading)
	
		local i = 1
		
		while true do

			if IsExisting("1_Building"..i) then
				ChangePlayer("1_Building"..i, 1)
			else
				break
			end

			i = i + 1

		end
		
		GlobalMissionScripting.GiveResouces(1, 1000, 500, 1000, 500, 0, 0)

		end1stChapter()
					
	else
		
		CreateNPCHQ1()
		
	end

end

function DestroyNPCHQ1()

	if GetPlayer("NPCHQ1") ~= 1 then
		
		DestroyNPC(NPCHQ1)
		
		MoveAndVanish("NPCHQ1",GetPosition("HQ1"))
		
		CreateArmyDestroyHQ(1)
		
	end

end