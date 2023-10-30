------------- Quests Chapter I ----




-------- Spawning Ragnar


createNpcRagnarCh1 = function ()

local npc	= {}
	npc.name = "Ragnar"
	npc.callback  = Ragnar1stChapter


	CreateNPC(npc)


end

Ragnar1stChapter = function()

wp =0
createBriefingRagnarChapterI()

end



------------------- Briefing with ragnar - he demands 10 000 wood 
createBriefingRagnarChapterI = function()



BriefingRagnarChapterI= {}
BriefingRagnarChapterI.finished = BriefingRagnarChapterIFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingRagnarChapterI[page] 					= 	{}
		BriefingRagnarChapterI[page].title				= 	String.Key("BriefingRagnarChapterI[1].title") 
		BriefingRagnarChapterI[page].text				=	String.Key("BriefingRagnarChapterI[1].text")
		BriefingRagnarChapterI[page].position				=	GetPosition("Dario")
		--BriefingRagnarChapterI[page].explore				=	10000


	
		--	page 2
	
		page = page +1
	
		BriefingRagnarChapterI[page] 					= 	{}
		BriefingRagnarChapterI[page].title				= 	String.Key("BriefingRagnarChapterI[2].title") 
		BriefingRagnarChapterI[page].text				=	String.Key("BriefingRagnarChapterI[2].text")
		BriefingRagnarChapterI[page].position				=	GetPosition("Ragnar")
		--BriefingRagnarChapterI[page].explore				=	1000


		--	page 3
	
		page = page +1
	
		BriefingRagnarChapterI[page] 					= 	{}
		BriefingRagnarChapterI[page].title				= 	String.Key("BriefingRagnarChapterI[3].title") 
		BriefingRagnarChapterI[page].text				=	String.Key("BriefingRagnarChapterI[3].text")
		BriefingRagnarChapterI[page].position				=	GetPosition("Ragnar")
		--BriefingRagnarChapterI[page].explore				=	10000

		--	page 4

		page = page +1
	
		BriefingRagnarChapterI[page] 					= 	{}
		BriefingRagnarChapterI[page].title				= 	String.Key("BriefingRagnarChapterI[4].title") 
		BriefingRagnarChapterI[page].text				=	String.Key("BriefingRagnarChapterI[4].text")
		BriefingRagnarChapterI[page].position				=	GetPosition("ragnarwood")
		BriefingRagnarChapterI[page].explore				=	3000


		--	page 4
		page = page +1
	
		BriefingRagnarChapterI[page] 					= 	{}
		BriefingRagnarChapterI[page].title				= 	String.Key("BriefingRagnarChapterI[5].title") 
		BriefingRagnarChapterI[page].text				=	String.Key("BriefingRagnarChapterI[5].text")
		BriefingRagnarChapterI[page].position				=	GetPosition("Dario")
		--BriefingRagnarChapterI[page].explore				=	10000
		






briefingTerminatRagnarChapterI = BriefingRagnarChapterI[page]

StartBriefing(BriefingRagnarChapterI)
		
end

BriefingRagnarChapterIFinished = function ()
QuestCutDownForest()

end





-------------------- The tribute function for ragnar's wood delivery

RagnarsWood = function ()

local job = {}		
				job.Tribute = 1
				Logic.AddTribute(			1, 
									job.Tribute,
									0,
									0,
									String.Key("treeschopped"),
									ResourceType.Wood, 
									10000 )			
				job.Callback = Woodpayment
				SetupTributePaid(job)					

end



Woodpayment = function ()

	createBriefingWoodPaid()
	wp =1

end



createBriefingWoodPaid = function()


BriefingWoodPaid= {}
BriefingWoodPaid.finished = BriefingWoodPaidFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingWoodPaid[page] 						= 	{}
		BriefingWoodPaid[page].title					= 	String.Key("BriefingWoodPaid[1].title") 
		BriefingWoodPaid[page].text					=	String.Key("BriefingWoodPaid[1].text")
		BriefingWoodPaid[page].position					=	GetPosition("Ragnar")
		--BriefingWoodPaid[page].explore				=	10000


	
		
briefingTerminatWoodPaid = BriefingWoodPaid[page]

StartBriefing(BriefingWoodPaid)

end


BriefingWoodPaidFinished = function()

ResolveBriefing(briefingTerminatForestDown)
createNpcRagnarThieving()

end



---------------- Ragnar's demand must be covered up as an operation to develop the city by cutting down the forest to the west



QuestCutDownForest = function()


	local npc	= {}
	npc.name = "Mayor"
	npc.callback  = BriefingForestDown


	CreateNPC(npc)


end


BriefingForestDown = function()

-- spawn volunteer workers

local i = 0
for i = 1,8,1 do
	worker = CreateEntity(1,Entities.PU_Serf,GetPosition("workspawn"),"volonteer"..i)
	Move("volonteer"..i, "workspawn")
end

BriefingForestDown= {}
BriefingForestDown.finished = BriefingForestDownFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingForestDown[page] 					= 	{}
		BriefingForestDown[page].title					= 	String.Key("BriefingForestDown[1].title") 
		BriefingForestDown[page].text					=	String.Key("BriefingForestDown[1].text")
		BriefingForestDown[page].position				=	GetPosition("Dario")
		--BriefingForestDown[page].explore				=	10000


	
		--	page 2
	
		page = page +1
	
		BriefingForestDown[page] 					= 	{}
		BriefingForestDown[page].title					= 	String.Key("BriefingForestDown[2].title") 
		BriefingForestDown[page].text					=	String.Key("BriefingForestDown[2].text")
		BriefingForestDown[page].position				=	GetPosition("Mayor")
		--BriefingForestDown[page].explore				=	1000


		--	page 3
	
		page = page +1
	
		BriefingForestDown[page] 					= 	{}
		BriefingForestDown[page].title					= 	String.Key("BriefingForestDown[3].title") 
		BriefingForestDown[page].text					=	String.Key("BriefingForestDown[3].text")
		BriefingForestDown[page].position				=	GetPosition("ragnarwood")
		--BriefingForestDown[page].explore				=	10000

		--	page 4

		page = page +1
	
		BriefingForestDown[page] 					= 	{}
		BriefingForestDown[page].title					= 	String.Key("BriefingForestDown[4].title") 
		BriefingForestDown[page].text					=	String.Key("BriefingForestDown[4].text")
		BriefingForestDown[page].position				=	GetPosition("Mayor")
		--BriefingForestDown[page].explore				=	10000
		

		--	page 5

		page = page +1
	
		BriefingForestDown[page] 					= 	{}
		BriefingForestDown[page].title					= 	String.Key("BriefingForestDown[5].title") 
		BriefingForestDown[page].text					=	String.Key("BriefingForestDown[5].text")
		BriefingForestDown[page].position				=	GetPosition("workspawn")
		--BriefingForestDown[page].explore				=	10000


		BriefingForestDown[page].quest					=	{}
		BriefingForestDown[page].quest.id				=	1
		BriefingForestDown[page].quest.type	    			=	MAINQUEST_OPEN
		BriefingForestDown[page].quest.title				=	String.MainKey.."briefingForestDown.quest.title"
		BriefingForestDown[page].quest.text	    			=	String.MainKey.."briefingForestDown.quest.text"




briefingTerminatForestDown = BriefingForestDown[page]

StartBriefing(BriefingForestDown)


end


BriefingForestDownFinished = function()
StartSimpleJob("TimerChapter2")
StartSimpleJob("BuildThePlateau")
x= 0
y = 0
z = 0
createQuest1()
createQuest2()
createQuest3()
--[[local c=0
for c = 1,16,1 do 
	ChangePlayer("p"..c,1)
end]]
--ChangePlayer("p1b",1)

Logic.ChangeAllEntitiesPlayerID(4, 1)
ChangePlayer("p16",4)
ChangePlayer("p17",4)

end





-- Quest chain ffs!!
-----------==================================
----------------------------------------=====

---------------- de markit
createQuest1 = function()

            

                        local pos = GetPosition("builduparea1")

                        if AreEntitiesInArea(1,Entities.PB_Market2, pos, 10000,1) == true 

                                    then 

                                    x = 1

                                    return true

                        end

 

               -- Quest

                local Quest1 = {}
		Quest1.AreaPos = "builduparea1"
		Quest1.AreaSize = 10000
		Quest1.EntityTypes =	{ 	{ Entities.PB_Market2, 1}}
		Quest1.Callback = Quest1done
		SetupEstablish(Quest1)

end



createQuest2 = function()

            

                        local pos = GetPosition("builduparea1")

                        if AreEntitiesInArea(1,Entities.PB_Blacksmith2, pos, 10000,1) == true or AreEntitiesInArea(1,Entities.PB_Blacksmith3, pos, 10000,1) == true 

                                    then 

                                    y = 1

                                    return true

                        end

 

               -- Quest

                
		local Quest2 = {}
		Quest2.AreaPos = "builduparea1"
		Quest2.AreaSize = 10000
	
		Quest2.EntityTypes =	{ 	{ Entities.PB_Blacksmith2, 1}
						
					}
	
		Quest2.Callback = Quest2done

		SetupEstablish(Quest2)

end



createQuest3 = function()

            

                        local pos = GetPosition("builduparea1")

                        if AreEntitiesInArea(1,Entities.PB_Barracks1, pos, 10000,1) == true or AreEntitiesInArea(1,Entities.PB_Barracks2, pos, 10000,1) == true 

                                    then 

                                    z = 1

                                    return true

                        end

 

               -- Quest

                
	
		local Quest3 = {}
		Quest3.AreaPos = "builduparea1"
		Quest3.AreaSize = 10000
	
		Quest3.EntityTypes =	{ 	
						{ Entities.PB_Barracks1, 1}
					}
	
		Quest3.Callback = Quest3done

		SetupEstablish(Quest3)
 

end



Quest1done = function()
x = 1
end

Quest2done = function()
y = 1
end

Quest3done = function()
z = 1
end

BuildThePlateau = function()

if x ==1 and y  ==1 and z ==1 then 

createBriefingPayRagnar()
return true
end
end



-------------- Small delay before
TIMER2 = 60*2
TimerChapter2 = function ()


	if TIMER2 == 1 then Start2ndChapter()

	return true

	else
	TIMER2 = TIMER2 - 1
	end

end



createBriefingPayRagnar = function()

BriefingPayRagnar = {}
BriefingPayRagnar.finished = BriefingPayRagnarFinished


	local page=0	


		--	page 4

		page = page +1
	
		BriefingPayRagnar[page] 					= 	{}
		BriefingPayRagnar[page].title					= 	String.Key("BriefingPayRagnar[1].title") 
		BriefingPayRagnar[page].text					=	String.Key("BriefingPayRagnar[1].text")
		BriefingPayRagnar[page].position				=	GetPosition("Ragnar")
		--BriefingPayRagnar[page].explore					=	1000
		



briefingTerminatPayRagnar = BriefingPayRagnar[page]

StartBriefing(BriefingPayRagnar)

end

BriefingPayRagnarFinished = function ()


RagnarsWood ()

end
----------------


createNpcRagnarThieving =  function()

	local npc	= {}
	npc.name = "Ragnar"
	npc.callback  = Thiefmission


	CreateNPC(npc)


end

Thiefmission = function ()
	check4quests()
	--createBriefingRagnarMission()

end




check4quests  = function()

if quest1 == 1 and quest2==1 and wp == 1 then createBriefingRagnarMission()

	else createBriefingNotYet()
end
end




createBriefingNotYet  = function()

BriefingNotYet = {}
BriefingNotYet.finished = BriefingNotYetFinished


	local page=0	


		--	page 4

		page = page +1
	
		BriefingNotYet[page] 						= 	{}
		BriefingNotYet[page].title					= 	String.Key("BriefingNotYet[1].title") 
		BriefingNotYet[page].text					=	String.Key("BriefingNotYet[1].text")
		BriefingNotYet[page].position					=	GetPosition("Dario")
		--BriefingNotYet[page].explore					=	10000
		

		
briefingTerminatNotYet = BriefingNotYet[page]

StartBriefing(BriefingNotYet)

end

BriefingNotYetFinished = function()

createNpcRagnarThieving()
end



createBriefingRagnarMission = function()

BriefingRagnarMission= {}
BriefingRagnarMission.finished = BriefingRagnarMissionFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingRagnarMission[page] 						= 	{}
		BriefingRagnarMission[page].title					= 	String.Key("BriefingRagnarMission[1].title") 
		BriefingRagnarMission[page].text					=	String.Key("BriefingRagnarMission[1].text")
		BriefingRagnarMission[page].position					=	GetPosition("Ragnar")
		--BriefingRagnarMission[page].explore					=	10000


	--	page 2
	
		page = page +1
	
		BriefingRagnarMission[page] 						= 	{}
		BriefingRagnarMission[page].title					= 	String.Key("BriefingRagnarMission[2].title") 
		BriefingRagnarMission[page].text					=	String.Key("BriefingRagnarMission[2].text")
		BriefingRagnarMission[page].position					=	GetPosition("Dario")
		--BriefingRagnarMission[page].explore					=	10000


	--	page 3
	
		page = page +1
	
		BriefingRagnarMission[page] 						= 	{}
		BriefingRagnarMission[page].title					= 	String.Key("BriefingRagnarMission[3].title") 
		BriefingRagnarMission[page].text					=	String.Key("BriefingRagnarMission[3].text")
		BriefingRagnarMission[page].position					=	GetPosition("Ragnar")
		--BriefingRagnarMission[page].explore					=	10000
	
	
	
	--	page 4
	
		page = page +1
	
		BriefingRagnarMission[page] 						= 	{}
		BriefingRagnarMission[page].title					= 	String.Key("BriefingRagnarMission[4].title") 
		BriefingRagnarMission[page].text					=	String.Key("BriefingRagnarMission[4].text")
		BriefingRagnarMission[page].position					=	GetPosition("Ragnar")
		--BriefingRagnarMission[page].explore					=	10000

	
	--	page 5
	
		page = page +1
	
		BriefingRagnarMission[page] 						= 	{}
		BriefingRagnarMission[page].title					= 	String.Key("BriefingRagnarMission[5].title") 
		BriefingRagnarMission[page].text					=	String.Key("BriefingRagnarMission[5].text")
		BriefingRagnarMission[page].position					=	GetPosition("Dario")
		--BriefingRagnarMission[page].explore					=	10000

	

		BriefingRagnarMission[page].quest					=	{}
		BriefingRagnarMission[page].quest.id					=	7
		BriefingRagnarMission[page].quest.type	    				=	MAINQUEST_OPEN
		BriefingRagnarMission[page].quest.title					=	String.MainKey.."BriefingRagnarMission.quest.title"
		BriefingRagnarMission[page].quest.text	    				=	String.MainKey.."BriefingRagnarMission.quest.text"


briefingTerminatRagnarMission = BriefingRagnarMission[page]

StartBriefing(BriefingRagnarMission)

end


BriefingRagnarMissionFinished = function()
cannons = 0
createQuestBuildDefense()
DestroyEntity("Ragnar")
Thief = CreateEntity(3,Entities.PU_LeaderSword2,GetPosition("thiefden"),"Ragnar")
Move("Ragnar","keep1")
StartSimpleJob("IsThiefNearVarg")
timer = 900
GUIQuestTools.ToggleStopWatch(timer ,1)
StartSimpleJob("TimerThief")
local x,y = Tools.GetPosition("defping")
GUI.CreateMinimapPulse(x,y)


end

createQuestBuildDefense = function()
--[[
	-- Quest
	local Quest = {}
	Quest.AreaPos = "defense"
	Quest.AreaSize = 3200
	
	Quest.EntityTypes =	{ 	{ Entities.PB_Tower2, 4}
				}
	
	Quest.Callback = DefenseDone

	SetupEstablish(Quest)
--]]
	StartSimpleJob("QuestTowersJob")
end

function QuestTowersJob()
	if Counter.Tick2("QuestTowersJob", 5) then
		if CountTowers() >= 4 then
			DefenseDone()
			return true
		end
	end
end

function CountTowers()
	local pos = GetPosition("defense")
	local towerCount1 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower2, pos.X, pos.Y, 3200, 6)}
	local towerCount2 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower2, pos.X, pos.Y, 3200, 6)}
	local towerCount3 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower3, pos.X, pos.Y, 3200, 6)}
	local towerCount4 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower3, pos.X, pos.Y, 3200, 6)}

	return (towerCount1[1] + towerCount2[1] + towerCount3[1] + towerCount4[1])
end

DefenseDone = function ()
	local x,y = Tools.GetPosition("defping")
	GUI.DestroyMinimapPulse(x,y)
	ResolveBriefing (briefingTerminatRagnarMission)
	createBriefingSpawnCitizens()
end

createBriefingSpawnCitizens = function()
SpawnCitz()
BriefingSpawnCitizens = {}
BriefingSpawnCitizens.finished = BriefingSpawnCitizensFinished


	local page=0	


		--	page 4

		page = page +1
	
		BriefingSpawnCitizens[page] 						= 	{}
		BriefingSpawnCitizens[page].title					= 	String.Key("BriefingSpawnCitizens[1].title") 
		BriefingSpawnCitizens[page].text					=	String.Key("BriefingSpawnCitizens[1].text")
		BriefingSpawnCitizens[page].position					=	GetPosition("workspawn")
		--BriefingSpawnCitizens[page].explore					=	10000
		

		
briefingTerminatSpawnCitizens = BriefingSpawnCitizens[page]

StartBriefing(BriefingSpawnCitizens)
end

BriefingSpawnCitizensFinished = function()

end




TimerThief = function()

	if timer == 0 then  createBriefingThiefEscapes()
				return true

			else timer = timer -1
	end
end


		
	



IsThiefNearVarg = function ()

	if IsNear("Ragnar","keep1",500) then 
						Preparation()
	return true
	end

end


