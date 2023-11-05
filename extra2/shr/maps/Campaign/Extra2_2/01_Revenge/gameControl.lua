-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
function StartQuest1()
	
	Report("Start Quest 1")
	
	StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)
	MayorVillage()
	VarQ1=0
	StartJob("BringHimAlive")
	

	
end

-------------------------------------------------------------------------------------------------------
function endQuest1()

	ResolveBriefing(briefingMajorReached)
	VarQ1=1

-- destroy minimap marker
	local x, y = Tools.GetPosition("Major")
	GUI.DestroyMinimapPulse(x, y)

end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
function StartQuest2()

	Report("Start Quest 2")
	createBriefingMajor()
	CityToPlayer()
	createQuestTowers()
	createEasyAttacks()

end

-------------------------------------------------------------------------------------------------------
function endQuest2()

	ResolveBriefing(briefingTowersDone)

	SpawnAttacksStatus=1

-- destroy minimap marker
	local x, y = Tools.GetPosition("CameraFocus")
	GUI.DestroyMinimapPulse(x, y)

	StartQuest3()

end


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
function StartQuest3()

	Report("Start Quest 3")

	relocatePilgrim()
	createBriefingAttack()
	FreeTheRoad()
	createCampArmy()
	CampsDestroyed()
	StartJob("CheckBuilding")

end

-------------------------------------------------------------------------------------------------------
function endQuest3()

	ResolveBriefing(briefingOneBaseDown)
	StartQuest4()


end


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
function StartQuest4()

	Report("Start Quest 4")

	FreeTheRoad2()
	createBaseArmy1()
	createBaseArmy2()
	createBaseArmy3()
	StartJob("CheckTentsStatus")

end

-------------------------------------------------------------------------------------------------------
function endQuest4()

	ResolveBriefing(briefingCaptureCaptain)

end


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
function StartQuest5()

	Report("Start Quest 5")

	TeleportForSurrender()
	createBriefingSurrender()
	StartSimpleJob("createCaptainFollowPilgrim")
	CreateHighPowerBombs()
	StartJob("MayorProximity")
	StartJob("HardToBeAlive")


end

-------------------------------------------------------------------------------------------------------
function endQuest5()

	ResolveBriefing(briefingVillageReachedFinal)
	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)

end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BringHimAlive"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BringHimAlive = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Pilgrim") and IsDead("P1Archers1") and IsDead("P1Archers2") and VarQ1==0

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_BringHimAlive = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()

		return true


	end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

function relocatePilgrim()

Bomberman = GetID("Pilgrim")
local wasSelected = IsEntitySelected(Bomberman)

	DestroyEntity(Bomberman)
	DestroyEntity("Major")

	--local pos = GetPosition("PilRespawn")
	--PilResp1 = Tools.CreateGroup(1, Entities.PU_Hero2, 0, pos.X, pos.Y, 0)
	--SetEntityName(PilResp1, "Pilgrim")

	CreateEntity(1,Entities.PU_Hero2,GetPosition("PilRespawn"),"Pilgrim")

	if wasSelected then

		Bomberman1 = GetID("Pilgrim")
		GUI.SelectEntity(Bomberman1)
   	end

	local pos = GetPosition("RespawnMayorPoint")
	MajorRespawn1 = Tools.CreateGroup(4, Entities.CU_Major01Idle, 0, pos.X, pos.Y, 180)
	SetEntityName(MajorRespawn1, "Mayor")


end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

function FreeTheRoad()

	DestroyEntity("Rock1")
	DestroyEntity("Rock2")

end


-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

function FreeTheRoad2()

	DestroyEntity("Pietroi1")
	DestroyEntity("Pietroi2")
	DestroyEntity("Pietroi3")

end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------


CampsDestroyed = function()

	StartJob("CheckCamps")

end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckCamps"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckCamps = function()
	-------------------------------------------------------------------------------------------------------------------

	return IsDead("Tent1") and IsDead("Tent2") and IsDead("Tent3") and IsDead("Tent4") and IsDead("Tent5") and IsDead("Tent6") and IsDead("Tent7") and IsDead("Tent8")

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_CheckCamps = function()
	-------------------------------------------------------------------------------------------------------------------

		MakeVulnerable("Prison")

		return true


	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckBuilding"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckBuilding = function()
	-------------------------------------------------------------------------------------------------------------------

	return IsDead("Prison")

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_CheckBuilding = function()
	-------------------------------------------------------------------------------------------------------------------

		CreateInformer()

		return true


	end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

function MayorVillage()

	-- setup table for npc
	MayorVillage				=	{}
	MayorVillage.name 			=	"Major"
	MayorVillage.callback			=	MayorVillageNPC
	        
	-- create npc
	CreateNPC(MayorVillage)
	   	
end

-------------------------------------------------------------------------------------------------------

MayorVillageNPC = function()

endQuest1()
StartQuest2()

end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

function CreateInformer()

	-- setup table for npc
	NPCInformer				=	{}
	NPCInformer.name 			=	"Informer"
	NPCInformer.callback			=	SpokenWithInformer
	        
	-- create npc
	CreateNPC(NPCInformer)
	   	
end

-------------------------------------------------------------------------------------------------------

SpokenWithInformer = function()

	endQuest3()
	createBriefingInformer()

end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckTentsStatus"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckTentsStatus = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("CapTent1") and IsDead("CapTent2") and IsDead("CapTent3") and IsDead("CapTent4") and IsDead("CapTent6") and IsDead("CapTent7") and IsDead("CapTent8") and IsDead("CapTent9")
	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_CheckTentsStatus = function()
	-------------------------------------------------------------------------------------------------------------------

		MakeVulnerable("CapTent5")
		ChangePlayer("CapTent5",2)
		CreateCaptain()


		return true


	end

-------------------------------------------------------------------------------------------------------

function CreateCaptain()

	local pos = GetPosition("CaptainSpawn")
	CaptainAppear = Tools.CreateGroup(2, Entities.CU_VeteranCaptain, 0, pos.X, pos.Y, 180)
	SetEntityName(CaptainAppear, "THEcaptain")
	StartSimpleJob("CaptainsLife")

end

-------------------------------------------------------------------------------------------------------

function CaptainsLife()

	local CapCheckLife = Logic.GetEntityIDByName("THEcaptain")

	if Logic.GetEntityHealth(CapCheckLife) < (Logic.GetEntityMaxHealth(CapCheckLife) * 0.4) then
		Logic.SetDiplomacyState( 1, 2, Diplomacy.Neutral )
		MakeInvulnerable("THEcaptain")

		endQuest4()
		StartQuest5()
		
		return true 
	end

end

-------------------------------------------------------------------------------------------------------

function TeleportForSurrender()

Bomberman12 = GetID("Pilgrim")
local wasSelected = IsEntitySelected(Bomberman12)


	DestroyEntity("Pilgrim")
	DestroyEntity("THEcaptain")

	--local pos = GetPosition("SurrenderSpawn2")
	--PilRespSurrender = Tools.CreateGroup(1, Entities.PU_Hero2, 0, pos.X, pos.Y, 0)
	--SetEntityName(PilRespSurrender, "Pilgrim")

	CreateEntity(1,Entities.PU_Hero2,GetPosition("SurrenderSpawn2"),"Pilgrim")

	if wasSelected then

		Bomberman12 = GetID("Pilgrim")
		GUI.SelectEntity(Bomberman12)
   	end

	local pos = GetPosition("SurrenderSpawn1")
	CaptainSurrender = Tools.CreateGroup(2, Entities.CU_VeteranCaptain, 0, pos.X, pos.Y, 180)
	SetEntityName(CaptainSurrender, "THEcaptain")


end

-------------------------------------------------------------------------------------------------------

createCaptainFollowPilgrim = function()

	Move("THEcaptain","Pilgrim",400)
	MakeInvulnerable("THEcaptain")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MayorProximity"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MayorProximity = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Pilgrim","Mayor",1000)

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_MayorProximity = function()
	-------------------------------------------------------------------------------------------------------------------

		FinalRelocation()
		createBriefingFinal()
		StartJob("BriefOver")

		return true


	end

-------------------------------------------------------------------------------------------------------

function FinalRelocation()

Bomberman13 = GetID("Pilgrim")
local wasSelected = IsEntitySelected(Bomberman13)

	DestroyEntity("Pilgrim")
	DestroyEntity("THEcaptain")
	DestroyEntity("Mayor")

	--local pos = GetPosition("PilRespawnFin")
	--PilRespFinal = Tools.CreateGroup(1, Entities.PU_Hero2, 0, pos.X, pos.Y, 0)
	--SetEntityName(PilRespFinal, "Pilgrim")

	CreateEntity(1,Entities.PU_Hero2,GetPosition("PilRespawnFin"),"Pilgrim")

	if wasSelected then

		Bomberman13 = GetID("Pilgrim")
		GUI.SelectEntity(Bomberman13)
   	end

	local pos = GetPosition("CapRespawn")
	CaptainResFinal = Tools.CreateGroup(2, Entities.CU_VeteranCaptain, 0, pos.X, pos.Y, 180)
	SetEntityName(CaptainResFinal, "THEcaptain")

	local pos = GetPosition("RespawnMayorPoint1")
	MayorFinal = Tools.CreateGroup(4, Entities.CU_Major01Idle, 0, pos.X, pos.Y, 180)
	SetEntityName(MayorFinal, "Mayor")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "HardToBeAlive"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_HardToBeAlive = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Pilgrim")

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_HardToBeAlive = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BriefOver"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BriefOver = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BriefOver = function()
	-------------------------------------------------------------------------------------------------------------------

		endQuest5()

		return true


	end