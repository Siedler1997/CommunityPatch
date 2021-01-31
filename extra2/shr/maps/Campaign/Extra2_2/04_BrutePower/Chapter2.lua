function StartChapter2()

	createBriefingLeader()

	ChangePlayer("player1",1)
	ChangePlayer("P4Serf1",1)
	ChangePlayer("P4Serf2",1)
	ChangePlayer("P4Serf3",1)
	ChangePlayer("P4Serf4",1)
	ChangePlayer("P1Village",1)
	BuildArchery()
	BuildBarracks()
	BuildBlacksmith()
	BuildBrickworks()
	BuildFarm1()
	BuildResidence1()
	BuildSawmill()
	BuildStoneMason()
	BuildUniversity()

	StartJob("CheckBuildings")

	StartJob("CounterStartChapter3")

	CreateRobbers()
	Quest1Done = 1

end

-------------------------------------------------------------------------------------------------------------------------

BuildArchery = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Archery1,1} }
	quest.Callback 		= 	BaseEstablished1

	SetupEstablish(quest)

	end

BaseEstablished1 = function()

	Archery=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildBarracks = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Barracks1,1} }
	quest.Callback 		= 	BaseEstablished2

	SetupEstablish(quest)

	end

BaseEstablished2 = function()

	Barracks=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildBlacksmith = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Blacksmith1,1} }
	quest.Callback 		= 	BaseEstablished3

	SetupEstablish(quest)

	end

BaseEstablished3 = function()

	Blacksmith=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildBrickworks = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Brickworks1,1} }
	quest.Callback 		= 	BaseEstablished4

	SetupEstablish(quest)

	end

BaseEstablished4 = function()

	Brickworks=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildFarm1 = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Farm3,2} }
	quest.Callback 		= 	BaseEstablished5

	SetupEstablish(quest)

	end

BaseEstablished5 = function()

	Farms=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildFarm2 = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Farm1,1} }
	quest.Callback 		= 	BaseEstablished6

	SetupEstablish(quest)

	end

BaseEstablished6 = function()

	Farm2=1
	BuildFarm3()
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildFarm3 = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Farm1,1} }
	quest.Callback 		= 	BaseEstablished7

	SetupEstablish(quest)

	end

BaseEstablished7 = function()

	Farm3=1
	BuildFarm4()
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildFarm4 = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Farm1,1} }
	quest.Callback 		= 	BaseEstablished8

	SetupEstablish(quest)

	end

BaseEstablished8 = function()

	Farm4=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildResidence1 = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Residence3,2} }
	quest.Callback 		= 	BaseEstablished9

	SetupEstablish(quest)

	end

BaseEstablished9 = function()

	Residences=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildResidence2 = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Residence1,1} }
	quest.Callback 		= 	BaseEstablished10

	SetupEstablish(quest)

	end

BaseEstablished10 = function()

	Residence2=1
	BuildResidence3()
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildResidence3 = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Residence1,1} }
	quest.Callback 		= 	BaseEstablished11

	SetupEstablish(quest)

	end

BaseEstablished11 = function()

	Residence3=1
	BuildResidence4()
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildResidence4 = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Residence1,1} }
	quest.Callback 		= 	BaseEstablished12

	SetupEstablish(quest)

	end

BaseEstablished12 = function()

	Residence4=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildSawmill = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_Sawmill1,1} }
	quest.Callback 		= 	BaseEstablished13

	SetupEstablish(quest)

	end

BaseEstablished13 = function()

	Sawmill=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildStoneMason = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_StoneMason1,1} }
	quest.Callback 		= 	BaseEstablished14

	SetupEstablish(quest)

	end

BaseEstablished14 = function()

	StoneMason=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

BuildUniversity = function()

	local quest = {}
	
	quest.EntityTypes 	=	{ {Entities.PB_University1,1} }
	quest.Callback 		= 	BaseEstablished15

	SetupEstablish(quest)

	end

BaseEstablished15 = function()

	University=1
	
	return true

	end

-------------------------------------------------------------------------------------------------------------------------

QUESTChapter3_DELAY 		=       240
QUESTChapter3_COUNTER 		=	QUESTChapter3_DELAY 

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CounterStartChapter3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CounterStartChapter3 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTChapter3_COUNTER > 0 then

                   QUESTChapter3_COUNTER = QUESTChapter3_COUNTER - 1

                   return false

                	elseif QUESTChapter3_COUNTER==0 then 

			return true
                      
                                 
			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_CounterStartChapter3 = function()
	-------------------------------------------------------------------------------------------------------------------

		start3rdChapter()

		return true

	end

-------------------------------------------------------------------------------------------------------------------------

function CreateRobbers()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_BanditLeaderSword1
	local etype2 = Entities.CU_Barbarian_LeaderClub1
	if CP_Difficulty == 1 then
		experience = experience + 2
		etype1 = Entities.CU_BanditLeaderSword2
		etype2 = Entities.CU_Barbarian_LeaderClub2
	end
	local pos = GetPosition("SpawnCaravanAttack")
	for i = 1, 6 do
		local Robber = AI.Entity_CreateFormation(5,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,experience,0)
		SetEntityName(Robber, "Robber"..i)
	end

	local pos 	= GetPosition("SpawnCaravanAttack")
	Robber7 	= AI.Entity_CreateFormation(5,etype1,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(Robber7, "Robber7")

	local pos 	= GetPosition("SpawnCaravanAttack")
	Robber8 	= AI.Entity_CreateFormation(5,etype2,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(Robber8, "Robber8")

	local pos 	= GetPosition("SpawnCaravanAttack")
	Robber9 	= AI.Entity_CreateFormation(5,Entities.CU_BanditLeaderBow1,0,4,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(Robber9, "Robber9")

	local pos 	= GetPosition("SpawnCaravanAttack")
	Robber10 	= AI.Entity_CreateFormation(5,Entities.CU_BanditLeaderBow1,0,4,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(Robber10, "Robber10")

	local pos = GetPosition("SpawnCaravanAttack")
	local Attacker1 = AI.Entity_CreateFormation(5,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(Attacker1, "Attacker1")

	local pos 	= GetPosition("SpawnCaravanAttack")
	Attacker2 	= AI.Entity_CreateFormation(5,etype1,0,8,pos.X,pos.Y,0,0,experience,0)
	SetEntityName(Attacker2, "Attacker2")

	Move("Robber1","GatherCaravanAttack")
	Move("Robber2","GatherCaravanAttack")
	Move("Robber3","GatherCaravanAttack")
	Move("Robber4","GatherCaravanAttack")
	Move("Robber5","GatherCaravanAttack")
	Move("Robber6","GatherCaravanAttack")
	Move("Robber7","GatherCaravanAttack")
	Move("Robber8","GatherCaravanAttack")
	Move("Robber9","GatherCaravanAttack")
	Move("Robber10","GatherCaravanAttack")
	Move("Attacker1","GatherCaravanAttack")
	Move("Attacker2","GatherCaravanAttack")

end

-------------------------------------------------------------------------------------------------------------------------

function MonasteryDefense()
	local experience = LOW_EXPERIENCE
	local etype1 = Entities.CU_BanditLeaderSword1
	if CP_Difficulty == 1 then
		experience = experience + 2
		etype1 = Entities.CU_BanditLeaderSword2
	end
	for i = 1, 5 do
		local pos = GetPosition("MonDefense"..i)
		local Defender = AI.Entity_CreateFormation(5,Entities.CU_VeteranLieutenant,0,0,pos.X,pos.Y,0,0,experience,0)
		SetEntityName(Defender, "Defender"..i)
	end

	local pos 	= GetPosition("MonDefense5")
	Defender6 	= AI.Entity_CreateFormation(5, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Defender6, "Defender6")

	local pos 	= GetPosition("MonDefense1")
	Defender7 	= AI.Entity_CreateFormation(5, Entities.CU_BanditLeaderBow1, 0, 4, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Defender7, "Defender7")

	local pos 	= GetPosition("MonDefense2")
	Defender8 	= AI.Entity_CreateFormation(5, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Defender8, "Defender8")

	local pos 	= GetPosition("MonDefense3")
	Defender9 	= AI.Entity_CreateFormation(5, Entities.CU_BanditLeaderBow1, 0, 4, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Defender9, "Defender9")

	local pos 	= GetPosition("MonDefense4")
	Defender10 	= AI.Entity_CreateFormation(5, etype1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
	SetEntityName(Defender10, "Defender10")

end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "CheckBuildings"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_CheckBuildings = function()
	-------------------------------------------------------------------------------------------------------------------

		return Archery==1 and Barracks==1 and Blacksmith==1 and Brickworks==1 and Farms==1 and Residences==1 and Sawmill==1 and StoneMason==1 and University==1

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_CheckBuildings = function()
	-------------------------------------------------------------------------------------------------------------------

		end2ndChapter()

		return true

	end