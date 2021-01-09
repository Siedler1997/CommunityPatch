-------------------------------------------------------------------------------------------------------------
--	briefing table
--
--	main
--			
--		.finished			=	callback when briefing is finisehd
--		.restoreCamera		=	move back to stored camera position before briefing starts
--                      	
--	page                	
--		.title				= 	title key of the page
--		.position 			= 	position table for controlling the camera position
--		.text				=	briefing text key
--		.marker				=	type of marker (needs: position)
--								can be a table with multiple markers
--			.position		=	position for marker
--			.marker			=	type of marker
--		.explore			=	range of exploration (needs: title and position)
--		.pointer			=	optional position for a in game pointer
--		.dialogCamera		=	camera moves near to position/npc
--		.noScrolling		=	disable scrolling (optional)
--		.npc.id				=	optional entity id for a "!" symbol
--		.npc.isObserved		=	camera follows npc
--		.quest.id			=	quest id
--		.quest.type			=	quest type
--		.quest.title		=	quest title
--		.quest.text			=	quest text
--		.mc.text			=	show multiple choice menu and display text in window
--		.mx.title			=	mutiple choice title key or string
--
--			.mc.firstSelected	=	continue briefing at this position if first button selected
--								at end of this briefing an empty page must appear (nil table entry)
--		or
--			.mc.firstSelectedCallback	=	can be used instead of firstSelected, function should return continue index
--
--		.mc.firstText		=	first button text
--		.mc.secondSelected	=	continue briefing at this position if second button selected
--								at end of this briefing an empty page must appear (nil table entry)
--		.mc.secondText		=	second button text
-------------------------------------------------------------------------------------------------------------


function Briefing_Extra(_page,_firstPage)

	--	multiple choice active
		if _page.mc ~= nil then
			
			if _page.mc.text ~= nil then

				-- Set multiple choice text in window
				assert(_page.mc.title~=nil)
				PrintMCHeadline(_page.mc.title)
				PrintMCText(_page.mc.text)
				
				-- Set text in both buttons
				assert(_page.mc.firstText~=nil)
				assert(_page.mc.secondText~=nil)
				PrintMCButton1Text(_page.mc.firstText)
				PrintMCButton2Text(_page.mc.secondText)
				
				-- show window
				XGUIEng.ShowWidget("Cinematic_Text",0)
				XGUIEng.ShowWidget("Cinematic_Headline",0)
				XGUIEng.ShowWidget("CinematicMC_Container",1)
				
				-- show mouse
				Mouse.CursorShow()
				
				-- wait for answer
				briefingState.waitingForMC = true
				return
			end
			
		end

end

function NextPageAllowed()

	return IsWaitingForMCSelection() == false
	
end


-------------------------------------------------------------------------------------------------------
--
--	                PrintMCHeadline(<text or textkey>)
--
-------------------------------------------------------------------------------------------------------
function PrintMCHeadline(_text)

	XGUIEng.ShowWidget("CinematicMC_Headline",1)

	XGUIEng.SetText("CinematicMC_Headline","@color:255,250,200 "..GetBriefingTextFromStringKey(_text))

end
-------------------------------------------------------------------------------------------------------
--
--	                PrintMCText(<text or textkey>)
--
-------------------------------------------------------------------------------------------------------
function PrintMCText(_text)

	XGUIEng.ShowWidget("CinematicMC_Text",1)

	XGUIEng.SetText("CinematicMC_Text",GetBriefingTextFromStringKey(_text))

	StartSpeech(_text)
	
end
-------------------------------------------------------------------------------------------------------
--
--	                PrintMCButton1Text(<text or textkey>)
--
-------------------------------------------------------------------------------------------------------
function PrintMCButton1Text(_text)

	XGUIEng.ShowWidget("CinematicMC_Button1",1)

	XGUIEng.SetText("CinematicMC_Button1", GetBriefingTextFromStringKey(_text))

end
-------------------------------------------------------------------------------------------------------
--
--	                PrintMCButton2Text(<text or textkey>)
--
-------------------------------------------------------------------------------------------------------
function PrintMCButton2Text(_text)

	XGUIEng.ShowWidget("CinematicMC_Button2",1)

	XGUIEng.SetText("CinematicMC_Button2", GetBriefingTextFromStringKey(_text))

end
-------------------------------------------------------------------------------------------------------
--
--	                <bool>IsWaitingForMCSelection()
--
-------------------------------------------------------------------------------------------------------
function IsWaitingForMCSelection()

	return IsBriefingActive() and briefingState.waitingForMC == true

end


-------------------------------------------------------------------------------------------------------
--
--	                FirstBriefingMCButtonSelected(<index>) index can only be 1 or 2
--
-------------------------------------------------------------------------------------------------------
function BriefingMCButtonSelected(_index)

	assert(briefingBook[1][briefingState.page].mc~=nil)
	briefingBook[1][briefingState.page].mc.selectedButton = _index

	if _index == 1 then
		
		if briefingBook[1][briefingState.page].mc.firstSelected ~= nil then
			
			briefingState.page = briefingBook[1][briefingState.page].mc.firstSelected - 1
			
		else

			assert(briefingBook[1][briefingState.page].mc.firstSelectedCallback)
			briefingState.page = briefingBook[1][briefingState.page].mc.firstSelectedCallback()-1
		
		end

	else
		assert(briefingBook[1][briefingState.page].mc.secondSelected)
		briefingState.page = briefingBook[1][briefingState.page].mc.secondSelected - 1
	end
	
	-- Hide selection window
	XGUIEng.HighLightButton("CinematicMC_Button1",0)
	XGUIEng.HighLightButton("CinematicMC_Button2",0)
	XGUIEng.ShowWidget("CinematicMC_Container",0)
	
	-- Conitnue
	briefingState.timer = 0
	briefingState.waitingForMC = false
	
	-- Hide mouse again
	Mouse.CursorHide()
	
end

-------------------------------------------------------------------------------------------------------
--
--	                GetSelectedBriefingMCButton(<page>)
--
-------------------------------------------------------------------------------------------------------
function GetSelectedBriefingMCButton(_page)

	if _page.mc ~= nil then
	
		return _page.mc.selectedButton		
		
	end

end
