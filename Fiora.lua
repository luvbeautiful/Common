FioraMenu = Menu("Fiora", "Fiora")
FioraMenu:SubMenu("Combo", "Combo")
FioraMenu.Combo:Boolean("Q", "Use Q", true)
FioraMenu.Combo:Boolean("E", "Use E", true)
FioraMenu.Combo:Boolean("R", "Use R", true)

FioraMenu:SubMenu("Drawings", "Drawings:")
FioraMenu.Drawings:Boolean("Q","Draw Q", true)
FioraMenu.Drawings:Boolean("E","Draw E", true)
FioraMenu.Drawings:Boolean("R","Draw R", true)
 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                       
					    local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,0,750,250,false,true)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 750) and FioraMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 500) and FioraMenu.Combo.R:Value() then
                        CastTargetSpell(target, _R)
                    end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 300) and FioraMenu.Combo.E:Value() then
                        CastSpell(_E)
						end
end


 
 


if FioraMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,750,3,100,0xff00ff00) end
if FioraMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,300,3,100,0xff00ff00) end
if FioraMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,GetCastRange(myHero,_R),3,100,0xff00ff000) end


end)
