function StartChapter3()

	CreateCaravans()
	createBriefingFirstCaravan()
	StartJob("MoveFirstCaravan")
	StartJob("AttackCaravan")
	StartJob("DetectAttackers")
	StartJob("FirstCaravanDead")
	StartJob("DestroyMonastery")
	StartJob("TwoQDown")

end

-------------------------------------------------------------------------------------------------------------------------

function CreateCaravans()

	caravanGold   = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanGold"),"CaravanGold")
	caravanIron   = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanIron"),"CaravanIron")
	caravanWood   = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanWood"),"CaravanWood")
	caravanStone  = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanStone"),"CaravanStone")
	caravanSulfur = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanSulfur"),"CaravanSulfur")
	caravanClay   = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanClay"),"CaravanClay")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MoveFirstCaravan"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MoveFirstCaravan = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsBriefingActive() then

			return false

		else

			return true

		end

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MoveFirstCaravan = function()
	-------------------------------------------------------------------------------------------------------------------

		Move("CaravanGold","MiddleGold")
		Move("CaravanIron","MiddleIron")
		Move("CaravanWood","MiddleWood")
		Move("CaravanClay","MiddleClay")
		Move("CaravanStone","MiddleStone")
		Move("CaravanSulfur","MiddleSulfur")
	
		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AttackCaravan"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AttackCaravan = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("CaravanGold","Gate1",1500)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_AttackCaravan = function()
	-------------------------------------------------------------------------------------------------------------------

			Attack("Robber1","CaravanGold")
			Attack("Robber2","CaravanIron")
			Attack("Robber3","CaravanWood")
			Attack("Robber4","CaravanClay")
			Attack("Robber5","CaravanStone")
			Attack("Robber6","CaravanSulfur")
			Attack("Robber7","CaravanGold")
			Attack("Robber8","CaravanIron")
			Attack("Robber9","CaravanClay")
			Attack("Robber10","CaravanStone")
			Attack("Attacker1","CaravanSulfur")
			Attack("Attacker2","CaravanGold")

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

                
                return IsNear("Robber1","MiddleIron",1000) or IsNear("Robber2","MiddleIron",1000) or IsNear("Robber3","MiddleIron",1000) or IsNear("Robber4","MiddleIron",1000) or IsNear("Robber5","MiddleIron",1000) or IsNear("Robber6","MiddleIron",1000) or IsNear("Robber7","MiddleIron",1000) or IsNear("Robber8","MiddleIron",1000) or IsNear("Robber9","MiddleIron",1000) or IsNear("Robber10","MiddleIron",1000)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_DetectAttackers = function()
	-------------------------------------------------------------------------------------------------------------------

		createBriefingFirstCaravanAttack()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "FirstCaravanDead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_FirstCaravanDead = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsDead("CaravanGold") and IsDead("CaravanIron") and IsDead("CaravanWood") and IsDead("CaravanClay") and IsDead("CaravanStone") and IsDead("CaravanSulfur")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_FirstCaravanDead = function()
	-------------------------------------------------------------------------------------------------------------------

		CreateEntity(0,Entities.XD_MiscSword,GetPosition("Pilgrim"),"PilgrimReference1")

		DestroyEntity("Pilgrim")

		local pos = GetPosition("PilgrimReference1")
		PilResp = Tools.CreateGroup(1, Entities.PU_Hero2, 0, pos.X, pos.Y, 180)
		SetEntityName(PilResp, "Pilgrim")

		createBriefingRobbers()

		if IsAlive("Robber1") then
		Move("Robber1","Point3")
		end

		if IsAlive("Robber2") then
		Move("Robber2","Point3")
		end

		if IsAlive("Robber3") then
		Move("Robber3","Point2")
		end

		if IsAlive("Robber4") then
		Move("Robber4","Point2")
		end

		if IsAlive("Robber5") then
		Move("Robber5","Point1")
		end

		if IsAlive("Robber6") then
		Move("Robber6","Point1")
		end

		if IsAlive("Robber7") then
		Move("Robber7","PointN1")
		end

		if IsAlive("Robber8") then
		Move("Robber8","PointN1")
		end

		if IsAlive("Robber9") then
		Move("Robber9","PointN2")
		end

		if IsAlive("Robber10") then
		Move("Robber10","PointN2")
		end

		if IsAlive("Attacker1") then
		Move("Attacker1","PointN1")
		end

		if IsAlive("Attacker2") then
		Move("Attacker2","PointN2")
		end

		StartJob("GenerateCaravans")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DestroyMonastery"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DestroyMonastery = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsDead("RobbersGenerator")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_DestroyMonastery = function()
	-------------------------------------------------------------------------------------------------------------------

		end3rdChapter()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TwoQDown"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TwoQDown = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return Quest1Done==1 and Quest2Done==1 and MonasteryDown==1

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TwoQDown = function()
	-------------------------------------------------------------------------------------------------------------------

		--start4thChapter()

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

QUESTCaravan_DELAY 		=       360
QUESTCaravan_COUNTER 		=	QUESTCaravan_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "GenerateCaravans"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_GenerateCaravans = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTCaravan_COUNTER > 0 then

                   QUESTCaravan_COUNTER = QUESTCaravan_COUNTER - 1

                   return false

                	elseif QUESTCaravan_COUNTER==0 then 

			return true
                      
                                 
			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_GenerateCaravans = function()
	-------------------------------------------------------------------------------------------------------------------

		TimedCaravans()
		StartJob("DetectAllCaravans")

		StartJob("RewardGold")
		StartJob("RewardIron")
		StartJob("RewardWood")
		StartJob("RewardClay")
		StartJob("RewardStone")
		StartJob("RewardSulfur")

		QUESTCaravan_DELAY 		=       360
		QUESTCaravan_COUNTER 		=	QUESTCaravan_DELAY
		StartJob("GenerateCaravans")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

function TimedCaravans()

	Gold12c   = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanGold"),"Gold1")
	Iron12c   = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanIron"),"Iron1")
	Wood12c   = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanWood"),"Wood1")
	Stone12c  = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanStone"),"Stone1")
	Sulfur12c = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanSulfur"),"Sulfur1")
	Clay12c   = CreateEntity(7,Entities.PU_Travelling_Salesman,GetPosition("SpawnCaravanClay"),"Clay1")

	StartJob("TimerEnsurance")	

	Move("Gold1","CaravanTarget1")
	Move("Iron1","CaravanTarget1")
	Move("Wood1","CaravanTarget1")
	Move("Clay1","CaravanTarget1")
	Move("Stone1","CaravanTarget1")
	Move("Sulfur1","CaravanTarget1")

	MakeInvulnerable("Gold1")
	MakeInvulnerable("Iron1")
	MakeInvulnerable("Clay1")
	MakeInvulnerable("Wood1")
	MakeInvulnerable("Stone1")
	MakeInvulnerable("Sulfur1")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "RewardGold"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_RewardGold = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("Gold1","CaravanTarget1",800)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardGold = function()
	-------------------------------------------------------------------------------------------------------------------

			AddGold(1000)

			DestroyEntity("Gold1")

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

                
                return IsNear("Wood1","CaravanTarget1",800)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardWood = function()
	-------------------------------------------------------------------------------------------------------------------

			AddWood(1000)

			DestroyEntity("Wood1")

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

                
                return IsNear("Sulfur1","CaravanTarget1",800)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardSulfur = function()
	-------------------------------------------------------------------------------------------------------------------

			AddSulfur(500)

			DestroyEntity("Sulfur1")

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

                
                return IsNear("Stone1","CaravanTarget1",800)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardStone = function()
	-------------------------------------------------------------------------------------------------------------------

			AddStone(1000)

			DestroyEntity("Stone1")

                        return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "RewardClay"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_RewardClay = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("Clay1","CaravanTarget1",800)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardClay = function()
	-------------------------------------------------------------------------------------------------------------------

			AddClay(1000)

			DestroyEntity("Clay1")

                        return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "RewardIron"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_RewardIron = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("Iron1","CaravanTarget1",800)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_RewardIron = function()
	-------------------------------------------------------------------------------------------------------------------

			AddIron(1000)

			DestroyEntity("Iron1")

                        return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DetectAllCaravans"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DetectAllCaravans = function()
	-------------------------------------------------------------------------------------------------------------------

	if MonasteryDown==0 then 
		
		if IsNear("Gold1","BorderPoint",1000) or IsNear("Iron1","BorderPoint",1000) or IsNear("Wood1","BorderPoint",1000) or IsNear("Clay1","BorderPoint",1000) or IsNear("Stone1","BorderPoint",1000) or IsNear("Sulfur1",BorderPoint,1000) then

		return true

		end

	else

	return false

	end

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_DetectAllCaravans = function()
	-------------------------------------------------------------------------------------------------------------------

		--CreateAttackCaravans()

		MakeVulnerable("Gold1")
		MakeVulnerable("Iron1")
		MakeVulnerable("Clay1")
		MakeVulnerable("Wood1")
		MakeVulnerable("Stone1")
		MakeVulnerable("Sulfur1")

		--Attack("Attacker1","Point1")
		--Attack("Attacker2","Point2")
		--Attack("Attacker3","Point3")


		--Attack("DefBor1","MiddleClay")
		--Attack("DefBor2","MiddleIron")
		--Attack("DefBor3","Point1")

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function CreateAttackCaravans()
	local etype1 = Entities.CU_BanditLeaderSword1
	local etype2 = Entities.CU_BanditLeaderBow1
	if CP_Difficulty > 0 then
		etype1 = Entities.CU_BanditLeaderSword2
		etype2 = Entities.CU_BanditLeaderBow2
	end

	local pos 	= GetPosition("SpawnCaravanAttack")
	Attacker2 	= AI.Entity_CreateFormation(5, etype1, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attacker2, "Attacker2")

	local pos 	= GetPosition("SpawnCaravanAttack")
	Attacker3 	= AI.Entity_CreateFormation(5, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attacker3, "Attacker3")
	
	local pos = GetPosition("MountainMenSpawn")
	local DefBor1 = AI.Entity_CreateFormation(4,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,CP_Difficulty+1,0)
	SetEntityName(DefBor1, "DefBor1")

end

-------------------------------------------------------------------------------------------

QUESTEnsurance_DELAY 		=       5
QUESTEnsurance_COUNTER 		=	QUESTEnsurance_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerEnsurance"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerEnsurance = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTEnsurance_COUNTER > 0 then

                   QUESTEnsurance_COUNTER = QUESTEnsurance_COUNTER - 1

                   return false

                	elseif QUESTEnsurance_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerEnsurance = function()
	-------------------------------------------------------------------------------------------------------------------

		Ensurance()

		QUESTEnsurance_DELAY 		=       5
		QUESTEnsurance_COUNTER 		=	QUESTEnsurance_DELAY

		StartJob("TimerEnsurance")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	

function Ensurance()

	if IsAlive("Gold1") then
	Move("Gold1","CaravanTarget1")
	end

	if IsAlive("Iron1") then
	Move("Iron1","CaravanTarget1")
	end

	if IsAlive("Wood1") then
	Move("Wood1","CaravanTarget1")
	end

	if IsAlive("Clay1") then
	Move("Clay1","CaravanTarget1")
	end

	if IsAlive("Stone1") then
	Move("Stone1","CaravanTarget1")
	end

	if IsAlive("Sulfur1") then
	Move("Sulfur1","CaravanTarget1")
	end

end