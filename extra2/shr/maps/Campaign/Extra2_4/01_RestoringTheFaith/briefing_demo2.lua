-----------------------------------
----- before the blast ------

createBriefingDemo1 = function ()


BriefingDemo1 = 	{}

	BriefingDemo1.finished = BriefingDemo1Finished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingDemo1[page] 					= 	{}
		BriefingDemo1[page].title				= 	String.Key("BriefingDemo1[1].title") 
		BriefingDemo1[page].text				=	String.Key("BriefingDemo1[1].text")
		BriefingDemo1[page].position				=	GetPosition("Bombjack")
		--BriefingDemo1[page].explore				=	2000


	--	page 2
	
		page = page+1
	
		BriefingDemo1[page] 					= 	{}
		BriefingDemo1[page].title				= 	String.Key("BriefingDemo1[2].title") 
		BriefingDemo1[page].text				=	string.format(XGUIEng.GetStringTableText("CM06_01_RestoringTheFaith/BriefingDemo1[2].text"), 1000 + 1000 * 0.5 * CP_Difficulty)
		BriefingDemo1[page].position				=	GetPosition("Bombjack")
		--BriefingDemo1[page].explore				=	2000

		

briefingTerminatBriefingDemo1 = BriefingDemo1[page]

StartBriefing(BriefingDemo1)
		
end
	
BriefingDemo1Finished = function()



end







-----------------------------------
----- after the blast -------------
createBriefingDemo2 = function ()


BriefingDemo2 = 	{}

	BriefingDemo2.finished = BriefingDemo2Finished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingDemo2[page] 					= 	{}
		BriefingDemo2[page].title				= 	String.Key("BriefingDemo2[1].title") 
		BriefingDemo2[page].text				=	String.Key("BriefingDemo2[1].text")
		BriefingDemo2[page].position				=	GetPosition("Bombjack")
		--BriefingDemo2[page].explore				=	2000


	--	page 2
	
		page = page+1
	
		BriefingDemo2[page] 					= 	{}
		BriefingDemo2[page].title				= 	String.Key("BriefingDemo2[2].title") 
		BriefingDemo2[page].text				=	String.Key("BriefingDemo2[2].text")
		BriefingDemo2[page].position				=	GetPosition("Bombjack")
		--BriefingDemo2[page].explore				=	2000

		

briefingTerminatBriefingDemo2 = BriefingDemo2[page]

StartBriefing(BriefingDemo2)
		
end
	
BriefingDemo2Finished = function()
Move("Bombjack","runto")
EffectsOnExplosion()
createQuestBuildUpPlateau()
end

EffectsOnExplosion = function()

	for i = 1,14,1 do

	Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("obs"..i).X, GetPosition("obs"..i).Y,0)		--EXPLODE
	DestroyEntity("obs"..i)

	end

end