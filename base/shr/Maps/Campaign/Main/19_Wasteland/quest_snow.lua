createQuestSnow = function()

	-- Create weather change quest
	Trigger.RequestTrigger( Events.LOGIC_EVENT_WEATHER_STATE_CHANGED,
				nil,
				"SnowQuest",
				1)

end





SnowQuest = function()
	-- Is new state snow
	if Event.GetNewWeatherState() == 3 then
		Move("Banned_Info_NPC","Banned_TargetPos")
		
		-- Start attacks
		--StartLeftFortress_Attack()
		--StartCenterOutpost_Attack()
		
		if talkedToSwampNPC == true then
			-- Quest done
			Logic.SetQuestType(
				1, 					
				4,
				MAINQUEST_OPEN +1,
				1
			)
			-- Show dry village briefing
			createBriefingDryVillage()
		else
			DisableNpcMarker("Banned_Info_NPC")
			SetNPCLookAtTarget("Banned_Info_NPC",0)
			
			InitNPCLookAt("SnowNPC")
			SetNPCLookAtTarget("SnowNPC",1)
			EnableNpcMarker("SnowNPC")
		end

		-- Quest done
		return true
	end
end