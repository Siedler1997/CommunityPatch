setuphero = function()

local pos = GetPosition("templarCp")
       TemplarHero = CreateEntity(6, Entities.PU_Hero1, pos,TemplarHero)
        
	MakeInvulnerable (TemplarHero)
	
--StartSimpleJob(HeroQuest)
end


HeroQuest = function()

	if bulache == 1 then DestroyNPC(TemplarHero) return true

	else return false
	end
end