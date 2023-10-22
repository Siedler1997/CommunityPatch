-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	meet with major ( end of major briefing)
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")

	-- NPCs
		InitMapNPCs()

	-- Meet Mayor of Tendel

		InitNPC("Major")
		SetNPCLookAtTarget("Major", 1)
		SetNPCWaypoints("Major", "MajorPatrol", 10)
		EnableNpcMarker("Major")
	
	-- Meet Leonardo

		InitNPCLookAt("leonardo")
		--	SetNPCLookAtTarget("leonardo",1)
		--	EnableNpcMarker("leonardo")

	-- enable important NPCs

		InitNPC("Seer")
		EnableNpcMarker("Seer")
--		InitNPCLookAt("TellAboutViewPoint")

	--	briefing

		createBriefingPrelude()
	
	--	quests

		createQuestDefeat()
		createQuestJoiningTowers()
		createQuestRewards()
		createQuestGates()

	-- Daughters prison is invulnerable
		if CP_Difficulty == 2 then
			MakeInvulnerable("P5DefenseGenerator1")
		else
			MakeInvulnerable("Prison")
		end
		
		MakeInvulnerable("ChurchRuin")

	-- Start Countdown for cutscene AriPilgrim (5 minutes after first attack)
	
		TimeLine.Enter("Start AriPilgrimDialog", TimeLine.Seconds + ARMYRAIDING_FIRSTATTACK + 8.5*60, "startCutscene_AriPilgrimDialog")
	
end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

	ResolveBriefing(meetMajor)

	start2ndQuest()
	start3rdQuest()

	Logic.SetShareExplorationWithPlayerFlag(1, 6, 1)

	-- Daughters prison is vulnerable again
	if CP_Difficulty == 2 then
		MakeVulnerable("P5DefenseGenerator1")
	else
		MakeVulnerable("Prison")
	end
	
	MakeVulnerable("ChurchRuin")

end	

-------------------------------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	build up cathedral(establish)
--
-------------------------------------------------------------------------------------------------------------------------


-- Quest: build Cathedral
start2ndQuest = function()
				
	Report("start 2nd quest")				

	--	briefing			

	createBriefingMajor()


	--	quests
	
	createQuestCathedral()

end

-------------------------------------------------------------------------------------------------------------------------
	
	
-- Cathedral is build
end2ndQuest = function()	

	Report("end 2nd quest")

	ResolveBriefing(BriefingMajor[MajorCathedralBuilt])

	MajorQuestDone()
end
			

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	Rescue daughter(daughter back to major)
--
-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()

	Report("start 3rd quest")

	--	quests
	
	createQuestRescueDaughter()

end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()	

	Report("end 3rd quest")

	ResolveBriefing(BriefingMajor[MajorPrincessFreed])
		
	start7thQuest()
	
end


-- Quest: bring princess home
start7thQuest = function()

	createBriefingDaughter()

	createQuestBringDaughterBack()

end


-- princess ist back home at major
end7thQuest = function()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechs(2, true)
		ResearchAllMilitaryTechs(4, true)
		ResearchAllMilitaryTechs(5, true)
		ResearchAllMilitaryTechs(6, true)	--No enemy, but has to be useful
		ResearchAllMilitaryTechs(7, true)
	end

	MajorQuestDone()
	
	ResolveBriefing(BringDaughterQuest)
	DisableNpcMarker("Princess")

	InitNPC("Major")
	Move("Princess","Major")
	Move("Major","Princess")

	-- Daughter arrives at home; player gets money reward
	--	check if briefing is active
	if IsBriefingActive() ~= true then
		createBriefingDaughterReturns()
	else
		MapBriefing_Started7 = StartJob("DelayBriefing7")
	end

end
	
	----------------------------------------------------------------
	Condition_DelayBriefing7 = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
			return true
		end

		return false
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefing7 = function()                                  
	----------------------------------------------------------------
		                                                            
		createBriefingDaughterReturns()
	
		EndJob(MapBriefing_Started7)

	end




MajorQuestDone = function()

	-- Both major quests done?
	if FirstMajorQuestDone ~= nil then

		-- This is second quest that is done, continue with mission
		start4thQuest()
		EnableNpcMarker("leonardo")

	else
		
		FirstMajorQuestDone = true
		
	end
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									4th Quest:	Meet leonardo (end of leonardo briefing)
--
-------------------------------------------------------------------------------------------------------------------------


start4thQuest = function()

	Report("start 4th quest")

	--	quests
	
		--	check if briefing is active
		if IsBriefingActive() ~= true then
	
			createBriefingMeetLeonardo()		
		
--			InitNPC("leonardo")
--			SetNPCLookAtTarget("leonardo",1)
			InitNPCLookAt("leonardo")
			QuestsFromMayorDone = true

		else

			MapBriefing_Started = StartJob("DelayBriefing")

		end
	
	end



	
	----------------------------------------------------------------
	Condition_DelayBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             
 
 
 
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefing = function()                                  
	----------------------------------------------------------------
		                                                            
		createBriefingMeetLeonardo()
	
--		InitNPC("leonardo")
--		SetNPCLookAtTarget("leonardo",1)
		EnableNpcMarker("leonardo")
		QuestsFromMayorDone = true

		EndJob(MapBriefing_Started)

	end
	
--	createBriefingMeetLeonardo()
--
--	InitNPC("leonardo")
--	SetNPCLookAtTarget("leonardo",1)
--	EnableNpcMarker("leonardo")


-------------------------------------------------------------------------------------------------------------------------

end4thQuest = function()	

	Report("end 4th quest")

	ResolveBriefing(BriefingMeetLeonardo[MeetLeonardo_Marker])

end


-------------------------------------------------------------------------------------------------------------------------
--
--									5th Quest:	Buildup Mines for Leonardo (establish)
--
-------------------------------------------------------------------------------------------------------------------------



start5thQuest = function()

	Report("start 5th quest")

	--	quests
	
	createQuestBuildMines()

	-- 	briefing
--	createBriefingLeonardo()

end

-------------------------------------------------------------------------------------------------------------------------

end5thQuest = function()	

	Report("end 5th quest")
	
	start6thQuest()

end

-------------------------------------------------------------------------------------------------------------------------
--
--									6th Quest:	Get Orb (Destroy)
--
-------------------------------------------------------------------------------------------------------------------------


start6thQuest = function()

	Report("start 6th quest")

	--	ai
	
		setupArmyDespair()

	--	quests
	
		createQuestDestroyOutpost()
		
	-- Enable defending army of tendrel
		
		StartTendrelDefense()

	-- 	briefing

		if IsBriefingActive() ~= true then
	
			createBriefingLabyrinth()		
		
		else

			MapBriefing_Started = StartJob("DelayBriefing6")

		end
	
	----------------------------------------------------------------
	Condition_DelayBriefing6 = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true

		end

		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefing6 = function()                                  
	----------------------------------------------------------------
		                                                            
		createBriefingLabyrinth()
	
	end

end



-------------------------------------------------------------------------------------------------------------------------

end6thQuest = function()	

	Report("end 6th quest")

	ResolveBriefing(OrbQuest)
	ResolveBriefing(EntraceExploration)

	StartCutscene("MissionComplete", Victory)

end



-------------------------------------------------------------------------------------------------------------------------

startCutscene_AriPilgrimDialog = function()

		--	check if briefing is active
		if IsBriefingActive() ~= true then
			StartCutscene("AriPilgrim")
		else
			CutsceneAriPilgrim_Started = StartJob("DelayCutsceneAriPilgrim")
		end
	
end
	
	----------------------------------------------------------------
	Condition_DelayCutsceneAriPilgrim = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
			return true
		end
		return false
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayCutsceneAriPilgrim = function()                                  
	----------------------------------------------------------------
		                                                            
		StartCutscene("AriPilgrim")
		EndJob(CutsceneAriPilgrim_Started)
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


	-- Hero is talking to build up npc
	if _npcId == GetID("Major") then
		
		if _heroId == GetID("dario") then			-- only talks to Dario

			-- already done
			if talkedToMajor == nil then

				end1stQuest()
			
				talkedToMajor = true
			end
		else
		
			SpokenMessage(String.MainKey.."Message_DarioMustTalk")
			
		end
		

		
	elseif _npcId == GetID("leonardo") then	

		-- First time at Leonardo
		if _heroId == GetID("dario") then			-- only talks to Dario

			if talkedToLeonardo == nil then			-- player talkes to Leonardo first time
		
				if QuestsFromMayorDone == true then	-- Mayor quest is fulfilled already
					end4thQuest()					-- resolve 4th quest
				end
	
				createBriefingLeonardo()			-- two options there depending on mayor quest done or not!
				start5thQuest()						-- Start build sulfur mines quest
	
				talkedToLeonardo = 1				-- player talked to Leonardo, got quest
			
				ReplaceEntity("LeoGate", Entities.XD_WallStraightGate)
			
	--			Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)
	
			else									-- Player was at Leo before and is now sent by mayor of Tendel
													-- after he fulfilled there the quests (quest 2 and 3)	
				if MinesBuild ~= 4 then
					createBriefingAgainAtLeonardo()			-- a) Leonardo quest not done yet
				else									
					if QuestsFromMayorDone == true then		-- and all Major quests are done

						end4thQuest()						-- resolve 4th quest (get Gunpowder)
						end5thQuest()						-- b) Leonardo quest done, start next quest
						
					else									-- c) Leonardo thanks only	
						
						createBriefingAgainAtLeonardoThanks()
						
					end
				end									
	
			end
	
			DisableNpcMarker("leonardo")
			
		else
		
			SpokenMessage(String.MainKey.."Message_DarioMustTalk")
			
		end
		
	elseif _npcId == GetID("Princess") then	

		-- already done
		if talkedToPrincess == nil then

			end3rdQuest()
			
			talkedToPrincess = true
		else
			
			SpokenMessage(String.MainKey.."Message_BringPrincessBack")
		
		end

	elseif _npcId == GetID("Seer") then	

		-- already done
		if talkedToSeer == nil then

			Report ("Talk to Seer!")

			StartCutscene("Seer")
			
			talkedToSeer = true
			DisableNpcMarker("Seer")
		
		end

	elseif _npcId == GetID("TellAboutViewPoint") then	

		createBriefingViewPoint()
		createQuestReachViewPoint()
		
	end
	
	
	----------------------------------------------------------------------------------------
	--	Tipp-giving NPCs without quests; TF_include

		MapLocal_npcCheck(_heroId,_npcId)

	----------------------------------------------------------------------------------------
	
end