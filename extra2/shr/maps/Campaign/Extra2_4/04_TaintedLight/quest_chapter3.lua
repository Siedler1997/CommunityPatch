-------------- Chapter 3 quests and briefings

createBriefingAlliesArrive = function()

CreateEntity(3, Entities.PU_Hero10, GetPosition("add1"), "Drake" )
CreateEntity(3, Entities.PU_Hero6, GetPosition("add2"), "Helias" )
CreateEntity(3, Entities.PU_Hero5, GetPosition("add3"), "Ari" )
CreateEntity(3, Entities.PU_Hero2, GetPosition("add4"), "Pilgrim" )

charged = 0 
sneaked = 0 

armyTemplarAllied()



	local npc	= {}
	npc.name = "Drake"
	npc.callback  = RelieveHeroes


	CreateNPC(npc)

	local npc1	= {}
	npc1.name = "tlidah"
	npc1.callback  = RelieveTemplars


	CreateNPC(npc1)

end

RelieveTemplars = function ()
local x,y=Tools.GetPosition("lidah")
GUI.DestroyMinimapPulse(x,y)

createBriefingTemplarsTurncoat()
	--[[
	for i = 1,6,1 do
		ChangePlayer("templarally"..i,1) 
	end
	ChangePlayer("tlidah",1)
	--]]
	--StartSimpleJob("ControlTLidah")
	armyTemplar1.control.job = 3
end

function ControlTLidah()
	if Counter.Tick2("ControlTLidah", 10) then
		for i = 1,6,1 do 
			if IsAlive("templarally"..i) then 
				Attack("templarally"..i, "Dario")
			end
		end
		if IsAlive("tlidah") then 
			Attack("tlidah", "Dario")
		end
	end
end


RelieveHeroes = function()

local x,y=Tools.GetPosition("Drake")
GUI.DestroyMinimapPulse(x,y)

		BriefingRelieveHeroes				= 	{}	
		BriefingRelieveHeroes.finished 			= 	RelieveHeroesFinished


		local page = 0

	--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[1].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[1].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000



		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[2].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[2].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[3].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[3].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[4].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[4].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000


		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[5].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[5].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[6].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[6].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[7].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[7].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000


		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[8].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[8].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000


		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[9].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[9].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[10].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[10].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[11].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[11].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000
		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[12].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[12].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000
		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[13].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[13].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000
		--	page
	
		page = page +1
	
		BriefingRelieveHeroes[page] 					= 	{}
		BriefingRelieveHeroes[page].title				= 	String.Key("BriefingRelieveHeroes[14].title") 
		BriefingRelieveHeroes[page].text				=	String.Key("BriefingRelieveHeroes[14].text")
		BriefingRelieveHeroes[page].position				=	GetPosition("Dario")
		--BriefingRelieveHeroes[page].explore				=	2000
	

		BriefingRelieveHeroes[page].quest				=	{}
		BriefingRelieveHeroes[page].quest.id				=	5
		BriefingRelieveHeroes[page].quest.type				=	MAINQUEST_OPEN
		BriefingRelieveHeroes[page].quest.title				=	String.Key("BriefingRelieveHeroes.quest.title")
		BriefingRelieveHeroes[page].quest.text				=	String.Key("BriefingRelieveHeroes.quest.text") 



	
		

                briefingTerminatRelieveHeroes = BriefingRelieveHeroes[page]
	
		StartBriefing(BriefingRelieveHeroes)




end




RelieveHeroesFinished = function()
ChangePlayer("Drake",1)
ChangePlayer("Helias",1)
ChangePlayer("Ari",1)
ChangePlayer("Pilgrim",1)
DestroyEntity("Mumu")
freetent = 0
bribep = 0 
bridge = 0


StartSimpleJob("AreGuardsDead")
StartSimpleJob("BridgeOverrrun")
IsBribePayed()
StartSimpleJob("IsBribeDelivered")

end

BridgeOverrrun = function()
if IsDead("patrols31") and IsDead("patrols32") and IsDead("patrols33") and IsDead("patrols34") 


and IsDead("towah1")
and IsDead("towah2")
and IsDead("towah3")
and IsDead("towah4")
and charged == 0

 then createBriefingBridgeOverrun()
	bridge = 1
	charged = 1
	return true

	else
end
end

createBriefingBridgeOverrun = function ()
ResolveBriefing(briefingTerminatRelieveHeroes)
createbriefingRevolt()
end








AreGuardsDead = function ()
if IsDead("patrols31") and IsDead("patrols32") and IsDead("patrols33") and IsDead("patrols34") and bridge == 0 then 

	for i = 1,4,1 do 
		Move("bribed"..i,"post"..i)
		LookAt("bribed"..i,"sarea4")
	end
	freetent = 1
	return true

end
end

IsBribeDelivered = function()
	
	if AreEntitiesInArea(1,Entities.PU_Thief, GetPosition("bribery"), 750,1) == true and bribep == 1 and bridge == 0 and freetent ==1 then 
			createBriefingBribingCannons()
			return true
	end
end

IsBribePayed = function()

				local job = {}	
				job.Tribute = 2
				Logic.AddTribute(			1, 
									job.Tribute,
									0,
									0,
									String.Key("briben"),
									ResourceType.Gold, 
									5000 )			
				job.Callback = BribePayment
				SetupTributePaid(job)			


end


BribePayment = function()
local x,y=Tools.GetPosition("bribery")
GUI.CreateMinimapPulse(x,y)

bribep = 1

end


createBriefingBribingCannons = function()
local x,y=Tools.GetPosition("bribery")
GUI.DestroyMinimapPulse(x,y)

BriefingBribingCannons				= 	{}	
		BriefingBribingCannons.finished 			= 	BribingCannonsFinished


		local page = 0

	--	page
	
		page = page +1
	
		BriefingBribingCannons[page] 					= 	{}
		BriefingBribingCannons[page].title				= 	String.Key("BriefingBribingCannons[1].title") 
		BriefingBribingCannons[page].text				=	String.Key("BriefingBribingCannons[1].text")
		BriefingBribingCannons[page].position				=	GetPosition("bribery")
		BriefingBribingCannons[page].explore				=	2000

	--	page
	
		page = page +1
	
		BriefingBribingCannons[page] 					= 	{}
		BriefingBribingCannons[page].title				= 	String.Key("BriefingBribingCannons[2].title") 
		BriefingBribingCannons[page].text				=	String.Key("BriefingBribingCannons[2].text")
		BriefingBribingCannons[page].position				=	GetPosition("bribery")
		--BriefingBribingCannons[page].explore				=	2000


	--	page
	
		page = page +1
	
		BriefingBribingCannons[page] 					= 	{}
		BriefingBribingCannons[page].title				= 	String.Key("BriefingBribingCannons[3].title") 
		BriefingBribingCannons[page].text				=	String.Key("BriefingBribingCannons[3].text")
		BriefingBribingCannons[page].position				=	GetPosition("bribery")
		--BriefingBribingCannons[page].explore				=	2000

	--	page
	
		page = page +1
	
		BriefingBribingCannons[page] 					= 	{}
		BriefingBribingCannons[page].title				= 	String.Key("BriefingBribingCannons[4].title") 
		BriefingBribingCannons[page].text				=	String.Key("BriefingBribingCannons[4].text")
		BriefingBribingCannons[page].position				=	GetPosition("bribery")
		--BriefingBribingCannons[page].explore				=	2000

	--	page
	
		page = page +1
	
		BriefingBribingCannons[page] 					= 	{}
		BriefingBribingCannons[page].title				= 	String.Key("BriefingBribingCannons[5].title") 
		BriefingBribingCannons[page].text				=	String.Key("BriefingBribingCannons[5].text")
		BriefingBribingCannons[page].position				=	GetPosition("bribery")
		--BriefingBribingCannons[page].explore				=	2000

	--	page
	
		page = page +1
	
		BriefingBribingCannons[page] 					= 	{}
		BriefingBribingCannons[page].title				= 	String.Key("BriefingBribingCannons[6].title") 
		BriefingBribingCannons[page].text				=	String.Key("BriefingBribingCannons[6].text")
		BriefingBribingCannons[page].position				=	GetPosition("bribery")
		--BriefingBribingCannons[page].explore				=	2000

	--	page
	
		page = page +1
	
		BriefingBribingCannons[page] 					= 	{}
		BriefingBribingCannons[page].title				= 	String.Key("BriefingBribingCannons[7].title") 
		BriefingBribingCannons[page].text				=	String.Key("BriefingBribingCannons[7].text")
		BriefingBribingCannons[page].position				=	GetPosition("bribery")
		--BriefingBribingCannons[page].explore				=	2000

	--	page
	
		page = page +1
	
		BriefingBribingCannons[page] 					= 	{}
		BriefingBribingCannons[page].title				= 	String.Key("BriefingBribingCannons[8].title") 
		BriefingBribingCannons[page].text				=	String.Key("BriefingBribingCannons[8].text")
		BriefingBribingCannons[page].position				=	GetPosition("bribery")
		--BriefingBribingCannons[page].explore				=	2000
  
  
  briefingTerminatBribingCannons = BriefingBribingCannons[page]
	
		StartBriefing(BriefingBribingCannons)




local pos = GetPosition("bribery")
number,ID = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PU_Thief, pos.X,pos.Y,1000,1)
DestroyEntity(ID)
ResolveBriefing(briefingTerminatRelieveHeroes)
createSignalForMaster()
end

BribingCannonsFinished = function()


end




createSignalForMaster = function()
				local job = {}	
				job.Tribute = 3
				Logic.AddTribute(			1, 
									job.Tribute,
									0,
									0,
									String.Key("master"),
									ResourceType.Gold, 
									0 )			
				job.Callback = checkrevolt
				SetupTributePaid(job)			

end

checkrevolt = function ()

if charged == 1 then return true
	else createbriefingRevolt()
		return true
end
end


createbriefingRevolt = function()

		if IsDead("Dario") then 
			local pos = GetPosition("Dario")
			DestroyEntity("Dario")
			CreateEntity(1, Entities.PU_Hero1c, pos, "Dario" )
		end

		briefingRevolt				= 	{}	
		briefingRevolt.finished 			= 	briefingRevoltFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingRevolt[page] 					= 	{}
		briefingRevolt[page].title				= 	String.Key("briefingRevolt[1].title") 
		briefingRevolt[page].text				=	String.Key("briefingRevolt[1].text")
		briefingRevolt[page].position				=	GetPosition("Dario")
		--briefingRevolt[page].explore				=	2000


		briefingRevolt[page].quest				=	{}
		briefingRevolt[page].quest.id				=	6
		briefingRevolt[page].quest.type				=	MAINQUEST_OPEN
		briefingRevolt[page].quest.title			=	String.Key("briefingRevolt.quest.title")
		briefingRevolt[page].quest.text				=	String.Key("briefingRevolt.quest.text") 



	
		

                briefingTerminatRevolt = briefingRevolt[page]
	
		StartBriefing(briefingRevolt)

end



briefingRevoltFinished = function()
charged = 1
StartSimpleJob("IsOverrun")
for i = 1,4,1 do
ChangePlayer("plus"..i,1)
ChangePlayer("cannon"..i,1)
end
ttimer = 20
StartSimpleJob("TemplarsChargeTimer")
end

TemplarsChargeTimer = function()
if ttimer == 0 then createBriefingTemplarsCharge()
		return true
	else ttimer = ttimer - 1

	end
end

createBriefingTemplarsCharge = function()
briefingTemplarsCharge				= 	{}	
		briefingTemplarsCharge.finished 			= 	briefingTemplarsChargeFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingTemplarsCharge[page] 					= 	{}
		briefingTemplarsCharge[page].title				= 	String.Key("briefingTemplarsCharge[1].title") 
		briefingTemplarsCharge[page].text				=	String.Key("briefingTemplarsCharge[1].text")
		briefingTemplarsCharge[page].position				=	GetPosition("templar6")
		briefingTemplarsCharge[page].explore				=	2000


	--	page
	
		page = page +1
	
		briefingTemplarsCharge[page] 					= 	{}
		briefingTemplarsCharge[page].title				= 	String.Key("briefingTemplarsCharge[2].title") 
		briefingTemplarsCharge[page].text				=	String.Key("briefingTemplarsCharge[2].text")
		briefingTemplarsCharge[page].position				=	GetPosition("tlidah")
		--briefingTemplarsCharge[page].explore				=	2000


	
	
		

                briefingTerminatTemplarsCharge = briefingTemplarsCharge[page]
	
		StartBriefing(briefingTemplarsCharge)

end

briefingTemplarsChargeFinished = function()
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile)
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Friendly )
	--[[
	for i = 1,9,1 do 
		--ChangePlayer("templars"..i,2)
		--ChangePlayer("lastdefense"..i,2)
		--ChangePlayer("tent"..i,2)
		Attack("templars"..i, "sarea4")
	end
	for i = 1,6,1 do 
		if IsAlive("templarally"..i) then 
			--ChangePlayer("templarally"..i,2)
			Attack("templarally"..i, "Dario")
		end
	end

	if IsAlive("tlidah") then 
		--ChangePlayer("tlidah",2)
		Attack("tlidah", "Dario")
	end
	--]]

	rtimer = 5
	StartSimpleJob("RebellionTimer")

end





RebellionTimer = function ()
if rtimer == 0 then createBriefingAmbush()
return true
	else rtimer = rtimer - 1
	end

end


createBriefingAmbush = function()

briefingAmbush				= 	{}	
		briefingAmbush.finished 			= 	briefingAmbushFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingAmbush[page] 					= 	{}
		briefingAmbush[page].title				= 	String.Key("briefingAmbush[1].title") 
		briefingAmbush[page].text				=	String.Key("briefingAmbush[1].text")
		briefingAmbush[page].position				=	GetPosition("ambush1")
		briefingAmbush[page].explore				=	2000


	--	page
	
		page = page +1
	
		briefingAmbush[page] 					= 	{}
		briefingAmbush[page].title				= 	String.Key("briefingAmbush[2].title") 
		briefingAmbush[page].text				=	String.Key("briefingAmbush[2].text")
		briefingAmbush[page].position				=	GetPosition("ambush8")
		briefingAmbush[page].explore				=	2000


	
	--	page
	
		page = page +1
	
		briefingAmbush[page] 					= 	{}
		briefingAmbush[page].title				= 	String.Key("briefingAmbush[3].title") 
		briefingAmbush[page].text				=	String.Key("briefingAmbush[3].text")
		briefingAmbush[page].position				=	GetPosition("ambush6")
		briefingAmbush[page].explore				=	2000
		

                briefingTerminatAmbush = briefingAmbush[page]
	
		StartBriefing(briefingAmbush)

spawnRebelsAmbush()

end

briefingAmbushFinished = function()

end


spawnRebelsAmbush = function()
Logic.SetDiplomacyState( 5, 2, Diplomacy.Hostile )
Logic.SetDiplomacyState( 5, 4, Diplomacy.Hostile )

for i = 1,12,1 do
local pos = GetPosition("ambush"..i)
rally =  Tools.CreateGroup(5, Entities.PU_LeaderRifle1, 6, pos.X,pos.Y, 90)
SetEntityName(rally, "rebelion"..i)
end


end


IsOverrun = function ()
if IsDead("templars1") and 
IsDead("templars2") and 
IsDead("templars3") and 
IsDead("templars4") and 
IsDead("templars5") and 
IsDead("templars6") and 
IsDead("templars7") and 
IsDead("templars8") and 
IsDead("templars9") and 

IsDead("lastdefense1") and 
IsDead("lastdefense2") and 
IsDead("lastdefense3") and 
IsDead("lastdefense4") and 
IsDead("lastdefense5") and 
IsDead("lastdefense6") and 
IsDead("lastdefense7") and 
IsDead("lastdefense8") and 
IsDead("lastdefense9") and 

IsDead(armyTemplar1) then 

createBriefingMeetOnBeach()
return true

 end
end