BaseArmy2_DELAY 		=       240
BaseArmy2_COUNTER 	        =	BaseArmy2_DELAY
---------------------------------------------------------------------------------------------------------------------------

createBaseArmy2 = function()


	StartJob("TimerBaseArmy2")


end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerBaseArmy2"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerBaseArmy2 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if BaseArmy2_COUNTER > 0 and IsAlive("EnemyCamp1") and IsAlive("EnemyCamp2") then

			BaseArmy2_COUNTER = BaseArmy2_COUNTER - 1

			return false

                elseif BaseArmy2_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerBaseArmy2 = function()
	-------------------------------------------------------------------------------------------------------------------

		SpawnArmyBase2()

		BaseArmy2_DELAY 	=       210
		BaseArmy2_COUNTER	=	BaseArmy2_DELAY

		StartJob("TimerBaseArmy2")		

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

SpawnArmyBase2 = function()
	local experience = MEDIUM_EXPERIENCE	
	local mainArmy2	= 	{	
				Entities.CU_BanditLeaderBow1
				}

	if CP_Difficulty == 0 then
		table.insert(mainArmy2, Entities.CU_BanditLeaderSword1)
		table.insert(mainArmy2, Entities.CU_Barbarian_LeaderClub1)
	else
		experience = experience + 1
		table.insert(mainArmy2, Entities.CU_BanditLeaderSword2)
		table.insert(mainArmy2, Entities.CU_Barbarian_LeaderClub2)
		table.insert(mainArmy2, Entities.PU_LeaderHeavyCavalry1)
	end


	AttackPoints2	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				}


	RandomUnit2 		= 	mainArmy2[Logic.GetRandom(table.getn(mainArmy2))+1]
	RandomAttackPoint2 	= 	AttackPoints2[Logic.GetRandom(table.getn(AttackPoints2))+1]



		local pos = GetPosition("EnemySpawn6")
		MainAttack2 = AI.Entity_CreateFormation(2, RandomUnit2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(MainAttack2, "BaseAttack2")


		Attack("BaseAttack2",RandomAttackPoint2)

end

