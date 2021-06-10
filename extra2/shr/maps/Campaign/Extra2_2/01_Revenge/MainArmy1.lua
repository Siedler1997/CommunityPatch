BaseArmy1_DELAY 		=       240
BaseArmy1_COUNTER 	        =	BaseArmy1_DELAY
---------------------------------------------------------------------------------------------------------------------------

createBaseArmy1 = function()


	StartJob("TimerBaseArmy1")


end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerBaseArmy1"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerBaseArmy1 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if BaseArmy1_COUNTER > 0 and IsAlive("CapTent7") and IsAlive("CapTent5") and IsDead("MainAttack1") then

			BaseArmy1_COUNTER = BaseArmy1_COUNTER - 1

			return false

                elseif BaseArmy1_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerBaseArmy1 = function()
	-------------------------------------------------------------------------------------------------------------------

		SpawnArmyBase1()

		BaseArmy1_DELAY 	=       180
		BaseArmy1_COUNTER	=	BaseArmy1_DELAY

		StartJob("TimerBaseArmy1")		

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

SpawnArmyBase1 = function()
	local experience = LOW_EXPERIENCE	
	mainArmy1	= {	Entities.PU_LeaderBow3,
				Entities.PU_LeaderHeavyCavalry2,
				Entities.PV_Cannon3,
				Entities.PU_LeaderPoleArm3,
				Entities.PU_LeaderSword3
				}

	if CP_Difficulty > 0 then
		experience = experience + 2
	end


	AttackPoints1	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AditionalAttackPoint1"
				}


	RandomUnit1 		= 	mainArmy1[Logic.GetRandom(table.getn(mainArmy1))+1]
	RandomAttackPoint1 	= 	AttackPoints1[Logic.GetRandom(table.getn(AttackPoints1))+1]



		local pos = GetPosition("MainBaseSpawn1")
		MainAttack1 = AI.Entity_CreateFormation(2, RandomUnit1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(MainAttack1, "BaseAttack1")
		LookAt(MainAttack1, "lookpos")


		Attack("BaseAttack1",RandomAttackPoint1)

end

