Arrival = function()

	  caravanGold   = CreateEntity(4,Entities.PU_Travelling_Salesman,GetPosition("SpawnArrival1"),"caravanGold")
	  caravanIron   = CreateEntity(4,Entities.PU_Travelling_Salesman,GetPosition("SpawnArrival2"),"caravanIron")
 	  caravanWood   = CreateEntity(4,Entities.PU_Travelling_Salesman,GetPosition("SpawnArrival3"),"caravanWood")
	  caravanStone  = CreateEntity(4,Entities.PU_Travelling_Salesman,GetPosition("SpawnArrival4"),"caravanStone")
	  caravanSulfur = CreateEntity(4,Entities.PU_Travelling_Salesman,GetPosition("SpawnArrival5"),"caravanSulfur")
	  caravanClay   = CreateEntity(4,Entities.PU_Travelling_Salesman,GetPosition("SpawnArrival6"),"caravanClay")
	  caravanErec   = CreateEntity(1,Entities.PU_Hero4,GetPosition("SpawnArrival13"),"Erec")

 	  local pos = GetPosition("SpawnArrival7")
 	  ArchersGroup1 = Tools.CreateGroup(1, Entities.PU_LeaderBow4, 8, pos.X, pos.Y, 0)
	  SetEntityName(ArchersGroup1,"Archers1")

 	  local pos = GetPosition("SpawnArrival8")
 	  ArchersGroup2 = Tools.CreateGroup(1, Entities.PU_LeaderBow4, 8, pos.X, pos.Y, 0)
	  SetEntityName(ArchersGroup2,"Archers2")

 	  local pos = GetPosition("SpawnArrival11")
 	  SwordsGroup1 = Tools.CreateGroup(1, Entities.PU_LeaderSword4, 8, pos.X, pos.Y, 0)
	  SetEntityName(SwordsGroup1,"Swords1")

 	  local pos = GetPosition("SpawnArrival12")
 	  SwordsGroup2 = Tools.CreateGroup(1, Entities.PU_LeaderSword4, 8, pos.X, pos.Y, 0)
	  SetEntityName(SwordsGroup2,"Swords2")

 	  local pos = GetPosition("SpawnArrival9")
 	  CavalryGroup1 = Tools.CreateGroup(1, Entities.PU_LeaderHeavyCavalry2, 3, pos.X, pos.Y, 0)
	  SetEntityName(CavalryGroup1,"Cavalry1")

 	  local pos = GetPosition("SpawnArrival10")
 	  CavalryGroup2 = Tools.CreateGroup(1, Entities.PU_LeaderHeavyCavalry2, 3, pos.X, pos.Y, 0)
	  SetEntityName(CavalryGroup2,"Cavalry2")


		ReplaceEntity("OpenSesame", Entities.PB_DrawBridgeClosed2)


	  StartJob("MovingCaravan")

	UnimportantBridge = 1

	variabila=1
	
	ResearchAllMilitaryTechsAddOn(2)
	ResearchAllMilitaryTechsAddOn(3)
end


	-------------------------------------------------------------------------------------------------------------------
	Condition_MovingCaravan = function()
	-------------------------------------------------------------------------------------------------------------------

                
		return Counter.Tick2("MovingCravan",15)
          
	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MovingCaravan = function()
	-------------------------------------------------------------------------------------------------------------------

	StartJob("TimeControler")

	return true

	end


-------------------------------------------------------------------------------------------

QUESTFollow_DELAY 		=       5
QUESTFollow_COUNTER 		=	QUESTFollow_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimeControler"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeControler = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTFollow_COUNTER > 0 then

                   QUESTFollow_COUNTER = QUESTFollow_COUNTER - 1

                   return false

                	elseif QUESTFollow_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimeControler = function()
	-------------------------------------------------------------------------------------------------------------------

		ControlMMSupport()

		QUESTFollow_DELAY 		=       5
		QUESTFollow_COUNTER 		=	QUESTFollow_DELAY

		StartJob("TimeControler")

		return true

	end

-------------------------------------------------------------------------------------------

function ControlMMSupport()

	if IsAlive("caravanGold") then

		Move("caravanGold","player1")

	end

	if IsAlive("caravanIron") then

		Move("caravanIron","player1")

	end

	if IsAlive("caravanWood") then

		Move("caravanWood","player1")

	end

	if IsAlive("caravanStone") then

		Move("caravanStone","player1")

	end

	if IsAlive("caravanSulfur") then

		Move("caravanSulfur","player1")

	end

	if IsAlive("caravanClay") then

		Move("caravanClay","player1")

	end

end
