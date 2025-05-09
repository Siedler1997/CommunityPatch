createQuestCaptureEnemyLeader = function()
	Report("createQuestCaptureEnemyLeader!")
	
	BigBadGuyCanBeCaptured = 0

	PatrolPositionSpawn = GetPosition("General_Spawn")
	PatrolPositionCamp	= GetPosition("General_Patrol")
	Prison							= GetID("Prison")
	PatrolSpawnID   		= GetID("General_Spawn")
	PatrolCampID   		= GetID("General_Patrol")
	
	local GeneralSpawnEntity = GetID("General_Spawn")
	local EnemyLeader = Logic.CreateEntity( Entities.CU_VeteranLieutenant, PatrolPositionSpawn.X, PatrolPositionSpawn.Y, 0, gvMission.PlayerIDBigBadGuy )
	Logic.SetEntityName(EnemyLeader, "BigBadGuy")
	local GuardSpawn = GetPosition("WaitingPositionB")
	local EnemyGroup1 = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PU_LeaderHeavyCavalry2, 9, GuardSpawn.X - 200, GuardSpawn.Y, 270)
	Logic.SetEntityName(EnemyGroup1, "GuardA")
	local EnemyGroup2 = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PU_LeaderHeavyCavalry2, 9, GuardSpawn.X, GuardSpawn.Y, 270)
	Logic.SetEntityName(EnemyGroup2, "GuardB")
	local EnemyGroup3 = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PU_LeaderHeavyCavalry2, 9, GuardSpawn.X, GuardSpawn.Y - 200, 270)
	Logic.SetEntityName(EnemyGroup3, "GuardC")
	local EnemyGroup4 = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub2, 9, GuardSpawn.X - 200, GuardSpawn.Y - 200, 270)
	Logic.SetEntityName(EnemyGroup4, "GuardD")
	local EnemyGroup5 = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub2, 9, GuardSpawn.X, GuardSpawn.Y - 200, 270)
	Logic.SetEntityName(EnemyGroup5, "GuardE")
	local EnemyGroup6 = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub2, 9, GuardSpawn.X - 200, GuardSpawn.Y - 200, 270)
	Logic.SetEntityName(EnemyGroup6, "GuardF")
	local EnemyGroup7 = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub2, 9, GuardSpawn.X, GuardSpawn.Y - 200, 270)
	Logic.SetEntityName(EnemyGroup7, "GuardG")
	local EnemyGroup8 = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub2, 9, GuardSpawn.X - 200, GuardSpawn.Y - 200, 270)
	Logic.SetEntityName(EnemyGroup8, "GuardH")

	
	InitNPC("BigBadGuy")

	LeaderFriendlyDistance 			= 5000
	CaptureRadius								= 500
	ReturnToSidecampInterval 		= 180
	ReturnToBattlefieldInterval = 180
	
	BigBadGuyCanBeCaptured = 1
	LeaderCaptureTrigger = StartJob("LeaderCannotBeCaptured")	
	LeaderWalkTrigger = StartJob("LeaderWalkToSideCamp")
	CapturedTrigger = StartJob("CapturedEnemiesLeader")
	PeacefulWonTrigger = StartJob("MissionPeacefulWon")
	StartJob("EnemyLeaderDead")
	
	Logic.GroupAttackMove(EnemyLeader, PatrolPositionCamp.X, PatrolPositionCamp.Y);		
end


-------------------------------------------------------------------------------------------
function Condition_LeaderCanBeCaptured()
	if Logic.CheckEntitiesDistance(PatrolSpawnID, GetID("BigBadGuy"), LeaderFriendlyDistance) == 1
	then
		return 1
	end
end


function Action_LeaderCanBeCaptured()
	local EnemyLeader = Logic.ChangeEntityPlayerID(GetID("BigBadGuy"),gvMission.PlayerIDBigBadGuy)	
	Logic.GroupAttackMove(EnemyLeader, PatrolPositionSpawn.X, PatrolPositionSpawn.Y);	
	BigBadGuyCanBeCaptured = 1
	LeaderCaptureTrigger = StartJob("LeaderCannotBeCaptured")
	return 1
end
--------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------
function Condition_LeaderCannotBeCaptured()
	if Logic.CheckEntitiesDistance(PatrolSpawnID, GetID("BigBadGuy"), LeaderFriendlyDistance) ~= 1
	then
		return 1
	end
end


function Action_LeaderCannotBeCaptured()
	local EnemyLeader = Logic.ChangeEntityPlayerID(GetID("BigBadGuy"),gvMission.PlayerIDBesieger)		
	Logic.GroupAttackMove(EnemyLeader, PatrolPositionCamp.X, PatrolPositionCamp.Y);
	local GuardPosition = GetPosition("WaitingPositionA")
	if IsAlive("GuardA") then
		Logic.GroupAttackMove(GetID("GuardA"), GuardPosition.X, GuardPosition.Y);
	end
	if IsAlive("GuardB") then
		Logic.GroupAttackMove(GetID("GuardB"), GuardPosition.X - 200, GuardPosition.Y);
	end
	if IsAlive("GuardC") then
		Logic.GroupAttackMove(GetID("GuardC"), GuardPosition.X, GuardPosition.Y -200);
	end
	if IsAlive("GuardD") then
		Logic.GroupAttackMove(GetID("GuardD"), GuardPosition.X - 200, GuardPosition.Y - 200);
	end
	if IsAlive("GuardE") then
		Logic.GroupAttackMove(GetID("GuardE"), GuardPosition.X + 400, GuardPosition.Y);
	end
	if IsAlive("GuardF") then
		Logic.GroupAttackMove(GetID("GuardF"), GuardPosition.X + 200, GuardPosition.Y);
	end
	if IsAlive("GuardG") then
		Logic.GroupAttackMove(GetID("GuardG"), GuardPosition.X + 400, GuardPosition.Y -200);
	end
	if IsAlive("GuardH") then
		Logic.GroupAttackMove(GetID("GuardH"), GuardPosition.X + 200, GuardPosition.Y - 200);
	end
	Report("Salim: My spys have reported: @cr It seems like you are to late - The leader is returning to his troops - @cr maybe he is going to return later", 20);
	BigBadGuyCanBeCaptured = 0
	LeaderCaptureTrigger = StartJob("LeaderCanBeCaptured")
	return 1
end
--------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------
function Condition_LeaderWalkToSideCamp()
	return Logic.GetWeatherState() == 3
end
function Action_LeaderWalkToSideCamp()
	Report("Salim: A spy reported that the enemy leader is walking to the sidecamp @cr Hurry to the hidden camp in the west", 5);
	Logic.GroupAttackMove(GetID("BigBadGuy"), PatrolPositionSpawn.X, PatrolPositionSpawn.Y);
	local GuardPosition = GetPosition("WaitingPositionB")
	if IsAlive("GuardA") then
		Logic.GroupAttackMove(GetID("GuardA"), GuardPosition.X, GuardPosition.Y);
	end
	if IsAlive("GuardB") then
		Logic.GroupAttackMove(GetID("GuardB"), GuardPosition.X - 200, GuardPosition.Y);
	end
	if IsAlive("GuardC") then
		Logic.GroupAttackMove(GetID("GuardC"), GuardPosition.X, GuardPosition.Y -200);
	end
	if IsAlive("GuardD") then
		Logic.GroupAttackMove(GetID("GuardD"), GuardPosition.X - 200, GuardPosition.Y - 200);
	end
	if IsAlive("GuardE") then
		Logic.GroupAttackMove(GetID("GuardE"), GuardPosition.X + 400, GuardPosition.Y);
	end
	if IsAlive("GuardF") then
		Logic.GroupAttackMove(GetID("GuardF"), GuardPosition.X + 200, GuardPosition.Y);
	end
	if IsAlive("GuardG") then
		Logic.GroupAttackMove(GetID("GuardG"), GuardPosition.X + 400, GuardPosition.Y -200);
	end
	if IsAlive("GuardH") then
		Logic.GroupAttackMove(GetID("GuardH"), GuardPosition.X + 200, GuardPosition.Y - 200);
	end

	LeaderWalkTrigger = StartJob("LeaderReturnsFromSideCamp")
	return 1
end

function Condition_LeaderReturnsFromSideCamp()
	return Logic.GetWeatherState() == 1
end
function Action_LeaderReturnsFromSideCamp()
	Logic.GroupAttackMove(GetID("BigBadGuy"), PatrolPositionCamp.X, PatrolPositionCamp.Y);
	LeaderWalkTrigger = StartJob("LeaderWalkToSideCamp")
	return 1
end
--------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------
function Condition_EnemyLeaderDead()
	if  IsDead("BigBadGuy")
	then
		return 1
	end
end


function Action_EnemyLeaderDead()
	if CP_Difficulty >= 1 then
		ResearchAllMilitaryTechs(2, true)
		ResearchAllMilitaryTechs(4, true)
		ResearchAllMilitaryTechs(5, true)
	end

	EndJob(LeaderWalkTrigger)
	EndJob(LeaderCaptureTrigger)
	EndJob(PeacefulWonTrigger)
	return 1
end
--------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------
function Condition_CapturedEnemiesLeader()
	if IsBriefingActive() then
		return false
	end
	UpdateHeroesTable()
	if BigBadGuyCanBeCaptured == 1
		and GetNearestHero("BigBadGuy", CaptureRadius) ~= nil
	then
		return 1
	end
end


function Action_CapturedEnemiesLeader()
	if CP_Difficulty >= 1 then
		ResearchAllMilitaryTechs(2, true)
		ResearchAllMilitaryTechs(4, true)
		ResearchAllMilitaryTechs(5, true)
	end

	Report( "You have captured the General. Now bring him to Folklung castle!." )
	SetNPCFollow("BigBadGuy", 1, 400, 3000, BigBadGuyEscaped)
	EndJob(LeaderWalkTrigger)
	EndJob(LeaderCaptureTrigger)
	if QuestCaptureGeneralBriefing ~= 0 then
	    ResolveBriefing(QuestCaptureGeneralBriefing)
	    RefreshRobbers()
	    QuestCaptureGeneralBriefing = 0
	end
	createBriefingEnemyLeaderCaptured()
	CapturedTrigger = 0
	return 1
end
--------------------------------------------------------------------------------------------

BigBadGuyEscaped = function()
	Report("Enemy leader escaped!")
	
	if FreeLeaderJob ~= 0 then
		EndJob(FreeLeaderJob)
		FreeLeaderJob = 0
		Logic.GroupAttackMove(GetID("BigBadGuy"), PatrolPositionSpawn.X, PatrolPositionSpawn.Y);	
		local GuardPosition = GetPosition("WaitingPositionB")
		if IsAlive("GuardA") then
			Logic.GroupAttackMove(GetID("GuardA"), GuardPosition.X, GuardPosition.Y);
		end
		if IsAlive("GuardB") then
			Logic.GroupAttackMove(GetID("GuardB"), GuardPosition.X - 200, GuardPosition.Y);
		end
		if IsAlive("GuardC") then
			Logic.GroupAttackMove(GetID("GuardC"), GuardPosition.X, GuardPosition.Y -200);
		end
		if IsAlive("GuardD") then
			Logic.GroupAttackMove(GetID("GuardD"), GuardPosition.X - 200, GuardPosition.Y - 200);
		end
		if IsAlive("GuardE") then
			Logic.GroupAttackMove(GetID("GuardE"), GuardPosition.X + 400, GuardPosition.Y);
		end
		if IsAlive("GuardF") then
			Logic.GroupAttackMove(GetID("GuardF"), GuardPosition.X + 200, GuardPosition.Y);
		end
		if IsAlive("GuardG") then
			Logic.GroupAttackMove(GetID("GuardG"), GuardPosition.X + 400, GuardPosition.Y -200);
		end
		if IsAlive("GuardH") then
			Logic.GroupAttackMove(GetID("GuardH"), GuardPosition.X + 200, GuardPosition.Y - 200);
		end
		if IsBriefingActive() then
			return 
		end
		createBriefingEscaped(EscapeBriefingFinished)
	end
end

EscapeBriefingFinished = function()
	BigBadGuyCanBeCaptured = 1
	Logic.DestroyEntity(GetID("BigBadGuy"))
	local EnemyLeader = Logic.CreateEntity( Entities.CU_VeteranLieutenant, PatrolPositionSpawn.X, PatrolPositionSpawn.Y, 0, gvMission.PlayerIDBigBadGuy )
	Logic.SetEntityName(EnemyLeader, "BigBadGuy")
	LeaderCaptureTrigger = StartJob("LeaderCannotBeCaptured")	
	LeaderWalkTrigger = StartJob("LeaderWalkToSideCamp")
	CapturedTrigger = StartJob("CapturedEnemiesLeader")
	
	Logic.GroupAttackMove(GetID("BigBadGuy"), PatrolPositionCamp.X, PatrolPositionCamp.Y);	
end

Condition_FreeLeader = function()
	return Counter.Tick2("FreeLeader", 3) and IsDead("BigBadGuy") == false
end


Action_FreeLeader = function()
	local CapturerID = GetNearestHero("BigBadGuy",3000)
	if CapturerID ~= nil then
		if IsAlive("GuardA") then
			Logic.GroupAttack(GetID("GuardA"), CapturerID)
		end
		if IsAlive("GuardB") then
			Logic.GroupAttack(GetID("GuardB"), CapturerID)
		end
		if IsAlive("GuardC") then
			Logic.GroupAttack(GetID("GuardC"), CapturerID)
		end
		if IsAlive("GuardD") then
			Logic.GroupAttack(GetID("GuardD"), CapturerID)
		end
		if IsAlive("GuardE") then
			Logic.GroupAttack(GetID("GuardE"), CapturerID)
		end
		if IsAlive("GuardF") then
			Logic.GroupAttack(GetID("GuardF"), CapturerID)
		end
		if IsAlive("GuardG") then
			Logic.GroupAttack(GetID("GuardG"), CapturerID)
		end
		if IsAlive("GuardH") then
			Logic.GroupAttack(GetID("GuardH"), CapturerID)
		end
	end
end


-------------------------------------------------------------------------------------------
function Condition_MissionPeacefulWon()
	if IsDead("BigBadGuy") == false
	then
		if Logic.CheckEntitiesDistance(Prison, GetID("BigBadGuy"), 800) == 1 then
			return 1
		end
	end
end


function Action_MissionPeacefulWon()
	Report("You have peaceful won!")
	end5thQuest()
	return 1
end
--------------------------------------------------------------------------------------------

