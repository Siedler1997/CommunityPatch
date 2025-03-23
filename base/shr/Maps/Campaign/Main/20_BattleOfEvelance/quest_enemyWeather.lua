
function createQuestEnemyWeather()
	StartSimpleJob("CheckWinterOnWater")
end

function CheckWinterOnWater()
	if Counter.Tick2("CheckWinterOnWater", 10) then
		--These are checked in ChangeWeatherByPlayer too but I want to avoid excessive area checks
		local CurrentWeatherEnergy = Logic.GetPlayersGlobalResource(5, ResourceType.WeatherEnergy)	
		local NeededWeatherEnergy = Logic.GetEnergyRequiredForWeatherChange()
		if Logic.GetWeatherState() == 3 and CurrentWeatherEnergy >= NeededWeatherEnergy then
			local ids1 = { Logic.GetPlayerEntitiesInArea(1, 0, 35185, 54155, 2000, 12) }
			local ids2 = { Logic.GetPlayerEntitiesInArea(1, 0, 27785, 53080, 2000, 12) }
			local ids3 = { Logic.GetPlayerEntitiesInArea(1, 0, 21425, 53380, 2000, 12) }
			local ids4 = { Logic.GetPlayerEntitiesInArea(1, 0, 25245, 56375, 2000, 12) }
		
			--Check if at any of these positions are at least 12 player units
			--We could check for enemy units too to avoid Kerboros drowning his own army but I think it fits his character quite well :P
			if ids1[1] >= 12 or ids2[1] >= 12 or ids3[1] >= 12 or ids4[1] >= 12 then
				--Allow Kerberos to use his Weather Tower
				local changed = ChangeWeatherByPlayer(5, 1, 60 * 10, XGUIEng.GetStringTableText(String.MainKey.."_Player5Name"))
				--Kerberos taunting could be immersive but I'm not sure
				--[[
				if changed == true then
					Sound.PlayGUISound(Sounds.VoicesHero7_HERO7_Madness_rnd_01)
				end
				--]]
			end
		end
	end
end