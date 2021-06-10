
function CreateNPCHQ3()

	NPCHQ3Briefing					=	{}
	NPCHQ3Briefing.restoreCamera	=	true
	NPCHQ3Briefing.finished			=	NPCHQ3BriefingFinished

	local page = 0
	
	--	page 1
	
		page = page +1
	
		NPCHQ3Briefing[page] 					= 	{}
		
		NPCHQ3Briefing[page].mc					= 	{}
		NPCHQ3Briefing[page].mc.title			= 	String.GenericKey("Serf")
		NPCHQ3Briefing[page].mc.text			=	String.Key("NPCHQ3Briefing[1].mc.text")
		
		NPCHQ3Briefing[page].mc.firstText		=	String.Key("NPCHQ3Briefing[1].mc.firstText")
		NPCHQ3Briefing[page].mc.firstSelected	=	2
	
		NPCHQ3Briefing[page].mc.secondText		=	String.Key("NPCHQ3Briefing[1].mc.secondText")
		NPCHQ3Briefing[page].mc.secondSelected	=	4
		
		NPCHQ3Briefing[page].position 			=	GetPosition("NPCHQ3")
		NPCHQ3Briefing[page].dialogCamera		=	true

		NPCHQ3BriefingMC						=	NPCHQ3Briefing[page]
		

	--	page 2
	
		page = page +1
	
		NPCHQ3Briefing[page] 					= 	{}
		NPCHQ3Briefing[page].title				= 	String.GenericKey("Serf")
		NPCHQ3Briefing[page].text				=	String.Key("NPCHQ3Briefing[2].text")

		NPCHQ3Briefing[page].position 			=	GetPosition("HQ3")
		
		
	--	page 4
		
		page = page +2
	
		NPCHQ3Briefing[page] 					= 	{}
		NPCHQ3Briefing[page].title				= 	String.GenericKey("Serf")
		NPCHQ3Briefing[page].text				=	String.Key("NPCHQ3Briefing[4].text")
		
		NPCHQ3Briefing[page].position 			=	GetPosition("NPCHQ3")
						
	-- setup table for npc
	NPCHQ3				=	{}
	NPCHQ3.name 		=	"NPCHQ3"
	NPCHQ3.briefing		=	NPCHQ3Briefing
	        
	-- create npc
	CreateNPC(NPCHQ3)
	
end

function NPCHQ3BriefingFinished()

	if GetSelectedBriefingMCButton(NPCHQ3BriefingMC) == 1 then

		Logic.SetEntityName(GetEntityId("HQ3"),"PlayerHQ")
		ChangePlayer("NPCHQ3",1)
	
		ResearchTechnology(Technologies.GT_Mercenaries)
		ResearchTechnology(Technologies.GT_StandingArmy)

		local i = 1

		while true do

			if IsExisting("3_Entity"..i) then
				ChangePlayer("3_Entity"..i, 1)
			else
				break
			end

			i = i + 1

		end
		
		local pos = GetPosition("3_RiflemanSpawn")
		local type = Entities.PU_LeaderRifle2
		if CP_Difficulty > 0 then
			type = Entities.PU_LeaderRifle1
		end

		Logic.SetEntityName(AI.Entity_CreateFormation(
							1,
							type,
							0,
							16,
							pos.X,pos.Y,
							0,0,
							0,
							0),"P1Rifles")		
						
		Move("P1Rifles", "HQ3EnemyPos")

		AddGold(1000)
		AddWood(1000)
		AddClay(500)
		AddStone(500)
						
		end1stChapter()
					
	else
		
		CreateNPCHQ3()
		
	end

end

function DestroyNPCHQ3()

	if GetPlayer("NPCHQ3") ~= 1  then
		
		DestroyNPC(NPCHQ3)
		
		MoveAndVanish("NPCHQ3",GetPosition("HQ3"))
		
		CreateArmyDestroyHQ(3)

		DestroyEntity("3_Entity10")
		DestroyEntity("3_Entity11")
		DestroyEntity("3_Entity12")
		
	end

end