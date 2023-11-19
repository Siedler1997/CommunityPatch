--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- AO: New Buttons
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function
GUIAction_ThiefPlaceExplosives()
	GUI.ActivatePlaceKegCommandState()
end

function
GUIAction_ScoutUseBinocular()
    GUI.ActivateScoutBinocularsCommandState()
end

function
GUIAction_ScoutFindResources()
	GUI.ScoutPointToResources(GUI.GetSelectedEntity())
end

function
GUIAction_ScoutTorches()
	GUI.ActivatePlaceTorchState()
end

function
GUIAction_Hero10SniperAttack()
  GUI.ActivateSnipeCommandState()
  GUI.State_SetExclusiveMessageRecipient(HeroSelection_GetCurrentSelectedHeroID())
end

function
GUIAction_Hero10LongRangeAura()
	GUI.SettlerAffectUnitsInArea(HeroSelection_GetCurrentSelectedHeroID())
end

function GUIAction_Hero11FireworksMotivate()
	GUI.SettlerMotivateWorkers(HeroSelection_GetCurrentSelectedHeroID())
	--Activate another ability as well
	GUI.SettlerAffectUnitsInArea(HeroSelection_GetCurrentSelectedHeroID())
end

function
GUIAction_Hero11FireworksFear()
	GUI.SettlerInflictFear(HeroSelection_GetCurrentSelectedHeroID())
end

function
GUIAction_Hero11Shuriken()	
	GUI.ActivateShurikenCommandState()
	GUI.State_SetExclusiveMessageRecipient(HeroSelection_GetCurrentSelectedHeroID())
end


function GUIAction_Hero12PoisonRange()	
	GUI.SettlerCircularAttack(HeroSelection_GetCurrentSelectedHeroID())
end


function GUIAction_Hero12PoisonArrows()
	GUI.ActivateShurikenCommandState()
	GUI.State_SetExclusiveMessageRecipient(HeroSelection_GetCurrentSelectedHeroID())
end


function GUIAction_AOOnlineHelp(_SelectedEntityID, _SpokenText, _Text)
		
		local AOSpokenText		
		local AOText 			
		
		local EntityType = Logic.GetEntityType( _SelectedEntityID )
		
		local UpgradeCategory
		
		if Logic.IsBuilding( _SelectedEntityID ) == 1 then	
			UpgradeCategory = Logic.GetUpgradeCategoryByBuildingType(EntityType)
		else
			UpgradeCategory = Logic.LeaderGetSoldierUpgradeCategory( _SelectedEntityID )
		end
		
		
		if UpgradeCategory ~= 0 and UpgradeCategory ~= nil then
			AOSpokenText		= Sounds["AOVoicesMentorHelp_" .. HintTable[UpgradeCategory]]
			AOText 			= XGUIEng.GetStringTableText("AOVoicesMentorHelp/" .. HintTable[UpgradeCategory])
		end
		
		
		
		if EntityType == Entities.PU_Scout then
			AOSpokenText	= Sounds.AOVoicesMentorHelp_UNIT_Scout
			AOText 			= XGUIEng.GetStringTableText("AOVoicesMentorHelp/UNIT_Scout")
		elseif EntityType == Entities.PU_Thief then
			AOSpokenText	= Sounds.AOVoicesMentorHelp_UNIT_Thief
			AOText 			= XGUIEng.GetStringTableText("AOVoicesMentorHelp/UNIT_Thief")
		end
		
		
		if AOSpokenText ~= nil 
		and AOText ~= nil then
			return AOSpokenText, AOText
		else
			return _SpokenText, _Text
		end
		
end					