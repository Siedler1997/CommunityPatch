CampArmy_DELAY 			=       20
CampArmy_COUNTER 	        =	CampArmy_DELAY

---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AriGetsHelp"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AriGetsHelp = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if CampArmy_COUNTER > 0 and IsDead("AriHelp1") and IsDead("AriHelp2") then

			CampArmy_COUNTER = CampArmy_COUNTER - 1

			return false

                elseif CampArmy_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_AriGetsHelp = function()
	-------------------------------------------------------------------------------------------------------------------

		SpawnMoreHelp()

		CampArmy_DELAY 		=       20
		CampArmy_COUNTER	=	CampArmy_DELAY

		StartJob("AriGetsHelp")		

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function SpawnMoreHelp()

	local pos = GetPosition("AriSpawn1")
	AriHelp1 = AI.Entity_CreateFormation(5,Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(AriHelp1, "AriHelp1")

	local pos = GetPosition("AriSpawn1")
	AriHelp2 = AI.Entity_CreateFormation(5,Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(AriHelp2, "AriHelp2")


	StartJob("TimeControler11")

end


-------------------------------------------------------------------------------------------

QUESTFollow1_DELAY 		=       5
QUESTFollow1_COUNTER 		=	QUESTFollow1_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimeControler11"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeControler11 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTFollow1_COUNTER > 0 then

                   QUESTFollow1_COUNTER = QUESTFollow1_COUNTER - 1

                   return false

                	elseif QUESTFollow1_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimeControler11 = function()
	-------------------------------------------------------------------------------------------------------------------

		ControlMMSupport11()

		QUESTFollow1_DELAY 		=       5
		QUESTFollow1_COUNTER 		=	QUESTFollow1_DELAY

		StartJob("TimeControler11")

		return true

	end

-------------------------------------------------------------------------------------------

function ControlMMSupport11()

	if ChapterCount1 == 1 and IsAlive("AriHelp1") then
	Attack("AriHelp1","P4_AttackTarg3")
	end

	if ChapterCount1 == 1 and IsAlive("AriHelp2") then
	Attack("AriHelp2","P4_AttackTarg3")
	end




	if ChapterCount1 == 2 and IsAlive("AriHelp1") then
	Attack("AriHelp1","SupportTarget1")
	end

	if ChapterCount1 == 2 and IsAlive("AriHelp2") then
	Attack("AriHelp2","SupportTarget1")
	end




	if ChapterCount1 == 3 and IsAlive("AriHelp1") then
	Attack("AriHelp1","SupportTarget4")
	end

	if ChapterCount1 == 3 and IsAlive("AriHelp2") then
	Attack("AriHelp2","SupportTarget4")
	end


end