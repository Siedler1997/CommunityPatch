function StartChapter1()

	local pos = GetPosition("GuardSpawn1")
	Guard1 = Tools.CreateGroup(7, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
	SetEntityName(Guard1, "Guard1")

	local pos = GetPosition("GuardSpawn2")
	Guard2 = Tools.CreateGroup(7, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
	SetEntityName(Guard2, "Guard2")

	local pos = GetPosition("CompSpawn")
	Comp1 = AI.Entity_CreateFormation(1, Entities.PU_LeaderPoleArm4,0,8,pos.X,pos.Y,0,0,1,0)
	SetEntityName(Comp1, "Comp1")


		local pos = GetPosition("Camp1Spawn1")
 		Camp1Def1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp1Def1, "Camp1Def1")

		local pos = GetPosition("Camp1Spawn2")
		Camp1Def2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp1Def2, "Camp1Def2")

		local pos = GetPosition("Camp1Spawn3")
		Camp1Def3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp1Def3, "Camp1Def3")

		local pos = GetPosition("Camp1Spawn4")
		Camp1Def4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp1Def4, "Camp1Def4")


		local pos = GetPosition("Camp2Spawn1")
		Camp2Def1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp2Def1, "Camp2Def1")

		local pos = GetPosition("Camp2Spawn2")
		Camp2Def2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp2Def2, "Camp2Def2")

		local pos = GetPosition("Camp2Spawn3")
		Camp2Def3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp2Def3, "Camp2Def3")

		local pos = GetPosition("Camp2Spawn4")
		Camp2Def4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp2Def4, "Camp2Def4")


		local pos = GetPosition("Camp3Spawn1")
		Camp3Def1 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp3Def1, "Camp3Def1")

		local pos = GetPosition("Camp3Spawn2")
		Camp3Def2 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp3Def2, "Camp3Def2")

		local pos = GetPosition("Camp3Spawn3")
		Camp3Def3 = AI.Entity_CreateFormation(7, Entities.PU_LeaderBow4,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp3Def3, "Camp3Def3")

		local pos = GetPosition("Camp3Spawn4")
		Camp3Def4 = AI.Entity_CreateFormation(7, Entities.PU_LeaderRifle2,0,8,pos.X,pos.Y,0,0,3,0)
		SetEntityName(Camp3Def4, "Camp3Def4")


	createBriefingPrelude()

	NPCMiner()

	StartJob("PricessDies")

	StartJob("MorBoii")



end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "PricessDies"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_PricessDies = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("Dario","DetectPoint1", 9000) or IsNear("Comp1","DetectPoint1", 9000)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_PricessDies = function()
	-------------------------------------------------------------------------------------------------------------------

		SetHealth("player1",30)
		SetHealth("Build1",20)
		SetHealth("Build2",20)
		SetHealth("Build3",20)
		SetHealth("Build666",20)
		Logic.SetDiplomacyState( 4, 7, Diplomacy.Hostile )
		createBriefingPrincessDies()
		DestroyEntity("Princess")
		StartJob("GuardsDown")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "GuardsDown"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_GuardsDown = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Guard1") and IsDead("Guard2")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_GuardsDown = function()
	-------------------------------------------------------------------------------------------------------------------

		NPCFather()
		Logic.SetShareExplorationWithPlayerFlag(1, 2, 1)

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "MorBoii"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_MorBoii = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("Dario") and IsDead("Comp1") and CacatDeBug == 0

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_MorBoii = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()

		return true


	end