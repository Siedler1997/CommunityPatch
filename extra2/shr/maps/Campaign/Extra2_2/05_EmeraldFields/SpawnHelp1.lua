CampArmy1_DELAY 		=       20
CampArmy1_COUNTER 	        =	CampArmy1_DELAY

---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AriGetsHelp1"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AriGetsHelp1 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if CampArmy1_COUNTER > 0 and IsDead("ErecHelp1") and IsDead("ErecHelp2") then

			CampArmy1_COUNTER = CampArmy1_COUNTER - 1

			return false

                elseif CampArmy1_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_AriGetsHelp1 = function()
	-------------------------------------------------------------------------------------------------------------------

		SpawnMoreHelp1()

		CampArmy1_DELAY 	=       20
		CampArmy1_COUNTER	=	CampArmy1_DELAY

		StartJob("AriGetsHelp1")		

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function SpawnMoreHelp1()


	local pos = GetPosition("ErecSpawn2")
	ErecHelp1 = AI.Entity_CreateFormation(3,Entities.PU_LeaderSword4,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(ErecHelp1, "ErecHelp1")

	local pos = GetPosition("ErecSpawn2")
	ErecHelp1 = AI.Entity_CreateFormation(3,Entities.PU_LeaderPoleArm4,0,8,pos.X,pos.Y,0,0,2,0)
	SetEntityName(ErecHelp2, "ErecHelp2")

	StartJob("TimeControler111")

end


-------------------------------------------------------------------------------------------

QUESTFollow11_DELAY 		=       5
QUESTFollow11_COUNTER 		=	QUESTFollow11_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimeControler111"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeControler111 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTFollow11_COUNTER > 0 then

                   QUESTFollow11_COUNTER = QUESTFollow11_COUNTER - 1

                   return false

                	elseif QUESTFollow11_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimeControler111 = function()
	-------------------------------------------------------------------------------------------------------------------

		ControlMMSupport111()

		QUESTFollow11_DELAY 		=       5
		QUESTFollow11_COUNTER 		=	QUESTFollow11_DELAY

		StartJob("TimeControler111")

		return true

	end

-------------------------------------------------------------------------------------------

function ControlMMSupport111()


	if ChapterCount1 == 1 and IsAlive("ErecHelp1") then
	Attack("ErecHelp1","P4_AttackTarg2")
	end

	if ChapterCount1 == 1 and IsAlive("ErecHelp2") then
	Attack("ErecHelp2","P4_AttackTarg2")
	end




	if ChapterCount1 == 2 and IsAlive("ErecHelp1") then
	Attack("ErecHelp1","SupportTarget2")
	end

	if ChapterCount1 == 2 and IsAlive("ErecHelp2") then
	Attack("ErecHelp2","SupportTarget2")
	end




	if ChapterCount1 == 3 and IsAlive("ErecHelp1") then
	Attack("ErecHelp1","SupportTarget4")
	end

	if ChapterCount1 == 3 and IsAlive("ErecHelp2") then
	Attack("ErecHelp2","SupportTarget4")
	end



end