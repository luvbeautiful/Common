ThreshMenu = Menu("Thresh", "Thresh")
ThreshMenu:SubMenu("Combo", "Combo")
ThreshMenu.Combo:Boolean("Q", "Use Q", true)
ThreshMenu.Combo:Boolean("W", "Use W", true)
ThreshMenu.Combo:Boolean("E", "Use E", true)
ThreshMenu.Combo:Boolean("R", "Use R", true)

ThreshMenu:SubMenu("Drawings", "Drawings")
ThreshMenu.Drawings:Boolean("Q", "Draw Q Range", true)
ThreshMenu.Drawings:Boolean("W", "Draw W Range", false)
ThreshMenu.Drawings:Boolean("E", "Draw E Range", false)
ThreshMenu.Drawings:Boolean("R", "Draw R Range", false)


OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
				local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,500,1100,60,true,false)
				 local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,389,500,210,false,true)


                       
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1100) and GoS:GetDistance(myHero, target) <= 1000 and ThreshMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						for _, ally in pairs(GoS:GetAllyHeroes()) do
						local WPred = GetPredictionForPlayer(GoS:myHeroPos(),ally,GetMoveSpeed(ally),1750,250,950,325,false,false)
						if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 1100) and GoS:GetDistance(myHero, ally) <= 1000 and ThreshMenu.Combo.W:Value() and (GetCurrentHP(ally)/GetMaxHP(ally))<=0.38 then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                    end
                    end
						if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1100) and GoS:GetDistance(myHero, target) <= 500 and ThreshMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						if CanUseSpell(myHero, _R) == READY and  GoS:ValidTarget(target, 400) and GoS:GetDistance(myHero, target) <= 400 and GoS:EnemiesAround(GoS:myHeroPos(), 400) >=2 and ThreshMenu.Combo.R:Value() then
                        CastSpell(_R)
						end
        end
if ThreshMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1100,3,100,0xff00ffff) end
if ThreshMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,950,3,100,0xff00ffff) end
if ThreshMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,500,3,100,0xff00ffff) end
if ThreshMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,400,3,100,0xff00ffff) end

end)

 

