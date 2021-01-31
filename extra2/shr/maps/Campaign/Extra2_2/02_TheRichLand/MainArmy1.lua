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

                
                if BaseArmy1_COUNTER > 0 and IsAlive("EnemyCamp1") and IsAlive("EnemyCamp2") then

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

		BaseArmy1_DELAY 	=       210
		BaseArmy1_COUNTER	=	BaseArmy1_DELAY

		StartJob("TimerBaseArmy1")		

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

SpawnArmyBase1 = function()
	local experience = MEDIUM_EXPERIENCE	
	local mainArmy1	= 	{	
				Entities.CU_BanditLeaderBow1
				}

	if CP_Difficulty == 0 then
		table.insert(mainArmy1, Entities.CU_BanditLeaderSword1)
		table.insert(mainArmy1, Entities.CU_Barbarian_LeaderClub1)
	else
		experience = experience + 1
		table.insert(mainArmy1, Entities.CU_BanditLeaderSword2)
		table.insert(mainArmy1, Entities.CU_Barbarian_LeaderClub2)
		table.insert(mainArmy1, Entities.PU_LeaderHeavyCavalry1)
	end


	AttackPoints1	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				}


	RandomUnit1 		= 	mainArmy1[Logic.GetRandom(table.getn(mainArmy1))+1]
	RandomAttackPoint1 	= 	AttackPoints1[Logic.GetRandom(table.getn(AttackPoints1))+1]



		local pos = GetPosition("EnemySpawn5")
		MainAttack1 = AI.Entity_CreateFormation(2, RandomUnit1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(MainAttack1, "BaseAttack1")


		Attack("BaseAttack1",RandomAttackPoint1)

end

