--Extra1Comfort.lua for AddOn 1 spesicic functions

-------------------------------------------------------------------------------------------------------
-- Setup Moor Weather Gfx Set.
-- @see SetupEvelanceWeatherGfxSet.
-- @see SetupMediterraneanWeatherGfxSet.
-- @see SetupHighlandWeatherGfxSet.
-- @see SetupNormalWeatherGfxSet.

function SetupMoorWeatherGfxSet()
	Display.SetRenderUseGfxSets(1)	
	WeatherSets_SetupMoor(1)
	WeatherSets_SetupMoorRain(2)
	WeatherSets_SetupMoorSnow(3)
end
	
-------------------------------------------------------------------------------------------------------
-- Setup Steppe Weather Gfx Set.
-- @see SetupEvelanceWeatherGfxSet.
-- @see SetupMediterraneanWeatherGfxSet.
-- @see SetupHighlandWeatherGfxSet.
-- @see SetupNormalWeatherGfxSet.

function SetupSteppeWeatherGfxSet()
	Display.SetRenderUseGfxSets(1)	
	WeatherSets_SetupSteppe(1)
	WeatherSets_SetupSteppeRain(2)
	WeatherSets_SetupSteppeSnow(3)
end

--Researchs Armor-, Attack- and other useful techs for military purposes
function ResearchAllMilitaryTechsAddOn(_PlayerId, _SuperTech)
	ResearchAllMilitaryTechs(_PlayerId, _SuperTech)

	ResearchTechnology( Technologies.T_FleeceArmor, _PlayerId );
	ResearchTechnology( Technologies.T_FleeceLinedLeatherArmor, _PlayerId );
	ResearchTechnology( Technologies.T_LeadShot, _PlayerId );
	ResearchTechnology( Technologies.T_Sights, _PlayerId );
end