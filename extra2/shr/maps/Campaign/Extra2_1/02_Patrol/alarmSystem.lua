------------------------------------------------------------------------------------------------------------------------------------
function createAlarmSystem()
	
	AlarmQuest1					=	{}
	AlarmQuest1.Serfs			=	true
	AlarmQuest1.Heroes			=	true
	AlarmQuest1.Leaders			=	true
	AlarmQuest1.TargetName		=	"PositionAlarm1"
	AlarmQuest1.Distance		=	2400 + 500 * CP_Difficulty
	AlarmQuest1.Callback		=	controlAlarmJob1
	SetupExpedition(AlarmQuest1)
	
	AlarmQuest2					=	{}
	AlarmQuest2.Serfs			=	true
	AlarmQuest2.Heroes			=	true
	AlarmQuest2.Leaders			=	true
	AlarmQuest2.TargetName		=	"PositionAlarm2"
	AlarmQuest2.Distance		=	2400 + 500 * CP_Difficulty
	AlarmQuest2.Callback		=	controlAlarmJob2
	SetupExpedition(AlarmQuest2)
	
	AlarmQuest3					=	{}
	AlarmQuest3.Serfs			=	true
	AlarmQuest3.Heroes			=	true
	AlarmQuest3.Leaders			=	true
	AlarmQuest3.TargetName		=	"PositionAlarm3"
	AlarmQuest3.Distance		=	2400 + 500 * CP_Difficulty
	AlarmQuest3.Callback		=	controlAlarmJob3
	SetupExpedition(AlarmQuest3)
	
	AlarmQuest4					=	{}
	AlarmQuest4.Serfs			=	true
	AlarmQuest4.Heroes			=	true
	AlarmQuest4.Leaders			=	true
	AlarmQuest4.TargetName		=	"PositionAlarm4"
	AlarmQuest4.Distance		=	2400 + 500 * CP_Difficulty
	AlarmQuest4.Callback		=	controlAlarmJob4
	SetupExpedition(AlarmQuest4)
	
	AlarmQuest5					=	{}
	AlarmQuest5.Serfs			=	true
	AlarmQuest5.Heroes			=	true
	AlarmQuest5.Leaders			=	true
	AlarmQuest5.TargetName		=	"PositionAlarm5"
	AlarmQuest5.Distance		=	2400 + 500 * CP_Difficulty
	AlarmQuest5.Callback		=	controlAlarmJob5
	SetupExpedition(AlarmQuest5)
	
end

------------------------------------------------------------------------------------------------------------------------------------
function controlAlarmJob1()
	if IsAlive("alarm1") then
		Sound.Play2DSound(Sounds.Misc_so_signalhorn, 0,127)
		GUI.AddNote(XGUIEng.GetStringTableText("CM03_02_Patrol/enableAlarm"))
		Alarm1JobId = StartSimpleJob("controlAlarm1")
		return true
	end
end

function controlAlarmJob2()
	if IsAlive("alarm2") then
		Sound.Play2DSound(Sounds.Misc_so_signalhorn, 0,127)
		GUI.AddNote(XGUIEng.GetStringTableText("CM03_02_Patrol/enableAlarm"))
		Alarm2JobId = StartSimpleJob("controlAlarm2")
		return true
	end
end

function controlAlarmJob3()
	if IsAlive("alarm3") then
		Sound.Play2DSound(Sounds.Misc_so_signalhorn, 0,127)
		GUI.AddNote(XGUIEng.GetStringTableText("CM03_02_Patrol/enableAlarm"))
		Alarm3JobId = StartSimpleJob("controlAlarm3")
		return true
	end
end

function controlAlarmJob4()
	if IsAlive("alarm4") then
		Sound.Play2DSound(Sounds.Misc_so_signalhorn, 0,127)
		GUI.AddNote(XGUIEng.GetStringTableText("CM03_02_Patrol/enableAlarm"))
		Alarm4JobId = StartSimpleJob("controlAlarm4")
		return true
	end
end

function controlAlarmJob5()
	if IsAlive("alarm5") then
		Sound.Play2DSound(Sounds.Misc_so_signalhorn, 0,127)
		GUI.AddNote(XGUIEng.GetStringTableText("CM03_02_Patrol/enableAlarm"))
		Alarm5JobId = StartSimpleJob("controlAlarm5")
		return true
	end
end

------------------------------------------------------------------------------------------------------------------------------------
function controlAlarm1()
--	if IsDead(armyAlarm1) then
		if Counter.Tick2("delayAlarm1", 2*60 + GetRandom(2*60)) then
			createArmyAlarm1()
		end
--	end
end

function controlAlarm2()
--	if IsDead(armyAlarm2) then
		if Counter.Tick2("delayAlarm2", 2*60 + GetRandom(2*60)) then
			createArmyAlarm2()
		end
--	end
end

function controlAlarm3()
	EndJob(Ambush1JobId)
	Advance(armyAmbush1)
		
--	if IsDead(armyAlarm3) then
		if Counter.Tick2("delayAlarm3", 2*60 + GetRandom(2*60)) then
			createArmyAlarm3()
		end
--	end
end

function controlAlarm4()
	EndJob(Patrol1JobId)
	Advance(armyPatrol1)
end

function controlAlarm5()	
--	if IsDead(armyAlarm3) then
		if Counter.Tick2("delayAlarm4", 2*60 + GetRandom(2*60)) then
			createArmyAlarm3()
		end
--	end
end