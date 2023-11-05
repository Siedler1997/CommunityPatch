
-------------------------------------------------------------------------------------------------------------

create1stQuest = function()

	Report("start 1st Quest")

	--	ai

		createArmySpawn()
		
		StartSimpleJob("ControlEnemyHeroes")
		
	--	briefing

		createBriefingPrelude()
		

	--	merchants
	
        	EnableNpcMarker("merchant1")
        	EnableNpcMarker("merchant2")
        	EnableNpcMarker("Info1")
        	EnableNpcMarker("Info2")
        	EnableNpcMarker("Info3")
        	EnableNpcMarker("Info4")
        	--EnableNpcMarker("Leonardo")
        	EnableNpcMarker("Kel")

	--	quests

		StartChestQuest()
        StartJob("UnlockP4gate1")
		startQuestDefeat()
		startQuestVictory()

		StartSimpleJob("ActivateLeonardoNPC")
end

function ActivateLeonardoNPC()
	if not IsExisting("PrisonCage") then
        EnableNpcMarker("Leonardo")
		return true
	end
end
	
destroy1stQuest = function()

	ResolveBriefing(briefingPrelude[page_prelude])
	Victory()
	Report("end 1st Quest")

	end

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)
	if IsBriefingActive() then	
		return	
		end	
	if Logic.IsHero(_heroId) then
		if _npcId == GetEntityId("merchant1") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("merchant1")
				createBriefingMerchant1()
				local job = {}		
				job.Tribute = 1
				Logic.AddTribute(	GetHumanPlayer(), 
									job.Tribute,
									0,
									0,
									String.Key("merchant1"),
									ResourceType.Gold, 
									2000 )			
				job.Callback = TributePaid1
				SetupTributePaid(job)								
				end
			end
	
		end




              if Logic.IsHero(_heroId) then
		if _npcId == GetEntityId("Info1") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("Info1")
				createBriefingInfo1()
												
				end
			end
	
		end



              if Logic.IsHero(_heroId) then
		if _npcId == GetEntityId("Info2") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("Info2")
				createBriefingInfo2()
												
				end
			end
	
		end





              if Logic.IsHero(_heroId) then
		   if _npcId == GetEntityId("Info3") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("Info3")
				createBriefingInfo3()
												
			end
		   end
	
	       end




              if Logic.IsHero(_heroId) then
		   if _npcId == GetEntityId("Info4") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("Info4")
				createBriefingInfo4()
												
			end
		   end
	
	       end



              if Logic.IsHero(_heroId) then
		if _npcId == GetEntityId("Kel") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("Kel")
				createBriefingKel()
												
				end
			end
	
		end



	if Logic.IsHero(_heroId) then
          if _npcId == GetEntityId("merchant2") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("merchant2")
				createBriefingMerchant2()
				local job = {}		
				job.Tribute = 2
				Logic.AddTribute(	GetHumanPlayer(), 
									job.Tribute,
									0,
									0,
									String.Key("merchant2"),
									ResourceType.Wood, 
									1000 )	

                                 

                                 job.Spawn         = { { Pos = "p8barracks", 
                                                         LeaderType       = Entities.PU_LeaderSword4, 
                                                         Soldiers         = 8,
                                                                                 } }

                                 job.Ralleypoint = "player1"

		
				job.Callback = TributePaid2
				SetupTributePaid(job)								
				end
			end
	
		end





	if Logic.IsHero(_heroId) then
		if npc_leo == nil and _npcId == GetEntityId("Leonardo") then
			if not IsExisting("PrisonCage") and IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("Leonardo")
				createBriefingLeonardo()
                burnTowers()
			end	
		end
    end		
end


TributePaid1 = function()

                Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 3)
                Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Tower, 3)

	end


TributePaid2 = function()



	end


----------------------------------------------------------------------------------------------------------------------- 
--
--          JOB: "UnlockP4gate1"
--
----------------------------------------------------------------------------------------------------------------------- 

            Condition_UnlockP4gate1 = function()


                        return IsNear("Dario", "gatekey1", 1000) and IsDead("player5")
                   

                        end


            -------------------------------------------------------------------------------------------------------------------

            Action_UnlockP4gate1 = function()

            -------------------------------------------------------------------------------------------------------------------

                        ReplaceEntity("gatekey1", Entities.XD_DarkWallStraightGate)
                     
                        return true


                        end


function ControlEnemyHeroes()
	if Counter.Tick2("ControlEnemyHeroes", 5) then
		--Varg
		if IsAlive("varg") then
			if AreEnemiesInArea(GetPlayer("varg"), GetPosition("varg"), 2000) then
				local HeroID = GetEntityId("varg")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerSummon(HeroID)
				end

				GUI.SettlerAffectUnitsInArea(HeroID)
			end
		end
		--Mary
		if IsAlive("mary") then
			if AreEnemiesInArea(GetPlayer("mary"), GetPosition("mary"), 1000) then
				local HeroID = GetEntityId("mary")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerAffectUnitsInArea(HeroID)
				end
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.8) then
					GUI.SettlerCircularAttack(HeroID)
				end
			end
		end
	end
end