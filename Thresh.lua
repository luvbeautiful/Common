ThreshMenu = Menu("Thresh", "Thresh")
ThreshMenu:SubMenu("Combo", "Combo")
ThreshMenu.Combo:Boolean("Q", "Use Q", true)
ThreshMenu.Combo:Boolean("W", "Use W", true)
ThreshMenu.Combo:Boolean("E", "Use E", true)
ThreshMenu.Combo:Boolean("R", "Use R", true)

ThreshMenu:SubMenu("Drawings", "Drawings")
ThreshMenu.Drawings:Boolean("Q", "Draw Q Range", true)
ThreshMenu.Drawings:Boolean("W", "Draw W Range", true)
ThreshMenu.Drawings:Boolean("E", "Draw E Range", true)
ThreshMenu.Drawings:Boolean("R", "Draw R Range", true)


OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
				local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1900,500,1100,70,true,false)
				  local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1900,500,950,70,false,true)
				 local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,0,400,110,false,true)


                       
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1100) and ThreshMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 950) and ThreshMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                    end
						if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and ThreshMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						if CanUseSpell(myHero, _R) == READY and  GoS:ValidTarget(target, 450) and ThreshMenu.Combo.R:Value() then
                        CastSpell(_R)
						end
        end
if ThreshMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1100,3,100,0xff00ff00) end
if ThreshMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,950,3,100,0xff00ff00) end
if ThreshMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if ThreshMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,450,3,100,0xff00ff00) end

end)

 

