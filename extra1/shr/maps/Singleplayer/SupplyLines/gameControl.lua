-------------------------------------------------------------------------------------------------------------

create1stQuest = function()


	Report("start 1st Quest")

----------------------------------------------------

		createArmySpawn()

----------------------------------------------------

		--createBriefingCoinac()
		createBriefingPrelude()
		--createQuestCoinac()

----------------------------------------------------

        	EnableNpcMarker("trade1")
        	EnableNpcMarker("trade2")

----------------------------------------------------

		StartChestQuest()
                StartJob("Unlockgate1")
                StartJob("Unlockgate2")
                StartJob("Unlockgate3")
		startQuestDefeat()
		startQuestVictory()


end



-------------------------------------------------------------------------------------------------------------------------

destroy1stQuest = function()

	ResolveBriefing(briefingPrelude[page_prelude])
	Victory()
	Report("end 1st Quest")

	end

-------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------
--
--          JOB: "Unlockgate1"
--
-----------------------------------------------------------------------------------------------------------------------

            Condition_Unlockgate1 = function()


                        return IsDead("base1") and IsDead("base2")


                        end


            -------------------------------------------------------------------------------------------------------------------

            Action_Unlockgate1 = function()

            -------------------------------------------------------------------------------------------------------------------

                        DestroyEntity("gate1")


                        return true


                        end



-----------------------------------------------------------------------------------------------------------------------
--
--          JOB: "Unlockgate2"
--
-----------------------------------------------------------------------------------------------------------------------

            Condition_Unlockgate2 = function()


                        return IsDead("base3") and IsDead("base4")


                        end


            -------------------------------------------------------------------------------------------------------------------

            Action_Unlockgate2 = function()

            -------------------------------------------------------------------------------------------------------------------

                        DestroyEntity("gate2")


                        return true


                        end






-----------------------------------------------------------------------------------------------------------------------
--
--          JOB: "Unlockgate3"
--
-----------------------------------------------------------------------------------------------------------------------

            Condition_Unlockgate3 = function()


                        return IsDead("base5") and IsDead("base6")


                        end


            -------------------------------------------------------------------------------------------------------------------

            Action_Unlockgate3 = function()

            -------------------------------------------------------------------------------------------------------------------

                        DestroyEntity("gate3")


                        return true


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
		if _npcId == GetEntityId("trade1") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("trade1")
				createBriefingtrade1()
				local job = {}
				job.Tribute = 1
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("trade1"),
									ResourceType.Wood,
									2000 )


				job.Resources 	= { sulfur = 2000 }
				job.Callback = TributePaid1
				SetupTributePaid(job)
				end
			end

		end



-------------------------------------------------------------------------------------------------------------------------


	if Logic.IsHero(_heroId) then
		if _npcId == GetEntityId("trade2") then
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("trade2")
				createBriefingtrade2()
				local job = {}
				job.Tribute = 2
				Logic.AddTribute(	GetHumanPlayer(),
									job.Tribute,
									0,
									0,
									String.Key("trade2"),
									ResourceType.Gold,
									2000 )


				job.Resources 	= { iron = 2000 }
				job.Callback = TributePaid2
				SetupTributePaid(job)
				end
			end

		end


-------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------


end


TributePaid1 = function()
	return true
	end


TributePaid2 = function()
	return true
	end



-------------------------------------------------------------------------------------------------------------------------



