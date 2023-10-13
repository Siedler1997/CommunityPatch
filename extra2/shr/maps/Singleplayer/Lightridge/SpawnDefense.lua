SpawnDefense = function()


 	  local pos 		= GetPosition("EastOne")
 	  DefenseEast1 		= Tools.CreateGroup(3, Entities.PU_LeaderBow3, 6, pos.X, pos.Y, 180)
	  SetEntityName(DefenseEast1,"LocalEast1")


 	  local pos 		= GetPosition("EastTwo")
 	  DefenseEast2 		= Tools.CreateGroup(3, Entities.PU_LeaderBow3, 6, pos.X, pos.Y, 180)
	  SetEntityName(DefenseEast2,"LocalEast2")


 	  local pos 		= GetPosition("EastThree")
 	  DefenseEast3 		= Tools.CreateGroup(3, Entities.PU_LeaderSword3, 6, pos.X, pos.Y, 180)
	  SetEntityName(DefenseEast3,"LocalEast3")


 	  local pos 		= GetPosition("WestOne")
 	  DefenseWest1 		= Tools.CreateGroup(3, Entities.PU_LeaderBow3, 6, pos.X, pos.Y, 180)
	  SetEntityName(DefenseWest1,"LocalWest1")


 	  local pos 		= GetPosition("WestTwo")
 	  DefenseWest2 		= Tools.CreateGroup(3, Entities.PU_LeaderBow3, 6, pos.X, pos.Y, 180)
	  SetEntityName(DefenseWest2,"LocalWest2")


 	  local pos 		= GetPosition("SouthOne")
 	  DefenseSouth1 	= Tools.CreateGroup(3, Entities.PU_LeaderBow3, 6, pos.X, pos.Y, 180)
	  SetEntityName(DefenseSouth1,"LocalSouth1")


 	  local pos 		= GetPosition("SouthTwo")
 	  DefenseSouth2 	= Tools.CreateGroup(3, Entities.PU_LeaderBow3, 6, pos.X, pos.Y, 180)
	  SetEntityName(DefenseSouth2,"LocalSouth2")


 	  local pos 		= GetPosition("PlayerHelp")
 	  DefensePlayer1 	= AI.Entity_CreateFormation(4,Entities.PU_LeaderBow2,0,4,pos.X,pos.Y,0,0,3,0)
	  SetEntityName(DefensePlayer1,"LocalPlayer1")


 	  local pos 		= GetPosition("PlayerHelp")
 	  DefensePlayer2 	= AI.Entity_CreateFormation(4,Entities.PU_LeaderBow2,0,4,pos.X,pos.Y,0,0,3,0)
	  SetEntityName(DefensePlayer2,"LocalPlayer2")


 	  local pos 		= GetPosition("PlayerHelp")
 	  DefensePlayer3 	= AI.Entity_CreateFormation(4,Entities.PU_LeaderBow2,0,4,pos.X,pos.Y,0,0,3,0)
	  SetEntityName(DefensePlayer3,"LocalPlayer3")


                        local pos 	= GetPosition("SpawnThiefWest")
                        ArchersAttack1 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 6, pos.X, pos.Y, 180)
                        SetEntityName(ArchersAttack1, "AttackOnArchers1")


                     	local pos 	= GetPosition("SpawnThiefEast")
                        ArchersAttack2 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 6, pos.X, pos.Y, 180)
                        SetEntityName(ArchersAttack2, "AttackOnArchers2")


                        local pos 	= GetPosition("SpawnThiefSouth")
                        ArchersAttack3 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 6, pos.X, pos.Y, 180)
                        SetEntityName(ArchersAttack3, "AttackOnArchers3")


	  Attack("LocalPlayer1","TargetBridge")
	  Attack("LocalPlayer2","TargetBridge")
	  Attack("LocalPlayer3","TargetBridgeSouth")


end