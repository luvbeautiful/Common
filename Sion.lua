SionMenu = Menu("Sion", "Sion")
SionMenu:SubMenu("Combo", "Combo")
SionMenu.Combo:Boolean("Q", "Use Q", true)
SionMenu.Combo:Boolean("E", "Use E", true)
SionMenu.Combo:Boolean("R", "Use R", true)

SionMenu:SubMenu("Drawings", "Drawings")
SionMenu.Drawings:Boolean("Q", "Draw Q Range", true)
SionMenu.Drawings:Boolean("W", "Draw W Range", true)
SionMenu.Drawings:Boolean("E", "Draw E Range", true)
SionMenu.Drawings:Boolean("R", "Draw R Range", true)

SionMenu:SubMenu("DMG", "Draw DMG")
SionMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
SionMenu.DMG:Boolean("E", "Draw E Dmg", true)
SionMenu.DMG:Boolean("W", "Draw W Dmg", true)
SionMenu.DMG:Boolean("R", "Draw R Dmg", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
				        
						local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,750,7500,100,false,false)
				        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,800,80,false,false)
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,0,2000,100,false,false)


                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, 7500) and GoS:GetDistance(myHero, target) <= 4000 and SionMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                        end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GetCastName(myHero, _E) == "SionE" and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 800 and SionMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						 if CanUseSpell(myHero, _W) == READY and SionMenu.Combo.E:Value() and GetCastName(myHero, _W) == "SionW" and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 500 then
                       CastSpell(_W)
				        end
                        if CanUseSpell(myHero, _W) == READY and SionMenu.Combo.E:Value() and GetCastName(myHero, _W) == "sionwdetonate" and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 500 then
                       CastSpell(_W)
                        end 		
                        if CanUseSpell(myHero, _Q) == READY and EPred.HitChance == 1 and SionMenu.Combo.Q:Value() and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 800 then
                        CastSkillShot(_Q,QPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
        end


for i,enemy in pairs(GoS:GetEnemyHeroes()) do

        if GoS:ValidTarget(enemy, 2000) and SionMenu.DMG.Q:Value() and CanUseSpell(myHero,_Q) == READY then
local trueDMG = GoS:CalcDamage(myHero, enemy, (20*GetCastLevel(myHero,_Q) + 0 + 0.65*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)

    elseif CanUseSpell(myHero,_W) == READY and SionMenu.DMG.W:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (25*GetCastLevel(myHero,_W) + 15 + 0.4*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)

    elseif CanUseSpell(myHero,_E) == READY and SionMenu.DMG.E:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (35*GetCastLevel(myHero,_E) + 35 + 0.4*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)

    elseif CanUseSpell(myHero,_R) == READY and SionMenu.DMG.R:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, (150*GetCastLevel(myHero,_R) + 0 + 0.4*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    end

 end
 

if SionMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,800,3,100,0xff00ff00) end
if SionMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,800,3,100,0xff00ff00) end
if SionMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,4000,3,100,0xff00ff00) end
if SionMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,500,3,100,0xff00ff00) end

end)
