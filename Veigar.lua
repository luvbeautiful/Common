VeigarMenu = Menu("Veigar", "Veigar")
VeigarMenu:SubMenu("Combo", "Combo")
VeigarMenu.Combo:Boolean("Q", "Use Q", true)
VeigarMenu.Combo:Boolean("SW", "Use W When Stunned", true)
VeigarMenu.Combo:Boolean("W", "Use W ", false)
VeigarMenu.Combo:Boolean("E", "Use E", true)

VeigarMenu:SubMenu("Killsteal", "Killsteal")
VeigarMenu.Killsteal:Boolean("R", "Killsteal with R", true)
VeigarMenu.Killsteal:Boolean("W", "Killsteal with W", true)

VeigarMenu:SubMenu("Drawings", "Drawings:")
VeigarMenu.Drawings:Boolean("Q", "Draw Q", true)
VeigarMenu.Drawings:Boolean("W", "Draw W", false)
VeigarMenu.Drawings:Boolean("E", "Draw E", false)
VeigarMenu.Drawings:Boolean("R", "Draw R", false)


VeigarMenu:SubMenu("DMG", "Draw DMG")
VeigarMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
VeigarMenu.DMG:Boolean("W", "Draw W Dmg", true)
VeigarMenu.DMG:Boolean("R", "Draw R Dmg", true)


 

OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()
                                    local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,251,925,70,true,false)
                                    local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,1350,900,225,false,false)
                                    local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,math.huge,700,350,false,true)
				
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 900 and VeigarMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
					        	    end
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 900 and VeigarMenu.Combo.SW:Value() and GotBuff(target, "DarkBindingMissile") == 1 or GotBuff(target, "Stun") == 1 or GotBuff(target, "veigareventhorizonstun") == 1 then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
						            end
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 900 and VeigarMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 700 and VeigarMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						           end
        end

   for i,enemy in pairs(GoS:GetEnemyHeroes()) do
    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and VeigarMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (45*GetCastLevel(myHero,_Q) + 35 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_W) == READY and GOS:ValidTarget(enemy, 2000) and VeigarMenu.DMG.W:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_W) + 70 + 1.0*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_R) == READY and GOS:ValidTarget(enemy, 2000) and VeigarMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (125*GetCastLevel(myHero,_R) + 125 + 0.7*(GetBonusAP(myHero) + 0.8*(GetBonusAP(enemy)))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end

                 for i,enemy in pairs(GoS:GetEnemyHeroes()) do
                  local WPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),0,1350,900,225,false,false)
                  if CanUseSpell(myHero,_R) and GoS:ValidTarget(enemy, 650) and VeigarMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (125*GetCastLevel(myHero,_R) + 100 + 0.7*(GetBonusAP(myHero) + 0.8*(GetBonusAP(enemy))))) then
                 CastTargetSpell(enemy, _R)
               end
             if CanUseSpell(myHero,_W) and GoS:ValidTarget(enemy, 900) and VeigarMenu.Killsteal.W:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_W) + 70 + 1.0*(GetBonusAP(myHero)))) then
                 CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
               end
      end
 

if VeigarMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,925,3,100,0xffffff00) end
if VeigarMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,700,3,100,0xffffff00) end
if VeigarMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,650,3,100,0xffffff00) end
if VeigarMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,900,3,100,0xffffff00) end

end)