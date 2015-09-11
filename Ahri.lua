AhriMenu = Menu("Ahri", "Ahri")
AhriMenu:SubMenu("Combo", "Combo")
AhriMenu.Combo:Boolean("Q", "Use Q", true)
AhriMenu.Combo:Boolean("W", "Use W", true)
AhriMenu.Combo:Boolean("E", "Use E", true)
AhriMenu.Combo:Boolean("R", "Use R", true)

AhriMenu:SubMenu("Drawings", "Drawings")
AhriMenu.Drawings:Boolean("Q", "Draw Q Range", true)
AhriMenu.Drawings:Boolean("W", "Draw W Range", true)
AhriMenu.Drawings:Boolean("E", "Draw E Range", true)
AhriMenu.Drawings:Boolean("R", "Draw R Range", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then

                       local mousePos = GetMousePos()
                        local target = GetCurrentTarget()
                local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1750,250,925,60,false,false)
                 local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),500,0,GetCastRange(myHero,_R),250,false,true)  
                 local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1550,250,1000,60,true,false)


                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, 1000) then 
                         if GoS:GetDistance(myHero, target) < 1000 and AhriMenu.Combo.R:Value() then
                        CastSkillShot(_R, mousePos.x, mousePos.y, mousePos.z)
						end
                    end
						if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and AhriMenu.Combo.W:Value() then
                        CastSpell(_W)
						end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and AhriMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                        end
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and AhriMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
        end

if AhriMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if AhriMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if AhriMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if AhriMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1000,3,100,0xff00ff00) end


end)
