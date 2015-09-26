ZedMenu = Menu("Zed", "Zed")
ZedMenu:SubMenu("Combo", "Combo")
ZedMenu.Combo:Boolean("Q", "Use Q", true)
ZedMenu.Combo:Boolean("W", "Use W", true)
ZedMenu.Combo:Boolean("E", "Use E", true)
ZedMenu.Combo:Boolean("R", "Use R", true)

ZedMenu:SubMenu("Drawings", "Drawings")
ZedMenu.Drawings:Boolean("Q", "Draw Q Range", true)
ZedMenu.Drawings:Boolean("W", "Draw W Range", true)
ZedMenu.Drawings:Boolean("E", "Draw E Range", true)
ZedMenu.Drawings:Boolean("R", "Draw R Range", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then

                        local target = GetCurrentTarget()
                       
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),550,300,1500,290,false,false)
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1700,350,925,50,false,false)






                       
                        if CanUseSpell(myHero, _W) and GetCastName(myHero, _W) ~= "zedw2" and WPred.HitChance == 1 and GoS:ValidTarget(target, 1500) and ZedMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                    end
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and ZedMenu.Combo.W:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and ZedMenu.Combo.E:Value() then
                        CastSpell(_E)
						end
						if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.3 and ZedMenu.Combo.R:Value() then
						CastTargetSpell(target, _R) 
						end

	end					

if ZedMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if ZedMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1500,3,100,0xff00ff00) end
if ZedMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if ZedMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


    end)