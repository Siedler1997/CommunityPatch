------------------------------------------------------------------------------------------------

function start1stChapter()

	createBriefingPrelude()
	startQuestDefeat()
	startQuestVictory()
	CreatePl1Defenders()

	troops	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]

	local pos = GetPosition("B9Target1")
	B9Group1 = Tools.CreateGroup(2, RandomUnit, 6, pos.X, pos.Y, 180)
	SetEntityName(B9Group1, "B9Group1")

	local pos = GetPosition("B9Target2")
	B9Group2 = Tools.CreateGroup(2, RandomUnit, 6, pos.X, pos.Y, 180)
	SetEntityName(B9Group2, "B9Group2")

	StartJob("CheckB9Group1")
	StartJob("CheckB9Group2")
	StartJob("StartAttack1")
	StartJob("StartAttack2")
	StartJob("BriefStopped")
	StartJob("GenerateCaravans")
	StartJob("StartReinforce")

end

------------------------------------------------------------------------------------------------

function end1stChapter()
	
	ResolveBriefing(briefingEnemyDown)
	start2ndChapter()

end

------------------------------------------------------------------------------------------------

function start2ndChapter()

	GUIQuestTools.StartQuestInformation("Ruin", "SP_Winter_Assault/MAX_TOWERS", 1, 1)
	GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

	StartJob("DeadBastilia1")
	StartJob("DeadBastilia2")
	StartJob("DeadBastilia3")
	StartJob("DeadBastilia4")
	StartJob("DeadBastilia5")
	StartJob("DeadBastilia6")
	StartJob("DeadBastilia7")
	StartJob("DeadBastilia8")
	StartJob("DeadBastilia9")

	local pos = GetPosition("HelpSpawn1")
 	Help1 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help1, "Help1")

	local pos = GetPosition("HelpSpawn2")
	Help2 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help2, "Help2")

	local pos = GetPosition("HelpSpawn3")
	Help3 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help3, "Help3")

	local pos = GetPosition("HelpSpawn4")
	Help4 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help4, "Help4")

	local pos = GetPosition("HelpSpawn5")
	Help5 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help5, "Help5")

	local pos = GetPosition("HelpSpawn6")
	Help6 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help6, "Help6")

	local pos = GetPosition("HelpSpawn7")
	Help7 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help7, "Help7")

	local pos = GetPosition("HelpSpawn8")
	Help8 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help8, "Help8")

	local pos = GetPosition("HelpSpawn9")
	Help9 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help9, "Help9")

	local pos = GetPosition("HelpSpawn10")
	Help10 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help10, "Help10")

	local pos = GetPosition("HelpSpawn11")
	Help11 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help11, "Help11")

	local pos = GetPosition("HelpSpawn12")
	Help12 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help12, "Help12")

	local pos = GetPosition("HelpSpawn13")
	Help13 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help13, "Help13")

	local pos = GetPosition("HelpSpawn14")
	Help14 = AI.Entity_CreateFormation(1, Entities.PU_LeaderHeavyCavalry2,0,3,pos.X,pos.Y,0,0,3,0)
	SetEntityName(Help14, "Help14")

	createBriefingDestroy()

end

------------------------------------------------------------------------------------------------

function end2ndChapter()
	
	ResolveBriefing(briefingAllBuildDown)

end

------------------------------------------------------------------------------------------------

function CreatePl1Defenders()

	for i=1,10,1 do

		local pos = GetPosition("PikeSpawn"..i)
		Pl1DefPole = Tools.CreateGroup(1, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 0)
		SetEntityName(Pl1DefPole, "Pl1DefPoleA"..i)

		local pos = GetPosition("ArchSpawn"..i)
		Pl1DefArch = Tools.CreateGroup(1, Entities.PU_LeaderBow2, 4, pos.X, pos.Y, 0)
		SetEntityName(Pl1DefArch, "Pl1DefArchA"..i)

	end

end

------------------------------------------------------------------------------------------------

MAX_TOWERS = 9
MAX = 0

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia1")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia1 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia2")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia2 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia3 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia3")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia3 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia4"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia4 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia4")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia4 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia5"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia5 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia5")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia5 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia6"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia6 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia6")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia6 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia7"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia7 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia7")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia7 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia8"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia8 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia8")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia8 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DeadBastilia9"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DeadBastilia9 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Bastilia9")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_DeadBastilia9 = function()
	-------------------------------------------------------------------------------------------------------------------

		MAX = MAX + 1
		GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_TOWERS )

		return true

	end

---------------------------------------------------------------------------------------------------------------------------

GenerateArmy = function()

	troops	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]




end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB9Group1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB9Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B9Group1") and IsAlive("Bastilia9")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB9Group1 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B9Spawn1")
		B9Group1 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B9Group1, "B9Group1")

		Attack("B9Group1","B9Target1")

		StartJob("CheckB9Group1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckB9Group2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckB9Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("B9Group2") and IsAlive("Bastilia9")

	end

	-------------------------------------------------------------------------------------------------------------------
	Action_CheckB9Group2 = function()
	-------------------------------------------------------------------------------------------------------------------

	troops1	= 	{	Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_Barbarian_LeaderClub2,
				Entities.CU_BlackKnight_LeaderMace2,
				Entities.CU_BanditLeaderBow2,
				Entities.CU_BanditLeaderSword2
				}

	RandomUnit1 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]

		local pos = GetPosition("B9Spawn2")
		B9Group2 = Tools.CreateGroup(2, RandomUnit1, 6, pos.X, pos.Y, 180)
		SetEntityName(B9Group2, "B9Group2")

		Attack("B9Group2","B9Target2")

		StartJob("CheckB9Group2")

		return true

	end

-------------------------------------------------------------------------------------------

QUESTAttack1_DELAY 			=       300
QUESTAttack1_COUNTER 			=	QUESTAttack1_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "StartAttack1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_StartAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTAttack1_COUNTER > 0 then

                   QUESTAttack1_COUNTER = QUESTAttack1_COUNTER - 1

                   return false

                	elseif QUESTAttack1_COUNTER==0 then 

			return true
                      
                                 
			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_StartAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------

		CreateB1Groups()
		CreateB2Groups()
		CreateB3Groups()
		CreateB5Groups()

		return true

	end

-------------------------------------------------------------------------------------------

QUESTAttack2_DELAY 			=       420
QUESTAttack2_COUNTER 			=	QUESTAttack2_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "StartAttack2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_StartAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTAttack2_COUNTER > 0 then

                   QUESTAttack2_COUNTER = QUESTAttack2_COUNTER - 1

                   return false

                	elseif QUESTAttack2_COUNTER==0 then 

			return true
                      
                                 
			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_StartAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------

		CreateB4Groups()
		CreateB6Groups()
		CreateB7Groups()
		CreateB8Groups()
		createBriefingMerchant()

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

QUESTPressure_DELAY 		=       2700
QUESTPressure_COUNTER 		=	QUESTPressure_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimePressure"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimePressure = function()
	-------------------------------------------------------------------------------------------------------------------

		if OneBuildingDown==0 then                

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

		end1stChapter()

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "BriefStopped"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_BriefStopped = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsBriefingActive() == false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_BriefStopped = function()
	-------------------------------------------------------------------------------------------------------------------

		StartJob("TimePressure")

		return true

	end

-------------------------------------------------------------------------------------------

QUESTReinforce_DELAY 			=       1500
QUESTReinforce_COUNTER 			=	QUESTReinforce_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "StartReinforce"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_StartReinforce = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTReinforce_COUNTER > 0 then

                   QUESTReinforce_COUNTER = QUESTReinforce_COUNTER - 1

                   return false

                	elseif QUESTReinforce_COUNTER==0 then 

			return true
                      
                                 
			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_StartReinforce = function()
	-------------------------------------------------------------------------------------------------------------------

		CreateB21Groups()
		CreateB61Groups()
		CreateB81Groups()

		return true

	end