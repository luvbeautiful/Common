AhriMenu = Menu("Ahri", "Ahri")
AhriMenu:SubMenu("Combo", "Combo")
AhriMenu.Combo:Boolean("Q", "Use Q", true)
AhriMenu.Combo:Boolean("W", "Use W", true)
AhriMenu.Combo:Boolean("E", "Use E", true)
AhriMenu.Combo:Boolean("NR", "Use R Near enemy", false)
AhriMenu.Combo:Boolean("FR", "Use R Far far", true)

AhriMenu:SubMenu("Drawings", "Drawings")
AhriMenu.Drawings:Boolean("Q", "Draw Q Range", true)
AhriMenu.Drawings:Boolean("W", "Draw W Range", false)
AhriMenu.Drawings:Boolean("E", "Draw E Range", false)
AhriMenu.Drawings:Boolean("R", "Draw R Range", false)


AhriMenu:SubMenu("DMG", "Draw DMG")
AhriMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
AhriMenu.DMG:Boolean("W", "Draw W Dmg", true)
AhriMenu.DMG:Boolean("R", "Draw R Dmg", true)
AhriMenu.DMG:Boolean("E", "Draw E Dmg", true)


 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then

                       local mousePos = GetMousePos()
                        local target = GetCurrentTarget()
                 local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1100,250,880,80,false,false) 
                 local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,250,975,60,true,false)

                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2200,500,450,250,false,false)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, 1200) and GoS:GetDistance(myHero, target) <= 1000 and GoS:GetDistance(myHero, target) <= 1000 and AhriMenu.Combo.NR:Value() then 
                        CastSkillShot(_R, mousePos.x, mousePos.y, mousePos.z)
						end
                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2200,500,1000,250,false,false)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, 1200) and GoS:GetDistance(myHero, target) <= 1000 and GoS:GetDistance(myHero, target) <= 1000 and AhriMenu.Combo.FR:Value() then 
                        CastSkillShot(_R, mousePos.x, mousePos.y, mousePos.z)
                        end
						if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 1200) and GoS:GetDistance(myHero, target) < 700 and AhriMenu.Combo.W:Value() then
                        CastSpell(_W)
						end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1200) and GoS:GetDistance(myHero, target) <= 900 and AhriMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                        end
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1200) and GoS:GetDistance(myHero, target) <= 840 and AhriMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
        end


   for i,enemy in pairs(GoS:GetEnemyHeroes()) do
    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and AhriMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (25*GetCastLevel(myHero,_Q) + 15 + 0.35*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_W) == READY and GOS:ValidTarget(enemy, 2000) and AhriMenu.DMG.W:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (25*GetCastLevel(myHero,_W) + 15 + 0.4*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_E) == READY and GOS:ValidTarget(enemy, 2000) and AhriMenu.DMG.E:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (35*GetCastLevel(myHero,_E) + 25 + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_R) == READY and GOS:ValidTarget(enemy, 2000) and AhriMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_R) + 30 + 0.3*(GetBonusAP(myHero) + 0.8*(GetBonusAP(enemy)))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end


if AhriMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,880,3,100,0xffffff00) end
if AhriMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,700,3,100,0xffffff00) end
if AhriMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,975,3,100,0xffffff00) end
if AhriMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1000,3,100,0xffffff00) end


end)
