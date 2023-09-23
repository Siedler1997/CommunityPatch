-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	do what you want
--
-------------------------------------------------------------------------------------------------------------------------
neargate1=0
neargate2=0
npcinfo=0
---------------------------------------------------------------------------------------------------------------start1stQuest = function()
function start1stQuest()

	Report("start 1st quest")

	createBriefingPrelude()

	mines=0

	local Quest1 = {}
	Quest1.EntityTypes =	{	{Entities.PB_ClayMine1,1},}									 
	Quest1.Callback = mineBuild
	SetupEstablish(Quest1)

	local Quest2 = {}
	Quest2.EntityTypes =	{	{Entities.PB_StoneMine1,1},}									
	Quest2.Callback = mineBuild
	SetupEstablish(Quest2)

	local Quest3 = {}
	Quest3.EntityTypes =	{	{Entities.PB_IronMine1,1},}									
	Quest3.Callback = mineBuild
	SetupEstablish(Quest3)

	local Quest4 = {}
	Quest4.EntityTypes =	{	{Entities.PB_SulfurMine1,1},}									
	Quest4.Callback = mineBuild
	SetupEstablish(Quest4)

	EnableNpcMarker("npcinfo1")
	EnableNpcMarker("merchant1")
	EnableNpcMarker("warrior")

	StartJob("VillageEast")
	StartJob("Waterfall2")
	StartJob("Waterfall1")
	StartJob("OldCastle")

    createArmySouthernAssault()

	createArmySpawn()
	createArmyDefend()

	createKeyQuest()

	startQuestDefeat()
	startQuestVictory()

    end
---------------------------------------------------------------------------------------------------------------
function end1stQuest()

	Report("end 1st quest")

	ResolveBriefing(briefingPrelude[page_prelude])

end
-----------------
function mineBuild()

	mines = mines+1
	
	if mines == 4 then 
		
		mineQuestCallback()
		
	end

end
---------------------------------------------------------------------------------------------------------------
function mineQuestCallback()

	end1stQuest()

    start2ndQuest()

    end
-------------------------------------------------------------------------------------------------------------------------
function start2ndQuest()

	Report("start 2nd quest")

    createBriefing2ndQuest()

	StartSimpleJob("controlQuest2")

	end
-------------------------------------------------------------------------------------------------------------------------
function controlQuest2()

        if allClanCastlesAreDead() == false then
            return false
            end

		end2ndQuest()

		return true

		end
-------------------------------------------------------------------------------------------------------------------------
function allClanCastlesAreDead()

    return IsDead("p3castle") and IsDead("p4_castle1") and IsDead("p4_castle2")

    end
-------------------------------------------------------------------------------------------------------------------------
function end2ndQuest()

	Report("end 2nd quest")

	ResolveBriefing(briefing2ndQuest[briefing2ndQuestPage])

	start3rdQuest()

	end
-------------------------------------------------------------------------------------------------------------------------
function start3rdQuest()

	Report("start 3rd quest")

	createBriefing3rdQuest()

	EnableNpcMarker("rat")

	StartSimpleJob("controlQuestUnlockGate1")
	StartSimpleJob("controlQuestUnlockGate2")
	StartSimpleJob("controlQuestDestroyFoundry")

	end
-------------------------------------------------------------------------------------------------------------------------
function controlQuestUnlockGate1()

		if IsNear("braveheart","gatekey1", 1500) then

    		if IsDead("tower1") then

        		ReplaceEntity("gatekey1", Entities.XD_WallStraightGate)
        		ReplaceEntity("gatekey2", Entities.XD_WallStraightGate)

        		return true

    		elseif neargate1 == 0 then

		        createGeneralBriefing("gatekey1","nokey")

		        neargate1=1

		        return false

                end
	    	end

	end
-------------------------------------------------------------------------------------------------------------------------
function controlQuestUnlockGate2()
    if IsNear("braveheart","gatekey3", 1500) then
		if IsDead("tower2") then
    		ReplaceEntity("gatekey3", Entities.XD_WallStraightGate)
    		ReplaceEntity("gatekey4", Entities.XD_WallStraightGate)
    		return true
		elseif neargate2 == 0 then
    		createGeneralBriefing("gatekey3","nokey")
    		neargate2=1
    		return false
    		end
	    end
    end
-------------------------------------------------------------------------------------------------------------------------
function controlQuestDestroyFoundry()
    if IsDead("foundry") then
    	local cannons = {Entities.PV_Cannon4}
		p1cannons = {}
		createArmy(1,2,p1cannons,3,"p1cannons",MEDIUM_EXPERIENCE,cannons)
	    createGeneralBriefing("p1cannons","cannons")
		return true
		end
    end

-------------------------------------------------------------------------------

createKeyQuest = function ()

	StartJob("findKey1")

	StartJob("findKey2")

	end

Condition_findKey1 = function()

		return IsDead("tower1")

		end
Action_findKey1 = function()

		createGeneralBriefing("rob3","key")

		return true

		end

Condition_findKey2 = function()

		return IsDead("tower2")

		end
Action_findKey2 = function()

		createGeneralBriefing("rob6","key")

		return true

		end






-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------

GameCallback_NPCInteraction = function(_heroId,_npcId)

	if IsBriefingActive() then
		return
		end

	if Logic.IsHero(_heroId) then

		if _npcId == GetEntityId("warrior") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("warrior")
				createGeneralBriefing("warrior","warrior.quest", "warrior.title")
				local job = {}
				job.Tribute = 1
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("warrior.tribute"),
									ResourceType.Gold,
									500 )
				job.Ralleypoint	= "braveheart"
				job.Callback    = TributePaid1
				SetupTributePaid(job)
    			end
	    	end

		if _npcId == GetEntityId("merchant1") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("merchant1")
				createGeneralBriefing("merchant1","merchant1.quest","merchant1.title")
				local job = {}
				job.Tribute = 6
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("merchant1.tribute"),
									ResourceType.Wood,
									700 )
				job.Ralleypoint	= "bravehart"
				job.Resources 	= { stone = 1000 }
				job.Callback = TributePaid7
				SetupTributePaid(job)
    			end
	    	end

		if _npcId == GetEntityId("rat") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("rat")
				createGeneralBriefing("rat","briefingRat")
				local job = {}
				job.Tribute = 2
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("rat.txt"),
									ResourceType.Stone,		2000,
									ResourceType.Wood,		2000,
									ResourceType.Clay,		2000,
									ResourceType.Iron,		2000,
									ResourceType.Gold,		2000,
									ResourceType.Sulfur,	2000)
				job.Callback = TributePaid2
				SetupTributePaid(job)
    			end
	    	end

		if _npcId == GetEntityId("npcinfo1") and npcinfo==0 then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("npcinfo1")
				createGeneralBriefing("npcinfo1","npcinfo1","npcinfo1.title")
				StartJob("npcinfo1")
        		end
    		end

		if _npcId == GetEntityId("npcinfo1") and npcinfo==1 then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("npcinfo1")
				createGeneralBriefing("npcinfo1","fishing","npcinfo1.title")
        		end
    		end
        end
    end
-------------------------------------------------------------------------------------------------------------------
Condition_npcinfo1 = function()
-------------------------------------------------------------------------------------------------------------------
	if Counter.Tick2("npcinfo1",120) then
    	Move("npcinfo1","fishingpoint")
	    return true
	    end
    end
-------------------------------------------------------------------------------------------------------------------
Action_npcinfo1 = function()
-------------------------------------------------------------------------------------------------------------------
	npcinfo=1
	EnableNpcMarker("npcinfo1")
	return true
	end

-------------------------------------------------------------------------------------------------------------------------
TributePaid1 = function()
	local bravePos = GetPosition("p8barracks")
	AI.Entity_CreateFormation(1, Entities.PU_LeaderSword3,0,6,bravePos.X,bravePos.Y,0,0,2,0)
	return true
end
-------------------------------------------------------------------------------------------------------------------------
TributePaid2 = function()
	createGeneralBriefing("gate1","opengates")
	ReplaceEntity("gate1", Entities.XD_WallStraightGate)
	return true
	end
-------------------------------------------------------------------------------------------------------------------------
TributePaid4 = function()

    local job1 = {}

	job1.Tribute = 5

	Logic.AddTribute(	GetHumanPlayer(),
	                    job1.Tribute,
						0,
						0,
						String.Key("merchant3.quest"),
						ResourceType.Gold,
						500
					)

    job1.Ralleypoint	= "bravehart"
    job1.Spawn 		    = { {	Pos 		= "cannons",LeaderType 	= Entities.PV_Cannon4 }	}

    job1.Callback = TributePaid6

	SetupTributePaid(job1)

	end
-------------------------------------------------------------------------------------------------------------------------
TributePaid6 = function()
	return true
	end
-------------------------------------------------------------------------------------------------------------------------
TributePaid7 = function()
	return true
	end
-------------------------------------------------------------------------------------------------------------------------
TributePaid8 = function()
	return true
	end
-------------------------------------------------------------------------------------------------------------------------
TributePaid9 = function()
	return true
	end