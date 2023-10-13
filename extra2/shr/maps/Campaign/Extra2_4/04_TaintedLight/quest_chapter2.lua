createNPCBruda = function()


local npc	= {}
	npc.name = "brudah"
	npc.callback  = createBriefingFollow
	CreateNPC(npc)

end


createBriefingFollow = function()

		briefingFollow 					= 	{}	
		briefingFollow.finished 			= 	BriefingFollowFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingFollow[page] 				= 	{}
		briefingFollow[page].title			= 	String.Key("briefingFollow[1].title") 
		briefingFollow[page].text			=	String.Key("briefingFollow[1].text")
		briefingFollow[page].position			=	GetPosition("brudah")
		--briefingFollow[page].explore			=	2000

		

                briefingTerminatFollow = briefingFollow[page]
	
		StartBriefing(briefingFollow)

end


BriefingFollowFinished = function()
Move("brudah", "entrance",400)
StartSimpleJob("IsBrudahNearEntrance")

end


IsBrudahNearEntrance = function()

if IsNear("brudah", "entrance", 400) then createBriefingBrudahEntrance()
return true
end

end



createBriefingBrudahEntrance  = function()


		briefingBrudahEntrance 					= 	{}	
		briefingBrudahEntrance.finished 			= 	BriefingBrudahEntranceFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingBrudahEntrance[page] 					= 	{}
		briefingBrudahEntrance[page].title				= 	String.Key("briefingBrudahEntrance[1].title") 
		briefingBrudahEntrance[page].text				=	String.Key("briefingBrudahEntrance[1].text")
		briefingBrudahEntrance[page].position				=	GetPosition("brudah")
		briefingBrudahEntrance[page].explore				=	2000

		

                briefingTerminatBrudahEntrance = briefingBrudahEntrance[page]
	
		StartBriefing(briefingBrudahEntrance)


end

BriefingBrudahEntranceFinished = function()

	local npc	= {}
	npc.name = "brudah"
	npc.callback  = createBriefingStockpile
	CreateNPC(npc)


end


----------------- ///////// Briefing with the Resistence's leader in the underground \\\\\\\\\\\ --------


createBriefingStockpile = function()

DestroyEntity("Dario")
DestroyEntity("brudah")
Dario = CreateEntity(1,Entities.PU_Hero1c,GetPosition("dariochat"),"Dario")
LookAt("rebel_lead","Dario")
LookAt("Dario","rebel_lead")
BriefingStockpile				= 	{}	
		BriefingStockpile.finished 			= 	BriefingStockpileFinished


		local page = 0

	--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[1].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[1].text")
		BriefingStockpile[page].position				=	GetPosition("brudahstockpile")
		--BriefingStockpile[page].explore				=	2000


		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[2].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[2].text")
		BriefingStockpile[page].position				=	GetPosition("dariostockpile")
		BriefingStockpile[page].explore					=	1000


		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[3].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[3].text")
		BriefingStockpile[page].position				=	GetPosition("rebel_lead")
		--BriefingStockpile[page].explore				=	2000


		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[4].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[4].text")
		BriefingStockpile[page].position				=	GetPosition("Dario")
		--BriefingStockpile[page].explore				=	2000


		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[5].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[5].text")
		BriefingStockpile[page].position				=	GetPosition("rebel_lead")
		BriefingStockpile[page].explore					=	2000


		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[6].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[6].text")
		BriefingStockpile[page].position				=	GetPosition("Dario")
		--BriefingStockpile[page].explore				=	2000


		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[7].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[7].text")
		BriefingStockpile[page].position				=	GetPosition("rebel_lead")
		--BriefingStockpile[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[8].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[8].text")
		BriefingStockpile[page].position				=	GetPosition("rebel_lead")
		--BriefingStockpile[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[9].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[9].text")
		BriefingStockpile[page].position				=	GetPosition("Dario")
		--BriefingStockpile[page].explore				=	2000

		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[10].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[10].text")
		BriefingStockpile[page].position				=	GetPosition("bank")
		BriefingStockpile[page].explore					=	1000

		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[11].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[11].text")
		BriefingStockpile[page].position				=	GetPosition("Dario")
		--BriefingStockpile[page].explore				=	2000



		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[12].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[12].text")
		BriefingStockpile[page].position				=	GetPosition("rebel_lead")
		--BriefingStockpile[page].explore				=	2000


		--	page
	
		page = page +1
	
		BriefingStockpile[page] 					= 	{}
		BriefingStockpile[page].title					= 	String.Key("BriefingStockpile[13].title") 
		BriefingStockpile[page].text					=	String.Key("BriefingStockpile[13].text")
		BriefingStockpile[page].position				=	GetPosition("Dario")
		--BriefingStockpile[page].explore				=	2000


		BriefingStockpile[page].quest					=	{}
		BriefingStockpile[page].quest.id				=	3
		BriefingStockpile[page].quest.type				=	MAINQUEST_OPEN
		BriefingStockpile[page].quest.title				=	String.Key("BriefingStockpile.quest.title")
		BriefingStockpile[page].quest.text				=	String.Key("BriefingStockpile.quest.text") 



	
		

                briefingTerminatStockpile = BriefingStockpile[page]
	
		StartBriefing(BriefingStockpile)



end

BriefingStockpileFinished = function()
	createQuestConquerTown3()
	if CP_Difficulty > 0 then
		AddStone(8000)
		AddWood(2000)
		AddClay(2000)
		AddIron(2500)
	else
		AddStone(2000)
		AddWood(1000)
		AddClay(1000)
		AddIron(1000)
	end
	createQuestCaptureNorth()
end

createQuestCaptureNorth = function()
bankos = 0
createQuestBanksBuild()
StartSimpleJob("AreNorthGuardsDead")

end






createQuestBanksBuild = function()
		local Quest = {}
		Quest.AreaPos = "bank"
		Quest.AreaSize = 8000
	
		Quest.EntityTypes =	{ 	{ Entities.PB_Bank1, 3},
						}
	
		Quest.Callback = bank1

		SetupEstablish(Quest)



end

bank1 = function()
			local x,y=Tools.GetPosition("bank1")
			GUI.DestroyMinimapPulse(x,y)
			local x,y=Tools.GetPosition("bank")
			GUI.DestroyMinimapPulse(x,y)
			local x,y=Tools.GetPosition("bank2")
			GUI.DestroyMinimapPulse(x,y)
bankos = 1
ResolveBriefing(briefingTerminatStockpile)
ReplaceEntity("gatetown3",Entities.XD_WallStraightGate)
end







AreNorthGuardsDead = function ()

if IsDead("patrols1") and IsDead("patrols2") and IsDead("patrols3") and IsDead("patrols4") then 
			--[[for i = 1,9,1 do 
				ChangePlayer("town2"..i,1)
			end]]

		Logic.ChangeAllEntitiesPlayerID(5, 1)



			guards = 1
			createBriefingMayorTown2()
		

			local x,y=Tools.GetPosition("bank1")
			GUI.CreateMinimapPulse(x,y)
			local x,y=Tools.GetPosition("bank")
			GUI.CreateMinimapPulse(x,y)
			local x,y=Tools.GetPosition("bank2")
			GUI.CreateMinimapPulse(x,y)
				return true
end

end

createBriefingMayorTown2 = function ()
		briefingMayorTown2 				= 	{}	
		briefingMayorTown2.finished 			= 	BriefingMayorTown2Finished


		local page = 0

	--	page
	
		page = page +1
	
		briefingMayorTown2[page] 					= 	{}
		briefingMayorTown2[page].title					= 	String.Key("briefingMayorTown2[1].title") 
		briefingMayorTown2[page].text					=	String.Key("briefingMayorTown2[1].text")
		briefingMayorTown2[page].position				=	GetPosition("patrol3")
		briefingMayorTown2[page].explore				=	2000

		

                briefingTerminatMayorTown2 = briefingMayorTown2[page]
	

		StartBriefing(briefingMayorTown2)
end

BriefingMayorTown2Finished = function()
createNPCGateMan()
spawnTown2Defenders()
end


createNPCGateMan = function()

--0EnableNpcMarker("gateman")
StartSimpleJob("IsDarioNearGateMan")
end


IsDarioNearGateMan = function ()

if IsNear("Dario","gateman",1500) and bankos == 0 then createBriefingDoEverything()
return true
end
end


createBriefingDoEverything = function()
		BriefingDoEverything 				= 	{}	
		BriefingDoEverything.finished 			= 	BriefingDoEverythingFinished


		local page = 0

	--	page
	
		page = page +1
	
		BriefingDoEverything[page] 					= 	{}
		BriefingDoEverything[page].title				= 	String.Key("BriefingDoEverything[1].title") 
		BriefingDoEverything[page].text					=	String.Key("BriefingDoEverything[1].text")
		BriefingDoEverything[page].position				=	GetPosition("gateman")
		BriefingDoEverything[page].explore				=	1000

		

                briefingTerminatMayorTown2 = BriefingDoEverything[page]
	

		StartBriefing(BriefingDoEverything)



end

BriefingDoEverythingFinished =function()

end

createQuestConquerTown3 = function()
Dario = CreateEntity(1,Entities.PU_Hero1c,GetPosition("entrance"),"Dario1")
		ConquerTown3				= 	{}	
		ConquerTown3.finished 			= 	ConquerTown3Finished


		local page = 0

	--	page
	
		page = page +1
	
		ConquerTown3[page] 					= 	{}
		ConquerTown3[page].title				= 	String.Key("ConquerTown3[1].title") 
		ConquerTown3[page].text					=	String.Key("ConquerTown3[1].text")
		ConquerTown3[page].position				=	GetPosition("rebel_lead")
		--ConquerTown3[page].explore				=	2000

	
	--	page
	
		page = page +1
	
		ConquerTown3[page] 					= 	{}
		ConquerTown3[page].title				= 	String.Key("ConquerTown3[2].title") 
		ConquerTown3[page].text					=	String.Key("ConquerTown3[2].text")
		ConquerTown3[page].position				=	GetPosition("rebel_lead")
		--ConquerTown3[page].explore				=	2000


	--	page
	
		page = page +1
	
		ConquerTown3[page] 					= 	{}
		ConquerTown3[page].title				= 	String.Key("ConquerTown3[3].title") 
		ConquerTown3[page].text					=	String.Key("ConquerTown3[3].text")
		ConquerTown3[page].position				=	GetPosition("Dario")
		--ConquerTown3[page].explore				=	2000



	--	page
	
		page = page +1
	
		ConquerTown3[page] 					= 	{}
		ConquerTown3[page].title				= 	String.Key("ConquerTown3[4].title") 
		ConquerTown3[page].text					=	String.Key("ConquerTown3[4].text")
		ConquerTown3[page].position				=	GetPosition("rebel_lead")
		--ConquerTown3[page].explore				=	2000

	--	page
	
		page = page +1
	
		ConquerTown3[page] 					= 	{}
		ConquerTown3[page].title				= 	String.Key("ConquerTown3[5].title") 
		ConquerTown3[page].text					=	String.Key("ConquerTown3[5].text")
		ConquerTown3[page].position				=	GetPosition("darkness")
		--ConquerTown3[page].explore				=	2000

		page = page +1
	
		ConquerTown3[page] 					= 	{}
		ConquerTown3[page].title				= 	String.Key("ConquerTown3[5].title") 
		ConquerTown3[page].text					=	String.Key("ConquerTown3[5].text")
		ConquerTown3[page].position				=	GetPosition("Dario1")
		--ConquerTown3[page].explore				=	2000


		ConquerTown3[page].quest					=	{}
		ConquerTown3[page].quest.id				=	4
		ConquerTown3[page].quest.type				=	MAINQUEST_OPEN
		ConquerTown3[page].quest.title				=	String.Key("ConquerTown3.quest.title")
		ConquerTown3[page].quest.text				=	String.Key("ConquerTown3.quest.text") 



	
		

                briefingTerminatConquerTown3 = ConquerTown3[page]
	
		StartBriefing(ConquerTown3)





end

ConquerTown3Finished = function()
DestroyEntity("Dario")
DestroyEntity("Dario1")
Dario = CreateEntity(1,Entities.PU_Hero1c,GetPosition("entrance"),"Dario")
StartSimpleJob("IsTown3Free")
end

IsTown3Free= function()

if IsDead("patrols21") and IsDead("patrols22") and IsDead("patrols23") and IsDead("patrols24") and IsDead("campers1") and IsDead("campers2") and IsDead("campers3") and IsDead("campers4") and IsDead("campers5") and IsDead("campers6") then createBriefingTown3Free()
return true
end
end


createBriefingTown3Free = function()
createBriefingAlliesArrive()
if IsDead("Dario") then 
			local pos = GetPosition("Dario")
			DestroyEntity("Dario")
			CreateEntity(1, Entities.PU_Hero1c, pos, "Dario" )
		end
briefingTown3Free 				= 	{}	
		briefingTown3Free.finished 			= 	BriefingTown3FreeFinished


		local page = 0

	--	page
	
		page = page +1
	
		briefingTown3Free[page] 					= 	{}
		briefingTown3Free[page].title					= 	String.Key("briefingTown3Free[1].title") 
		briefingTown3Free[page].text					=	String.Key("briefingTown3Free[1].text")
		briefingTown3Free[page].position				=	GetPosition("t21")
		briefingTown3Free[page].explore					=	2000

	--	page
	
		page = page +1
	
		briefingTown3Free[page] 					= 	{}
		briefingTown3Free[page].title					= 	String.Key("briefingTown3Free[2].title") 
		briefingTown3Free[page].text					=	String.Key("briefingTown3Free[2].text")
		briefingTown3Free[page].position				=	GetPosition("Dario")
		--briefingTown3Free[page].explore				=	2000

	
	--	page
	
		page = page +1
	
		briefingTown3Free[page] 					= 	{}
		briefingTown3Free[page].title					= 	String.Key("briefingTown3Free[3].title") 
		briefingTown3Free[page].text					=	String.Key("briefingTown3Free[3].text")
		briefingTown3Free[page].position				=	GetPosition("lidah")
		--briefingTown3Free[page].explore				=	2000


	--	page
	
		page = page +1
	
		briefingTown3Free[page] 					= 	{}
		briefingTown3Free[page].title					= 	String.Key("briefingTown3Free[3].title") 
		briefingTown3Free[page].text					=	String.Key("briefingTown3Free[3].text")
		briefingTown3Free[page].position				=	GetPosition("Drake")
		--briefingTown3Free[page].explore				=	2000



	
                briefingTerminatTown3Free = briefingTown3Free[page]
		StartBriefing(briefingTown3Free)

end



BriefingTown3FreeFinished = function()

ResolveBriefing(briefingTerminatConquerTown3)
local x,y=Tools.GetPosition("lidah")
GUI.CreateMinimapPulse(x,y)
local x,y=Tools.GetPosition("Drake")
GUI.CreateMinimapPulse(x,y)

--[[for i = 1,13,1 do 
ChangePlayer("t2"..i,1)
end]]

Logic.ChangeAllEntitiesPlayerID(7, 1)


spawnTown3Defenders()


end





