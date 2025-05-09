IncludeGlobals("Information_Extra")

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
--			.markerColor	=	color of marker
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
--		.mc.firstSelected	=	continue briefing at this position if first button selected
--								at end of this briefing an empty page must appear (nil table entry)
--		.mc.firstText		=	first button text
--		.mc.secondSelected	=	continue briefing at this position if second button selected
--								at end of this briefing an empty page must appear (nil table entry)
--		.mc.secondText		=	second button text
-------------------------------------------------------------------------------------------------------------

--	global defines

	STATIC_MARKER 					= 	0
	ANIMATED_MARKER 				= 	1
	MARKER_COLOR	 				= 	0
	BRIEFING_EXPLORATION_RANGE 		= 	6000
	BRIEFING_TALK_DISTANCE			=	500
	BRIEFING_CAMERA_HEIGHT			=	3000 -- gvCamera.ZoomDistanceMax
	MAINQUEST_OPEN					= 	1
	MAINQUEST_CLOSED				= 	2
	SUBQUEST_OPEN					= 	11
	SUBQUEST_CLOSED					= 	12

	BRIEFING_CAMERA_FLYTIME			= 	0
	BRIEFING_NEXTPAGE_TIME			= 	1 * 10
	BRIEFING_TIMER_PER_CHAR			=	1.4

	BRIEFING_VOICE_DURATION_EXTENSION = 20

	DIALOG_ZOOMDISTANCE				=	1200
	DIALOG_ZOOMANGLE				=	29
	BRIEFING_ZOOMDISTANCE			=	3770
	BRIEFING_ZOOMANGLE				=	43
--	briefing control structure

	briefingState 					= 	{}
	briefingState.timer				= 	0
	briefingState.page				= 	0

	MISSION_OBJECTIVES				=	"Mission Objectives"

	COLOR0 							=	" @color:255,255,255 "
	COLOR1 							=	" @color:255,250,200 "
	COLOR2 							=	" @color:250,255,200 "

-------------------------------------------------------------------------------------------------------
--
--	                Briefing(<page table>,<1st page flag>)
--
-------------------------------------------------------------------------------------------------------

Briefing = function(_page,_firstPage)

	--	by default

		--	disable following camera

			Camera.FollowEntity(0)

	--	quest activated?

		if _page.quest ~= nil then

			assert(_page.quest.id 		~= nil)
			assert(_page.quest.type 	~= nil)
			assert(_page.quest.title 	~= nil)
			assert(_page.quest.text 	~= nil)

			-- position to quest
			if _page.position ~= nil and _page.noScrolling ~= true then

				Logic.AddQuestEx(
					1,
					_page.quest.id,
					_page.quest.type,
					_page.quest.title,
					_page.quest.text,
					_page.position.X,
					_page.position.Y,
					1
				)

			else

				Logic.AddQuest(
					1,
					_page.quest.id,
					_page.quest.type,
					_page.quest.title,
					_page.quest.text,
					1
				)

				end
			end

	--	exploration activated?

		if _page.explore ~= nil then
			assert(_page.position ~= nil)
			assert(_page.exploreId == nil)
			_page.exploreId = GlobalMissionScripting.ExploreArea(_page.position.X,_page.position.Y,_page.explore / 100)
			Logic.ForceFullExplorationUpdate()
			assert(_page.exploreId ~= 0)
			end

	--	create minimap marker?

		if _page.marker ~= nil then

			if type(_page.marker) == "table" then

				table.foreach(_page.marker, function(_,_marker) ShowBriefingMarker(_marker) end)

			else

				ShowBriefingMarker(_page)

			end

		end

	--	position available?

		if _page.position ~= nil then

		--	deploy the camera directly, for the first page of the briefing report

			if _page.noScrolling == nil then

				if _firstPage == true then

					if _page.dialogCamera == true then

						Camera.ZoomSetDistance(DIALOG_ZOOMDISTANCE)
						Camera.ZoomSetAngle(DIALOG_ZOOMANGLE)

					else

						Camera.ZoomSetDistance(BRIEFING_ZOOMDISTANCE)
						Camera.ZoomSetAngle(BRIEFING_ZOOMANGLE)

						end

					Camera.ScrollSetLookAt(_page.position.X,_page.position.Y)

				else

					Camera.InitCameraFlight()

					if _page.dialogCamera == true then

						Camera.ZoomSetDistanceFlight(DIALOG_ZOOMDISTANCE, BRIEFING_CAMERA_FLYTIME)
						Camera.ZoomSetAngleFlight(DIALOG_ZOOMANGLE, BRIEFING_CAMERA_FLYTIME)

					else

						Camera.ZoomSetDistanceFlight(BRIEFING_ZOOMDISTANCE, BRIEFING_CAMERA_FLYTIME)
						Camera.ZoomSetAngleFlight(BRIEFING_ZOOMANGLE, BRIEFING_CAMERA_FLYTIME)

						end

					Camera.FlyToLookAt(_page.position.X,_page.position.Y,BRIEFING_CAMERA_FLYTIME)

					end

				end

		--	deploy minimap signal

			GUI.ScriptSignal(_page.position.X,_page.position.Y,0)

			end

	--	npc available?

		if _page.npc ~= nil then

			if _page.npc.id ~= nil then

				if _page.npc.isObserved == true then

					Camera.FollowEntity(_page.npc.id)


					if _page.dialogCamera == true then

						Camera.ZoomSetDistance(DIALOG_ZOOMDISTANCE)
						Camera.ZoomSetAngle(DIALOG_ZOOMANGLE)

					else

						Camera.ZoomSetDistance(BRIEFING_ZOOMDISTANCE)
						Camera.ZoomSetAngle(BRIEFING_ZOOMANGLE)

						end

					end

				EnableNpcMarker(_page.npc.id)

				end

			end

	--	pointer available?

		if _page.pointer ~= nil then

			_page.pointerId = Logic.CreateEffect(GGL_Effects.FXTerrainPointer,_page.pointer.X,_page.pointer.Y,GUI.GetPlayerID())

			end

	--	stop speech
		Stream.Stop()

	-- external function
	if Briefing_Extra ~= nil then
		Briefing_Extra(_page, _firstPage)
	end

	--	title available?

		if _page.title ~= nil then

			local Title = GetBriefingTextFromStringKey(_page.title)

			PrintBriefingHeadline("@color:255,250,200 "..Title)

		end

	--	text available?

		if _page.text ~= nil then

			if type(_page.text) == "table" then

				briefingText = ""

				table.foreach	(
									_page.text,
									function(_,_value)
										local Text = GetBriefingTextFromStringKey(_value)

										briefingText = briefingText..Text.."\n"
									end
								)

				PrintBriefingText(briefingText)
			else

				local Text = GetBriefingTextFromStringKey(_page.text)

				PrintBriefingText(Text)

				--	start speech one tick after displaying text
				Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_TURN,
										nil,
										"StartSpeech_Action",
										1,
										nil,
										{_page.text})

				end

			end

	end

function ShowBriefingMarker(_page)

	if _page.marker == STATIC_MARKER then

		GUI.CreateMinimapMarker(_page.position.X,_page.position.Y,_page.markerColor)

	elseif _page.marker == ANIMATED_MARKER then

		GUI.CreateMinimapPulse(_page.position.X,_page.position.Y,_page.markerColor)

	end

end

StartSpeech_Action = function(_key)

	StartSpeech(_key)

	CalculateBriefingTime()

	return true
end

CalculateBriefingTime = function()

	-- Get duration of sample and set if longer
	local length = (Stream.GetDuration() * 10) + BRIEFING_VOICE_DURATION_EXTENSION
	if length > BRIEFING_VOICE_DURATION_EXTENSION then
		briefingState.timer = length
	end

	-- allow next page after half second to prevent accidentally canceling
	briefingState.nextPageDelayTime = briefingState.timer - 5

end


Condition_WaitForBriefingEnd = function()
	if briefingIsActive == true then
		return false
		end
	if briefingBook ~= nil then
		return false
		end
	if briefingState.jobId ~= nil then
		return false
		end
	return true
	end
Action_WaitForBriefingEnd = function()
	ExecuteBriefing(backupBriefing[1])
	return true
	end

-------------------------------------------------------------------------------------------------------
--
--	                ExecuteBriefing(<briefing table>)
--
-------------------------------------------------------------------------------------------------------

ExecuteBriefing = function(_briefing)

		briefingBook = {}

	--	special counter to reset the minimap

		miniMapResetCounter = 0

	--	use specified briefing table

		table.insert(briefingBook,_briefing)

	--	prepare game for briefing sequence

		PrepareBriefing(_briefing)

	--	initialize briefing state

		briefingState.timer				=	0
		briefingState.nextPageDelayTime =	0
		briefingState.page				=	0

		briefingState.cameraPositionX,briefingState.cameraPositionY	= Camera.ScrollGetLookAt()

	--	unit handling

		Logic.SetGlobalInvulnerability(1)

	--	forbid all minimap battle signals

		GUI.EnableBattleSignals(false)

	--	start briefing job

		briefingState.jobId = StartHiResJob("Briefing")
		Action_Briefing()

	--	set activation flag

		assert(briefingIsActive == nil or briefingIsActive == false)

		briefingIsActive = true

	end

-------------------------------------------------------------------------------------------------------
--
--	                PrepareBriefing()
--
-------------------------------------------------------------------------------------------------------

PrepareBriefing = function(_briefing)


	--	prepare camera
		GUIAction_GoBackFromHawkViewInNormalView()
		Interface_SetCinematicMode(1)
		Camera.StopCameraFlight()
		Camera.ScrollUpdateZMode(0)
		Camera.RotSetAngle(-45)

		-- toggle FoW
		Display.SetRenderFogOfWar(1)
		GUI.MiniMap_SetRenderFogOfWar(1)
		--gvCamera.DefaultFlag = 1

	--	sound

		--	backup
		briefingState.Effect = Sound.GetVolumeAdjustment(3)
		briefingState.Ambient = Sound.GetVolumeAdjustment(5)
		briefingState.Music = Music.GetVolumeAdjustment()

		--	half volume
		Sound.SetVolumeAdjustment(3, briefingState.Effect * 0.5)
		Sound.SetVolumeAdjustment(5, briefingState.Ambient * 0.5)
		Music.SetVolumeAdjustment(briefingState.Music * 0.5)

		--	stop feedback sounds
		Sound.PlayFeedbackSound(0,0)

	--	set gui state

		--	enable cutscene key mode
			Input.CutsceneMode()

		--	forbid feedback sounds

			GUI.SetFeedbackSoundOutputState(0)

		--	activate cinematic menu

--			XGUIEng.ShowWidget("3dOnScreenDisplay",1)

			--start briefing music
			LocalMusic.SongLength = 0

			XGUIEng.ShowWidget("CinematicMiniMapContainer",1)

	end

-------------------------------------------------------------------------------------------------------
--
--	                EndBriefing()
--
-------------------------------------------------------------------------------------------------------

EndBriefing = function()

	--	resume all entities

	--	Logic.ResumeAllEntities()

	--	disable sky box

		Display.SetRenderSky(0)

	--	unit handling

		Logic.SetGlobalInvulnerability(0)

	--	allow all minimap battle signals

		GUI.EnableBattleSignals(true)

	--	reactivate Selection

		GUI.ActivateSelectionState()

	--	set default camera mode

		Interface_SetCinematicMode(0)

	--	restore sound

		--	full volume
		Sound.SetVolumeAdjustment(3, briefingState.Effect)
		Sound.SetVolumeAdjustment(5, briefingState.Ambient)
		Music.SetVolumeAdjustment(briefingState.Music)

		--restart default  music
		LocalMusic.SongLength = 0

	--	default gui

		--	disable cutscene key mode
			Input.GameMode()

		--	allow feedback sounds

			GUI.SetFeedbackSoundOutputState(1)

		--	activate in game menu

			XGUIEng.ShowWidget("Normal",1)
			XGUIEng.ShowWidget("3dOnScreenDisplay",1)

		--	deactivate cinematic stuff

			XGUIEng.ShowWidget("Cinematic",0)
			XGUIEng.ShowWidget("Cinematic_Text",0)
			XGUIEng.ShowWidget("Cinematic_Headline",0)
			XGUIEng.ShowWidget("CinematicMiniMapContainer",0)

	--	jump back camera

		if briefingBook[1].restoreCamera == true then

			Camera.ScrollSetLookAt(briefingState.cameraPositionX,briefingState.cameraPositionY)

			end

	--	finishing callback

		if briefingBook[1].finished ~= nil then

			briefingBook[1].finished()

			end

	--	stop speech
		Stream.Stop()

		briefingIsActive = false

	--	remove book

		briefingBook = nil

	--	remove job id

		briefingState.jobId = nil

	end

-------------------------------------------------------------------------------------------------------
--
--	                NextBriefingPage()
--
-------------------------------------------------------------------------------------------------------

NextBriefingPage = function()

	-- Not allowed during multiple choice
	if NextPageAllowed == nil or NextPageAllowed() then
		if briefingState.nextPageDelayTime >= briefingState.timer then
			Camera.StopCameraFlight(0)
			briefingState.timer = 0
		end
	end
end

-------------------------------------------------------------------------------------------------------
--
--	                GetBriefingTextLength(<page>)
--
-------------------------------------------------------------------------------------------------------

GetBriefingTextLength = function(_page)

	if _page.text ~= nil then

		if type(_page.text) == "table" then

			briefingText = ""

			table.foreach	(
								_page.text,
								function(_,_value)
									local Text = XGUIEng.GetStringTableText(_value)

									if Text == nil then
										Text = _value
									end

									briefingText = briefingText..Text.."\n"
								end
							)

			return string.len(briefingText)

		else

			briefingText = XGUIEng.GetStringTableText(_page.text)

			if briefingText == nil then
				briefingText = _page.text
			end

			if briefingText ~= nil then
				return string.len(briefingText)
			else
				if Game.IsMapDebugSet() then
					assert(false, "Key ".._page.text.." is not valid or contains no text!")
				end
				return BRIEFING_NEXTPAGE_TIME
			end

		end

	end

	return 0

end

-------------------------------------------------------------------------------------------------------
--
--	                PrintBriefingText(<text>)
--
-------------------------------------------------------------------------------------------------------

PrintBriefingText = function(_text)

	XGUIEng.ShowWidget("Cinematic_Text",1)

	XGUIEng.SetText("Cinematic_Text",_text)

	end

-------------------------------------------------------------------------------------------------------
--
--	                PrintBriefingHeadline(<text>)
--
-------------------------------------------------------------------------------------------------------

PrintBriefingHeadline = function(_text)

	XGUIEng.ShowWidget("Cinematic_Headline",1)

	XGUIEng.SetText("Cinematic_Headline",_text)

	end

-------------------------------------------------------------------------------------------------------
--
--	                <bool> IsBriefingActive()
--
-------------------------------------------------------------------------------------------------------

IsBriefingActive = function()

	return briefingIsActive == true

	end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "Briefing"
--
-----------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------
	Condition_Briefing = function()
	-------------------------------------------------------------------------------------------------------------------

		miniMapResetCounter = miniMapResetCounter +1

		if miniMapResetCounter == 2 then

			GUI.ResetMiniMap()

			end

		if briefingState.waitingForMC == true then
			return false
		end

		if briefingState.timer > 0 then

			briefingState.timer = briefingState.timer -1

			return false

		else

			return true

			end

		end

	-------------------------------------------------------------------------------------------------------------------
	Action_Briefing = function()
	-------------------------------------------------------------------------------------------------------------------

		if briefingBook[1][briefingState.page +1] == nil then

			EndBriefing()

			return true

			end

		if briefingBook[1][briefingState.page +1].text ~= nil then

			briefingState.timer = (GetBriefingTextLength(briefingBook[1][briefingState.page +1])) * BRIEFING_TIMER_PER_CHAR

		else

			briefingState.timer = BRIEFING_NEXTPAGE_TIME

			end

		-- allow next page after half second to prevent accidentally canceling
		briefingState.nextPageDelayTime = briefingState.timer - 5

		Briefing(briefingBook[1][briefingState.page +1],briefingState.page == 0)


		briefingState.page = briefingState.page +1

		miniMapResetCounter = 0

		return false

		end

-------------------------------------------------------------------------------------------------------
--
--	                <text> GetBriefingTextFromStringKey(<text or textkey>)
--
-------------------------------------------------------------------------------------------------------
function GetBriefingTextFromStringKey(_key)

	local briefingText = XGUIEng.GetStringTableText(_key)

	if briefingText == nil then
		briefingText = _key
		
		if Game.IsDebugVersion() == 1 then
			briefingText = briefingText.."  ! Not a valid string key !"
		end
	end 

	return briefingText

end
