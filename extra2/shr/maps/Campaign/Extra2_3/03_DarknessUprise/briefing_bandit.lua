goldPaid=0
function createBriefingBandit()

	BriefingBandit = 	{}

		BriefingBandit.finished = BriefingBanditFinished
	
		local page = 0


		page = page + 1

		BriefingBandit[page] 				= 	{}
		BriefingBandit[page].position 			= 	GetPosition("bandit")
		BriefingBandit[page].mc                		=	{}
        	BriefingBandit[page].mc.title			= 	String.Key("Bandit")
		BriefingBandit[page].mc.text			=	String.Key("bandit.mctext")
		BriefingBandit[page].mc.firstText		=	String.Key("bandit.buy")
		BriefingBandit[page].mc.secondText		=	String.Key("bandit.cancel")
		BriefingBandit[page].mc.firstSelectedCallback	=	BanditMCCallback
		BriefingBandit[page].mc.secondSelected		=	3

		BriefingMCPage 					= 	BriefingBandit[page]
		
		page = 3

		BriefingBandit[page] 				= 	{}
		BriefingBandit[page].text			=	String.Key("bandit.tent")

		page = 5

		BriefingBandit[page] 				= 	{}
		BriefingBandit[page].text			=	String.Key("bandit.nogold")


		StartBriefing(BriefingBandit)

end


function BanditMCCallback()

	if GetGold() < 500 then
		goldPaid=0
		return 5

	else

		AddGold(-500)
		goldPaid=1

		return 3

	end

end


BriefingBanditFinished = function()

	   if GetSelectedBriefingMCButton(BriefingMCPage) == 1 and goldPaid == 1 then
		createBlockade()
	   else
	DestroyNPC(NPCbandit)
	NPCbandit			=	{}
	NPCbandit.name 			=	"bandit"
	NPCbandit.callback		=	createBriefingBandit
	CreateNPC(NPCbandit)	
	   end

end

function createBlockade()
	local pos1 = GetPosition("bandit_spawn")

	for n=1,4,1 do
		CreateEntity(1,Entities.XD_MiscHaybale3,GetPosition("blockade"..n),"hey"..n)
		local Armybandit = AI.Entity_CreateFormation(7,Entities.CU_BanditLeaderBow2,0,6,pos1.X,pos1.Y,0,0,VERYHIGH_EXPERIENCE-CP_Difficulty,0)
		LookAt(Armybandit, "traderoute2_1")
		SetEntityName(Armybandit, "Armybandit"..n)
		Move("Armybandit"..n,"blockade"..n,100)
	end
	for n=5,6,1 do
		CreateEntity(1,Entities.XD_MiscHaybale2,GetPosition("blockade"..n),"hey"..n)
	end
	Explore.Show("blocks","blockade1",1500)
end