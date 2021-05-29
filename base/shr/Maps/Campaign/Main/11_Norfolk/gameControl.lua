-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	escort messanger
--
-------------------------------------------------------------------------------------------------------------------------







start1stQuest = function()

	WinterAttackCountdown = 1200
	WinterAttackAttackRunning = false
	WinterTime = 4200 -- 4200 Zeit bis Wintereinbruch

--	Input.KeyBindDown (Keys.NumPad8, "setupNorfolkWinterArmy()")
--	Input.KeyBindDown (Keys.NumPad9, "startNorfolkWinterAttack()")
--	Input.KeyBindDown (Keys.NumPad7, "Logic.AddWeatherElement(3, 20000, 0, 3, 5, 10)")

	MessengerTalkCounter	= 0
	MessengerTalkToCounter = 0
	MessengerTalked={}
	MessengerWaypoint = 1

	Report("start 1st quest")

	-- defeat conditions

	AddDefeatEntity("HQ")
	AddDefeatEntity("P3HQ")

	--	ai
	
	AI.Army_EnableLeaderAi(GetEntityId("Messenger"), 0)
	
	createPlayer2()
	createPlayer3()
	createPlayer4()
	
	--	briefing

--	createBriefingPrelude()
	
	--	quests

	createQuestEscortMessenger()

	InitNPCLookAt("Monk")
	InitNPCLookAt("HolzMichl")
	

	StartCutscene("Intro", createBriefingPrelude)
	--	StartCutscene("Intro")
end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

	DisableNpcMarker("Messenger")

	MessengerDone = true

	ResolveBriefing(MessengerAttacker1Page)
	ResolveBriefing(MessengerAttacker2Page)
	ResolveBriefing(MessengerAttacker3Page)

	start2ndQuest()

end	

-------------------------------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	find leonardo
--
-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
				
	Report("start 2nd quest")	
	
	Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

	--	briefing
	
	createBriefingMayor()
	
	createQuestReachLeo()

	if IsBriefingActive() ~= true 
		then
		Move("MayorNPC", "MayorTarget")

		else
		StartJob("DelayBriefing")

		end
		
	--	quests

	createQuestWinterAttack()
	createQuestProtectNorfolk()
	
	EnableNpcMarker("Leonardo")
	InitNPC("Leonardo")
	SetNPCLookAtTarget("Leonardo", 1)

	EnableNpcMarker("IronNPC")
	InitNPC("IronNPC")
	SetNPCLookAtTarget("IronNPC", 1)

	--StartCountdown(60, Action_WeatherChange, false)
end

-------------------------------------------------------------------------------------------------------------------------
	
end2ndQuest = function()	

	Report("end 2nd quest")

	-- Allow weather machine
--	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 2)
--	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 2)
--	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 2)
	talkedToLeonardo = true

	if FindLeoPage ~= nil then
		ResolveBriefing(FindLeoPage)
	end
	
	start3rdQuest()
end
			

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	defend norfolk
--
-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()

	Report("start 3rd quest")

	--	briefing
	
	createBriefingLeonardo()

	--	quests
	
--	createQuestDefendNorfolk()
end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()	

	Report("end 3rd quest")
	
	if BarbariansPage~= nil then
--		ResolveBriefing(BarbariansPage)
--		ResolveBriefing(KerberosPage)
	end
	
--	if NorfolkPage~= nil then
--		ResolveBriefing(NorfolkPage)
--	end
--	if NorfolkPage~= nil then
--		ResolveBriefing(NorfolkPage)
--	end
	
	if BuildIronTowers1Page ~= nil then
		ResolveBriefing(BuildIronTowers1Page)
		ResolveBriefing(BuildIronTowers2Page)
	end
		
	DisableNpcMarker("IronNPC")	
	DisableNpcMarker("Monk")

	
	if IsBriefingActive() ~= true then

		StartCutscene("MissionComplete")
		Report("Victory")
		Victory()
	else
		Report("Briefing Delayed!!!")
		StartJob("DelayBriefingPreExtro")
	
	end
	


end

	
	----------------------------------------------------------------
	Condition_DelayBriefingPreExtro = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefingPreExtro = function()                                  
	----------------------------------------------------------------
		                                                            
		StartCutscene("MissionComplete")
		Report("Victory")
		Victory()

	end
	






-------------------------------------------------------------------------------------------------------------------------
--
--									1st Sub Quest:	Heal Priest
--
-------------------------------------------------------------------------------------------------------------------------


start1stSubQuest = function()

	Report("start 1st sub quest")

	--	briefing

	ResolveBriefing(MonkPage)	
	createBriefingPriest()

	--	quests
	
	start2ndSubQuest()
	start3rdSubQuest()
end

-------------------------------------------------------------------------------------------------------------------------

end1stSubQuest = function()	

	Report("end 1st sub quest")

	--	healed
	DestroyEntity("rock1")
	DestroyEntity("rock2")

	Tools.GiveResouces(gvMission.PlayerID, 3000)
	
	MonkQuestDone	=	true		
end


-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Sub Quest:	Get water
--
-------------------------------------------------------------------------------------------------------------------------


start2ndSubQuest = function()

	Report("start 2nd sub quest")

	--	quests
	
	createQuestGetWater()

end

-------------------------------------------------------------------------------------------------------------------------

end2ndSubQuest = function()	

	Report("end 2nd sub quest")

	ResolveBriefing(GetWaterPage)

	GotOnePotionPart()
	
	-- multiple ways...ingredients or monk
	createBriefingWater()
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
GotOnePotionPart = function()

	if potionCount ~= nil then
		
		potionCount		= 2
		talkedToMonk	= nil
		havePotion		= true
		
		EnableNpcMarker("Monk")
	else
		potionCount = 1
	end
	
end
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Sub Quest:	Get ingredients
--
-------------------------------------------------------------------------------------------------------------------------


start3rdSubQuest = function()

	Report("start 3rd sub quest")

	--	quests
	
	createQuestGetIngredients()
	
end

-------------------------------------------------------------------------------------------------------------------------

end3rdSubQuest = function()	

	Report("end 3rd sub quest")
	
	ResolveBriefing(GetIngredients)

	GotOnePotionPart()
	
	ReplaceEntity("Ingredient", Entities.XD_ChestOpen)
	
	-- multiple ways...water or monk
	createBriefingIngredients()
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
	if _npcId == GetID("Messenger") then
		-- Send messanger to waypoint
		Move("Messenger", "Waypoint"..MessengerArmy.waypoint)
		
		if _heroId == GetID("Dario") then

		MessengerTalkToCounter = MessengerTalkToCounter + 1
		if MessengerTalkToCounter >= 5 then
			MessengerTalkToCounter = 5
		end
	
		SpokenMessage(String.MainKey.."MessengerRandom"..MessengerTalkToCounter)
		
	
	--		Message(XGUIEng.GetStringTableText(String.MainKey.."MessengerRandom1"))
	--		Message("Please help me to reach Norfolk.")
	end
			
--	elseif _npcId == GetID("Leonardo") then	
--
--		-- already done
--		if talkedToLeonardo == nil then
--
--			end2ndQuest()
--			
--			talkedToLeonardo = true
--		end
--
	elseif _npcId == GetID("Monk") then	

				-- already done
			if talkedToMonk == nil then
	
				if havePotion == nil then
	
					start1stSubQuest()
				
				else
				
					createBriefingPriestHealed()
				
					ResolveBriefing(MonkPage)
				end
				
				talkedToMonk = true
		
			end
		
	elseif _npcId == GetID("IronNPC") then
		
		if talkedToIronNPC == nil then
			
			createBriefingIronMines()
			
			talkedToIronNPC = true
			
		end
		


	elseif _npcId == GetID("HolzMichl") then
		
		if talkedToHolzMichl == nil then
			
			createBriefingHolzMichl()
			
			talkedToHolzMichl = true
			
		end
		
	end

end



----------------------------------------------------------------
Condition_DelayBriefing = function()                               
                                                                   
	if IsBriefingActive() ~= true then
	                                                            
		return true
	end

return false
			                                                            
end                                                             
                                                                   
----------------------------------------------------------------
Action_DelayBriefing = function()                                  

Move("MayorNPC", "MayorTarget")
local ID = GetID("MayorNPC")
Logic.RotateEntity(ID, 180)
                                                            
return true

end

