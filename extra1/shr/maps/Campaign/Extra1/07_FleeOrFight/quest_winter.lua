TIME_TO_WINTER = 60 * (120 - 30 * CP_Difficulty)

function CreateQuestWinter()

	StartSimpleJob("QuestWinter")

end

function QuestWinter()

	
	if countDownStarted ~= true then
	
		-- Show timer
		MapLocal_StartCountDown(TIME_TO_WINTER)

		countDownStarted = true

	end

	if WinterTimeGone == true then

		if not IsBriefingActive() and not IsCutsceneActive() and not Logic.IsWeatherChangeActive() then

			StartWinter(1000000)
			
			MapLocal_StopCountDown(TIME_TO_WINTER)
			
			end3rdChapter()
			
		    LocalMusic.UseSet = LocalMusic.SetDarkMoor
			
			return true
	
		end
		
	end

	if Counter.Tick2("QuestWinter", TIME_TO_WINTER) then

		WinterTimeGone = true
			
	end

end