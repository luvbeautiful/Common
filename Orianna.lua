OriannaMenu = Menu("Orianna", "Orianna")
OriannaMenu:SubMenu("Combo", "Combo")
OriannaMenu.Combo:Boolean("Q", "Use Q", true)

OriannaMenu:SubMenu("Drawings", "Drawings:")
OriannaMenu.Drawings:Boolean("Q","Draw Q", true)
 
 
OnLoop(function(myHero)

local target = GetCurrentTarget()
local mousePos = GetMousePos()

if IOW:Mode() == "Combo" then
              local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,250,900,80,false,true)
                       
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 900) and OriannaMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
			
        end	
if OriannaMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end

end)