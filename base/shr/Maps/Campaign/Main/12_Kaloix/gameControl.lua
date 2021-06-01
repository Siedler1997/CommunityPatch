-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	Tribute to countess village 
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")

	--	ai
	
	createPlayer4()
	createPlayer2()
	createPlayer7()
	
	EnableNpcMarker("wiseguy")
	InitNPCLookAt("wiseguy")

	--	briefing
	
--	StartCutscene("Intro")

--	createBriefingPrelude()

	createQuestBuildUpCountessVillage()
	
	createQuestDefendCountessVillage()
	createQuestDefeat()
		
	start2ndQuest()
	start5thSubQuest() 
	StartCutscene("Intro", createBriefingPrelude)
end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

	ResolveBriefing(briefingPrelude[2])

	-- Let countess serf run to dario
--	EnableNpcMarker("CountessSerf")

	-- Let serf run to dario
--	InitNPC("CountessSerf")
--	SetNPCLookAtTarget("CountessSerf",1)
--	SetNPCFollow("CountessSerf", 1, 1000)
--	EnableNpcMarker("CountessSerf")

	Logic.SetShareExplorationWithPlayerFlag(1, 4, 1)
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )

	start3rdQuest()

end	

-------------------------------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	Destroy KI1 and defend village (attack KI1)
--
-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
				
	Report("start 2nd quest")				
			
	--	ai
	
	createPlayer6()
							
	--	briefing
	
	createQuestDestroyKI1()

	end

-------------------------------------------------------------------------------------------------------------------------
	
end2ndQuest = function()	

	Report("end 2nd quest")

	ResolveBriefing(briefingPrelude[4])
	ResolveBriefing(briefingPrelude[5])

	StartCutscene("MissionComplete")
	Victory()
end

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	(build up village)
--
-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()
				
	Report("start 3rd quest")				
			
					
	--	briefing
	
	createBriefingTributePaid()

	--	quest

	createQuestCountessVillageTributePaid()

end

-------------------------------------------------------------------------------------------------------------------------
	
end3rdQuest = function()	

	Report("end 3rd quest")
	
--	start1stSubQuest()
	start0stSubQuest()
end

	


-------------------------------------------------------------------------------------------------------------------------
--
--									0st Sub Quest:	TalkToMorfichet
--
-------------------------------------------------------------------------------------------------------------------------

start0stSubQuest = function()

	Report("start 0st sub quest")


	EnableNpcMarker("Morfichet")
	InitNPCLookAt("Morfichet")
	
	createBriefingMorfichet()
	-- Give foundry to player
		Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 3)
	
end

end0stSubQuest = function()

	Report("end 0st sub quest")
	ResolveBriefing(briefingMorfichet[2])
	start1stSubQuest()


end



-------------------------------------------------------------------------------------------------------------------------
--
--									1st Sub Quest:	Buy Stone Mine.
--
-------------------------------------------------------------------------------------------------------------------------

start1stSubQuest = function()

	Report("start 1st sub quest")

	--TK Flag, damit Warnung vor Rot nur 1x kommt
	RedAttackToggle = 0 

	--	quest

	createQuestBuyStoneMine()
		
	--	briefing
		
	createBriefingMines()

	

	start2ndSubQuest()
end

end1stSubQuest = function()

	Report("end 1st sub quest")

	ResolveBriefing(briefingMines[3])
	if tributeToRedPaid == nil then
		StartKI2_Attack()
		createBriefingRedAttack()
	end
	start6thSubQuest()
end

-------------------------------------------------------------------------------------------------------------------------
--
--									2st Sub Quest:	Buy Clay Mine.
--
-------------------------------------------------------------------------------------------------------------------------

start2ndSubQuest = function()

	Report("start 2nd sub quest")

	-- quest
		createQuestBuyClayMine()

	start3rdSubQuest()

end
end2ndSubQuest = function()

--	Break()

	Report("end 2nd sub quest")

	ResolveBriefing(briefingMines[4])
	if tributeToRedPaid == nil then
		StartKI2_Attack()
		createBriefingRedAttack()
	end
	start6thSubQuest()

end	

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Sub Quest:	Buy Iron Mine.
--
-------------------------------------------------------------------------------------------------------------------------

start3rdSubQuest = function()

	Report("start 3rd sub quest")

	-- quest
		createQuestBuyIronMine()

	start4thSubQuest()
end

end3rdSubQuest = function()

	Report("end 3rd sub quest")

	ResolveBriefing(briefingMines[5])
	if tributeToRedPaid == nil then
		StartKI2_Attack()
		createBriefingRedAttack()
	end
	start6thSubQuest()
end	

-------------------------------------------------------------------------------------------------------------------------
--
--									4th Sub Quest:	Buy Sulfur Mine.
--
-------------------------------------------------------------------------------------------------------------------------

start4thSubQuest = function()

	Report("start 4th sub quest")

	-- quest
		createQuestBuySulfurMine()
end

end4thSubQuest = function()

	Report("end 4th sub quest")

	ResolveBriefing(briefingMines[6])
	if tributeToRedPaid == nil then
		StartKI2_Attack()
		createBriefingRedAttack()
	end
	
	start6thSubQuest()
end	


-------------------------------------------------------------------------------------------------------------------------
--
--									5th Sub Quest:	Destroy Red Army
--TK
---------------------------------------------------------------------------------------------------------------------------

start5thSubQuest = function()
				
	Report("start Red Destroy")				
			
	createQuestDestroyKI2()

	end

end5thSubQuest = function ()
	
	Report ("Red destroyed")
	createBriefingDestroyRedDone()
	

end
-------------------------------------------------------------------------------------------------------------------------
--
--									6th Sub Quest:	Pay Tribute to Red Army
--TK
---------------------------------------------------------------------------------------------------------------------------

start6thSubQuest = function()
				
	if tributeToRedPaid == nil then
		createQuestTributeToRed()
		end
		

	end

end6thSubQuest = function ()
	
	Report ("Tribute Paid")
	StopKI2_Attack()
	createBriefingTributeToRedPaid()
	tributeToRedPaid = true

end
	

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

		MapLocal_npcCheck(_heroId,_npcId)

	-- Hero is talking to Morfichet
	if _npcId == GetID("Morfichet") then
		
		-- already done
		if talkedToMorfichet == nil then

			-- Start sub quest
			end0stSubQuest()
			
			talkedToMorfichet = true
			DisableNpcMarker("Morfichet")

		end
	elseif _npcId == GetID("wiseguy") then
		
		-- already done
		if talkedTowiseguy == nil then

			-- Start sub quest
			createBriefingWiseguy()
			
			talkedTowiseguy = true
			DisableNpcMarker("wiseguy")

		end
		
		
		
	end

end