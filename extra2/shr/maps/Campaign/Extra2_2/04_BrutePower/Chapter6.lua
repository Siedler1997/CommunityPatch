function StartChapter6()

StartJob("CheckBrief1")
ReplaceEntity("FinalGate", Entities.XD_PalisadeGate2)
StartJob("BarbarianSettlementDead")
StartJob("BarbarianAttacks")
StartJob("BarbarianAttacks1")
StartJob("BarbarianAttacks2")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckBrief1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckBrief1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_CheckBrief1 = function()
	-------------------------------------------------------------------------------------------------------------------

		createBriefingBarbarians()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BarbarianSettlementDead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BarbarianSettlementDead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("EnemyB")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BarbarianSettlementDead = function()
	-------------------------------------------------------------------------------------------------------------------

		end6thChapter()

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

QUESTBarbarianAttacks_DELAY 		=       0
QUESTBarbarianAttacks_COUNTER 		=	QUESTBarbarianAttacks_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BarbarianAttacks"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BarbarianAttacks = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("BarbBuild2") then

		if BGroup1==0 then

                if QUESTBarbarianAttacks_COUNTER > 0 then

                   QUESTBarbarianAttacks_COUNTER = QUESTBarbarianAttacks_COUNTER - 1

                   return false

                	elseif QUESTBarbarianAttacks_COUNTER==0 then 

			return true
                      
                                 
			end

		end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BarbarianAttacks = function()
	-------------------------------------------------------------------------------------------------------------------

		BarbarianArmy()

		StartJob("BGroup1Dead")

		QUESTBarbarianAttacks_DELAY 		=       120
		QUESTBarbarianAttacks_COUNTER 		=	QUESTBarbarianAttacks_DELAY 
		StartJob("BarbarianAttacks")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

function BarbarianArmy()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_BlackKnight_LeaderMace1
	local etype2 = Entities.PU_LeaderBow2
	if CP_Difficulty == 1 then
		experience = experience + 3
		etype1 = Entities.CU_BlackKnight_LeaderMace2
		etype2 = Entities.PU_LeaderBow3
	end

	local pos = GetPosition("BSpawn1")
	RaidAttack1 = AI.Entity_CreateFormation(2, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack1, "RandAttack1")

	local pos = GetPosition("BSpawn2")
	RaidAttack2 = AI.Entity_CreateFormation(2, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack2, "RandAttack2")

	Attack("RandAttack1","Backup3")
	Attack("RandAttack2","PointN1")

	BGroup1=1

end

-------------------------------------------------------------------------------------------------------------------------

QUESTBarbarianAttacks1_DELAY 		=       30
QUESTBarbarianAttacks1_COUNTER 		=	QUESTBarbarianAttacks1_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BarbarianAttacks1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BarbarianAttacks1 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("EnemyB") and BGroup2==0 then

                if QUESTBarbarianAttacks1_COUNTER > 0 then

                   QUESTBarbarianAttacks1_COUNTER = QUESTBarbarianAttacks1_COUNTER - 1

                   return false

                	elseif QUESTBarbarianAttacks1_COUNTER==0 and IsAlive("EnemyB") then 

			return true
                      
                                 
			end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BarbarianAttacks1 = function()
	-------------------------------------------------------------------------------------------------------------------

		BarbarianArmy1()

		StartJob("BGroup2Dead")

		QUESTBarbarianAttacks1_DELAY 		=       120
		QUESTBarbarianAttacks1_COUNTER 		=	QUESTBarbarianAttacks1_DELAY 
		StartJob("BarbarianAttacks1")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

function BarbarianArmy1()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_BlackKnight_LeaderMace1
	local etype2 = Entities.PU_LeaderPoleArm2
	if CP_Difficulty == 1 then
		experience = experience + 3
		etype1 = Entities.CU_BlackKnight_LeaderMace2
		etype2 = Entities.PU_LeaderPoleArm3
	end

	local pos = GetPosition("BSpawn3")
	RaidAttack3 = AI.Entity_CreateFormation(2, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack3, "RandAttack3")

	local pos = GetPosition("BSpawn4")
	RaidAttack4 = AI.Entity_CreateFormation(2, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack4, "RandAttack4")


	Attack("RandAttack3","FinAttack1")
	Attack("RandAttack4","FinAttack1")

	BGroup2=1

end

-------------------------------------------------------------------------------------------------------------------------

QUESTBarbarianAttacks2_DELAY 		=       60
QUESTBarbarianAttacks2_COUNTER 		=	QUESTBarbarianAttacks2_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BarbarianAttacks2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BarbarianAttacks2 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("BarbBuild6") then

		if BGroup3==0 then

                if QUESTBarbarianAttacks2_COUNTER > 0 then

                   QUESTBarbarianAttacks2_COUNTER = QUESTBarbarianAttacks2_COUNTER - 1

                   return false

                	elseif QUESTBarbarianAttacks2_COUNTER==0 then 

			return true
                      
                                 
			end

		end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BarbarianAttacks2 = function()
	-------------------------------------------------------------------------------------------------------------------

		BarbarianArmy2()

		StartJob("BGroup3Dead")

		QUESTBarbarianAttacks2_DELAY 		=       120
		QUESTBarbarianAttacks2_COUNTER 		=	QUESTBarbarianAttacks2_DELAY 
		StartJob("BarbarianAttacks2")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

function BarbarianArmy2()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_BanditLeaderBow1
	local etype2 = Entities.CU_BanditLeaderSword1
	local etype3 = Entities.CU_BlackKnight_LeaderMace1
	if CP_Difficulty == 1 then
		experience = experience + 3
		etype1 = Entities.PU_LeaderBow3
		etype2 = Entities.PU_LeaderPoleArm3
		etype3 = Entities.CU_BlackKnight_LeaderMace2
	end

	local pos = GetPosition("BSpawn5")
	RaidAttack5 = AI.Entity_CreateFormation(2, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack5, "RandAttack5")

	local pos = GetPosition("BSpawn6")
	RaidAttack6 = AI.Entity_CreateFormation(2, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack6, "RandAttack6")

	local pos = GetPosition("BSpawn7")
	RaidAttack7 = AI.Entity_CreateFormation(2, etype3, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack7, "RandAttack7")

	Attack("RandAttack5","FinAttack2")
	Attack("RandAttack6","FinAttack2")
	Attack("RandAttack7","FinAttack3")

	BGroup3=1

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BGroup1Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BGroup1Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("RandAttack1") and IsDead("RandAttack2")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BGroup1Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		BGroup1=0

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BGroup2Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BGroup2Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("RandAttack3") and IsDead("RandAttack4")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BGroup2Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		BGroup2=0

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BGroup3Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BGroup3Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("RandAttack5") and IsDead("RandAttack6") and IsDead("RandAttack7")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BGroup3Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		BGroup3=0

		return true


	end