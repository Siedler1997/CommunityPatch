
createBriefingScoutDies = function()

		briefingScoutDies 				= 	{}	
		briefingScoutDies.finished 			= 	BriefingScoutDiesFinished

		CreateEntity(4,Entities.PU_Scout,GetPosition("ScoutStartRun"),"DeadScout")
		Move("DeadScout","ScoutEndPoint")
		StartJob("SpawnWolves")
		StartJob("KillTheScout")


		local page = 0

	--	page
	
		page = page +1
	
		briefingScoutDies[page] 			= 	{}
		briefingScoutDies[page].title			= 	String.Key("briefingScoutDies[1].title") 
		briefingScoutDies[page].text			=	String.Key("briefingScoutDies[1].text")
		briefingScoutDies[page].position		=	GetPosition("ScoutEndPoint")
		briefingScoutDies[page].explore			=	1500

	--	page
	
		page = page +1
	
		briefingScoutDies[page] 			= 	{}
		briefingScoutDies[page].title			= 	String.Key("briefingScoutDies[2].title") 
		briefingScoutDies[page].text			=	String.Key("briefingScoutDies[2].text")
		briefingScoutDies[page].position		=	GetPosition("ScoutEndPoint")


	
		StartBriefing(briefingScoutDies)
		
end
	
   BriefingScoutDiesFinished = function()
	
   end
	

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SpawnWolves"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SpawnWolves = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsNear("DeadScout","ScoutEndPoint",200)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_SpawnWolves = function()
	-------------------------------------------------------------------------------------------------------------------

		CreateEntity(3,Entities.CU_AggressiveWolf_Grey,GetPosition("Wolf1"),"Wolfie1")
		CreateEntity(3,Entities.CU_AggressiveWolf_Grey,GetPosition("Wolf2"),"Wolfie2")
		CreateEntity(3,Entities.CU_AggressiveWolf_Grey,GetPosition("Wolf3"),"Wolfie3")
		CreateEntity(3,Entities.CU_AggressiveWolf_Grey,GetPosition("Wolf4"),"Wolfie4")
		CreateEntity(3,Entities.CU_AggressiveWolf_Grey,GetPosition("Wolf5"),"Wolfie5")
		CreateEntity(3,Entities.CU_AggressiveWolf_Grey,GetPosition("Wolf6"),"Wolfie6")
		CreateEntity(3,Entities.CU_AggressiveWolf_Grey,GetPosition("Wolf7"),"Wolfie7")

		Attack("Wolfie1","DeadScout")
		Attack("Wolfie2","DeadScout")
		Attack("Wolfie3","DeadScout")
		Attack("Wolfie4","DeadScout")
		Attack("Wolfie5","DeadScout")
		Attack("Wolfie6","DeadScout")
		Attack("Wolfie7","DeadScout")

		return true


	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "KillTheScout"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_KillTheScout = function()
	-------------------------------------------------------------------------------------------------------------------

                return IsDead("DeadScout")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_KillTheScout = function()
	-------------------------------------------------------------------------------------------------------------------

		start1stChapter()
		DestroyEntity("Wolfie1")
		DestroyEntity("Wolfie2")
		DestroyEntity("Wolfie3")
		DestroyEntity("Wolfie4")
		DestroyEntity("Wolfie5")
		DestroyEntity("Wolfie6")
		DestroyEntity("Wolfie7")

		return true


	end