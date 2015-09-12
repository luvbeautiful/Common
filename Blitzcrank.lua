BlitzcrankMenu = Menu("Blitzcrank", "Blitzcrank")
BlitzcrankMenu:SubMenu("Combo", "Combo")
BlitzcrankMenu.Combo:Boolean("Q", "Use Q", true)
BlitzcrankMenu.Combo:Boolean("W", "Use W", true)
BlitzcrankMenu.Combo:Boolean("E", "Use E", true)
BlitzcrankMenu.Combo:Boolean("R", "Use R", true)

BlitzcrankMenu:SubMenu("Drawings", "Drawings")
BlitzcrankMenu.Drawings:Boolean("Q", "Draw Q Range", true)
BlitzcrankMenu.Drawings:Boolean("R", "Draw R Range", true)


BlitzcrankMenu:SubMenu("Killsteal", "Killsteal")
BlitzcrankMenu.Killsteal:Boolean("R", "Killsteal with R", true)

  
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
				local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,1050,70,true,false)
                        
                       if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1050) and BlitzcrankMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						            end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 600) and BlitzcrankMenu.Combo.W:Value() then
                        CastSpell(_W)
                        end
						            if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 400) and BlitzcrankMenu.Combo.E:Value() then
                        CastSpell(_E)
						            end
						            if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and BlitzcrankMenu.Combo.R:Value() then
                        CastSpell(_R)
						            end
        end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do

if CanUseSpell(myHero,_R) and GoS:ValidTarget(enemy, GetCastRange(myHero,_R)) and BlitzcrankMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (125*GetCastLevel(myHero,_R) + 125 + 1.0*GetBonusAP(myHero))) then
                 CastSpell(_R)

end
 
if BlitzcrankMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if BlitzcrankMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


end

end)
