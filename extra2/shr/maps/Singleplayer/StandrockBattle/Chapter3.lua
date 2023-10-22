function StartChapter3()

	local pos = GetPosition("TempTarget")
	Temp1 = Tools.CreateGroup(7, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
	SetEntityName(Temp1, "Temp1")

	NPCCavalry()

	StartJob("CounterMessage")
	StartJob("TimeToGoToAri")
	StartJob("TimerCampArmyOne")
	startQuestDefeat()
	startQuestVictory()
	DestroyEntity("Rock1")
	DestroyEntity("Rock2")
	DestroyEntity("Rock3")
	DestroyEntity("Rock4")
end

---------------------------------------------------------------------------------------------

function FirstWave()

	local pos = GetPosition("EnemySpawn1")
	Pike1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike1, "Pike1")

	local pos = GetPosition("EnemySpawn1")
	Pike2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike2, "Pike2")

	local pos = GetPosition("EnemySpawn1")
	Pike3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike3, "Pike3")

	local pos = GetPosition("EnemySpawn1")
	Pike4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike4, "Pike4")

	local pos = GetPosition("EnemySpawn1")
	Pike5 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike5, "Pike5")

	local pos = GetPosition("EnemySpawn1")
	Pike6 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike6, "Pike6")

	local pos = GetPosition("EnemySpawn1")
	Pike7 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike7, "Pike7")

	local pos = GetPosition("EnemySpawn1")
	Pike8 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike8, "Pike8")

	local pos = GetPosition("EnemySpawn1")
	Pike9 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike9, "Pike9")

	local pos = GetPosition("EnemySpawn1")
	Pike10 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike10, "Pike10")



	local pos = GetPosition("EnemySpawn2")
	Archers1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers1, "Archers1")

	local pos = GetPosition("EnemySpawn2")
	Archers2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers2, "Archers2")

	local pos = GetPosition("EnemySpawn2")
	Archers3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers3, "Archers3")

	local pos = GetPosition("EnemySpawn2")
	Archers4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers4, "Archers4")

	local pos = GetPosition("EnemySpawn2")
	Archers5 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers5, "Archers5")

	local pos = GetPosition("EnemySpawn2")
	Archers6 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers6, "Archers6")

	local pos = GetPosition("EnemySpawn2")
	Archers7 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle1,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers7, "Archers7")

	local pos = GetPosition("EnemySpawn2")
	Archers8 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle1,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers8, "Archers8")

	local pos = GetPosition("EnemySpawn2")
	Archers9 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle1,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers9, "Archers9")

	local pos = GetPosition("EnemySpawn2")
	Archers10 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle1,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers10, "Archers10")

	CreateEntity(7,Entities.PV_Cannon2,GetPosition("EnemySpawn3"),"Cannon1")
	CreateEntity(7,Entities.PV_Cannon2,GetPosition("EnemySpawn3"),"Cannon2")
	CreateEntity(7,Entities.PV_Cannon3,GetPosition("EnemySpawn3"),"Cannon3")
	CreateEntity(7,Entities.PV_Cannon3,GetPosition("EnemySpawn3"),"Cannon4")
	CreateEntity(7,Entities.PV_Cannon4,GetPosition("EnemySpawn3"),"Cannon5")
	CreateEntity(7,Entities.PV_Cannon4,GetPosition("EnemySpawn3"),"Cannon6")

	local pos = GetPosition("EnemySpawn3")
	Cavalry1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry1, "Cavalry1")

	local pos = GetPosition("EnemySpawn3")
	Cavalry2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry2, "Cavalry2")

	local pos = GetPosition("EnemySpawn3")
	Cavalry3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry3, "Cavalry3")

	local pos = GetPosition("EnemySpawn3")
	Cavalry4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry4, "Cavalry4")

	local pos = GetPosition("EnemySpawn3")
	Cavalry5 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry5, "Cavalry5")

	local pos = GetPosition("EnemySpawn3")
	Cavalry6 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry6, "Cavalry6")

	local pos = GetPosition("EnemySpawn3")
	Cavalry7 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry7, "Cavalry7")

	local pos = GetPosition("EnemySpawn3")
	Cavalry8 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry8, "Cavalry8")

	local pos = GetPosition("EnemySpawn3")
	Cavalry9 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry9, "Cavalry9")

	local pos = GetPosition("EnemySpawn3")
	Cavalry10 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry10, "Cavalry10")

	local pos = GetPosition("EnemySpawn3")
	Cavalry11 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry11, "Cavalry11")

	local pos = GetPosition("EnemySpawn3")
	Cavalry12 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry12, "Cavalry12")

	local pos = GetPosition("EnemySpawn1")
	Swords1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords1, "Swords1")

	local pos = GetPosition("EnemySpawn1")
	Swords2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords2, "Swords2")

	local pos = GetPosition("EnemySpawn1")
	Swords3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords3, "Swords3")

	local pos = GetPosition("EnemySpawn1")
	Swords4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords4, "Swords4")

	local pos = GetPosition("EnemySpawn1")
	Swords5 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords5, "Swords5")



	Attack("Cavalry1","CavalryTarget1")
	Attack("Cavalry2","CavalryTarget2")
	Attack("Cavalry3","CavalryTarget3")
	Attack("Cavalry4","CavalryTarget4")
	Attack("Cavalry5","CavalryTarget5")
	Attack("Cavalry6","CavalryTarget6")
	Attack("Cavalry7","CavalryTarget7")
	Attack("Cavalry8","CavalryTarget8")
	Attack("Cavalry9","CavalryTarget9")
	Attack("Cavalry10","CavalryTarget10")
	Attack("Cavalry11","CavalryTarget11")
	Attack("Cavalry12","CavalryTarget12")

	Attack("Cannon1","CannonTarget1")
	Attack("Cannon2","CannonTarget2")
	Attack("Cannon3","CannonTarget3")
	Attack("Cannon4","CannonTarget4")
	Attack("Cannon5","CannonTarget5")
	Attack("Cannon6","CannonTarget6")

	Attack("Swords1","SwordTarget1")
	Attack("Swords2","SwordTarget2")
	Attack("Swords3","SwordTarget3")
	Attack("Swords4","SwordTarget4")
	Attack("Swords5","SwordTarget5")

	Attack("Archers1","ArchersTarget1")
	Attack("Archers2","ArchersTarget2")
	Attack("Archers3","ArchersTarget3")
	Attack("Archers4","ArchersTarget4")
	Attack("Archers5","ArchersTarget5")
	Attack("Archers6","ArchersTarget6")
	Attack("Archers7","ArchersTarget7")
	Attack("Archers8","ArchersTarget8")
	Attack("Archers9","ArchersTarget9")
	Attack("Archers10","ArchersTarget10")

	Attack("Pike1","PikeTarget1")
	Attack("Pike2","PikeTarget2")
	Attack("Pike3","PikeTarget3")
	Attack("Pike4","PikeTarget4")
	Attack("Pike5","PikeTarget5")
	Attack("Pike6","PikeTarget6")
	Attack("Pike7","PikeTarget7")
	Attack("Pike8","PikeTarget8")
	Attack("Pike9","PikeTarget9")
	Attack("Pike10","PikeTarget10")

	GoToAttack=1

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CounterMessage"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CounterMessage = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_CounterMessage = function()
	-------------------------------------------------------------------------------------------------------------------

		createBriefingEnemies()

		return true


	end

-------------------------------------------------------------------------------------------

QUESTAri_DELAY 			=       2400
QUESTAri_COUNTER 		=	QUESTAri_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimeToGoToAri"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeToGoToAri = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTAri_COUNTER > 0 then

                   QUESTAri_COUNTER = QUESTAri_COUNTER - 1

			MapLocal_StartCountDown(QUESTAri_COUNTER)
			Report("Time remaining : "..QUESTAri_COUNTER.." seconds")

                   return false

                	elseif QUESTAri_COUNTER==0 then 

			return true
                      
                                 
			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimeToGoToAri = function()
	-------------------------------------------------------------------------------------------------------------------

		MapLocal_StopCountDown(0)
		FirstWave()
		StartJob("TimerCampArmy")
		StartJob("AreTheyDead")

		return true

	end

-------------------------------------------------------------------------------------------

CampArmy_DELAY 			=       300
CampArmy_COUNTER 	        =	CampArmy_DELAY

---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerCampArmy"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerCampArmy = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if CampArmy_COUNTER > 0 then

			CampArmy_COUNTER = CampArmy_COUNTER - 1

			return false

                elseif CampArmy_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerCampArmy = function()
	-------------------------------------------------------------------------------------------------------------------

		StartJob("TimerEnsurance")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AreTheyDead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AreTheyDead = function()
	-------------------------------------------------------------------------------------------------------------------
                
                return IsDead("Swords1") and IsDead("Swords2") and IsDead("Swords3") and IsDead("Swords4") and IsDead("Swords5") and IsDead("Pike1") and IsDead("Pike2") and IsDead("Pike3") and IsDead("Pike4") and IsDead("Pike5") and IsDead("Pike6") and IsDead("Pike7") and IsDead("Pike8") and IsDead("Pike9") and IsDead("Pike10") and IsDead("Archers1") and IsDead("Archers2") and IsDead("Archers3") and IsDead("Archers4") and IsDead("Archers5") and IsDead("Archers6") and IsDead("Archers7") and IsDead("Archers8") and IsDead("Archers9") and IsDead("Archers10") and IsDead("Cannon1") and IsDead("Cannon2") and IsDead("Cannon3") and IsDead("Cannon4") and IsDead("Cannon5") and IsDead("Cannon6") and IsDead("Cavalry1") and IsDead("Cavalry2") and IsDead("Cavalry3") and IsDead("Cavalry4") and IsDead("Cavalry5") and IsDead("Cavalry6") and IsDead("Cavalry7") and IsDead("Cavalry8") and IsDead("Cavalry9") and IsDead("Cavalry10") and IsDead("Cavalry11") and IsDead("Cavalry12")

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_AreTheyDead = function()
	-------------------------------------------------------------------------------------------------------------------

		SecondWave()
		StartJob("AreTheyDead1")

		return true

	end

---------------------------------------------------------------------------------------------

function SecondWave()

	local pos = GetPosition("EnemySpawn1")
	Pike1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike1, "Pike1")

	local pos = GetPosition("EnemySpawn1")
	Pike2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike2, "Pike2")

	local pos = GetPosition("EnemySpawn1")
	Pike3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike3, "Pike3")

	local pos = GetPosition("EnemySpawn1")
	Pike4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike4, "Pike4")

	local pos = GetPosition("EnemySpawn1")
	Pike5 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike5, "Pike5")


	local pos = GetPosition("EnemySpawn2")
	Archers1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers1, "Archers1")

	local pos = GetPosition("EnemySpawn2")
	Archers2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers2, "Archers2")

	local pos = GetPosition("EnemySpawn2")
	Archers3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers3, "Archers3")

	local pos = GetPosition("EnemySpawn2")
	Archers4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle1,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers4, "Archers4")

	local pos = GetPosition("EnemySpawn2")
	Archers5 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle1,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers5, "Archers5")


	CreateEntity(7,Entities.PV_Cannon2,GetPosition("EnemySpawn3"),"Cannon1")
	CreateEntity(7,Entities.PV_Cannon3,GetPosition("EnemySpawn3"),"Cannon2")
	CreateEntity(7,Entities.PV_Cannon4,GetPosition("EnemySpawn3"),"Cannon3")


	local pos = GetPosition("EnemySpawn3")
	Cavalry1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry1, "Cavalry1")

	local pos = GetPosition("EnemySpawn3")
	Cavalry2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry2, "Cavalry2")

	local pos = GetPosition("EnemySpawn3")
	Cavalry3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry3, "Cavalry3")

	local pos = GetPosition("EnemySpawn3")
	Cavalry4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry4, "Cavalry4")

	local pos = GetPosition("EnemySpawn3")
	Cavalry5 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry5, "Cavalry5")

	local pos = GetPosition("EnemySpawn3")
	Cavalry6 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry6, "Cavalry6")



	local pos = GetPosition("EnemySpawn1")
	Swords1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords1, "Swords1")

	local pos = GetPosition("EnemySpawn1")
	Swords2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords2, "Swords2")

	local pos = GetPosition("EnemySpawn1")
	Swords3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords3, "Swords3")

	StartJob("TimerAttack")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AreTheyDead1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AreTheyDead1 = function()
	-------------------------------------------------------------------------------------------------------------------
                
                return IsDead("Swords1") and IsDead("Swords2") and IsDead("Swords3") and IsDead("Pike1") and IsDead("Pike2") and IsDead("Pike3") and IsDead("Pike4") and IsDead("Pike5") and IsDead("Archers1") and IsDead("Archers2") and IsDead("Archers3") and IsDead("Archers4") and IsDead("Archers5") and IsDead("Cannon1") and IsDead("Cannon2") and IsDead("Cannon3") and IsDead("Cavalry1") and IsDead("Cavalry2") and IsDead("Cavalry3") and IsDead("Cavalry4") and IsDead("Cavalry5") and IsDead("Cavalry6")

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_AreTheyDead1 = function()
	-------------------------------------------------------------------------------------------------------------------

		ThirdWave()

		return true

	end

---------------------------------------------------------------------------------------------

function ThirdWave()

	NowYouCanWin = 1

	local pos = GetPosition("EnemySpawn1")
	Pike1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike1, "Pike1")

	local pos = GetPosition("EnemySpawn1")
	Pike2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike2, "Pike2")

	local pos = GetPosition("EnemySpawn1")
	Pike3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderPoleArm3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Pike3, "Pike3")



	local pos = GetPosition("EnemySpawn2")
	Archers1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers1, "Archers1")

	local pos = GetPosition("EnemySpawn2")
	Archers2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers2, "Archers2")

	local pos = GetPosition("EnemySpawn2")
	Archers3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Archers3, "Archers3")




	CreateEntity(7,Entities.PV_Cannon2,GetPosition("EnemySpawn3"),"Cannon1")
	CreateEntity(7,Entities.PV_Cannon3,GetPosition("EnemySpawn3"),"Cannon2")



	local pos = GetPosition("EnemySpawn3")
	Cavalry1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry1, "Cavalry1")

	local pos = GetPosition("EnemySpawn3")
	Cavalry2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry2, "Cavalry2")

	local pos = GetPosition("EnemySpawn3")
	Cavalry3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Cavalry3, "Cavalry3")





	local pos = GetPosition("EnemySpawn1")
	Swords1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords1, "Swords1")

	local pos = GetPosition("EnemySpawn1")
	Swords2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderSword3,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(Swords2, "Swords2")


	AttackPoints1	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomAttackPoint1 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints1))+1]

	AttackPoints	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomAttackPoint 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints))+1]


	Attack("Cavalry1",RandomAttackPoint1)
	Attack("Cavalry2",RandomAttackPoint)
	Attack("Cavalry3",RandomAttackPoint1)



	Attack("Cannon1",RandomAttackPoint)
	Attack("Cannon2",RandomAttackPoint1)



	Attack("Swords1",RandomAttackPoint)
	Attack("Swords2",RandomAttackPoint1)



	Attack("Archers1",RandomAttackPoint)
	Attack("Archers2",RandomAttackPoint1)
	Attack("Archers3",RandomAttackPoint)



	Attack("Pike1",RandomAttackPoint1)
	Attack("Pike2",RandomAttackPoint)
	Attack("Pike3",RandomAttackPoint1)

	StartJob("TimerCampArmyTwo")

end

---------------------------------------------------------------------------------------------------------------------------

CampArmyOne_DELAY 		=       300
CampArmyOne_COUNTER 	        =	CampArmyOne_DELAY

---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerCampArmyOne"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerCampArmyOne = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if CampArmyOne_COUNTER > 0 then

			CampArmyOne_COUNTER = CampArmyOne_COUNTER - 1

			return false

                elseif CampArmyOne_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerCampArmyOne = function()
	-------------------------------------------------------------------------------------------------------------------

		GenerateArmy3()

		CampArmyOne_DELAY 	=       90
		CampArmyOne_COUNTER	=	CampArmyOne_DELAY

		StartJob("TimerCampArmyOne")		

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

GenerateArmy3 = function()

	troops	= 	{	Entities.PU_LeaderBow3,
				Entities.PU_LeaderPoleArm3,
				Entities.PU_LeaderSword3,
				Entities.PU_LeaderCavalry2
				}


	AttackPoints	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]

	RandomAttackPoint 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints))+1]


		local pos = GetPosition("CampSpawn3")
		RaidAttack4 = AI.Entity_CreateFormation(7, RandomUnit,0,8,pos.X,pos.Y,0,0,2,0)
		SetEntityName(RaidAttack4, "RandAttack4")


		Attack("RandAttack4",RandomAttackPoint)

end

---------------------------------------------------------------------------------------------------------------------------

CampArmyTwo_DELAY 		=       300
CampArmyTwo_COUNTER 	        =	CampArmyTwo_DELAY

---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerCampArmyTwo"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerCampArmyTwo = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if CampArmyTwo_COUNTER > 0 then

			CampArmyTwo_COUNTER = CampArmyTwo_COUNTER - 1

			return false

                elseif CampArmyTwo_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerCampArmyTwo = function()
	-------------------------------------------------------------------------------------------------------------------

		GenerateArmy2()

		CampArmyTwo_DELAY 	=       120
		CampArmyTwo_COUNTER	=	CampArmyTwo_DELAY

		StartJob("TimerCampArmyTwo")		

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

GenerateArmy2 = function()

	troops1	= 	{	Entities.PU_LeaderBow3,
				Entities.PU_LeaderPoleArm3,
				Entities.PU_LeaderSword3,
				Entities.PU_LeaderCavalry3,
				Entities.PU_LeaderRifle1
				}


	AttackPoints1	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

	RandomAttackPoint1 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints1))+1]


		local pos = GetPosition("EnemySpawn1")
		RaidAttack1 = AI.Entity_CreateFormation(7, RandomUnit1,0,8,pos.X,pos.Y,0,0,2,0)
		SetEntityName(RaidAttack1, "RandAttack1")

		local pos = GetPosition("EnemySpawn2")
		RaidAttack2 = AI.Entity_CreateFormation(7, RandomUnit1,0,8,pos.X,pos.Y,0,0,2,0)
		SetEntityName(RaidAttack2, "RandAttack2")

		local pos = GetPosition("EnemySpawn3")
		RaidAttack3 = AI.Entity_CreateFormation(7, RandomUnit1,0,8,pos.X,pos.Y,0,0,2,0)
		SetEntityName(RaidAttack3, "RandAttack3")


		Attack("RandAttack1",RandomAttackPoint1)
		Attack("RandAttack2",RandomAttackPoint1)
		Attack("RandAttack3",RandomAttackPoint1)

end

-----------------------------------------------------------------------------------------------------------------------

function ForceAttack()

		if IsAlive("Swords1") then
		Attack("Swords1","player1")
		end

		if IsAlive("Swords2") then
		Attack("Swords2","player1")
		end

		if IsAlive("Swords3") then
		Attack("Swords3","player1")
		end

		if IsAlive("Swords4") then
		Attack("Swords4","player1")
		end

		if IsAlive("Swords5") then
		Attack("Swords5","player1")
		end


		if IsAlive("Pike1") then
		Attack("Pike1","player1")
		end

		if IsAlive("Pike2") then
		Attack("Pike2","player1")
		end

		if IsAlive("Pike3") then
		Attack("Pike3","player1")
		end

		if IsAlive("Pike4") then
		Attack("Pike4","player1")
		end

		if IsAlive("Pike5") then
		Attack("Pike5","player1")
		end

		if IsAlive("Pike6") then
		Attack("Pike6","player1")
		end

		if IsAlive("Pike7") then
		Attack("Pike7","player1")
		end

		if IsAlive("Pike8") then
		Attack("Pike8","player1")
		end

		if IsAlive("Pike9") then
		Attack("Pike9","player1")
		end

		if IsAlive("Pike10") then
		Attack("Pike10","player1")
		end


		if IsAlive("Archers1") then
		Attack("Archers1","player1")
		end

		if IsAlive("Archers2") then
		Attack("Archers2","player1")
		end

		if IsAlive("Archers3") then
		Attack("Archers3","player1")
		end

		if IsAlive("Archers4") then
		Attack("Archers4","player1")
		end

		if IsAlive("Archers5") then
		Attack("Archers5","player1")
		end

		if IsAlive("Archers6") then
		Attack("Archers6","player1")
		end

		if IsAlive("Archers7") then
		Attack("Archers7","player1")
		end

		if IsAlive("Archers8") then
		Attack("Archers8","player1")
		end

		if IsAlive("Archers9") then
		Attack("Archers9","player1")
		end

		if IsAlive("Archers10") then
		Attack("Archers10","player1")
		end


		if IsAlive("Cannon1") then
		Attack("Cannon1","player1")
		end

		if IsAlive("Cannon2") then
		Attack("Cannon2","player1")
		end

		if IsAlive("Cannon3") then
		Attack("Cannon3","player1")
		end

		if IsAlive("Cannon4") then
		Attack("Cannon4","player1")
		end

		if IsAlive("Cannon5") then
		Attack("Cannon5","player1")
		end

		if IsAlive("Cannon6") then
		Attack("Cannon6","player1")
		end


		if IsAlive("Cavalry1") then
		Attack("Cavalry1","player1")
		end

		if IsAlive("Cavalry2") then
		Attack("Cavalry2","player1")
		end

		if IsAlive("Cavalry3") then
		Attack("Cavalry3","player1")
		end

		if IsAlive("Cavalry4") then
		Attack("Cavalry4","player1")
		end

		if IsAlive("Cavalry5") then
		Attack("Cavalry5","player1")
		end

		if IsAlive("Cavalry6") then
		Attack("Cavalry6","player1")
		end

		if IsAlive("Cavalry7") then
		Attack("Cavalry7","player1")
		end

		if IsAlive("Cavalry8") then
		Attack("Cavalry8","player1")
		end

		if IsAlive("Cavalry9") then
		Attack("Cavalry9","player1")
		end

		if IsAlive("Cavalry10") then
		Attack("Cavalry10","player1")
		end

		if IsAlive("Cavalry11") then
		Attack("Cavalry11","player1")
		end

		if IsAlive("Cavalry12") then
		Attack("Cavalry12","player1")
		end

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

		ForceAttack()

		QUESTEnsurance_DELAY 		=       5
		QUESTEnsurance_COUNTER 		=	QUESTEnsurance_DELAY

		StartJob("TimerEnsurance")

		return true

	end

-------------------------------------------------------------------------------------------

QUESTTimerAttack_DELAY 			=       5
QUESTTimerAttack_COUNTER 		=	QUESTTimerAttack_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerAttack = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTTimerAttack_COUNTER > 0 then

                   QUESTTimerAttack_COUNTER = QUESTTimerAttack_COUNTER - 1

                   return false

                	elseif QUESTTimerAttack_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerAttack = function()
	-------------------------------------------------------------------------------------------------------------------

		SecondForceAttack()

		QUESTTimerAttack_DELAY 			=       5
		QUESTTimerAttack_COUNTER 		=	QUESTTimerAttack_DELAY

		StartJob("TimerAttack")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------

function SecondForceAttack()

	AttackPoints1	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomAttackPoint1 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints1))+1]

	AttackPoints	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomAttackPoint 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints))+1]


		if IsAlive("Swords1") then
		Attack("Swords1","player1")
		end

		if IsAlive("Swords2") then
		Attack("Swords2","player1")
		end

		if IsAlive("Swords3") then
		Attack("Swords3","player1")
		end



		if IsAlive("Pike1") then
		Attack("Pike1","player1")
		end

		if IsAlive("Pike2") then
		Attack("Pike2","player1")
		end

		if IsAlive("Pike3") then
		Attack("Pike3","player1")
		end

		if IsAlive("Pike4") then
		Attack("Pike4","player1")
		end

		if IsAlive("Pike5") then
		Attack("Pike5","player1")
		end



		if IsAlive("Archers1") then
		Attack("Archers1","player1")
		end

		if IsAlive("Archers2") then
		Attack("Archers2","player1")
		end

		if IsAlive("Archers3") then
		Attack("Archers3","player1")
		end

		if IsAlive("Archers4") then
		Attack("Archers4","player1")
		end

		if IsAlive("Archers5") then
		Attack("Archers5","player1")
		end



		if IsAlive("Cannon1") then
		Attack("Cannon1","player1")
		end

		if IsAlive("Cannon2") then
		Attack("Cannon2","player1")
		end

		if IsAlive("Cannon3") then
		Attack("Cannon3","player1")
		end


		if IsAlive("Cavalry1") then
		Attack("Cavalry1","player1")
		end

		if IsAlive("Cavalry2") then
		Attack("Cavalry2","player1")
		end

		if IsAlive("Cavalry3") then
		Attack("Cavalry3","player1")
		end

		if IsAlive("Cavalry4") then
		Attack("Cavalry4","player1")
		end

		if IsAlive("Cavalry5") then
		Attack("Cavalry5","player1")
		end

		if IsAlive("Cavalry6") then
		Attack("Cavalry6","player1")
		end

end