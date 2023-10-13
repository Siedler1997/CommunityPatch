FinalAttack_DELAY 		=       300
FinalAttack_COUNTER 	        =	FinalAttack_DELAY

---------------------------------------------------------------------------------------------------------------------

	FinalAttack = function()


	StartJob("TimerFinalAttack")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerFinalAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerFinalAttack = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if FinalAttack_COUNTER > 0 then

                   FinalAttack_COUNTER = FinalAttack_COUNTER - 1

                   return false

                	elseif FinalAttack_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerFinalAttack = function()
	-------------------------------------------------------------------------------------------------------------------


                        local pos = GetPosition("player2Army")
 	                    p2attack1 = AI.Entity_CreateFormation(2,Entities.PU_LeaderSword4,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack1, "GroupAttack1")


                     	local pos = GetPosition("player2Army")
                        p2attack2 = AI.Entity_CreateFormation(2,Entities.PU_LeaderSword4,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack2, "GroupAttack2")

                     	local pos = GetPosition("player2Army")
                        p2attack3 = AI.Entity_CreateFormation(2,Entities.PU_LeaderSword4,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack3, "GroupAttack3")

                     	local pos = GetPosition("player2Army")
                        p2attack4 = AI.Entity_CreateFormation(2,Entities.PU_LeaderSword4,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack4, "GroupAttack4")

                     	local pos = GetPosition("player2Army")
                        p2attack5 = AI.Entity_CreateFormation(2,Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack5, "GroupAttack5")

                     	local pos = GetPosition("player2Army")
                        p2attack6 = AI.Entity_CreateFormation(2,Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack6, "GroupAttack6")

                     	local pos = GetPosition("player2Army")
                        p2attack7 = AI.Entity_CreateFormation(2,Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack7, "GroupAttack7")

                     	local pos = GetPosition("player2Army")
                        p2attack8 = AI.Entity_CreateFormation(2,Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack8, "GroupAttack8")

                     	local pos = GetPosition("player2Army")
                        p2attack9 = AI.Entity_CreateFormation(2,Entities.PU_LeaderHeavyCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack9, "GroupAttack9")

                     	local pos = GetPosition("player2Army")
                        p2attack10 = AI.Entity_CreateFormation(2,Entities.PU_LeaderHeavyCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack10, "GroupAttack10")

                     	local pos = GetPosition("player2Army")
                        p2attack11 = AI.Entity_CreateFormation(2,Entities.PU_LeaderHeavyCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack11, "GroupAttack11")

                     	local pos = GetPosition("player2Army")
                        p2attack12 = AI.Entity_CreateFormation(2,Entities.PU_LeaderHeavyCavalry2,0,8,pos.X,pos.Y,0,0,2,0)
                        SetEntityName(p2attack12, "GroupAttack12")


			Attack("GroupAttack1","player1")
			Attack("GroupAttack2","player1")
			Attack("GroupAttack3","player1")
			Attack("GroupAttack4","player1")
			Attack("GroupAttack5","player1")
			Attack("GroupAttack6","player1")
			Attack("GroupAttack7","player1")
			Attack("GroupAttack8","player1")
			Attack("GroupAttack9","player1")
			Attack("GroupAttack10","player1")
			Attack("GroupAttack11","player1")
			Attack("GroupAttack12","player1")

                        return true


	end
