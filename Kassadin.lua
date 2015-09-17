KassadinMenu = Menu("Kassadin", "Kassadin")
KassadinMenu:SubMenu("Combo", "Combo")
KassadinMenu.Combo:Boolean("Q", "Use Q", true)
KassadinMenu.Combo:Boolean("W", "Use W", true)
KassadinMenu.Combo:Boolean("E", "Use E", true)
KassadinMenu.Combo:Boolean("R", "Use R", true)

KassadinMenu:SubMenu("Drawings", "Drawings:")
KassadinMenu.Drawings:Boolean("Q","Draw Q", true)
KassadinMenu.Drawings:Boolean("E","Draw E", true)
KassadinMenu.Drawings:Boolean("R","Draw R", true)


 
 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
  
                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,250,700,270,false,false)
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,250,700,270,false,true)





                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and KassadinMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
						if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 300) and KassadinMenu.Combo.W:Value() then
                        CastSpell(_W)
                    end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 700) and KassadinMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                        end
						if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and KassadinMenu.Combo.Q:Value() then
						CastTargetSpell(target, _Q)
						end
        end


if KassadinMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if KassadinMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end
if KassadinMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


end)
