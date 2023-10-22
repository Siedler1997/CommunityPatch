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

                
                if BaseArmy3_COUNTER > 0 and IsAlive("EnemyCamp1") and IsAlive("EnemyCamp2") then

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

		BaseArmy3_DELAY 	=       210
		BaseArmy3_COUNTER	=	BaseArmy3_DELAY

		StartJob("TimerBaseArmy3")		

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

SpawnArmyBase3 = function()
	local mainArmy3	= 	{ }

	if CP_Difficulty == 0 then
		table.insert(mainArmy3, Entities.CU_BanditLeaderSword1)
		table.insert(mainArmy3, Entities.CU_Barbarian_LeaderClub1)
		table.insert(mainArmy3, Entities.CU_BanditLeaderBow1)
	else
		table.insert(mainArmy3, Entities.CU_BanditLeaderSword2)
		table.insert(mainArmy3, Entities.CU_Barbarian_LeaderClub2)
		table.insert(mainArmy3, Entities.CU_BanditLeaderBow2)
	end

	AttackPoints3	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				}


	RandomUnit3 		= 	mainArmy3[Logic.GetRandom(table.getn(mainArmy3))+1]
	RandomAttackPoint3 	= 	AttackPoints3[Logic.GetRandom(table.getn(AttackPoints3))+1]



		local pos = GetPosition("EnemySpawn7")
		MainAttack3 = AI.Entity_CreateFormation(2, RandomUnit3, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(MainAttack3, "BaseAttack3")


		Attack("BaseAttack3",RandomAttackPoint3)

end

