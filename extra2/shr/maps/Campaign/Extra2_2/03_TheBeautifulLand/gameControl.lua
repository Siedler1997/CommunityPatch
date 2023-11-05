StartQ2_DELAY 		=       60
StartQ2_COUNTER		=	StartQ2_DELAY

------------------------------------------------------------------------------------------------

function start1stChapter()

        EnableNpcMarker("IronLeader")
	createBriefingPrelude()
	CreatePlayer1Army()
	CreateTentsArmy()
	StartJob("StartQ2")
	StartJob("TentScout1")
	StartJob("TentScout2")
	StartJob("TentScout3")
	--StartJob("AllFree")
	StartJob("Scout1Rescued")
	StartJob("Scout2Rescued")
	StartJob("Scout3Rescued")
	StartJob("AllInBase")
	StartJob("Start5thQuest")
	startQuestDefeat()
	StartJob("MonitorMess3Way")
	StartSimpleJob("Player2HQLife")
	BuildIronMine()
	BuildClayMine()


end
function end1stChapter()
	
	ResolveBriefing(briefingScoutsTaken)

-- destroy minimap marker
	local x, y = Tools.GetPosition("PreludeTarget1")
	GUI.DestroyMinimapPulse(x, y)

-- destroy minimap marker
	local x, y = Tools.GetPosition("PreludeTarget2")
	GUI.DestroyMinimapPulse(x, y)

	createBriefingScoutsFree()

	start3rdChapter()

end

------------------------------------------------------------------------------------------------

function start2ndChapter()

	CreateCaravan()
	createBriefingCaravan()
	CaravanControl()
	StartJob("CaravanAttack")
	StartJob("RewardGold")
	StartJob("RewardWood")
	StartJob("RewardSulfur")
	StartJob("RewardStone")
	StartJob("MinesQuest")
	--StartJob("PlaceMarkers3")
	--StartJob("PlaceMarkers4")

end
function end2ndChapter()
	
	ResolveBriefing(briefingMinesDone)

	QuestMinesReady=1

end

------------------------------------------------------------------------------------------------

function start3rdChapter()

		createBriefingErecMess()
		StartJob("MessengerIsDead")
		StartJob("TimeToGoToErec")
		StartJob("MessengerIsFree")


end
function end3rdChapter()
	
	ResolveBriefing(briefingErecMessSent)

	-- destroy minimap marker
	local x, y = Tools.GetPosition("ErecMessCameraTarget")
	GUI.DestroyMinimapPulse(x, y)

	start4thChapter()

end

------------------------------------------------------------------------------------------------

function start4thChapter()

	EnableNpcMarker("Alchemist")
	CreateLowPowerBombs()
	createBriefingDrakeMess()
	StartJob("TimeToGoToDrake")
	StartJob("Messenger2IsDead")
	StartJob("Messenger2IsFree")
	StartJob("CheckAlchemistPaid")

	--StartJob("CounterMessage")

end
function end4thChapter()
	
	QuestTwoMessGone=1
	ResolveBriefing(briefingDrakeMessGone)

	-- destroy minimap marker
	local x, y = Tools.GetPosition("MessDrakeCameraTarget")
	GUI.DestroyMinimapPulse(x, y)

	-- destroy minimap marker
	local x, y = Tools.GetPosition("Alchemist")
	GUI.DestroyMinimapPulse(x, y)

end

------------------------------------------------------------------------------------------------

function start5thChapter()

		createBriefingAriMess()
		StartJob("TimeToGoToAri")
		StartJob("Messenger3IsDead")
		StartJob("Messenger3IsFree")

end
function end5thChapter()

	-- destroy minimap marker
	local x, y = Tools.GetPosition("MessDrakeCameraTarget")
	GUI.DestroyMinimapPulse(x, y)

	ResolveBriefing(briefingAriMessGone)

	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)
	--Victory()

end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TentScout1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TentScout1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("TentScout1")

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TentScout1 = function()
	-------------------------------------------------------------------------------------------------------------------

		--local pos 	= GetPosition("Scout1Spawn")
		--Messenger1 	= Tools.CreateGroup(4, Entities.PU_Scout, 0, pos.X, pos.Y, 180)
		--SetEntityName(Messenger1, "Messenger1")

		Scout1Free=1

		Move("Messenger1","Mess1Target")

		StartJob("MoaraMata1")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MoaraMata1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MoaraMata1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Messenger1") and Prost1Dead == 0

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_MoaraMata1 = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TentScout2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TentScout2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("TentScout2")

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TentScout2 = function()
	-------------------------------------------------------------------------------------------------------------------

		--local pos 	= GetPosition("Scout2Spawn")
		--Messenger2 	= Tools.CreateGroup(4, Entities.PU_Scout, 0, pos.X, pos.Y, 180)
		--SetEntityName(Messenger2, "Messenger2")

		Scout2Free=1

		Move("Messenger2","Mess2Target")

		StartJob("MoaraMata2")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MoaraMata2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MoaraMata2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Messenger2") and Prost2Dead == 0

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_MoaraMata2 = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TentScout3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TentScout3 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("TentScout3")

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TentScout3 = function()
	-------------------------------------------------------------------------------------------------------------------

		--local pos 	= GetPosition("Scout3Spawn")
		--Messenger3 	= Tools.CreateGroup(4, Entities.PU_Scout, 0, pos.X, pos.Y, 180)
		--SetEntityName(Messenger3, "Messenger3")

		Scout3Free=1

		Move("Messenger3","Mess3Target")

		StartJob("MoaraMata3")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MoaraMata3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MoaraMata3 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Messenger3") and Prost3Dead == 0

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_MoaraMata3 = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AllFree"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AllFree = function()
	-------------------------------------------------------------------------------------------------------------------

                return Scout1Free==1 and Scout2Free==1 and Scout3Free==1

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_AllFree = function()
	-------------------------------------------------------------------------------------------------------------------

		Move("Messenger1","Mess1Target")
		Move("Messenger2","Mess2Target")
		Move("Messenger3","Mess3Target")



		--EndJob("Mess1IsDead11")
		--EndJob("Mess2IsDead22")
		--EndJob("Mess3IsDead33")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Scout1Rescued"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Scout1Rescued = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Messenger1","Mess1Target",200)

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_Scout1Rescued = function()
	-------------------------------------------------------------------------------------------------------------------

		Scout1InBase=1

		Prost1Dead = 1


		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Scout2Rescued"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Scout2Rescued = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Messenger2","Mess2Target",200)

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_Scout2Rescued = function()
	-------------------------------------------------------------------------------------------------------------------

		Scout2InBase=1

		Prost2Dead = 1


		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Scout3Rescued"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Scout3Rescued = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Messenger3","Mess3Target",200)

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_Scout3Rescued = function()
	-------------------------------------------------------------------------------------------------------------------

		Scout3InBase=1

		Prost3Dead = 1

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AllInBase"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AllInBase = function()
	-------------------------------------------------------------------------------------------------------------------

                return Scout1InBase==1 and Scout2InBase==1 and Scout3InBase==1

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_AllInBase = function()
	-------------------------------------------------------------------------------------------------------------------

		end1stChapter()

		return true


	end

---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "StartQ2"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_StartQ2 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if StartQ2_COUNTER > 0 then

                   StartQ2_COUNTER = StartQ2_COUNTER - 1

                   return false

                	elseif StartQ2_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_StartQ2 = function()
	-------------------------------------------------------------------------------------------------------------------

		start2ndChapter()

	return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CaravanAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CaravanAttack = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("CaravanIron","CaravanTargetIron",400) or IsNear("CaravanClay","CaravanTargetClay",400)

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_CaravanAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		local etype1 = Entities.PU_LeaderBow2
		local etype2 = Entities.PU_LeaderSword2
		local etype3 = Entities.PU_LeaderPoleArm2
		if CP_Difficulty > 0 then
			etype1 = Entities.PU_LeaderBow3
			etype2 = Entities.PU_LeaderSword3
			etype3 = Entities.PU_LeaderPoleArm3
		end

		local pos 	= GetPosition("CaravanAttackSpawn")
		CaravanAttackAS = AI.Entity_CreateFormation(2, etype1, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(CaravanAttackAS, "CaravanAttack1")

		local pos 	= GetPosition("CaravanAttackSpawn")
		CaravanAttackAS = AI.Entity_CreateFormation(2, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(CaravanAttackAS, "CaravanAttack2")

		local pos 	= GetPosition("CaravanAttackSpawn")
		CaravanAttackAS = AI.Entity_CreateFormation(2, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(CaravanAttackAS, "CaravanAttack3")

		local pos 	= GetPosition("CaravanAttackSpawn")
		CaravanAttackAS = AI.Entity_CreateFormation(2, etype3, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(CaravanAttackAS, "CaravanAttack4")

		local pos 	= GetPosition("CaravanAttackSpawn")
		CaravanAttackAS = AI.Entity_CreateFormation(2, etype3, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(CaravanAttackAS, "CaravanAttack5")

		StartJob("DeadCaravans")
		
		Attack("CaravanAttack1","CaravanIron")
		Attack("CaravanAttack2","CaravanIron")
		Attack("CaravanAttack4","CaravanIron")
		Attack("CaravanAttack3","CaravanClay")
		Attack("CaravanAttack5","CaravanClay")
		createBriefingCaravanAttack()
		StartJob("DeadForSure")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadCaravans"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadCaravans = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("CaravanClay") and IsDead("CaravanIron")

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_DeadCaravans = function()
	-------------------------------------------------------------------------------------------------------------------

		Move("CaravanGold","CaravanHQGold")
		Move("CaravanWood","CaravanHQWood")
		Move("CaravanStone","CaravanHQStone")
		Move("CaravanSulfur","CaravanHQSulfur")

		Attack("CaravanAttack1","Player2HQ")
		Attack("CaravanAttack2","Player2HQ")
		Attack("CaravanAttack3","Player2HQ")
		Attack("CaravanAttack4","Player2HQ")
		Attack("CaravanAttack5","Player2HQ")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadForSure"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadForSure = function()
	-------------------------------------------------------------------------------------------------------------------

                if IsBriefingActive() then

			return false

		else

			return true

		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_DeadForSure = function()
	-------------------------------------------------------------------------------------------------------------------

		DestroyEntity("CaravanClay")
		DestroyEntity("CaravanIron")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MinesQuest"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MinesQuest = function()
	-------------------------------------------------------------------------------------------------------------------

                return Caravan1Done==1 and Caravan2Done==1 and Caravan3Done==1 and Caravan4Done==1

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_MinesQuest = function()
	-------------------------------------------------------------------------------------------------------------------

		createBriefingMines()

		StartJob("MinesAreBuilt")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
-----------------------------------------------------------------------------------------------------------------------	
-----------------------------------------------------------------------------------------------------------------------	

function BuildIronMine()

	local pos = GetPosition("IronMineTarget")

	if AreEntitiesInArea(1,Entities.PB_IronMine1, pos, 3000,1) == true then 

		IronMineIsBuild=1
		return true
	end


	-- Quest

	local Quest = {}

	Quest.AreaPos = "IronMineTarget"

	Quest.AreaSize = 3000

	Quest.EntityTypes = {    { Entities.PB_IronMine1, 1}}

	Quest.Callback = QuestStone

	SetupEstablish(Quest)

end

function QuestStone()

IronMineIsBuild=1

end

------------------------------------------------------------------------------------------------

function BuildClayMine()

	local Quest1 = {}

	Quest1.EntityTypes = { { Entities.PB_ClayMine1, 1}}

	Quest1.Callback = QuestClay1

	SetupEstablish(Quest1)

end

function QuestClay1()

ClayMineIsBuild=1

end

-----------------------------------------------------------------------------------------------------------------------	
-----------------------------------------------------------------------------------------------------------------------	
-----------------------------------------------------------------------------------------------------------------------	

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MinesAreBuilt"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MinesAreBuilt = function()
	-------------------------------------------------------------------------------------------------------------------

                return ClayMineIsBuild==1 and IronMineIsBuild==1

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_MinesAreBuilt = function()
	-------------------------------------------------------------------------------------------------------------------

		end2ndChapter()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "RewardGold"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_RewardGold = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("CaravanGold","CaravanHQGold",200)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardGold = function()
	-------------------------------------------------------------------------------------------------------------------

			AddGold(2000)

			DestroyEntity("CaravanGold")

			Caravan1Done=1

                        return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "RewardWood"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_RewardWood = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("CaravanWood","CaravanHQWood",200)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardWood = function()
	-------------------------------------------------------------------------------------------------------------------

			AddWood(2000)

			DestroyEntity("CaravanWood")

			Caravan2Done=1

                        return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "RewardSulfur"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_RewardSulfur = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("CaravanSulfur","CaravanHQSulfur",200)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardSulfur = function()
	-------------------------------------------------------------------------------------------------------------------

			AddSulfur(1000)

			DestroyEntity("CaravanSulfur")

			Caravan3Done=1

                        return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "RewardStone"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_RewardStone = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("CaravanStone","CaravanHQStone",200)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardStone = function()
	-------------------------------------------------------------------------------------------------------------------

			AddStone(2000)

			DestroyEntity("CaravanStone")

			Caravan4Done=1

                        return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Start5thQuest"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Start5thQuest = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return QuestTwoMessGone==1 and QuestMinesReady==1

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_Start5thQuest = function()
	-------------------------------------------------------------------------------------------------------------------

		start5thChapter()

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
		if _npcId == GetEntityId("Alchemist") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("Alchemist")
				createBriefingAlchemist()
				local job = {}
				job.Tribute = 1
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("Alchemist"),
									ResourceType.Iron,		400,
									ResourceType.Gold,		500,
									ResourceType.Sulfur,		400
						)

				job.Callback = TributePaid1
				SetupTributePaid(job)
			end
		end

	end

	if Logic.IsHero(_heroId) then
		if _npcId == GetEntityId("IronLeader") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("IronLeader")
				createBriefingNPCIronLeader()
				local job = {}
				job.Tribute = 2
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("NPCIronLeader"),
									ResourceType.Wood,		500
						)

				job.Callback = TributePaid2
				SetupTributePaid(job)
			end
		end

	end

end

-------------------------------------------------------------------------------------------------------------------------

TributePaid1 = function()

	LightTheBombs=1

	return true

end

TributePaid2 = function()

	ChangePlayer("P4IronMine",1)

	return true

end

-------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MonitorMess3Way"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MonitorMess3Way = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Messenger3","MessAriTarget5",2000)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MonitorMess3Way = function()
	-------------------------------------------------------------------------------------------------------------------
		local etype1 = Entities.CU_Barbarian_LeaderClub1
		local etype2 = Entities.CU_BanditLeaderSword1
		if CP_Difficulty > 0 then
			etype1 = Entities.CU_Barbarian_LeaderClub2
			etype2 = Entities.CU_BanditLeaderSword2
		end

		local pos = GetPosition("SurpriseSpawn1")
		SurpriseAttack1 = AI.Entity_CreateFormation(2, etype1, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(SurpriseAttack1, "SurpriseAttack1")

		local pos = GetPosition("SurpriseSpawn1")
		SurpriseAttack2 = AI.Entity_CreateFormation(2, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(SurpriseAttack2, "SurpriseAttack2")

		local pos = GetPosition("SurpriseSpawn1")
		SurpriseAttack3 = AI.Entity_CreateFormation(2, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(SurpriseAttack3, "SurpriseAttack3")

		Attack("SurpriseAttack1","MessAriTarget5")
		Attack("SurpriseAttack2","MessAriTarget5")
		Attack("SurpriseAttack3","MessAriTarget5")
		createBriefingMessAttack()

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function Player2HQLife()

	local HQ2CheckLife = Logic.GetEntityIDByName("Player2HQ")

	if Logic.GetEntityHealth(HQ2CheckLife) < (Logic.GetEntityMaxHealth(HQ2CheckLife) * 0.3) then
		local etype1 = Entities.PU_LeaderPoleArm3
		local etype2 = Entities.PU_LeaderBow3
		local etype3 = Entities.PU_LeaderHeavyCavalry1
		local etype4 = Entities.PU_LeaderCavalry1
		if CP_Difficulty > 0 then
			etype1 = Entities.PU_LeaderPoleArm4
			etype2 = Entities.PU_LeaderBow4
			etype3 = Entities.PU_LeaderHeavyCavalry2
			etype4 = Entities.PU_LeaderCavalry2
		end

		local pos = GetPosition("SpawnHQAttack1")
		HQAttack1 = AI.Entity_CreateFormation(2, Entities.CU_VeteranCaptain, 0, 0, pos.X, pos.Y, 0, 0, CP_Difficulty + 1, 0)
		SetEntityName(HQAttack1, "HQAttack1")

		local pos = GetPosition("SpawnHQAttack2")
		HQAttack2 = AI.Entity_CreateFormation(2, etype1, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(HQAttack2, "HQAttack2")

		local pos = GetPosition("SpawnHQAttack3")
		HQAttack3 = AI.Entity_CreateFormation(2, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(HQAttack3, "HQAttack3")

		local pos = GetPosition("SpawnHQAttack3")
		HQAttack4 = AI.Entity_CreateFormation(2, etype3, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(HQAttack4, "HQAttack4")

		local pos = GetPosition("SpawnHQAttack1")
		HQAttack5 = AI.Entity_CreateFormation(2, etype4, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(HQAttack5, "HQAttack5")

		Attack("HQAttack1","Player2HQ")
		Attack("HQAttack2","Player2HQ")
		Attack("HQAttack3","Player2HQ")
		Attack("HQAttack4","Player2HQ")
		Attack("HQAttack5","Player2HQ")

		
		return true 
	end

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "PlaceMarkers3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_PlaceMarkers3 = function()
	-------------------------------------------------------------------------------------------------------------------

		return IronMineIsBuild==1

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_PlaceMarkers3 = function()
	-------------------------------------------------------------------------------------------------------------------

		-- destroy minimap marker
		local p, o = Tools.GetPosition("IronMineTarget")
		GUI.DestroyMinimapPulse(p, o)

		StartJob("PlaceMarkers3")


		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "PlaceMarkers4"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_PlaceMarkers4 = function()
	-------------------------------------------------------------------------------------------------------------------

		return ClayMineIsBuild==1

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_PlaceMarkers4 = function()
	-------------------------------------------------------------------------------------------------------------------


		-- destroy minimap marker
		local j, k = Tools.GetPosition("ClayMineTarget")
		GUI.DestroyMinimapPulse(j, k)

		StartJob("PlaceMarkers4")


		return true

	end