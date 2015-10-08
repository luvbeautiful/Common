BlitzcrankMenu = Menu("Blitzcrank", "Blitzcrank")
BlitzcrankMenu:SubMenu("Combo", "Combo")
BlitzcrankMenu.Combo:Boolean("Q", "Use Q", true)
BlitzcrankMenu.Combo:Boolean("W", "Use W", false)
BlitzcrankMenu.Combo:Boolean("E", "Use E", false)
BlitzcrankMenu.Combo:Boolean("R", "Use R", false)

BlitzcrankMenu:SubMenu("Drawings", "Drawings")
BlitzcrankMenu.Drawings:Boolean("Q", "Draw Q Range", true)
BlitzcrankMenu.Drawings:Boolean("R", "Draw R Range", false)


BlitzcrankMenu:SubMenu("Killsteal", "Killsteal")
BlitzcrankMenu.Killsteal:Boolean("R", "Killsteal with R", true)

BlitzcrankMenu:SubMenu("AutoQ", "AutoQ")
BlitzcrankMenu.AutoQ:Boolean("AQ", "AutoQ", true)

BlitzcrankMenu:SubMenu("DMG", "Draw DMG")
BlitzcrankMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
BlitzcrankMenu.DMG:Boolean("R", "Draw R Dmg", true)

  
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
				local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,925,70,true,false)
                        
                       if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 870 and BlitzcrankMenu.Combo.Q:Value() then
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

local target = GetCurrentTarget()
local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,925,70,true,false)
 
                       if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 870 and BlitzcrankMenu.AutoQ.AQ:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                    end
 

   for i,enemy in pairs(GoS:GetEnemyHeroes()) do
    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and BlitzcrankMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (55*GetCastLevel(myHero,_Q) + 25 + 1.0*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_R) == READY and GOS:ValidTarget(enemy, 2000) and BlitzcrankMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (125*GetCastLevel(myHero,_R) + 125 + 1.0*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end

if BlitzcrankMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,870,1,100,0xff00ff00) end
if BlitzcrankMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


end

end)