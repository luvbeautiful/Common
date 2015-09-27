MorganaMenu = Menu("Morgana", "Morgana")
MorganaMenu:SubMenu("Combo", "Combo")

MorganaMenu.Combo:Boolean("Q", "Use Q", true)
MorganaMenu.Combo:Boolean("SW", "Use W on enemies hit by Q/R ", true)
MorganaMenu.Combo:Boolean("W", "Use W", false)
MorganaMenu.Combo:Boolean("E", "Use Ally E", true)
MorganaMenu.Combo:Boolean("R", "Use R", true)

MorganaMenu:SubMenu("Killsteal", "Killsteal")
MorganaMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)
MorganaMenu.Killsteal:Boolean("W", "Killsteal with W", true)

MorganaMenu:SubMenu("Drawings", "Drawings:")
MorganaMenu.Drawings:Boolean("Q", "Draw Q", true)
MorganaMenu.Drawings:Boolean("W", "Draw W", true)
MorganaMenu.Drawings:Boolean("E", "Draw E", true)
MorganaMenu.Drawings:Boolean("R", "Draw R", true)


MorganaMenu:SubMenu("DMG", "Draw DMG")
MorganaMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
MorganaMenu.DMG:Boolean("W", "Draw W Dmg", true)
MorganaMenu.DMG:Boolean("R", "Draw R Dmg", true)


 

OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()

                     local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,250,1300,80,true,false)
                     local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,216,900,280,false,false)






                       
                        
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1300) and MorganaMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
						if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 900) and MorganaMenu.Combo.W:Value() then
						CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 900) and MorganaMenu.Combo.SW:Value() and GotBuff(target, "DarkBindingMissile") == 1 or GotBuff(target, "Stun") == 1 then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z) 
                    end
                        for _, ally in pairs(GoS:GetAllyHeroes()) do                        
                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 1300) and GoS:GetDistance(myHero, ally) <= 750 and MorganaMenu.Combo.E:Value() and (GetCurrentHP(ally)/GetMaxHP(ally))<0.5 then
                        CastTargetSpell(ally, _E)
                        end
                    end
						if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 625) and MorganaMenu.Combo.R:Value() then
                        CastSpell(_R)
						end
        end

      for i,enemy in pairs(GoS:GetEnemyHeroes()) do

        
    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and MorganaMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (55*GetCastLevel(myHero,_Q) + 25 + 0.9*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    end
    if CanUseSpell(myHero,_W) == READY and GOS:ValidTarget(enemy, 2000) and MorganaMenu.DMG.W:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (80*GetCastLevel(myHero,_W) + 1.1*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    end
    if CanUseSpell(myHero,_R) == READY and GOS:ValidTarget(enemy, 2000) and MorganaMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (75*GetCastLevel(myHero,_R) + 75 + 0.7*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    end
    
end
      for i,enemy in pairs(GoS:GetEnemyHeroes()) do
            
            local QPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),1200,250,1300,80,true,false)
                     local WPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),0,216,900,280,false,false)

            if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(enemy,GetCastRange(myHero,_Q)) and MorganaMenu.Killsteal.Q:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (55*GetCastLevel(myHero,_Q) + 25 + 0.9*(GetBonusAP(myHero)))) then
            CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
            end
            if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(enemy,GetCastRange(myHero,_W)) and MorganaMenu.Killsteal.W:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (6*GetCastLevel(myHero,_Q) + 2 + 0.11*(GetBonusAP(myHero)))) then
            CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
            end
        end
 
if MorganaMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1300,3,100,0xff00ffff) end
if MorganaMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,750,3,100,0xff00ff00) end
if MorganaMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,625,3,100,0xff00ff00) end
if MorganaMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,900,3,100,0xff00ff00) end

end)
