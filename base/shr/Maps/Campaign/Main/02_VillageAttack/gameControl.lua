-------------------------------------------------------------------------------------------------------------------------
--
--									Quest:	Move to castle
--
-------------------------------------------------------------------------------------------------------------------------

startQuestMoveToCastle = function()

	Report("start quest: move to castle")


	-- Create NPCs	TF_Include!

		InitMapNPCs() 					--MapLocal_CreateNPCs()

	-- set start army

		--	spawn support troops and deploy dario
	
		local troopDescription = {
		
			leaderType 			= Entities.PU_LeaderSword1,
			maxNumberOfSoldiers	= 4,
			minNumberOfSolderis	= 4,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			
	
		army = {}
		
		army.player 	= 	GetHumanPlayer()
		army.id			=	1
		army.position	=	GetPosition("spawn")
	
		local support1 = CreateTroop(army,troopDescription)  
		local support2 = CreateTroop(army,troopDescription)  
		
		Move(support1,"briefing1")
		Move(support2,"briefing2")
		Move("Dario","briefing3")


	--	quest

		createQuestDefeat()
		
	--	ai
	
		createArmyAttack1()			-- only create; attack job is started when defend quest starts
		createArmyAttack2()			-- only create; attack job is started when defend quest starts
		
		createArmySiege()
		
		createArmyDefendCamps()
		
		createArmyDefendMine()
		
		createArmyDefendRoute()
		
		createArmyDefendIron()
		
	--	misc

		MakeInvulnerable("castle")
		MakeInvulnerable("tower1")
		MakeInvulnerable("tower2")

	-- start with cutscene
	
		StartCutscene("Intro", initialBriefing)
		

end



initialBriefing = function()

	createBriefingMoveToCastle()

	Cutscene_Intro_CreateArmySiege()

end


-------------------------------------------------------------------------------------------------------------------------
	
endQuestMoveToCastle = function()

	MakeVulnerable("tower1")
	MakeVulnerable("tower2")

	ResolveBriefing(briefingMoveToCastle[page_supportCastle])

	if IsAlive("village0") then
	
		ChangePlayer("village0", GetHumanPlayer())

	end
	
	-->TF: 
		-- Give start resources
		-- Paramater: PlayerID, Gold, clay, wood, Stone, Iron, Sulfur
		GlobalMissionScripting.GiveResouces(GetHumanPlayer(),350, 750, 750 , 490, 100, 0)


	
	-- destroy some building, set remaining buildings and defenders under control of player
		if IsAlive("castle") then
			Logic.SetEntitySelectableFlag(Logic.GetEntityIDByName("castle"), 1)
			Logic.SetEntityUserControlFlag(Logic.GetEntityIDByName("castle"), 1)
		end
	
		for i=0,4,1 do
	
			if IsAlive("House"..i) then
		
				local house = Logic.GetEntityIDByName("House"..i)
	
				ChangePlayer(house,GetHumanPlayer())

				Logic.SetEntitySelectableFlag(house, 1)
				Logic.SetEntityUserControlFlag(house, 1)
			end

			if IsAlive("defender"..i) then
			
				ChangePlayer("defender"..i,GetHumanPlayer())
				Logic.SetEntitySelectableFlag("defender"..i, 1)
				Logic.SetEntityUserControlFlag("defender"..i, 1)
	
			end

			-- destroy some buildings
			if IsAlive("Destroy"..i) then
		
				local house = Logic.GetEntityIDByName("Destroy"..i)
				Logic.HurtEntity(house, Logic.GetEntityHealth(house) )
		
			end

			-- kill Settlers
			if IsAlive("Settler"..i) then
				Logic.DestroyEntity(Logic.GetEntityIDByName("Settler"..i))
			end

			if IsAlive("Settler"..(i+4)) then
				Logic.DestroyEntity(Logic.GetEntityIDByName("Settler"..(i+4)))
			end

		end
	
	
	-- Start Mother dies Bink	

--		StartBinkVideo("VillageAttack1")

	
	-- start next quest

		startQuestDefendCastle()

	end




-------------------------------------------------------------------------------------------------------------------------
--
--									Quest:	Defend castle
--
-------------------------------------------------------------------------------------------------------------------------

startQuestDefendCastle = function()

	Report("start quest: defend castle")

	--	briefing

--		createBriefingDefendCastlePrelude()
		StartBinkVideo("VillageAttack1")
		createBriefingDefendCastle()		-- starts at end: createQuestRescueLeonardo()

	--	quest

		createQuestDefendCastle()

		createQuestMerchant()

	--	ai
	
		 StartJob("ControlArmyAttack1")
		 StartJob("ControlArmyAttack2")
			--		createArmyAttack1()			-- is created at start
			--		createArmyAttack2()         -- is created at start

	end	

-------------------------------------------------------------------------------------------------------------------------
	
endQuestDefendCastle = function()

	ResolveBriefing(briefingDefendCastle[page_destroyTower1])
	ResolveBriefing(briefingDefendCastle[page_destroyTower2])
	ResolveBriefing(briefingDefendCastle[page_defendCastle])
	
	startQuestSearchMayor1()

end

-------------------------------------------------------------------------------------------------------------------------
--
--									Quest:	Search Mayor1 (northern village)
--
-------------------------------------------------------------------------------------------------------------------------

startQuestSearchMayor1 = function()

	Report("start quest: search mayor1")

	--	briefing
	
			--	briefing	
		if IsBriefingActive() ~= true then
			createBriefingSearchMayor1()
		else
			MayorDialog_Started = StartJob("DelayMayorDialog")
		end

	--	quest

		createQuestSearchMayor1()

end	

	----------------------------------------------------------------
	Condition_DelayMayorDialog = function()                               
	----------------------------------------------------------------
		                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end
	
		return false
				                                                            
	end                                                             


	                                                                    
	----------------------------------------------------------------
	Action_DelayMayorDialog = function()                                  
	----------------------------------------------------------------
		                                                            
		createBriefingSearchMayor1()
	
		EndJob(MayorDialog_Started)
	
	end




-------------------------------------------------------------------------------------------------------------------------
	
endQuestSearchMayor1 = function()

	Report("end quest: search mayor1")

	ResolveBriefing(briefingSearchMayor1[page_searchMayor1])
	
	startQuestSupportVillage1()
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									Quest:	Support Village 1
--
-------------------------------------------------------------------------------------------------------------------------

startQuestSupportVillage1 = function()

	Report("start quest: support village1")

	--	briefing

		-->TF		createBriefingSupportVillage1()   -- moved because of 2 different entry points
				
	--	ai
	
		createArmyCave1()
		
	--	quest
	
		createQuestDefendVillage1()
		
        Logic.SetShareExplorationWithPlayerFlag(1,4,1)

	end
	
-------------------------------------------------------------------------------------------------------------------------
	
endQuestSupportVillage1 = function()

	--	briefing
	
		ResolveBriefing(briefingSupportVillage1[page_supportVillage1])
		
	--	quest
	
		destroyQuestDefendVillage1()

	end	
	
-------------------------------------------------------------------------------------------------------------------------
--
--									Quest:	Erecs arrival
--
-------------------------------------------------------------------------------------------------------------------------
	
startQuestErecsArrival = function()

	Report("start quest: support village2")

	--	briefing
	
		createBriefingErecsArrival()	
	
	--	ai
	
		createArmyCave2()

	end
	
-------------------------------------------------------------------------------------------------------------------------
	
endQuestErecsArrival = function()

	ResolveBriefing(briefingErecsArrival[page_defendVillage2])
	
	StartCutscene("MissionComplete", Victory)	
	
	--	Victory()

end	












	
-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	-- Ignore if running briefing
	if IsBriefingActive() then
		return
	end


	if Logic.IsHero(_heroId) then
	
		if npc_merchant == nil and _npcId == GetEntityId("Merchant") then
		
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
			
				npc_merchant = 1
			
				destroyQuestMerchant()
				
				createBriefingMerchantDialog()
			
				end
				
			end

		if npc_leo == nil and _npcId == GetEntityId("Leonardo") then
		
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
			
				npc_leo = 1
			
				destroyQuestRescueLeonardo()
				
				createBriefingLeonardoDialog()

				Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Tower, 3)
				Logic.SetTechnologyState(GetHumanPlayer(),Technologies.UP1_Tower, 3 )  

--				Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_GearWheel, 3)	
		
				end
				
			end

		if IsAlive("Mayor_north") then

			if npc_mayorNorth == nil and _npcId == GetEntityId("Mayor_north") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				
					npc_mayorNorth = 1
				
--					createBriefingMayorDialog()

					-->TF Briefing	is started here because of 2 different entry points to quest				
					destroyQuestSearchMayor1()			

					createBriefingSupportVillage1()
					--	startQuestSupportVillage1()
				
					end
					
				end
	
			end
			

		
	----------------------------------------------------------------------------------------
	--	Tipp-giving NPCs without quests; TF_include

		MapLocal_npcCheck(_heroId,_npcId)

	----------------------------------------------------------------------------------------
		
	end	
	
end