CampArmy2_DELAY 		=       20
CampArmy2_COUNTER 	        =	CampArmy2_DELAY

---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AriGetsHelp2"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AriGetsHelp2 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if CampArmy2_COUNTER > 0 and IsDead("DrakeHelp1") and IsDead("DrakeHelp2") then

			CampArmy2_COUNTER = CampArmy2_COUNTER - 1

			return false

                elseif CampArmy2_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_AriGetsHelp2 = function()
	-------------------------------------------------------------------------------------------------------------------

		SpawnMoreHelp2()

		CampArmy2_DELAY 	=       20
		CampArmy2_COUNTER	=	CampArmy2_DELAY

		StartJob("AriGetsHelp2")		

		return true


	end

-------------------------------------------------------------------------------------------------------------------------

function SpawnMoreHelp2()


	local pos = GetPosition("AdditionalHelp1")
	DrakeHelp1 = AI.Entity_CreateFormation(4,Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,VERYHIGH_EXPERIENCE-CP_Difficulty,0)
	SetEntityName(DrakeHelp1, "DrakeHelp1")

	local pos = GetPosition("AdditionalHelp1")
	DrakeHelp2 = AI.Entity_CreateFormation(4,Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,VERYHIGH_EXPERIENCE-CP_Difficulty,0)
	SetEntityName(DrakeHelp2, "DrakeHelp2")

	StartJob("TimeControler112")

end


-------------------------------------------------------------------------------------------

QUESTFollow12_DELAY 		=       5
QUESTFollow12_COUNTER 		=	QUESTFollow12_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimeControler112"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeControler112 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTFollow12_COUNTER > 0 then

                   QUESTFollow12_COUNTER = QUESTFollow12_COUNTER - 1

                   return false

                	elseif QUESTFollow12_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimeControler112 = function()
	-------------------------------------------------------------------------------------------------------------------

		ControlMMSupport112()

		QUESTFollow12_DELAY 		=       5
		QUESTFollow12_COUNTER 		=	QUESTFollow12_DELAY

		StartJob("TimeControler112")

		return true

	end

-------------------------------------------------------------------------------------------

function ControlMMSupport112()


	if ChapterCount1 == 1 and IsAlive("DrakeHelp1") then
	Attack("DrakeHelp1","EnemySpawn4")
	end

	if ChapterCount1 == 1 and IsAlive("DrakeHelp2") then
	Attack("DrakeHelp2","EnemySpawn4")
	end




	if ChapterCount1 == 2 and IsAlive("DrakeHelp1") then
	Attack("DrakeHelp1","SupportTarget3")
	end

	if ChapterCount1 == 2 and IsAlive("DrakeHelp2") then
	Attack("DrakeHelp2","SupportTarget3")
	end




	if ChapterCount1 == 3 and IsAlive("DrakeHelp1") then
	Attack("DrakeHelp1","SupportTarget4")
	end

	if ChapterCount1 == 3 and IsAlive("DrakeHelp2") then
	Attack("DrakeHelp2","SupportTarget4")
	end



end