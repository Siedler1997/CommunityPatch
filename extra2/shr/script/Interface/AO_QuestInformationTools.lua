GUIQuestTools = {}
----------------------------------------------------------------------------------------------------------------
function GUIQuestTools.ToggleStopWatch(_UltimatumTime, _status)

		XGUIEng.ShowWidget("StopWatch",_status)
		
		if _status == 1 then
			GUIQuestTools.UltimatumTime = 	_UltimatumTime
			GUIQuestTools.UltimatumStartTime = Logic.GetTime()
		else
			GUIQuestTools.UltimatumTime = 	0
		end
	
	end
	
----------------------------------------------------------------------------------------------------------------
function GUIQuestTools.StartQuestInformation(_texture, _tooltipKey, _counter, _status)
	
		--set Tooltip
		GUIQuestTools.QuestTooltip = _tooltipKey
		
		--save status 
		GUIQuestTools.QuestInformationFlag = _status
		GUIQuestTools.QuestCounterFlag = _counter
		
		--save Texture
		GUIQuestTools.QuestInformationTexture = _texture
		
		--reset counter
		--XGUIEng.SetText("QuestInfromationCounter", " ")	
		
		GUIQuestTools.InitQuestInformation()
	
	end
	
----------------------------------------------------------------------------------------------------------------
function GUIQuestTools.DisableQuestInformation()
	
		--save status 
		GUIQuestTools.QuestInformationFlag = 0
		GUIQuestTools.QuestCounterFlag = 0
		
		XGUIEng.ShowWidget("QuestInformation",GUIQuestTools.QuestInformationFlag)
		XGUIEng.ShowWidget("QuestInformationCounter",GUIQuestTools.QuestCounterFlag)
	
	end

----------------------------------------------------------------------------------------------------------------
function GUIQuestTools.InitQuestInformation()
		--toggle widgets		
		XGUIEng.ShowWidget("QuestInformation",GUIQuestTools.QuestInformationFlag)
		XGUIEng.ShowWidget("QuestInformationCounter",GUIQuestTools.QuestCounterFlag)
		
		--set Texture
		for i=0,4,1
		do
			XGUIEng.SetMaterialTexture("QuestInformationIcon",i, "Data\\Graphics\\Textures\\GUI\\QuestInformation\\" .. GUIQuestTools.QuestInformationTexture ..".png")		
		end
	end

----------------------------------------------------------------------------------------------------------------
function GUIQuestTools.UpdateQuestInformationString(_string)
		GUIQuestTools.QuestCounterString = "@center " .. _string		
	end
	
----------------------------------------------------------------------------------------------------------------
function GUIQuestTools.UpdateQuestInformationCounter()
		XGUIEng.SetText("QuestInformationCounter", GUIQuestTools.QuestCounterString)	
	end

----------------------------------------------------------------------------------------------------------------
function GUIQuestTools.UpdateQuestInformationTooltip()
		XGUIEng.SetTextKeyName("QuestInformationTooltipText", GUIQuestTools.QuestTooltip)	 
	end

----------------------------------------------------------------------------------------------------------------
function GUIQuestTools.UpdateStopWatch()
	
		local CurrentTimeSeconds = Logic.GetTime()	
		local SecondsLeft=  math.floor(GUIQuestTools.UltimatumTime-(CurrentTimeSeconds - GUIQuestTools.UltimatumStartTime))
		
		local TotalMinutes = math.floor( SecondsLeft / 60 )	
		local Minutes = math.mod( TotalMinutes, 60 )
		local Hours = math.floor( TotalMinutes / 60 )
		local TotalSeconds = math.mod( math.floor(SecondsLeft), 60 )
			
		local String = ""
		
		if SecondsLeft < 60 then
		 	String = String .. "@color:255,120,120,255 "
		end

		String = String.. "@center "
		 
		if Hours > 0 then
			
			String = String .. Hours .. ":"
			
			if Minutes < 10 then
				
				String = String .. "0"
				
			end
			
		end
		 
		if TotalSeconds < 10 then		
			String = String .. Minutes .. ":" .. "0" .. TotalSeconds	
		else		
			String = String .. Minutes .. ":" .. TotalSeconds	
		end
	
		if SecondsLeft == 60 then		
			Sound.Play2DSound(Sounds.Misc_Countdown1, 0,50)
		end
		
		--[[
		local MiliSecondsLeft = math.floor((GUIQuestTools.UltimatumTime*1000)-(Logic.GetTimeMs() - (GUIQuestTools.UltimatumStartTime*1000)))
		if MiliSecondsLeft == 5000
		or MiliSecondsLeft == 4000
		or MiliSecondsLeft == 3000
		or MiliSecondsLeft == 2000
		or MiliSecondsLeft == 1000 then
			Sound.Play2DSound( Sounds.Smith01,0 )
		end
		--]]
		
		XGUIEng.SetText("StopWatchCounter", String)	
		
		GUIQuestTools.StopWatchSecondsLeft = TotalSeconds
		
		-- do not show stopwatch when time has run out
		if TotalSeconds < 0 then
			GUIQuestTools.ToggleStopWatch(0, 0)
		end
	
	end

----------------------------------------------------------------------------------------------------------------