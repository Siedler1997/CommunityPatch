CreateNPCTemplarHero = function()
       	  
	-- setup table for npc
	local Npc 				= {}
	Npc.name 				= TemplarHero
	Npc.callback				= hero	
	        
	-- create npc
	CreateNPC(Npc)
	     
end

hero = function()

		DisableNpcMarker(TemplarHero)
		createBriefingTemplarHero()
				
				
end


createBriefingTemplarHero = function()

BriefingTemplarHero = 	{}

	BriefingTemplarHero.finished = BriefingTemplarHeroFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingTemplarHero[page] 					= 	{}
		BriefingTemplarHero[page].title					= 	String.Key("BriefingTemplarHero.title") 
		BriefingTemplarHero[page].text					=	String.Key("BriefingTemplarHero.text")
		BriefingTemplarHero[page].position				=	GetPosition(TemplarHero)
		--BriefingTemplarHero[page].explore				=	2000


	--	page 2
	
		page = page+1
	
		BriefingTemplarHero[page] 					= 	{}
		BriefingTemplarHero[page].title					= 	String.Key("BriefingTemplarHero[1].title") 
		BriefingTemplarHero[page].text					=	String.Key("BriefingTemplarHero[1].text")
		BriefingTemplarHero[page].position				=	GetPosition("hill100")
		BriefingTemplarHero[page].explore				=	2000

		BriefingTemplarHero[page].quest				=	{}
		BriefingTemplarHero[page].quest.id			=	9
		BriefingTemplarHero[page].quest.type	    		=	SUBQUEST_OPEN
		BriefingTemplarHero[page].quest.title			=	String.MainKey.."BriefingTemplarHero.quest.title"
		BriefingTemplarHero[page].quest.text	    		=	String.MainKey.."BriefingTemplarHero.quest.text"

briefingTerminatTemplarHero = BriefingTemplarHero[page]

StartBriefing(BriefingTemplarHero)
		
end
	

BriefingTemplarHeroFinished = function()

StartQuestBuildTower()


end



StartQuestBuildTower =  function ()
	local pos = GetPosition("hill100")
	if AreEntitiesInArea(1,Entities.PB_Tower2, pos, 500,1) == true 
	  or AreEntitiesInArea(1,Entities.PB_Tower3, pos, 500,1) == true
	  or AreEntitiesInArea(1,Entities.PB_DarkTower2, pos, 500,1) == true 
	  or AreEntitiesInArea(1,Entities.PB_DarkTower3, pos, 500,1) == true then 
		Questtower()
		return true
	end

	-- Quest
--[[
	local Quest = {}
	Quest.AreaPos = "hill100"
	Quest.AreaSize = 3000
	
	Quest.EntityTypes = { 	{ Entities.PB_Tower2, 1}}
	
	Quest.Callback = Questtower

	SetupEstablish(Quest)
--]]
	StartSimpleJob("QuestTowersJob")
end	

function QuestTowersJob()
	if Counter.Tick2("QuestTowersJob", 5) then
		local pos = GetPosition("hill100")
		if AreEntitiesInArea(1,Entities.PB_Tower2, pos, 500,1) == true 
		  or AreEntitiesInArea(1,Entities.PB_Tower3, pos, 500,1) == true
		  or AreEntitiesInArea(1,Entities.PB_DarkTower2, pos, 500,1) == true 
		  or AreEntitiesInArea(1,Entities.PB_DarkTower3, pos, 500,1) == true then 
			Questtower()
			return true
		end
	end
end

Questtower = function()
	Move(TemplarHero,"guardpoint",200)
	ResolveBriefing(briefingTerminatTemplarHero)
end



