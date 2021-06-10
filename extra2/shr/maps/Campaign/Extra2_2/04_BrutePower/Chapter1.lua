function StartChapter1()
	local pos 	= GetPosition("PilgrimArmyStart")
	PilArmy 	= AI.Entity_CreateFormation(1, Entities.PU_LeaderPoleArm2, 0, 4, pos.X, pos.Y, 0, 0, 3, 0)
	SetEntityName(PilArmy, "PilArmy")

	StartJob("PilgrimCloseBorder")
	StartSimpleJob("PilgrimsLife")
	startQuestDefeat()
	StartJob("StartQuest4")
	MonasteryDefense()

end

------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "PilgrimCloseBorder"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_PilgrimCloseBorder = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Pilgrim","BorderPoint",1000) or IsNear("PilArmy","BorderPoint",1000)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_PilgrimCloseBorder = function()
	-------------------------------------------------------------------------------------------------------------------
		local experience = LOW_EXPERIENCE
		if CP_Difficulty > 0 then
			experience = experience + 2
		end

		for i = 1, 8 do
			local pos = GetPosition("BorderSpawn"..math.ceil(i/2))
			local BorGuard = AI.Entity_CreateFormation(4,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,experience,0)
			SetEntityName(BorGuard, "BorGuard"..i)
		end

		Attack("BorGuard1","Pilgrim")
		Attack("BorGuard2","Pilgrim")
		Attack("BorGuard3","Pilgrim")
		Attack("BorGuard4","Pilgrim")
		Attack("BorGuard5","Pilgrim")
		Attack("BorGuard6","Pilgrim")
		Attack("BorGuard7","Pilgrim")
		Attack("BorGuard8","Pilgrim")

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function PilgrimsLife()

	local PilgrimsLife = Logic.GetEntityIDByName("Pilgrim")

		if Logic.GetEntityHealth(PilgrimsLife) < (Logic.GetEntityMaxHealth(PilgrimsLife) * 0.4) then
		Logic.SetDiplomacyState( 1, 4, Diplomacy.Neutral )

		DestroyEntity("BorGuard1")
		DestroyEntity("BorGuard2")
		DestroyEntity("BorGuard3")
		DestroyEntity("BorGuard4")
		DestroyEntity("BorGuard5")
		DestroyEntity("BorGuard6")
		DestroyEntity("BorGuard7")
		DestroyEntity("BorGuard8")
		DestroyEntity("Pilgrim")

		local pos 	= GetPosition("ChatPil")
		Pilgrim 	= Tools.CreateGroup(1, Entities.PU_Hero2, 0, pos.X, pos.Y, 180)
		SetEntityName(Pilgrim, "Pilgrim")

		local experience = LOW_EXPERIENCE
		if CP_Difficulty > 0 then
			experience = experience + 2
		end
		for i = 1, 8 do
			local pos
			if i < 5 then
				pos = GetPosition("Chat"..i)
			else
				pos = GetPosition("Backup"..(i-4))
			end
			local BorGuard = AI.Entity_CreateFormation(4,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,experience,0)
			SetEntityName(BorGuard, "BorGuard"..i)
		end

		ReplaceEntity("Gate1", Entities.XD_PalisadeGate2)
		StartJob("EscortStart")
		StartJob("PilgrimDead")
		--StartJob("DetectAttackers")
		createBriefingVillagers()

		return true 
	end

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "EscortStart"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_EscortStart = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_EscortStart = function()
	-------------------------------------------------------------------------------------------------------------------

		--StartJob("PilgrimEscort")
		StartSimpleJob("DetectPilgrim")

		Attack("BorGuard1","Target1")
		Attack("BorGuard2","Target2")
		Attack("BorGuard3","Target3")
		Attack("BorGuard4","Target4")

		--EnableNpcMarker("MountainMenLeader")
		NPCLeader()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "PilgrimDead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_PilgrimDead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Pilgrim") and Quest1Status==0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_PilgrimDead = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "PilgrimEscort"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_PilgrimEscort = function()
	-------------------------------------------------------------------------------------------------------------------

                return Quest1Status==0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_PilgrimEscort = function()
	-------------------------------------------------------------------------------------------------------------------

		DetectPilgrim()

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function DetectPilgrim()

if Quest1Status==0 then

if IsAlive("BorGuard1") then
point1 = GetPosition("BorGuard1")
end
if IsAlive("BorGuard2") then
point2 = GetPosition("BorGuard2")
end
if IsAlive("BorGuard3") then
point3 = GetPosition("BorGuard3")
end
if IsAlive("BorGuard4") then
point4 = GetPosition("BorGuard4")
end


PilgrimOK ={ Logic.GetEntitiesInArea(Entities.PU_Hero2,point1.X,point1.Y,5000,1,1),
		Logic.GetEntitiesInArea(Entities.PU_Hero2,point2.X,point2.Y,5000,1,1),
		Logic.GetEntitiesInArea(Entities.PU_Hero2,point3.X,point3.Y,5000,1,1),
		Logic.GetEntitiesInArea(Entities.PU_Hero2,point4.X,point4.Y,5000,1,1)
		}


	if PilgrimOK[1] == 0 and PilgrimOK[2] == 0  and PilgrimOK[3] == 0 and PilgrimOK[4] == 0  then

	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
	DisableNpcMarker("MountainMenLeader")

	if TextDisplayed==0 then
	createBriefingRun()
	end

	if IsAlive("BorGuard1") then
	Attack("BorGuard1","Pilgrim")
	end

	if IsAlive("BorGuard2") then
	Attack("BorGuard2","Pilgrim")
	end

	if IsAlive("BorGuard3") then
	Attack("BorGuard3","Pilgrim")
	end

	if IsAlive("BorGuard4") then
	Attack("BorGuard4","Pilgrim")
	end

	if IsAlive("BorGuard5") then
	Attack("BorGuard5","Pilgrim")
	end

	if IsAlive("BorGuard6") then
	Attack("BorGuard6","Pilgrim")
	end

	if IsAlive("BorGuard7") then
	Attack("BorGuard7","Pilgrim")
	end

	if IsAlive("BorGuard8") then
	Attack("BorGuard8","Pilgrim")
	end

	end

end

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "StartQuest4"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_StartQuest4 = function()
	-------------------------------------------------------------------------------------------------------------------

                return 	Quest1Done==1 and Quest2Done==1 and MonasteryDown==1

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_StartQuest4 = function()
	-------------------------------------------------------------------------------------------------------------------

		start4thChapter()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DetectAttackers"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DetectAttackers = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("Robber1","MiddleIron",1000)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_DetectAttackers = function()
	-------------------------------------------------------------------------------------------------------------------

		createBriefingFirstCaravanAttack()

		return true


	end