function StartChapter5()

createBriefingQ5Starter()
StartJob("QuestStart")
StartJob("PilgrimSeesYuki")
StartJob("AttackRitual")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestStart"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestStart = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestStart = function()
	-------------------------------------------------------------------------------------------------------------------

		StartJob("TimeToSavePrincess")
	
		for i = 1, 16 do
			local pos = GetPosition("RitualSpawn"..i)
			local RitualMen = AI.Entity_CreateFormation(5,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,CP_Difficulty+1,0)
			SetEntityName(RitualMen, "RitualMen"..i)
		end

		StartJob("Effects")

		MakeInvulnerable("Druid1")
		MakeInvulnerable("Druid2")
		MakeInvulnerable("Druid3")
		MakeInvulnerable("Druid4")
		MakeInvulnerable("Druid5")
		MakeInvulnerable("Druid6")
		MakeInvulnerable("Druid7")
		MakeInvulnerable("Druid8")
		MakeInvulnerable("Druid9")
		MakeInvulnerable("Princess")

		StartJob("CheckTroops")
		StartJob("TroopsCheck")
		StartJob("DefendersAttack")

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

QUESTPrincess_DELAY 		=       300
QUESTPrincess_COUNTER 		=	QUESTPrincess_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimeToSavePrincess"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeToSavePrincess = function()
	-------------------------------------------------------------------------------------------------------------------

		if PrincessFree==0 then                

		if QUESTPrincess_COUNTER > 0 then

                   QUESTPrincess_COUNTER = QUESTPrincess_COUNTER - 1

			MapLocal_StartCountDown(QUESTPrincess_COUNTER)
			Report("Time remaining : "..QUESTPrincess_COUNTER.." seconds")

                   return false

                	elseif QUESTPrincess_COUNTER==0 then 

			return true
                      
                                 
			end

		else

		MapLocal_StopCountDown(0)

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimeToSavePrincess = function()
	-------------------------------------------------------------------------------------------------------------------

		MapLocal_StopCountDown(0)

		if PrincessFree==0 then
		Defeat()
		end

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

QUESTBombs_DELAY 		=       2
QUESTBombs_COUNTER 		=	QUESTBombs_DELAY 
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Effects"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Effects = function()
	-------------------------------------------------------------------------------------------------------------------

		if StopEffects==0 then

		if QUESTBombs_COUNTER > 0 and StopEffects==0 then

                   QUESTBombs_COUNTER = QUESTBombs_COUNTER - 1

                   return false

                	elseif QUESTBombs_COUNTER==0 then 

			return true
                      
                                 
			end

		end

	end

		
	-------------------------------------------------------------------------------------------------------------------
	Action_Effects = function()
	-------------------------------------------------------------------------------------------------------------------

	Logic.CreateEffect(GGL_Effects.FXMaryDemoralize, GetPosition("Efect1").X, GetPosition("Efect1").Y,0)
	Logic.CreateEffect(GGL_Effects.FXMaryDemoralize, GetPosition("Efect2").X, GetPosition("Efect2").Y,0)
	Logic.CreateEffect(GGL_Effects.FXMaryDemoralize, GetPosition("Efect3").X, GetPosition("Efect3").Y,0)
	Logic.CreateEffect(GGL_Effects.FXMaryDemoralize, GetPosition("Efect4").X, GetPosition("Efect4").Y,0)
	Logic.CreateEffect(GGL_Effects.FXMaryDemoralize, GetPosition("Efect5").X, GetPosition("Efect5").Y,0)
	Logic.CreateEffect(GGL_Effects.FXMaryDemoralize, GetPosition("Efect6").X, GetPosition("Efect6").Y,0)
	Logic.CreateEffect(GGL_Effects.FXMaryDemoralize, GetPosition("Efect7").X, GetPosition("Efect7").Y,0)
	Logic.CreateEffect(GGL_Effects.FXMaryDemoralize, GetPosition("Efect8").X, GetPosition("Efect8").Y,0)
	Logic.CreateEffect(GGL_Effects.FXTemplarAltarEffect, GetPosition("MiddleEffect").X, GetPosition("MiddleEffect").Y,0)

		QUESTBombs_DELAY 		=       2
		QUESTBombs_COUNTER 		=	QUESTBombs_DELAY
		StartJob("Effects")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckTroops"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckTroops = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("RitualMen1") and IsDead("RitualMen2") and IsDead("RitualMen3") and IsDead("RitualMen4") and IsDead("RitualMen5") and IsDead("RitualMen6") and IsDead("RitualMen7") and IsDead("RitualMen8") and IsDead("RitualMen9") and IsDead("RitualMen10") and IsDead("RitualMen11") and IsDead("RitualMen12") and IsDead("RitualMen13") and IsDead("RitualMen14") and IsDead("RitualMen15") and IsDead("RitualMen16") 

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_CheckTroops = function()
	-------------------------------------------------------------------------------------------------------------------

		MakeVulnerable("Druid1")
		MakeVulnerable("Druid2")
		MakeVulnerable("Druid3")
		MakeVulnerable("Druid4")
		MakeVulnerable("Druid5")
		MakeVulnerable("Druid6")
		MakeVulnerable("Druid7")
		MakeVulnerable("Druid8")
		MakeVulnerable("Druid9")

		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid1"),"DruidReference1")
		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid2"),"DruidReference2")
		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid3"),"DruidReference3")
		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid4"),"DruidReference4")
		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid5"),"DruidReference5")
		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid6"),"DruidReference6")
		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid7"),"DruidReference7")
		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid8"),"DruidReference8")
		CreateEntity(0,Entities.XD_Evil_LeaderBearman1_Drop,GetPosition("Druid9"),"DruidReference9")

		DestroyEntity("Druid1")
		DestroyEntity("Druid2")
		DestroyEntity("Druid3")
		DestroyEntity("Druid4")
		DestroyEntity("Druid5")
		DestroyEntity("Druid6")
		DestroyEntity("Druid7")
		DestroyEntity("Druid8")
		DestroyEntity("Druid9")
		
		for i = 1, 9 do
			local pos = GetPosition("DruidReference"..i)
			local Druid = AI.Entity_CreateFormation(5,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,CP_Difficulty+1,0)
			SetEntityName(Druid, "Druid"..i)
		end

		Attack("Druid1","RitualSpawn1")
		Attack("Druid2","RitualSpawn2")
		Attack("Druid3","RitualSpawn3")
		Attack("Druid4","RitualSpawn4")
		Attack("Druid5","RitualSpawn1")
		Attack("Druid6","RitualSpawn2")
		Attack("Druid7","RitualSpawn3")
		Attack("Druid8","RitualSpawn4")
		Attack("Druid9","RitualSpawn1")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TroopsCheck"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TroopsCheck = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Druid1") and IsDead("Druid2") and IsDead("Druid3") and IsDead("Druid4") and IsDead("Druid5") and IsDead("Druid6") and IsDead("Druid7") and IsDead("Druid8") and IsDead("Druid9")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TroopsCheck = function()
	-------------------------------------------------------------------------------------------------------------------

		StopEffects=1
		end5thChapter()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DefendersAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DefendersAttack = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Rock1") or IsDead("Rock2")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_DefendersAttack = function()
	-------------------------------------------------------------------------------------------------------------------

		Attack("RitualMen1","RitualSpawn1")
		Attack("RitualMen2","RitualSpawn2")
		Attack("RitualMen3","RitualSpawn3")
		Attack("RitualMen4","RitualSpawn4")
		Attack("RitualMen5","RitualSpawn1")
		Attack("RitualMen6","RitualSpawn2")
		Attack("RitualMen7","RitualSpawn3")
		Attack("RitualMen8","RitualSpawn4")
		Attack("RitualMen9","RitualSpawn1")
		Attack("RitualMen10","RitualSpawn2")
		Attack("RitualMen11","RitualSpawn3")
		Attack("RitualMen12","RitualSpawn4")
		Attack("RitualMen13","RitualSpawn1")
		Attack("RitualMen14","RitualSpawn2")
		Attack("RitualMen15","RitualSpawn3")
		Attack("RitualMen16","RitualSpawn4")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "PilgrimSeesYuki"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_PilgrimSeesYuki = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false and IsNear("Pilgrim","Princess",1500) and PrincessFree==0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_PilgrimSeesYuki = function()
	-------------------------------------------------------------------------------------------------------------------

		createBriefingSighting()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AttackRitual"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AttackRitual = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false and Visited==1

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_AttackRitual = function()
	-------------------------------------------------------------------------------------------------------------------

		Attack("TorukSup1","RitualSpawn1")
		Attack("TorukSup2","RitualSpawn2")
		Attack("TorukSup3","RitualSpawn3")
		Attack("TorukSup4","RitualSpawn4")
		Attack("TorukSup5","RitualSpawn1")
		Attack("TorukSup6","RitualSpawn2")
		Attack("TorukSup7","RitualSpawn3")
		Attack("TorukSup8","RitualSpawn4")
		Attack("TorukSup9","RitualSpawn1")
		Attack("TorukSup10","RitualSpawn2")
		Attack("TorukSup11","RitualSpawn3")
		Attack("TorukSup12","RitualSpawn4")
		Attack("Toruk","RitualSpawn1")


		return true


	end