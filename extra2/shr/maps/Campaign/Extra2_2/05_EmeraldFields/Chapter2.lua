function StartChapter2()

StartJob("MessengerToPilgrim")
StartJob("DetectMessenger1")
StartJob("TeleportPilgrim")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MessengerToPilgrim"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MessengerToPilgrim = function()
	-------------------------------------------------------------------------------------------------------------------

                return Messenger1Close==0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MessengerToPilgrim = function()
	-------------------------------------------------------------------------------------------------------------------

		StartSimpleJob("WhereIsPilgrim")

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function WhereIsPilgrim()

	if Mess1Spoken==0 then

		PosPil = GetPosition("Pilgrim")
		Move("Messenger1",PosPil)

	end

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DetectMessenger1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DetectMessenger1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Messenger1","Pilgrim",800)

	end

		
	-------------------------------------------------------------------------------------------------------------------
	Action_DetectMessenger1 = function()
	-------------------------------------------------------------------------------------------------------------------

		Messenger1Close=1
		Mess1Spoken=1

		CreateEntity(0,Entities.XD_MiscSword,GetPosition("Pilgrim"),"PilgrimReference1")
		CreateEntity(0,Entities.XD_MiscSword,GetPosition("Messenger1"),"MessReference1")

		DestroyEntity("Pilgrim")
		DestroyEntity("Messenger1")

		local pos = GetPosition("PilgrimReference1")
		PilResp1 = Tools.CreateGroup(1, Entities.PU_Hero2, 0, pos.X, pos.Y, 0)
		SetEntityName(PilResp1, "Pilgrim")

		local pos = GetPosition("MessReference1")
		MessResp1 = Tools.CreateGroup(3, Entities.PU_Scout, 0, pos.X, pos.Y, 180)
		SetEntityName(MessResp1, "Messenger1")

		createBriefingHelpErec()

		StartJob("CounterMessage")

		return true


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

		StartJob("TimePressure")
		MessengerToAri()
		Move("Messenger1","Mess1Target")
		MakeVulnerable("Messenger1")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TeleportPilgrim"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TeleportPilgrim = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Pilgrim") and Mess1Spoken==0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TeleportPilgrim = function()
	-------------------------------------------------------------------------------------------------------------------

		DestroyEntity("Pilgrim")

		local pos = GetPosition("PilTele")
		PilResp2 = Tools.CreateGroup(1, Entities.PU_Hero2, 0, pos.X, pos.Y, 180)
		SetEntityName(PilResp2, "Pilgrim")

		createBriefingPilDead()

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

QUESTPressure_DELAY 		=       180
QUESTPressure_COUNTER 		=	QUESTPressure_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimePressure"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimePressure = function()
	-------------------------------------------------------------------------------------------------------------------

		if MessageDelivered==0 then                

		if QUESTPressure_COUNTER > 0 then

                   QUESTPressure_COUNTER = QUESTPressure_COUNTER - 1

			MapLocal_StartCountDown(QUESTPressure_COUNTER)
			Report("Time remaining : "..QUESTPressure_COUNTER.." seconds")

                   return false

                	elseif QUESTPressure_COUNTER==0 then 

			return true
                      
                                 
			end

		else

		MapLocal_StopCountDown(0)

		end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimePressure = function()
	-------------------------------------------------------------------------------------------------------------------

		MapLocal_StopCountDown(0)

		if MessageDelivered==0 then
		Defeat()
		end

		return true

	end

---------------------------------------------------------------------------------------

function MessengerToAri()

	-- setup table for npc

	local MessengerToAri		=	{}
	MessengerToAri.name 		=	"Messenger2"
	MessengerToAri.callback		=	SendMessage
	        
	-- create npc
	CreateNPC(MessengerToAri)
	   	
end

------------------------------------

SendMessage = function()

	createBriefingSendMess()
	StartJob("CounterMessage1")
	StartJob("MessageArrived")
	
end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CounterMessage1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CounterMessage1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_CounterMessage1 = function()
	-------------------------------------------------------------------------------------------------------------------

		Move("Messenger2","Mess2Target")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MessageArrived"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MessageArrived = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Messenger2","Mess2Target",200)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MessageArrived = function()
	-------------------------------------------------------------------------------------------------------------------

		MessageDelivered=1
		createBriefingMessReceived()
		MountainFollowers()
		--StartJob("TimeControler")
		--StartJob("LeaderEnable")
		ReplaceEntity("FirstGate", Entities.XD_WallStraightGate_Closed)
		ErecFirstArmy()
		DrakeFirstArmy()
		AriFirstArmy()
		StartJob("AttackEnabled")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "LeaderEnable"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_LeaderEnable = function()
	-------------------------------------------------------------------------------------------------------------------

                return FollowersAreDead==0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_LeaderEnable = function()
	-------------------------------------------------------------------------------------------------------------------

		NPCMMLeader()


		return true


	end

--------------------------------------------------------------------------------------------------

function ErecFirstArmy()

		local pos = GetPosition("ErecSpawn1")
		ErecArmy1 = Tools.CreateGroup(3, Entities.PU_LeaderHeavyCavalry2, 3, pos.X, pos.Y, 180)
		SetEntityName(ErecArmy1, "ErecArmy1")

		local pos = GetPosition("ErecSpawn1")
		ErecArmy11 = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm4, 8, pos.X, pos.Y, 180)
		SetEntityName(ErecArmy11, "ErecArmy11")

		local pos = GetPosition("ErecSpawn2")
		ErecArmy2 = Tools.CreateGroup(3, Entities.PU_LeaderSword4, 8, pos.X, pos.Y, 180)
		SetEntityName(ErecArmy2, "ErecArmy2")

		local pos = GetPosition("ErecSpawn3")
		ErecArmy3 = Tools.CreateGroup(3, Entities.PU_LeaderSword4, 8, pos.X, pos.Y, 180)
		SetEntityName(ErecArmy3, "ErecArmy3")

		local pos = GetPosition("ErecSpawn3")
		ErecArmy31 = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm4, 8, pos.X, pos.Y, 180)
		SetEntityName(ErecArmy31, "ErecArmy31")

		Move("ErecArmy1","FirstTarget5")
		Move("ErecArmy11","FirstTarget6")
		Move("ErecArmy2","FirstTarget1")
		Move("ErecArmy3","FirstTarget7")
		Move("ErecArmy31","FirstTarget6")

end

--------------------------------------------------------------------------------------------------

function DrakeFirstArmy()

		local pos = GetPosition("DrakeSpawn1")
		DrakeArmy1 = Tools.CreateGroup(4, Entities.PU_LeaderRifle2, 8, pos.X, pos.Y, 180)
		SetEntityName(DrakeArmy1, "DrakeArmy1")

		local pos = GetPosition("DrakeSpawn2")
		DrakeArmy2 = Tools.CreateGroup(4, Entities.PU_LeaderRifle2, 8, pos.X, pos.Y, 180)
		SetEntityName(DrakeArmy2, "DrakeArmy2")

		Move("DrakeArmy1","FirstTarget2")
		Move("DrakeArmy2","FirstTarget5")

end

--------------------------------------------------------------------------------------------------

function AriFirstArmy()

		local pos = GetPosition("AriSpawn1")
		AriArmy1 = Tools.CreateGroup(5, Entities.PU_LeaderBow4, 8, pos.X, pos.Y, 180)
		SetEntityName(AriArmy1, "AriArmy1")

		local pos = GetPosition("AriSpawn2")
		AriArmy2 = Tools.CreateGroup(5, Entities.PU_LeaderBow4, 8, pos.X, pos.Y, 180)
		SetEntityName(AriArmy2, "AriArmy2")

		Move("AriArmy1","FirstTarget3")
		Move("AriArmy2","FirstTarget4")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AttackEnabled"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AttackEnabled = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("ErecArmy1","FirstTarget7",4000) and IsNear("ErecArmy11","FirstTarget7",4000) and IsNear("ErecArmy2","FirstTarget7",4000) and IsNear("ErecArmy3","FirstTarget7",4000) and IsNear("ErecArmy31","FirstTarget7",4000) and IsNear("DrakeArmy1","FirstTarget7",4000) and IsNear("DrakeArmy2","FirstTarget7",4000) and IsNear("AriArmy1","FirstTarget7",4000) and IsNear("AriArmy2","FirstTarget7",4000)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_AttackEnabled = function()
	-------------------------------------------------------------------------------------------------------------------

		EnemyFirstArmy()

		return true


	end

--------------------------------------------------------------------------------------------------

function EnemyFirstArmy()
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
	end

	for i = 1, 10 do
		local pos = GetPosition("EnemySpawn1")
		if i >= 5 then
			pos = GetPosition("EnemySpawn4")
		end
		local EnemyFirst = AI.Entity_CreateFormation(2,Entities.CU_VeteranCaptain,0,0,pos.X,pos.Y,0,0,experience,0)
		SetEntityName(EnemyFirst, "EnemyFirst"..i)
	end

	local pos = GetPosition("EnemySpawn2")
	EnemyFirst11 = AI.Entity_CreateFormation(2,Entities.PU_LeaderSword4,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst11, "EnemyFirst11")

	local pos = GetPosition("EnemySpawn2")
	EnemyFirst12 = AI.Entity_CreateFormation(2,Entities.PU_LeaderSword4,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst12, "EnemyFirst12")

	local pos = GetPosition("EnemySpawn3")
	EnemyFirst13 = AI.Entity_CreateFormation(2,Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst13, "EnemyFirst13")


	local pos = GetPosition("EnemySpawn3")
	EnemyFirst14 = AI.Entity_CreateFormation(2,Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst14, "EnemyFirst14")

	local pos = GetPosition("EnemySpawn5")
	EnemyFirst15 = AI.Entity_CreateFormation(2,Entities.PU_LeaderPoleArm4,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst15, "EnemyFirst15")

	local pos = GetPosition("EnemySpawn5")
	EnemyFirst16 = AI.Entity_CreateFormation(2,Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst16, "EnemyFirst16")

	local pos = GetPosition("EnemySpawn5")
	EnemyFirst17 = AI.Entity_CreateFormation(2,Entities.PU_LeaderHeavyCavalry2,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst17, "EnemyFirst17")

	local pos = GetPosition("EnemySpawn5")
	EnemyFirst18 = AI.Entity_CreateFormation(2,Entities.PU_LeaderHeavyCavalry2,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst18, "EnemyFirst18")

	local pos = GetPosition("EnemySpawn4")
	EnemyFirst19 = AI.Entity_CreateFormation(2,Entities.CU_VeteranCaptain,0,0,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst19, "EnemyFirst19")
	
	local pos = GetPosition("EnemySpawn1")
	EnemyFirst20 = AI.Entity_CreateFormation(2,Entities.CU_VeteranCaptain,0,0,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(EnemyFirst20, "EnemyFirst20")

	Attack("EnemyFirst1","EnemyG1")
	Attack("EnemyFirst2","EnemyG1")
	Attack("EnemyFirst3","EnemyG2")
	Attack("EnemyFirst4","EnemyG2")
	Attack("EnemyFirst5","EnemyG3")
	Attack("EnemyFirst6","EnemyG3")
	Attack("EnemyFirst7","EnemyG4")
	Attack("EnemyFirst8","EnemyG4")
	Attack("EnemyFirst9","EnemyG5")
	Attack("EnemyFirst10","EnemyG5")
	Attack("EnemyFirst11","EnemyG6")
	Attack("EnemyFirst12","EnemyG6")
	Attack("EnemyFirst13","EnemyG7")
	Attack("EnemyFirst14","EnemyG7")
	Attack("EnemyFirst15","EnemyG8")
	Attack("EnemyFirst16","EnemyG8")
	Attack("EnemyFirst17","EnemyG8")
	Attack("EnemyFirst18","EnemyG8")
	Attack("EnemyFirst19","EnemyG6")
	Attack("EnemyFirst20","EnemyG6")

	StartJob("StartBattle")


end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "StartBattle"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_StartBattle = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("EnemyFirst8","EnemyG7",2000) and IsNear("EnemyFirst13","EnemyG7",2000)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_StartBattle = function()
	-------------------------------------------------------------------------------------------------------------------

		Attack("EnemyFirst1","player3")
		Attack("EnemyFirst2","player3")
		Attack("EnemyFirst3","player3")
		Attack("EnemyFirst4","player3")
		Attack("EnemyFirst5","player3")
		Attack("EnemyFirst6","player3")
		Attack("EnemyFirst7","player3")
		Attack("EnemyFirst8","player3")
		Attack("EnemyFirst9","player3")
		Attack("EnemyFirst10","player3")
		Attack("EnemyFirst11","player3")
		Attack("EnemyFirst12","player3")
		Attack("EnemyFirst13","player3")
		Attack("EnemyFirst14","player3")
		Attack("EnemyFirst15","player3")
		Attack("EnemyFirst16","player3")
		Attack("EnemyFirst17","player3")
		Attack("EnemyFirst18","player3")
		Attack("EnemyFirst19","player3")
		Attack("EnemyFirst20","player3")


		StartJob("YukiComes")
		StartJob("StartOfChapter3")
		StartJob("ErecDies")
		StartJob("TimerEnsurance")
		StartJob("TimerEnsurance1")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "YukiComes"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_YukiComes = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("ErecArmy1") and IsDead("ErecArmy11") and IsDead("ErecArmy2") and IsDead("ErecArmy3") and IsDead("ErecArmy31") and IsDead("DrakeArmy1") and IsDead("DrakeArmy2") and IsDead("AriArmy1") and IsDead("AriArmy2") and IsDead("AlarmBuilding")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_YukiComes = function()
	-------------------------------------------------------------------------------------------------------------------

		YukiArmy()
		createBriefingYukiArrival()
		StartJob("WaitAttack")

		return true

	end

--------------------------------------------------------------------------------------------------

function YukiArmy()
	local experience = VERYHIGH_EXPERIENCE
	local etype1 = Entities.PU_LeaderBow3
	local etype2 = Entities.PU_LeaderSword3
	local etype3 = Entities.PU_LeaderPoleArm3
	if CP_Difficulty == 1 then
		experience = experience - 1
		etype1 = Entities.PU_LeaderBow2
		etype2 = Entities.PU_LeaderSword2
		etype3 = Entities.PU_LeaderPoleArm2
	end

		local pos = GetPosition("YukiSpawn10")
		YukiArmy1 = AI.Entity_CreateFormation(1,etype1,0,4,pos.X,pos.Y,0,0,experience,0)
		SetEntityName(YukiArmy1, "YukiArmy1")

		local pos = GetPosition("YukiSpawn11")
		YukiArmy2 = AI.Entity_CreateFormation(1,Entities.PU_LeaderRifle1,0,4,pos.X,pos.Y,0,0,experience,0)
		SetEntityName(YukiArmy2, "YukiArmy2")

		local pos = GetPosition("YukiSpawn7")
		YukiArmy3 = AI.Entity_CreateFormation(1,etype2,0,4,pos.X,pos.Y,0,0,experience,0)
		SetEntityName(YukiArmy3, "YukiArmy3")

		local pos = GetPosition("YukiSpawn9")
		YukiArmy4 = AI.Entity_CreateFormation(1,etype3,0,4,pos.X,pos.Y,0,0,experience,0)
		SetEntityName(YukiArmy4, "YukiArmy4")

		--[[
		CreateEntity(1,Entities.CU_VeteranLieutenant,GetPosition("YukiSpawn2"),"YukiArmy5")
		CreateEntity(1,Entities.CU_VeteranLieutenant,GetPosition("YukiSpawn3"),"YukiArmy6")
		CreateEntity(1,Entities.CU_VeteranLieutenant,GetPosition("YukiSpawn4"),"YukiArmy7")
		CreateEntity(1,Entities.CU_VeteranLieutenant,GetPosition("YukiSpawn5"),"YukiArmy8")
		CreateEntity(1,Entities.CU_VeteranLieutenant,GetPosition("YukiSpawn6"),"YukiArmy9")
		CreateEntity(1,Entities.CU_VeteranLieutenant,GetPosition("YukiSpawn8"),"YukiArmy10")
		--]]
		CreateEntity(8,Entities.PU_Hero11,GetPosition("YukiSpawn1"),"Yuki")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "WaitAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_WaitAttack = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_WaitAttack = function()
	-------------------------------------------------------------------------------------------------------------------

		Move("Yuki","PozitiaLuKkt")
		Attack("YukiArmy1","GoPoint1")
		Attack("YukiArmy2","ErecSpawn3")
		Attack("YukiArmy3","GoPoint1")
		Attack("YukiArmy4","ErecSpawn3")
		--[[
		Attack("YukiArmy5","GoPoint1")
		Attack("YukiArmy6","ErecSpawn3")
		Attack("YukiArmy7","GoPoint1")
		Attack("YukiArmy8","ErecSpawn3")
		Attack("YukiArmy9","GoPoint1")
		Attack("YukiArmy10","ErecSpawn3")
		--]]
		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "StartOfChapter3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_StartOfChapter3 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("EnemyFirst1") and IsDead("EnemyFirst2") and IsDead("EnemyFirst3") and IsDead("EnemyFirst4") and IsDead("EnemyFirst5") and IsDead("EnemyFirst6") and IsDead("EnemyFirst7") and IsDead("EnemyFirst8") and IsDead("EnemyFirst9") and IsDead("EnemyFirst10") and IsDead("EnemyFirst11") and IsDead("EnemyFirst12") and IsDead("EnemyFirst13") and IsDead("EnemyFirst14") and IsDead("EnemyFirst15") and IsDead("EnemyFirst16") and IsDead("EnemyFirst17") and IsDead("EnemyFirst18") and IsDead("EnemyFirst19") and IsDead("EnemyFirst20")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_StartOfChapter3 = function()
	-------------------------------------------------------------------------------------------------------------------

		end2ndChapter()

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ErecDies"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ErecDies = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("player3") and Chapter2IsDone==0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_ErecDies = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()

		return true

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

	if IsAlive("EnemyFirst1") and IsNear("EnemyFirst1","EnsurancePoint",5000) then
	Attack("EnemyFirst1","player3")
	end

	if IsAlive("EnemyFirst2") and IsNear("EnemyFirst2","EnsurancePoint",5000) then
	Attack("EnemyFirst2","player3")
	end

	if IsAlive("EnemyFirst3") and IsNear("EnemyFirst3","EnsurancePoint",5000) then
	Attack("EnemyFirst3","player3")
	end

	if IsAlive("EnemyFirst4") and IsNear("EnemyFirst4","EnsurancePoint",5000) then
	Attack("EnemyFirst4","player3")
	end

	if IsAlive("EnemyFirst5") and IsNear("EnemyFirst5","EnsurancePoint",5000) then
	Attack("EnemyFirst5","player3")
	end

	if IsAlive("EnemyFirst6") and IsNear("EnemyFirst6","EnsurancePoint",5000) then
	Attack("EnemyFirst6","player3")
	end

	if IsAlive("EnemyFirst7") and IsNear("EnemyFirst7","EnsurancePoint",5000) then
	Attack("EnemyFirst7","player3")
	end

	if IsAlive("EnemyFirst8") and IsNear("EnemyFirst8","EnsurancePoint",5000) then
	Attack("EnemyFirst8","player3")
	end

	if IsAlive("EnemyFirst9") and IsNear("EnemyFirst9","EnsurancePoint",5000) then
	Attack("EnemyFirst9","player3")
	end

	if IsAlive("EnemyFirst10") and IsNear("EnemyFirst10","EnsurancePoint",5000) then
	Attack("EnemyFirst10","player3")
	end

	if IsAlive("EnemyFirst11") and IsNear("EnemyFirst11","EnsurancePoint",5000) then
	Attack("EnemyFirst11","player3")
	end

	if IsAlive("EnemyFirst12") and IsNear("EnemyFirst12","EnsurancePoint",5000) then
	Attack("EnemyFirst12","player3")
	end

	if IsAlive("EnemyFirst13") and IsNear("EnemyFirst13","EnsurancePoint",5000) then
	Attack("EnemyFirst13","player3")
	end

	if IsAlive("EnemyFirst14") and IsNear("EnemyFirst14","EnsurancePoint",5000) then
	Attack("EnemyFirst14","player3")
	end

	if IsAlive("EnemyFirst15") and IsNear("EnemyFirst15","EnsurancePoint",5000) then
	Attack("EnemyFirst15","player3")
	end

	if IsAlive("EnemyFirst16") and IsNear("EnemyFirst16","EnsurancePoint",5000) then
	Attack("EnemyFirst16","player3")
	end

	if IsAlive("EnemyFirst17") and IsNear("EnemyFirst17","EnsurancePoint",5000) then
	Attack("EnemyFirst17","player3")
	end

	if IsAlive("EnemyFirst18") and IsNear("EnemyFirst18","EnsurancePoint",5000) then
	Attack("EnemyFirst18","player3")
	end

	if IsAlive("EnemyFirst19") and IsNear("EnemyFirst19","EnsurancePoint",5000) then
	Attack("EnemyFirst19","player3")
	end

	if IsAlive("EnemyFirst20") and IsNear("EnemyFirst20","EnsurancePoint",5000) then
	Attack("EnemyFirst20","player3")
	end


end

-------------------------------------------------------------------------------------------

QUESTEnsurance1_DELAY 		=       5
QUESTEnsurance1_COUNTER 	=	QUESTEnsurance1_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerEnsurance1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerEnsurance1 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTEnsurance1_COUNTER > 0 then

                   QUESTEnsurance1_COUNTER = QUESTEnsurance1_COUNTER - 1

                   return false

                	elseif QUESTEnsurance1_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerEnsurance1 = function()
	-------------------------------------------------------------------------------------------------------------------

		Ensurance1()

		QUESTEnsurance1_DELAY 		=       5
		QUESTEnsurance1_COUNTER 	=	QUESTEnsurance1_DELAY

		StartJob("TimerEnsurance1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	

function Ensurance1()

	if IsAlive("EnemyFirst1") and IsNear("EnemyFirst1","MiscaIdiotii",5000) then
	Attack("EnemyFirst1","player3")
	end

	if IsAlive("EnemyFirst2") and IsNear("EnemyFirst2","MiscaIdiotii",5000) then
	Attack("EnemyFirst2","player3")
	end

	if IsAlive("EnemyFirst3") and IsNear("EnemyFirst3","MiscaIdiotii",5000) then
	Attack("EnemyFirst3","player3")
	end

	if IsAlive("EnemyFirst4") and IsNear("EnemyFirst4","MiscaIdiotii",5000) then
	Attack("EnemyFirst4","player3")
	end

	if IsAlive("EnemyFirst5") and IsNear("EnemyFirst5","MiscaIdiotii",5000) then
	Attack("EnemyFirst5","player3")
	end

	if IsAlive("EnemyFirst6") and IsNear("EnemyFirst6","MiscaIdiotii",5000) then
	Attack("EnemyFirst6","player3")
	end

	if IsAlive("EnemyFirst7") and IsNear("EnemyFirst7","MiscaIdiotii",5000) then
	Attack("EnemyFirst7","player3")
	end

	if IsAlive("EnemyFirst8") and IsNear("EnemyFirst8","MiscaIdiotii",5000) then
	Attack("EnemyFirst8","player3")
	end

	if IsAlive("EnemyFirst9") and IsNear("EnemyFirst9","MiscaIdiotii",5000) then
	Attack("EnemyFirst9","player3")
	end

	if IsAlive("EnemyFirst10") and IsNear("EnemyFirst10","MiscaIdiotii",5000) then
	Attack("EnemyFirst10","player3")
	end

	if IsAlive("EnemyFirst11") and IsNear("EnemyFirst11","MiscaIdiotii",5000) then
	Attack("EnemyFirst11","player3")
	end

	if IsAlive("EnemyFirst12") and IsNear("EnemyFirst12","MiscaIdiotii",5000) then
	Attack("EnemyFirst12","player3")
	end

	if IsAlive("EnemyFirst13") and IsNear("EnemyFirst13","MiscaIdiotii",5000) then
	Attack("EnemyFirst13","player3")
	end

	if IsAlive("EnemyFirst14") and IsNear("EnemyFirst14","MiscaIdiotii",5000) then
	Attack("EnemyFirst14","player3")
	end

	if IsAlive("EnemyFirst15") and IsNear("EnemyFirst15","MiscaIdiotii",5000) then
	Attack("EnemyFirst15","player3")
	end

	if IsAlive("EnemyFirst16") and IsNear("EnemyFirst16","MiscaIdiotii",5000) then
	Attack("EnemyFirst16","player3")
	end

	if IsAlive("EnemyFirst17") and IsNear("EnemyFirst17","MiscaIdiotii",5000) then
	Attack("EnemyFirst17","player3")
	end

	if IsAlive("EnemyFirst18") and IsNear("EnemyFirst18","MiscaIdiotii",5000) then
	Attack("EnemyFirst18","player3")
	end

	if IsAlive("EnemyFirst19") and IsNear("EnemyFirst19","MiscaIdiotii",5000) then
	Attack("EnemyFirst19","player3")
	end

	if IsAlive("EnemyFirst20") and IsNear("EnemyFirst20","MiscaIdiotii",5000) then
	Attack("EnemyFirst20","player3")
	end


end