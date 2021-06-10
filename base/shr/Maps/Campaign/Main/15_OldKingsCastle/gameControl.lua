-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	talk to garek
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")

	InitMapNPCs()

	-- Enable BuildUpNPC
	InitNPCLookAt("Garek")
	
	--	ai
	
	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer5()
	createPlayer6()
	
	--	briefing

	createBriefingPrelude()
	
	--	quests
	
	AddDefeatEntity("HQ")
	
	createQuestDefeat()
	createQuestWinterGate()
	createQuestRewards()
	
	start3rdSubQuest()
	start6thSubQuest()
	start7thSubQuest()

end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

	Logic.AddWeatherElement(3, 10000000, 0, 3, 5, 10)

	ResolveBriefing(MeetGarekPage)

	-- Generate resources
	GlobalMissionScripting.GiveResouces(GetHumanPlayer(),500,1200,1200,1000,500,200)

	-- Give towers
		--	ChangePlayer("OldKingsCastle",gvMission.PlayerID)
local i
	for i=1,3 do
		ChangePlayer("Tower"..i,gvMission.PlayerID)
	end

	start2ndQuest()
end	

-------------------------------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	rescue village
--
-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
				
	Report("start 2nd quest")				
			
	--	briefing

	createBriefingGarek()

	--	quests
	
	createQuestRescueVillage()

end

-------------------------------------------------------------------------------------------------------------------------
	
end2ndQuest = function()	

	Report("end 2nd quest")

	ResolveBriefing(rescueVillagePage)
	
	
	start3rdQuest()
	start8thSubQuest()
end
			

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	Sommer
--
-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()

	Report("start 3rd quest")

	--	ai
	
	TimeLine.Enter("Start P2VAttack", TimeLine.Seconds + 10*60, "StartArmyP2VillageAttack")
	if CP_Difficulty == 0 then
		TimeLine.Enter("Setup Army P5 Upgrading", TimeLine.Seconds + 10*60, "SetupArmyP5Upgrading")
	end


	--	briefing

	createBriefingSommer()
	
	--	quests
	
	createQuestSommer()

	createQuestLeonardo()

	--createQuestDestroyRuins()
	createQuestRebuildCastle()

	-- give player a HQ
		
	ChangePlayer("HQ",gvMission.PlayerID)

end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()	

	Report("end 3rd quest")

	ResolveBriefing(sommerPage)

	start4thQuest()	
	
end


-------------------------------------------------------------------------------------------------------------------------
--
--									4th Quest:	Defeat kerberos
--
-------------------------------------------------------------------------------------------------------------------------


start4thQuest = function()

	Report("start 4th quest")

	--	ai
	
	TimeLine.Enter("Start P5 Attack", 5*60+TimeLine.Seconds, "StartArmyP5Attack")

	-- 	briefing
	
	createBriefingKerberos()

	--	quests
	
	createQuestDefeatKerberos()

	DestroyEntity("RockNorth")
	DestroyEntity("RockNorth2")

end

-------------------------------------------------------------------------------------------------------------------------

end4thQuest = function()	

	Report("end 4th quest")


	ResolveBriefing(kerberosAttackExplorePage)
	ResolveBriefing(defeatKerberosPage)

	Logic.SetDiplomacyState( 6, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )

	kerberosGivedUp = true

	start5thQuest()
end


-------------------------------------------------------------------------------------------------------------------------
--
--									5th Quest:	reach exit
--
-------------------------------------------------------------------------------------------------------------------------


start5thQuest = function()

	Report("start 5th quest")

	-- 	briefing
	
	createBriefingNeutralKerberos()

	--	quests
	
	createQuestReachExit()

end

-------------------------------------------------------------------------------------------------------------------------

end5thQuest = function()	

	Report("end 5th quest")

	ResolveBriefing(reachExitPage)
	
	StartCutscene("MissionComplete", Victory)
end


-------------------------------------------------------------------------------------------------------------------------
--
--									1st Sub Quest:	rech bergstadt
--
-------------------------------------------------------------------------------------------------------------------------

start1stSubQuest = function()

	Report("start 1st sub quest")

	InitNPC("BergstadtNPC")
	SetNPCLookAtTarget("BergstadtNPC",1)
	EnableNpcMarker("BergstadtNPC")


end




end1stSubQuest = function()

	Report("end 1st sub quest")

	ResolveBriefing(reachBergstadtPage)

	start2ndSubQuest()
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Sub Quest:	tribute for bergstadt
--
-------------------------------------------------------------------------------------------------------------------------

start2ndSubQuest = function()

	Report("start 2nd sub quest")

	--	briefing
	
	createBriefingBergstadt()
	
	--	quest
	createQuestTributeBergstadt()
end



end2ndSubQuest = function()


	Report("end 2nd sub quest")

	ResolveBriefing(BergstadtTributePage)
	
	createBriefingBergstadtAttack()
	
	-- share Exploration
		Logic.SetShareExplorationWithPlayerFlag(1, 6, 1)

	setupArmyP6Attack()
	
	DestroyEntity("RockSouth")
	
	if kerberosGivedUp == nil then
		Logic.SetDiplomacyState( 6, 5, Diplomacy.Hostile )
	end

end

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Sub Quest:	closed gate
--
-------------------------------------------------------------------------------------------------------------------------

start3rdSubQuest = function()

	Report("start 3rd sub quest")

	--	quest
	
	createQuestClosedGate()

	start4thSubQuest()
end

end3rdSubQuest = function()

	Report("end 3rd sub quest")

	-- no key found yet
	if haveGate1Key == nil then
		createBriefingGetKey()
	end

end

-------------------------------------------------------------------------------------------------------------------------
--
--									4th Sub Quest:	Get Key
--
-------------------------------------------------------------------------------------------------------------------------

start4thSubQuest = function()

	Report("start 4th sub quest")

	--	quest
	
	createQuestGetKey()

end

end4thSubQuest = function()

	Report("end 4th sub quest")

	SpokenMessage(String.MainKey.."Message_KeyFound")
	
	ReplaceEntity("GateKey1", Entities.XD_ChestOpen)
	
	haveGate1Key = true

	if KeyPage ~= nil then
		ResolveBriefing(KeyPage)
	end

	start5thSubQuest()
end

-------------------------------------------------------------------------------------------------------------------------
--
--									5th Sub Quest:	Open Gate
--
-------------------------------------------------------------------------------------------------------------------------

start5thSubQuest = function()

	Report("start 5th sub quest")

	--	quest
	
	createQuestOpenGate()

end

end5thSubQuest = function()

	Report("end 5th sub quest")

	if GateOpened == nil then
		
		SpokenMessage(String.MainKey.."Message_GateOpened")

		ReplaceEntity("Gate1", Entities.XD_WallStraightGate)
		GateOpened = true
		start1stSubQuest()
	
	end

end


-------------------------------------------------------------------------------------------------------------------------
--
--									6th Sub Quest:	Aris Friends
--
-------------------------------------------------------------------------------------------------------------------------

start6thSubQuest = function()

	Report("start 6th sub quest")

	--	quest
	
	createQuestAriFriends()

end

end6thSubQuest = function()

	Report("end 6th sub quest")

	createBriefingAriFriends()

end

-------------------------------------------------------------------------------------------------------------------------
--
--									7th Sub Quest:	Ari and Helias died
--
-------------------------------------------------------------------------------------------------------------------------

start7thSubQuest = function()

	Report("start 7th sub quest")

	--	quest
	
	createQuestAriHeliasDead()

end

end7thSubQuest = function()

	Report("end 7th sub quest")

	if IsAlive("RockSouth") and IsAlive("RockNorth") then
		createBriefingAriHeliasDied()
		
		haveGate1Key = true
		
		if GateOpened == nil then
			
			GateOpened = true
			ReplaceEntity("Gate1", Entities.XD_WallStraightGate)
			start1stSubQuest()
			
		end
	end

end

-------------------------------------------------------------------------------------------------------------------------
--
--									8th Sub Quest:	Iron Mine
--
-------------------------------------------------------------------------------------------------------------------------

start8thSubQuest = function()

	Report("start 8th sub quest")

	--	quests
	
	createQuestBuildNearIron()

end

end8thSubQuest = function()

	Report("end 8th sub quest")

	TimeLine.Enter("Start attacking Mine", TimeLine.Seconds +  10*60, "StartArmyP2IronAttack")

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


	if _npcId == GetID("BergstadtNPC") then	

		-- Is not helias
		if _heroId == GetEntityId("Ari") then
			
			SpokenMessage(String.MainKey.."Message_TalkToHelias")
			
		else

			-- already done
			if talkedToBergstadtNPC == nil then
	
				end1stSubQuest()
				
				talkedToBergstadtNPC = true
			end

		end
		
	end
	
	if _npcId == GetID("Leonardo") then	

			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

				StartBriefing(briefingLeonardo)
			
				destroyQuestLeonardo()					

			end
				
	end


	----------------------------------------------------------------------------------------
	--	Tipp-giving NPCs without quests; TF_include

		MapLocal_npcCheck(_heroId,_npcId)

	----------------------------------------------------------------------------------------

end