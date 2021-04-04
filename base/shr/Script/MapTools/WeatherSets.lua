-- GfxSetSetLightParams
-- Sets the light parameters for the given gfx set. Params: Gfx set index, transition start, transition end, 

-- GfxSetSetSnowStatus
-- Sets the ice status for the given Gfx set. Params: gfx set index, transition start, transition end, snow status.

-- GfxSetSetSnowEffectStatus
-- Sets the snow effect status for the given gfx set. Params: gfx set index, transition start, transition end, 

-- GfxSetSetFogParams
-- Sets the fog parameters for the given Gfx set. Params: gfx set index, transition start, transition end, fog 


-- Standart Weather: Europe
function Mission_InitWeatherGfxSetsForAllMaps()
	Display.SetRenderUseGfxSets(1)
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)
end

-- Normal
function WeatherSets_SetupNormal(_ID, _Rain, _Snow)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox02")

	if _Rain ~= nil then
		Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, _Rain)
	else
		Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, 0)
	end

	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 0)

	if _Snow ~= nil then
		Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, _Snow)
	else
		Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 0)
	end

	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 152,172,182, 5000,28000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  120,110,110,  205,204,180)
end

function WeatherSets_SetupSnow(_ID, _Rain, _Snow)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox01")

	if _Rain ~= nil then
		Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, _Rain)
	else
		Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, 0)
	end

	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 1)

	if _Snow ~= nil then
		Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, _Snow)
	else
		Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 1)
	end

	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 152,172,182, 4000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0,  40, -15, -75,  116,144,164, 255,234,202)
end

function WeatherSets_SetupRain(_ID, _Rain, _Snow)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox04")

	if _Rain ~= nil then
		Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, _Rain)
	else
		Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, 1)
	end

	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 0)

	if _Snow ~= nil then
		Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, _Snow)
	else
		Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 0)
	end

	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 102,132,142, 4000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  120,110,110,  205,204,180)
end


-- Evelance
function WeatherSets_SetupEvelance(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox07")
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 29,36,44, 5000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  102,108,108, 96,75,54)
end
function WeatherSets_SetupEvelanceSnow(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox01")
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 1)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 1)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 81,96,104, 4000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  87,108,123, 191,176,152)
end

function WeatherSets_SetupEvelanceRain(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox04")
	Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, 1)
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 29,44,51, 4000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  102,108,108, 96,78,54)
end

-- Mediterranean
function WeatherSets_SetupMediterranean(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox03")
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 152,172,182, 5000,28000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  120,110,110,  255,254,230)
end

function WeatherSets_SetupMediterraneanSnow(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox01")
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 1)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 1)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 152,172,182, 4000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0,  40, -15, -75,  100,110,110, 250,250,250)
end

function WeatherSets_SetupMediterraneanRain(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox04")
	Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, 1)
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 102,132,142, 4000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  120,110,110,  255,254,230)
end


-- Highland
function WeatherSets_SetupHighland(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox05")
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 152,172,182, 5000,28000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  120,110,110,  255,254,230)
end

function WeatherSets_SetupHighlandSnow(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox01")
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 1)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 1)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 152,172,182, 4000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0,  40, -15, -75,  100,110,110, 250,250,250)
end

function WeatherSets_SetupHighlandRain(_ID)
	Display.GfxSetSetSkyBox(_ID, 0.0, 1.0, "YSkyBox04")
	Display.GfxSetSetRainEffectStatus(_ID, 0.0, 1.0, 1)
	Display.GfxSetSetSnowStatus(_ID, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(_ID, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(_ID, 0.0, 1.0, 1, 102,132,142, 4000,12000)
	Display.GfxSetSetLightParams(_ID,  0.0, 1.0, 40, -15, -50,  120,110,110,  255,254,230)
end



function GameCallback_SetWeather(Weather)

    -- These are only in local variables for clarity - they are initialized with the values
    -- used when the weather is normal (i.e. Weather == 1)
    local Duration = 300
    local IsPeriodic = 0    -- This should always be 0 for weather set by the weather machine
    local GfxState = 1      
    local TransitionForerun = 4
    local TransitionDuration = 8
   
    -- If the passed in weather type is not "Normal", then the parameters sent to 
    -- "Logic.AddWeatherElement" need changing. In this example rain just uses a different
    -- Gfx set, and snow uses a longer duration and transition times
    if Weather == 2 then
        -- "Rain" Set the parameters as they are required for rain
        GfxState = 2
    elseif Weather == 3 then
        -- "Snow" Set the parameters as they are required for snow
        Duration = 400
        GfxState = 3
        TransitionForerun = 5
        TransitionDuration = 10
    end

    -- Call the function that actually sets the weather
    Logic.AddWeatherElement(Weather, Duration, IsPeriodic, GfxState, TransitionForerun, TransitionDuration)
    
    --restart music
    LocalMusic.SongLength = Logic.GetTime() + TransitionDuration
end