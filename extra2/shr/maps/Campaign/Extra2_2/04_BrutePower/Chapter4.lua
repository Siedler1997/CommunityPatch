function StartChapter4()

	DestroyEntity("MML1")
	CreateEntity(0,Entities.XD_MiscSword,GetPosition("MountainMenLeader"),"MML1")

	DestroyEntity("MountainMenLeader")

	local pos = GetPosition("MML1")
	MMLResp = Tools.CreateGroup(4, Entities.CU_Barbarian_Hero, 0, pos.X, pos.Y, 180)
	SetEntityName(MMLResp, "MML1")

	StartJob("Open2ndHalf")
	NPCLeader1()
	local experience = LOW_EXPERIENCE
	if CP_Difficulty > 0 then
		experience = experience + 1
	end
	local pos = GetPosition("Relocation")
	local MountainMenLeader = AI.Entity_CreateFormation(4,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,(experience+1),0)
	SetEntityName(MountainMenLeader, "MountainMenLeader")

	createBriefingInfo()

end

------------------------------------------------------------------------------------------------

function ContinueChapter4()
	local experience = LOW_EXPERIENCE
	if CP_Difficulty > 0 then
		experience = experience + 1
	end
	for i = 1, 12 do
		local pos = GetPosition("TorukSup"..i)
		local TorukSup = AI.Entity_CreateFormation(4,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,experience,0)
		SetEntityName(TorukSup, "TorukSup"..i)
	end
	local pos = GetPosition("Toruk")
	local Toruk = AI.Entity_CreateFormation(4,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,(experience+1),0)
	SetEntityName(Toruk, "Toruk")

	MakeVulnerable("Rock1")
	MakeVulnerable("Rock2")

	NPCToruk()

	createBriefingEneMountMen()
	StartJob("CheckRocks2")

	StartJob("Quest5Start")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "FollowPilgrim"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_FollowPilgrim = function()
	-------------------------------------------------------------------------------------------------------------------

                return PilFollow==0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_FollowPilgrim = function()
	-------------------------------------------------------------------------------------------------------------------

		Move("Toruk","MMTar1")
		Move("TorukSup1","MMTar2")
		Move("TorukSup2","MMTar3")
		Move("TorukSup3","MMTar4")
		Move("TorukSup4","MMTar5")
		Move("TorukSup5","MMTar6")
		Move("TorukSup6","MMTar7")
		Move("TorukSup7","MMTar8")
		Move("TorukSup8","MMTar9")
		Move("TorukSup9","MMTar10")
		Move("TorukSup10","MMTar11")
		Move("TorukSup11","MMTar12")
		Move("TorukSup12","MMTar13")

		return true


	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckRocks2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckRocks2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Approach1") or IsDead("Approach2")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_CheckRocks2 = function()
	-------------------------------------------------------------------------------------------------------------------

		StartJob("EnemyMMAttacks")
		StartJob("EnemyMMAttacks1")
		StartJob("EnemyMMAttacks2")

		return true


	end


-------------------------------------------------------------------------------------------------------------------------

QUESTEnemyMMAttacks_DELAY 		=       30
QUESTEnemyMMAttacks_COUNTER 		=	QUESTEnemyMMAttacks_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "EnemyMMAttacks"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_EnemyMMAttacks = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("MMB6") then

		if MM1Group1==0 then

                if QUESTEnemyMMAttacks_COUNTER > 0 then

                   QUESTEnemyMMAttacks_COUNTER = QUESTEnemyMMAttacks_COUNTER - 1

                   return false

                	elseif QUESTEnemyMMAttacks_COUNTER==0 then 

			return true
                      
                                 
			end

		end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_EnemyMMAttacks = function()
	-------------------------------------------------------------------------------------------------------------------

		EnemyMMArmy()

		StartJob("MM1Group1Dead")

		QUESTEnemyMMAttacks_DELAY 		=       120
		QUESTEnemyMMAttacks_COUNTER 		=	QUESTEnemyMMAttacks_DELAY 
		StartJob("EnemyMMAttacks")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

EnemyMMArmy = function()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_Barbarian_LeaderClub1
	local etype2 = Entities.CU_BanditLeaderSword1
	if CP_Difficulty > 0 then
		experience = experience + 3
		etype1 = Entities.CU_Barbarian_LeaderClub2
		etype2 = Entities.CU_BanditLeaderSword2
	end

	local pos = GetPosition("MMAttack1")
	RaidAttack1 = AI.Entity_CreateFormation(3, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack1, "Rand1Attack1")

	local pos = GetPosition("MMAttack2")
	RaidAttack2 = AI.Entity_CreateFormation(3, etype2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack2, "Rand1Attack2")

	Attack("Rand1Attack1","CaravanTarget")
	Attack("Rand1Attack2","CaravanTarget")

	MM1Group1=1

end

-------------------------------------------------------------------------------------------------------------------------

QUESTEnemyMMAttacks1_DELAY 		=       60
QUESTEnemyMMAttacks1_COUNTER 		=	QUESTEnemyMMAttacks1_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "EnemyMMAttacks1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_EnemyMMAttacks1 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("MMB8") then

		if MM1Group2==0 then

                if QUESTEnemyMMAttacks1_COUNTER > 0 then

                   QUESTEnemyMMAttacks1_COUNTER = QUESTEnemyMMAttacks1_COUNTER - 1

                   return false

                	elseif QUESTEnemyMMAttacks1_COUNTER==0 then 

			return true
                      
                                 
			end

		end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_EnemyMMAttacks1 = function()
	-------------------------------------------------------------------------------------------------------------------

		EnemyMMArmy1()

		StartJob("MM1Group2Dead")

		QUESTEnemyMMAttacks1_DELAY 		=       120
		QUESTEnemyMMAttacks1_COUNTER 		=	QUESTEnemyMMAttacks1_DELAY 
		StartJob("EnemyMMAttacks1")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

EnemyMMArmy1 = function()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_BanditLeaderSword1
	if CP_Difficulty > 0 then
		experience = experience + 3
		etype1 = Entities.CU_BanditLeaderSword2
	end

	local pos = GetPosition("MMAttack4")
	RaidAttack3 = AI.Entity_CreateFormation(3, Entities.CU_BanditLeaderBow1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack3, "Rand1Attack3")

	local pos = GetPosition("MMAttack2")
	RaidAttack4 = AI.Entity_CreateFormation(3, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack4, "Rand1Attack4")


	Attack("Rand1Attack3","CaravanTarget")
	Attack("Rand1Attack4","CaravanTarget")

	MM1Group2=1


end

-------------------------------------------------------------------------------------------------------------------------

QUESTEnemyMMAttacks2_DELAY 		=       90
QUESTEnemyMMAttacks2_COUNTER 		=	QUESTEnemyMMAttacks2_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "EnemyMMAttacks2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_EnemyMMAttacks2 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("MMB3") then

		if MM1Group1==0 then

                if QUESTEnemyMMAttacks2_COUNTER > 0 then

                   QUESTEnemyMMAttacks2_COUNTER = QUESTEnemyMMAttacks2_COUNTER - 1

                   return false

                	elseif QUESTEnemyMMAttacks2_COUNTER==0 then 

			return true
                      
                                 
			end

		end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_EnemyMMAttacks2 = function()
	-------------------------------------------------------------------------------------------------------------------

		EnemyMMArmy2()

		StartJob("MM1Group3Dead")

		QUESTEnemyMMAttacks2_DELAY 		=       120
		QUESTEnemyMMAttacks2_COUNTER 		=	QUESTEnemyMMAttacks2_DELAY 
		StartJob("EnemyMMAttacks2")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

EnemyMMArmy2 = function()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_Barbarian_LeaderClub1
	if CP_Difficulty > 0 then
		experience = experience + 3
		etype1 = Entities.CU_Barbarian_LeaderClub2
	end

	local pos = GetPosition("MMAttack2")
	RaidAttack5 = AI.Entity_CreateFormation(3, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack5, "Rand1Attack5")

	local pos = GetPosition("MMAttack4")
	RaidAttack6 = AI.Entity_CreateFormation(3, Entities.CU_BanditLeaderBow1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(RaidAttack6, "Rand1Attack6")


	Attack("Rand1Attack5","CaravanTarget")
	Attack("Rand1Attack6","CaravanTarget")

	MM1Group3=1

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Quest5Start"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Quest5Start = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Rock1") or IsDead("Rock2")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_Quest5Start = function()
	-------------------------------------------------------------------------------------------------------------------

		start5thChapter()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Open2ndHalf"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Open2ndHalf = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("MMB1") and IsDead("MMB2") and IsDead("MMB3") and IsDead("MMB4") and IsDead("MMB5") and IsDead("MMB7") and IsDead("MMB8")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_Open2ndHalf = function()
	-------------------------------------------------------------------------------------------------------------------

		end4thChapter()
		createBriefingInfo2()
		NPCCityBoy()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MM1Group1Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MM1Group1Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Rand1Attack1") and IsDead("Rand1Attack2")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MM1Group1Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		MM1Group1=0

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MM1Group2Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MM1Group2Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Rand1Attack3") and IsDead("Rand1Attack4")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MM1Group2Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		MM1Group2=0

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MM1Group3Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MM1Group3Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Rand1Attack5") and IsDead("Rand1Attack6")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MM1Group3Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		MM1Group3=0

		return true


	end