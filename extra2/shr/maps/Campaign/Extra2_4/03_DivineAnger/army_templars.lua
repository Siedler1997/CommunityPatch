function createTemplarArmy()

 

            -- Init army

            ArmyPatrol                                                     =          {}

            ArmyPatrol.player                                              =          8

            ArmyPatrol.id                                                   =          3

            ArmyPatrol.strength						 =          20

            ArmyPatrol.position                                            =          GetPosition("templargroup")

            ArmyPatrol.rodeLength						=          10000

            ArmyPatrol.beAgressive					=          true

            

            ArmyPatrol.retreatStrength				 =          0

            ArmyPatrol.baseDefenseRange				 =          10000

            ArmyPatrol.outerDefenseRange			=          10000

            ArmyPatrol.AttackAllowed				 =          true

            ArmyPatrol.pulse                                               =          true

            

--          ArmyPatrol.patrolPointTime                    =          3*60

            

            SetupArmy(ArmyPatrol)

 

            local troops = {             

                                                Entities.PU_LeaderHeavyCavalry2,

                                               
                                                Entities.PU_LeaderSword4,

                                                Entities.PU_LeaderSword4,

                                                Entities.PU_LeaderBow4,

                                }

            

                                                

            local troopDescription = {

            

                        maxNumberOfSoldiers    = 8,

                        minNumberOfSoldiers     = 0,

                        experiencePoints           = 1+CP_Difficulty,

            }                                   

            

            local RandomUnit={}

 

            for h=1,8 ,1 do

 

            RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

 

            troopDescription.leaderType = RandomUnit[h]

            EnlargeArmy(ArmyPatrol,troopDescription)

 

            end

 

            Redeploy(ArmyPatrol, ArmyPatrol.position)

 

            StartSimpleJob("ControlTemplarArmy")

 

end

 

function ControlTemplarArmy()

 

            if Counter.Tick2("ControlTemplarArmy", 10) then

 

                        if IsDead(ArmyPatrol) then

                        

                        return true

                        end

            

                        ArmyPatrol.position        =          GetPosition("gathertemps")

                                    

                        Redeploy(ArmyPatrol, ArmyPatrol.position)

                                    

                        TickOffensiveAIController(ArmyPatrol)

            

            end

end




function createTemplarArmy1()

 

            -- Init army

            ArmyPatrol1                                                     =          {}

            ArmyPatrol1.player                                              =          8

            ArmyPatrol1.id                                                   =          2

            ArmyPatrol1.strength						 =          20

            ArmyPatrol1.position                                            =          GetPosition("templargroup1")

            ArmyPatrol1.rodeLength						=          10000

            ArmyPatrol1.beAgressive					=          true

            

            ArmyPatrol1.retreatStrength				 =          0

            ArmyPatrol1.baseDefenseRange				 =          10000

            ArmyPatrol1.outerDefenseRange			=          10000

            ArmyPatrol1.AttackAllowed				 =          true

            ArmyPatrol1.pulse                                               =          true

            

--          ArmyPatrol.patrolPointTime                    =          3*60

            

            SetupArmy(ArmyPatrol1)

 

            local troops = {             

                                                Entities.PU_LeaderHeavyCavalry2,

                                               
                                                Entities.PU_LeaderSword4,

                                                Entities.PU_LeaderSword4,

                                                Entities.PU_LeaderBow4,

                                }

            

                                                

            local troopDescription = {

            

                        maxNumberOfSoldiers    = 8,

                        minNumberOfSoldiers     = 0,

                        experiencePoints           = 1+CP_Difficulty,

            }                                   

            

            local RandomUnit={}

 

            for h=1,8 ,1 do

 

            RandomUnit[h] = troops[Logic.GetRandom(table.getn(troops))+1]

 

            troopDescription.leaderType = RandomUnit[h]

            EnlargeArmy(ArmyPatrol1,troopDescription)

 

            end

 

            Redeploy(ArmyPatrol1, ArmyPatrol1.position)

 

            StartSimpleJob("ControlTemplarArmy1")

 

end

 

function ControlTemplarArmy1()

 

            if Counter.Tick2("ControlTemplarArmy1", 10) then

 

                        if IsDead(ArmyPatrol1) then

                        

                        return true

                        end

            

                        ArmyPatrol1.position        =          GetPosition("gathertemps")

                                    

                        Redeploy(ArmyPatrol1, ArmyPatrol1.position)

                                    

                        TickOffensiveAIController(ArmyPatrol1)

            

            end

end



SpawnCitz = function()

cit1 = GetPosition("cit1")
battle = Tools.CreateGroup(1, Entities.PU_LeaderSword4, 6, cit1.X,cit1.Y, 0)
SetEntityName(battle, "cit1") 


cit2 = GetPosition("cit2")
battle = Tools.CreateGroup(1, Entities.PU_LeaderSword4, 6, cit2.X,cit2.Y, 0)
SetEntityName(battle, "cit2") 


end