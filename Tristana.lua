TristanaMenu = Menu("Tristana", "Tristana")
TristanaMenu:SubMenu("Combo", "Combo")
TristanaMenu.Combo:Boolean("Q", "Use Q", true)
TristanaMenu.Combo:Boolean("W", "Use W", false)
TristanaMenu.Combo:Boolean("E", "Use E", true)
TristanaMenu.Combo:Boolean("R", "Use R", false)

TristanaMenu:SubMenu("Killsteal", "Killsteal")
TristanaMenu.Killsteal:Boolean("R", "Killsteal with R", true)
TristanaMenu.Killsteal:Boolean("W", "Killsteal with W", true)

TristanaMenu:SubMenu("Drawings", "Drawings:")
TristanaMenu.Drawings:Boolean("W", "Draw W", true)
TristanaMenu.Drawings:Boolean("R", "Draw R", true)

TristanaMenu:SubMenu("DMG", "Draw DMG")
TristanaMenu.DMG:Boolean("W", "Draw W Dmg", true)
TristanaMenu.DMG:Boolean("R", "Draw R Dmg", true)

OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()
                       
                            local WPred = GetPredictionForPlayer(Gos:myHeroPos(),target,GetMoveSpeed(target),1150,750,900,270,false,false)


					              if CanUseSpell(myHero, _Q) == READY and GoS:GetDistance(myHero, target) <= 669 and TristanaMenu.Combo.Q:Value() then
			                  CastSpell(_Q)
						            end
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 900) and TristanaMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
						            if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and TristanaMenu.Combo.E:Value() then
                        CastTargetSpell(target, _E)
						            end
						            if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 700) and TristanaMenu.Combo.R:Value() then
                        CastTargetSpell(target, _R)
						            end
                end

                for i,enemy in pairs(GoS:GetEnemyHeroes()) do
 if CanUseSpell(myHero,_W) == READY and GoS:ValidTarget(enemy, 2000) and TristanaMenu.DMG.W:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, (25*GetCastLevel(myHero,_W) + 55 + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff00ffff)
     elseif CanUseSpell(myHero,_R) == READY and GoS:ValidTarget(enemy, 2000) and TristanaMenu.DMG.R:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, (100*GetCastLevel(myHero,_R) + 200 + 1.0*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff00ffff)
    end
end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local WPred = GetPredictionForPlayer(Gos:myHeroPos(),enemy,GetMoveSpeed(enemy),1150,750,900,270,false,false)
                 if CanUseSpell(myHero,_R) and GoS:ValidTarget(enemy, 700) and TristanaMenu.DMG.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 200 + 1.0*(GetBonusAP(myHero)))) then
                 CastTargetSpell(enemy, _R)
               end
               if CanUseSpell(myHero,_W) and GoS:ValidTarget(enemy, 900) and WPred.HitChance == 1 and TristanaMenu.DMG.W:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (25*GetCastLevel(myHero,_W) + 55 + 0.5*(GetBonusAP(myHero)))) then
                 CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
      end
end
 
if TristanaMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,900,3,100,0xff00ff00) end
if TristanaMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,700,3,100,0xff00ff00) end

end)
