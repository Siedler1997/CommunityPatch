BaseArmy3_DELAY 		=       240
BaseArmy3_COUNTER 	        =	BaseArmy3_DELAY
---------------------------------------------------------------------------------------------------------------------------

createBaseArmy3 = function()


	StartJob("TimerBaseArmy3")


end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerBaseArmy3"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerBaseArmy3 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if BaseArmy3_COUNTER > 0 and IsAlive("CapTent9") and IsAlive("CapTent6") and IsDead("MainAttack3") then

			BaseArmy3_COUNTER = BaseArmy3_COUNTER - 1

			return false

                elseif BaseArmy3_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerBaseArmy3 = function()
	-------------------------------------------------------------------------------------------------------------------

		SpawnArmyBase3()

		BaseArmy3_DELAY 	=       180
		BaseArmy3_COUNTER	=	BaseArmy3_DELAY

		StartJob("TimerBaseArmy3")		

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

SpawnArmyBase3 = function()
	mainArmy3	= {	Entities.PV_Cannon3 }

	if CP_Difficulty < 2 then
		table.insert(mainArmy3, Entities.PU_LeaderBow3)
		table.insert(mainArmy3, Entities.PU_LeaderHeavyCavalry1)
		table.insert(mainArmy3, Entities.PU_LeaderPoleArm3)
		table.insert(mainArmy3, Entities.PU_LeaderSword3)
		table.insert(mainArmy3, Entities.PU_LeaderRifle1)
	else
		table.insert(mainArmy3, Entities.PU_LeaderBow4)
		table.insert(mainArmy3, Entities.PU_LeaderHeavyCavalry2)
		table.insert(mainArmy3, Entities.PU_LeaderPoleArm4)
		table.insert(mainArmy3, Entities.PU_LeaderSword4)
		table.insert(mainArmy3, Entities.PU_LeaderRifle2)
	end

	AttackPoints3	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AditionalAttackPoint1"
				}


	RandomUnit3 		= 	mainArmy3[Logic.GetRandom(table.getn(mainArmy3))+1]
	RandomAttackPoint3 	= 	AttackPoints3[Logic.GetRandom(table.getn(AttackPoints3))+1]



		local pos = GetPosition("MainBaseSpawn3")
		MainAttack3 = AI.Entity_CreateFormation(2, RandomUnit3, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(MainAttack3, "BaseAttack3")
		LookAt(MainAttack3, "lookpos")


		Attack("BaseAttack3",RandomAttackPoint3)

end

