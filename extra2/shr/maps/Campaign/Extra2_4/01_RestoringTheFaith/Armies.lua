
-------------------------------------------------------
------------  RAIDERS  --------------------------------
-------------------------------------------------------
--+++++++++++++++++++++++++++++++++++++++++++++++++++--


Raid1_DELAY 		=       0
Raid1_COUNTER 	        =	Raid1_DELAY

---------------------------------------------------------------------------------------------------------------------------

createSpawnRaid1 = function()


	StartJob("TimerRaid1")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerRaid1"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerRaid1 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if Raid1_COUNTER > 0 and  preputz==0 then

                   Raid1_COUNTER = Raid1_COUNTER - 1

                   return false

                	elseif Raid1_COUNTER==0   then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerRaid1 = function()
	-------------------------------------------------------------------------------------------------------------------

		local i = GetRandom(1,4)
		local j = GetRandom(1,4)

		local banditSwordType = Entities.CU_BanditLeaderSword1
		--local banditBowType = Entities.CU_BanditLeaderBow1
		if CP_Difficulty > 0 then
			banditSwordType = Entities.CU_BanditLeaderSword2
			--banditBowType = Entities.CU_BanditLeaderBow2
		end
				
        local pos = GetPosition("raidsp1")
        RaidAttack1 = Tools.CreateGroup(2, banditSwordType, 8, pos.X, pos.Y, 180)
        SetEntityName(RaidAttack1, "Bulangii1")


        local pos = GetPosition("raidsp2")
        RaidAttack2 = Tools.CreateGroup(2, banditSwordType, 8, pos.X, pos.Y, 180)
        SetEntityName(RaidAttack2, "Bulangii2")

		Attack("Bulangii1","attack"..i)
		Attack("Bulangii2","attack"..j)


        Raid1_DELAY 		=       400
        Raid1_COUNTER 	        =	Raid1_DELAY
		StartJob("TimerRaid1")

		return true


	end
--+++++++++++++++++++++++++++++++++++++++++++++++++++-------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------





-------------------------------------------------------
------------  BARBARIANS  -----------------------------
-------------------------------------------------------
--+++++++++++++++++++++++++++++++++++++++++++++++++++--




setuppl6army = function()

	pl6army 				= {}

	pl6army.player 			        = 2
	pl6army.id				= 2
	pl6army.strength		        = 1
	pl6army.position		        = GetPosition("barboutpost")
	pl6army.rodeLength		        = 500
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		pl6army.spawnTypes 			= { { Entities.CU_BanditLeaderSword1, 8} }
	else
		pl6army.spawnTypes 			= { { Entities.CU_BanditLeaderSword2, 8} }
	end
	pl6army.spawnPos			= GetPosition("barboutpost")
	--pl6army.spawnGenerator		        = "barboutpost"
	pl6army.respawnTime			= 60*5
	pl6army.maxSpawnAmount		        = 1
	pl6army.endless				= true
	pl6army.refresh				= false

	pl6army.retreatStrength			= 2
	pl6army.baseDefenseRange		= 2000
	pl6army.outerDefenseRange		= 3200
	pl6army.Attack					= false
	pl6army.AttackAllowed			= false
	pl6army.experiencePoints		= CP_Difficulty

	-- Setup army
	SetupArmy(pl6army)
	
	-- Army generator
	SetupAITroopSpawnGenerator("pl6army", pl6army)

	-- Control army
	StartJob("Controlpl6army")

end

--------------------------------------------------------------------------------------------
--
--	JOB: "Controlpl6army"
--
--------------------------------------------------------------------------------------------	
	--------------------------------------------------------------------------------------------
	Condition_Controlpl6army = function()
	--------------------------------------------------------------------------------------------
		return Counter.Tick2("Controlpl6army",10)
	end
		
	--------------------------------------------------------------------------------------------
	Action_Controlpl6army = function()
	--------------------------------------------------------------------------------------------
		TickOffensiveAIController(pl6army)
		return false		
	end
--------------------------------------------------------------------------------------------





setupbarbuci = function()

	barbuci 				= {}

	barbuci.player 			        = 2
	barbuci.id				= 1
	barbuci.strength		        = 1
	barbuci.position		        = GetPosition("barbcamp")
	barbuci.rodeLength		        = 500
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		barbuci.spawnTypes 			= { { Entities.CU_BanditLeaderBow1, 8} }
	else
		barbuci.spawnTypes 			= { { Entities.CU_BanditLeaderBow2, 8} }
	end
	barbuci.spawnPos			= GetPosition("barbcamp")
	barbuci.spawnGenerator		        = "LeaderB"
	barbuci.respawnTime			= 60*5
	barbuci.maxSpawnAmount		        = 1
	barbuci.endless				= true
	barbuci.refresh				= false

	barbuci.retreatStrength			= 2
	barbuci.baseDefenseRange		= 2000
	barbuci.outerDefenseRange		= 3200
	barbuci.Attack					= false
	barbuci.AttackAllowed			= false
	barbuci.experiencePoints		= CP_Difficulty

	-- Setup army
	SetupArmy(barbuci)
	
	-- Army generator
	SetupAITroopSpawnGenerator("barbuci", barbuci)

	-- Control army
	StartJob("Controlbarbuci")

end

--------------------------------------------------------------------------------------------
--
--	JOB: "Controlbarbuci"
--
--------------------------------------------------------------------------------------------	
	--------------------------------------------------------------------------------------------
	Condition_Controlbarbuci = function()
	--------------------------------------------------------------------------------------------
		return Counter.Tick2("Controlbarbuci",10)
	end
		
	--------------------------------------------------------------------------------------------
	Action_Controlbarbuci = function()
	--------------------------------------------------------------------------------------------
		TickOffensiveAIController(barbuci)
		return false		
	end
--------------------------------------------------------------------------------------------






setupbarbuci1 = function()

	barbuci1 				= {}

	barbuci1.player 			= 2
	barbuci1.id				= 3
	barbuci1.strength		        = 1
	barbuci1.position		        = GetPosition("barbcamp1")
	barbuci1.rodeLength		        = 500
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		barbuci1.spawnTypes 			= { { Entities.CU_BanditLeaderBow1, 8} }
	else
		barbuci1.spawnTypes 			= { { Entities.CU_BanditLeaderBow2, 8} }
	end
	barbuci1.spawnPos			= GetPosition("barbcamp1")
	barbuci1.spawnGenerator			= "LeaderB"
	barbuci1.respawnTime			= 60*5
	barbuci1.maxSpawnAmount		        = 1
	barbuci1.endless			= true
	barbuci1.refresh			= false

	barbuci1.retreatStrength		= 2
	barbuci1.baseDefenseRange		= 2000
	barbuci1.outerDefenseRange		= 3200
	barbuci1.Attack					= false
	barbuci1.AttackAllowed			= false
	barbuci1.experiencePoints		= CP_Difficulty

	-- Setup army
	SetupArmy(barbuci1)
	
	-- Army generator
	SetupAITroopSpawnGenerator("barbuci1", barbuci1)

	-- Control army
	StartJob("Controlbarbuci1")

end

--------------------------------------------------------------------------------------------
--
--	JOB: "Controlbarbuci1"
--
--------------------------------------------------------------------------------------------	
	--------------------------------------------------------------------------------------------
	Condition_Controlbarbuci1 = function()
	--------------------------------------------------------------------------------------------
		return Counter.Tick2("Controlbarbuci1",10)
	end
		
	--------------------------------------------------------------------------------------------
	Action_Controlbarbuci1 = function()
	--------------------------------------------------------------------------------------------
		TickOffensiveAIController(barbuci1)
		return false		
	end
--------------------------------------------------------------------------------------------




setupcaft = function()

	caft 				= {}

	caft.player 			= 2
	caft.id				= 4
	caft.strength		        = 1
	caft.position		        = GetPosition("barbcamp3")
	caft.rodeLength		        = 500
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		caft.spawnTypes 			= { { Entities.CU_BanditLeaderBow1, 8} }
	else
		caft.spawnTypes 			= { { Entities.CU_BanditLeaderBow2, 8} }
	end
	caft.spawnPos			= GetPosition("barbcamp3")
	caft.spawnGenerator		= "LeaderB"
	caft.respawnTime		= 60*5
	caft.maxSpawnAmount		= 1
	caft.endless			= true
	caft.refresh			= false

	caft.retreatStrength		= 2
	caft.baseDefenseRange		= 2000
	caft.outerDefenseRange		= 3200
	caft.Attack					= false
	caft.AttackAllowed			= false
	caft.experiencePoints		= CP_Difficulty

	-- Setup army
	SetupArmy(caft)
	
	-- Army generator
	SetupAITroopSpawnGenerator("caft", caft)

	-- Control army
	StartJob("Controlcaft")

end

--------------------------------------------------------------------------------------------
--
--	JOB: "Controlcaft"
--
--------------------------------------------------------------------------------------------	
	--------------------------------------------------------------------------------------------
	Condition_Controlcaft = function()
	--------------------------------------------------------------------------------------------
		return Counter.Tick2("Controlcaft",10)
	end
		
	--------------------------------------------------------------------------------------------
	Action_Controlcaft = function()
	--------------------------------------------------------------------------------------------
		TickOffensiveAIController(caft)
		return false		
	end
--------------------------------------------------------------------------------------------


Spawnkillaz = function ()

	local pos = GetPosition("barboutpost2")
	if CP_Difficulty == 0 then
		CampBoys = AI.Entity_CreateFormation(3,Entities.CU_BanditLeaderSword1,0,8,pos.X,pos.Y,0,0,1,0)
	else
		CampBoys = AI.Entity_CreateFormation(3,Entities.CU_BanditLeaderSword2,0,8,pos.X,pos.Y,0,0,CP_Difficulty+1,0)
	end
    SetEntityName(CampBoys, "killaz") 
	 
end
-----------------------------------------------------------------------------------------


--+++++++++++++++++++++++++++++++++++++++++++++++++++-------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------










-------------------------------------------------------
------------  TEMPLARS  -------------------------------
-------------------------------------------------------
--+++++++++++++++++++++++++++++++++++++++++++++++++++--


setupTemplars1 = function()

	templars1 				= {}

	templars1.player 			= 1
	templars1.id				= 1
	templars1.strength		        = 1
	templars1.position		        = GetPosition("templars")
	templars1.rodeLength		        = 500
	
	-- Spawn parameter
	templars1.spawnTypes 			= { { Entities.PU_LeaderHeavyCavalry2, 3} }
	templars1.spawnPos			= GetPosition("templars")
	--templars1.spawnGenerator		= "templars"
	templars1.respawnTime			= 60*5
	templars1.maxSpawnAmount		= 1
	templars1.endless			= true
	templars1.refresh			= false

	templars1.retreatStrength		= 2
	templars1.baseDefenseRange		= 2000
	templars1.outerDefenseRange		= 3200
	templars1.Attack			= false
	templars1.AttackAllowed			= false

	-- Setup army
	SetupArmy(templars1)
	
	-- Army generator
	SetupAITroopSpawnGenerator("templars1", templars1)

	-- Control army
	StartJob("Controltemplars1")

end

--------------------------------------------------------------------------------------------
--
--	JOB: "Controltemplars1"
--
--------------------------------------------------------------------------------------------	
	--------------------------------------------------------------------------------------------
	Condition_Controltemplars1 = function()
	--------------------------------------------------------------------------------------------
		return Counter.Tick2("Controltemplars1",10)
	end
		
	--------------------------------------------------------------------------------------------
	Action_Controltemplars1 = function()
	--------------------------------------------------------------------------------------------
		TickOffensiveAIController(templars1)
		return false		
	end
--------------------------------------------------------------------------------------------


--+++++++++++++++++++++++++++++++++++++++++++++++++++-------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------





-------------------------------------------------------
------------  TRAITOR   -------------------------------
-------------------------------------------------------
--+++++++++++++++++++++++++++++++++++++++++++++++++++--

SpawnTraitor = function()
		SetFriendly(1,8)
		SetFriendly(2,8)

		StartJob("tradare")

		local pos = GetPosition("raidsp2")
                        Traitor = Tools.CreateGroup(8, Entities.CU_BanditLeaderSword1, 0, pos.X, pos.Y, 340)
                 SetEntityName(Traitor, "Bula")       

		Move("Bula","teapa")
		DisableNpcMarker("Bula")
end
		


Condition_tradare = function()

	return IsNear("Bula", "teapa", 50) 
			
end

Action_tradare = function()
			
			
			local Npc = {}
			Npc.name = "Bula"
			Npc.callback = tepar	

			-- create npc
			CreateNPC(Npc)

		BriefingTraitorAppears()
	     	return true
end		


		


tepar = function()

	BriefingBarbTraitor()
	
end



--+++++++++++++++++++++++++++++++++++++++++++++++++++-------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------







-------------------------------------------------------
------------  DEFENSES  -------------------------------
-------------------------------------------------------
--+++++++++++++++++++++++++++++++++++++++++++++++++++--
defenses = function()
	local pos = GetPosition("defense1")
        defense11 = Tools.CreateGroup(1, Entities.PU_LeaderBow1, 6, pos.X, pos.Y, 90)
        SetEntityName(defense11, "aparare11")
	local pos = GetPosition("defense11")
	defense12 = Tools.CreateGroup(1, Entities.PU_LeaderBow1, 6, pos.X, pos.Y, 90)
        SetEntityName(defense12, "aparare12")


        local pos = GetPosition("defense2")
        defense21 = Tools.CreateGroup(1, Entities.PU_LeaderBow1, 6, pos.X, pos.Y, 90)
        SetEntityName(defense21, "aparare21")
	local pos = GetPosition("defense21")
	defense22 = Tools.CreateGroup(1, Entities.PU_LeaderBow1, 6, pos.X, pos.Y, 90)
        SetEntityName(defense22, "aparare22")

	local pos = GetPosition("defense3")
        defense31 = Tools.CreateGroup(1, Entities.PU_LeaderBow1, 6, pos.X, pos.Y, 90)
        SetEntityName(defense31, "aparare31")
	local pos = GetPosition("defense31")
	defense32 = Tools.CreateGroup(1, Entities.PU_LeaderBow1, 6, pos.X, pos.Y, 90)
        SetEntityName(defense32, "aparare32")

	local pos = GetPosition("defense41")
        defense31 = Tools.CreateGroup(1, Entities.PU_LeaderBow1, 6, pos.X, pos.Y, 90)
        SetEntityName(defense41, "aparare41")
	local pos = GetPosition("defense42")
	defense32 = Tools.CreateGroup(1, Entities.PU_LeaderBow1, 6, pos.X, pos.Y, 90)
        SetEntityName(defense42, "aparare42")
end

BriefingBombs = function()
	
	
	StartSimpleJob "Traps"
	

end	


		Traps = function ()
			for i = 1,23,1 do
				if IsNear ("Bulangii1","trap"..i,1200) or IsNear ("Bulangii1","trap"..i,1200)
				
				then 
					for j = 1,23,1 do
						CreateEntity(1,Entities.XD_Bomb1,GetPosition("trap"..j),"bang") 
						CreateEntity(1,Entities.XD_Bomb1,GetPosition("trap"..j),"bang")
						CreateEntity(1,Entities.XD_Bomb1,GetPosition("trap"..j),"bang")
						CreateEntity(1,Entities.XD_Bomb1,GetPosition("trap"..j),"bang")
					end
					JobTribute()
				return true

				--CreateEntity(1,Entities.XD_Bomb1,GetPosition("trap"..i),"bang") 
				--CreateEntity(1,Entities.XD_Bomb1,GetPosition("trap"..i),"bang") 
				--CreateEntity(1,Entities.XD_Bomb1,GetPosition("trap"..i),"bang") 
				end			
			end
			
		end





-------trolls ----

Spawntrolls = function ()

	local pos = GetPosition("trollsb")
        Bridgeboys = Tools.CreateGroup(3, Entities.CU_BanditLeaderSword1, 6, pos.X, pos.Y, 180)
         SetEntityName(Bridgeboys, "trolls") 
	 
end