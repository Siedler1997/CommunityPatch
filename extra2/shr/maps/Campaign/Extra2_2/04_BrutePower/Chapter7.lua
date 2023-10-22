function StartChapter7()

	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(3, true)
		ResearchAllMilitaryTechsAddOn(4, true)
		ResearchAllMilitaryTechsAddOn(5, true)
	end

	ReplaceEntity("Poarta1", Entities.XD_PalisadeGate2)
	StartJob("CheckBrief")
	StartJob("EnemyMMAttacks2221")
	StartJob("EnemyMMAttacks2222")
	StartJob("EnemyMMAttacks2223")
	StartJob("MountainMenVillageDead")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckBrief"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckBrief = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_CheckBrief = function()
	-------------------------------------------------------------------------------------------------------------------

		createBriefingExterminate()

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

QUESTEnemyMMAttacks2221_DELAY 			=       20
QUESTEnemyMMAttacks2221_COUNTER 		=	QUESTEnemyMMAttacks2221_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "EnemyMMAttacks2221"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_EnemyMMAttacks2221 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("MMHouse1") and MountainMenDeastroyed==0 and MM2Group1==0 then

                if QUESTEnemyMMAttacks2221_COUNTER > 0 then

                   QUESTEnemyMMAttacks2221_COUNTER = QUESTEnemyMMAttacks2221_COUNTER - 1

                   return false

                	elseif QUESTEnemyMMAttacks2221_COUNTER==0 then 

			return true
                      
                                 
			end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_EnemyMMAttacks2221 = function()
	-------------------------------------------------------------------------------------------------------------------

		EnemyMMArmy2221()

		StartJob("MM2Group1Dead")

		QUESTEnemyMMAttacks2221_DELAY 		=       120
		QUESTEnemyMMAttacks2221_COUNTER 	=	QUESTEnemyMMAttacks2221_DELAY 
		StartJob("EnemyMMAttacks2221")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

EnemyMMArmy2221 = function()
	local etype1 = Entities.CU_Barbarian_LeaderClub1
	local etype2 = Entities.CU_BanditLeaderSword1
	if CP_Difficulty > 0 then
		etype1 = Entities.CU_Barbarian_LeaderClub2
		etype2 = Entities.CU_BanditLeaderSword2
	end

	local pos = GetPosition("MM1Attack1")
	RaidAttack1 = AI.Entity_CreateFormation(3, etype1, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(RaidAttack1, "Rand2Attack1")

	local pos = GetPosition("MM1Attack3")
	RaidAttack2 = AI.Entity_CreateFormation(3, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(RaidAttack2, "Rand2Attack2")


	Attack("Rand2Attack1","CaravanTarget")
	Attack("Rand2Attack2","CaravanTarget")

	MM2Group1=1

end

-------------------------------------------------------------------------------------------------------------------------

QUESTEnemyMMAttacks2222_DELAY 			=       50
QUESTEnemyMMAttacks2222_COUNTER 		=	QUESTEnemyMMAttacks2222_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "EnemyMMAttacks2222"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_EnemyMMAttacks2222 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("EnemyMM") and MountainMenDeastroyed==0 and MM2Group2==0 then

                if QUESTEnemyMMAttacks2222_COUNTER > 0 then

                   QUESTEnemyMMAttacks2222_COUNTER = QUESTEnemyMMAttacks2222_COUNTER - 1

                   return false

                	elseif QUESTEnemyMMAttacks2222_COUNTER==0 then 

			return true
                      
                                 
			end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_EnemyMMAttacks2222 = function()
	-------------------------------------------------------------------------------------------------------------------

		EnemyMMArmy2222()

		StartJob("MM2Group2Dead")

		QUESTEnemyMMAttacks2222_DELAY 		=       120
		QUESTEnemyMMAttacks2222_COUNTER 	=	QUESTEnemyMMAttacks2222_DELAY 
		StartJob("EnemyMMAttacks2222")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

EnemyMMArmy2222 = function()
	local etype1 = Entities.CU_BanditLeaderSword1
	local etype2 = Entities.CU_BanditLeaderBow1
	if CP_Difficulty > 0 then
		etype1 = Entities.CU_BanditLeaderSword2
		etype2 = Entities.CU_BanditLeaderBow2
	end

	local pos = GetPosition("MM1Attack3")
	RaidAttack3 = AI.Entity_CreateFormation(3, etype1, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(RaidAttack3, "Rand2Attack3")

	local pos = GetPosition("MM1Attack4")
	RaidAttack4 = AI.Entity_CreateFormation(3, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(RaidAttack4, "Rand2Attack4")


	Attack("Rand2Attack3","CaravanTarget")
	Attack("Rand2Attack4","CaravanTarget")

	MM2Group2=1

end

-------------------------------------------------------------------------------------------------------------------------

QUESTEnemyMMAttacks2223_DELAY 			=       80
QUESTEnemyMMAttacks2223_COUNTER 		=	QUESTEnemyMMAttacks2223_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "EnemyMMAttacks2223"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_EnemyMMAttacks2223 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsAlive("EnemyMM") and MountainMenDeastroyed==0 and MM2Group3==0 then

                if QUESTEnemyMMAttacks2223_COUNTER > 0 then

                   QUESTEnemyMMAttacks2223_COUNTER = QUESTEnemyMMAttacks2223_COUNTER - 1

                   return false

                	elseif QUESTEnemyMMAttacks2223_COUNTER==0 then 

			return true
                      
                                 
			end

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_EnemyMMAttacks2223 = function()
	-------------------------------------------------------------------------------------------------------------------

		EnemyMMArmy2223()

		StartJob("MM2Group3Dead")

		QUESTEnemyMMAttacks2223_DELAY 		=       120
		QUESTEnemyMMAttacks2223_COUNTER 	=	QUESTEnemyMMAttacks2223_DELAY 
		StartJob("EnemyMMAttacks2223")

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

EnemyMMArmy2223 = function()
	local etype1 = Entities.CU_Barbarian_LeaderClub1
	local etype2 = Entities.CU_BanditLeaderBow1
	if CP_Difficulty > 0 then
		etype1 = Entities.CU_Barbarian_LeaderClub2
		etype2 = Entities.CU_BanditLeaderBow2
	end

	local pos = GetPosition("MM1Attack3")
	RaidAttack5 = AI.Entity_CreateFormation(3, etype2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(RaidAttack5, "Rand2Attack5")

	local pos = GetPosition("MM1Attack4")
	RaidAttack6 = AI.Entity_CreateFormation(3, etype1, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(RaidAttack6, "Rand2Attack6")


	Attack("Rand2Attack5","CaravanTarget")
	Attack("Rand2Attack6","CaravanTarget")

	MM2Group3=1

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MM2Group1Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MM2Group1Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Rand2Attack1") and IsDead("Rand2Attack2")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MM2Group1Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		MM2Group1=0

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MM2Group2Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MM2Group2Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Rand2Attack3") and IsDead("Rand2Attack4")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MM2Group2Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		MM2Group2=0

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MM2Group3Dead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MM2Group3Dead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Rand2Attack5") and IsDead("Rand2Attack6")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MM2Group3Dead = function()
	-------------------------------------------------------------------------------------------------------------------

		MM2Group3=0

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MountainMenVillageDead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MountainMenVillageDead = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("EnemyMM")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MountainMenVillageDead = function()
	-------------------------------------------------------------------------------------------------------------------

		end7thChapter()

		return true


	end