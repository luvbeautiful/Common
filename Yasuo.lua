YasuoMenu = Menu("Yasuo", "Yasuo")
YasuoMenu:SubMenu("Combo", "Combo")
YasuoMenu.Combo:Boolean("Q", "Use Q", true)
YasuoMenu.Combo:Boolean("E", "Use E", true)
YasuoMenu.Combo:Boolean("R", "Use R", true)

YasuoMenu:SubMenu("Killsteal", "Killsteal")
YasuoMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)
YasuoMenu.Killsteal:Boolean("R", "Killsteal with R", true)

YasuoMenu:SubMenu("Drawings", "Drawings")
YasuoMenu.Drawings:Boolean("Q", "Draw Q Range", true)
YasuoMenu.Drawings:Boolean("E", "Draw E Range", true)
YasuoMenu.Drawings:Boolean("R", "Draw R Range", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
                         
                        

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),8700,120,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "YasuoQW" and GotBuff(myHero, "yasuodashcalar") == 0 and  QPred.HitChance == 1 and GoS:ValidTarget(target, 520) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),8700,150,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq2w" and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 0 and  GoS:ValidTarget(target, 520) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,250,3250,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and GotBuff(myHero, "yasuodashcalar") == 0 and QPred.HitChance == 1 and GoS:ValidTarget(target, 3250) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and YasuoMenu.Combo.E:Value() then
                        CastTargetSpell(target, _E)
                        end
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and YasuoMenu.Combo.R:Value() then
                        CastSpell(_R)
                        end


        end

 
for i,enemy in pairs(GoS:GetEnemyHeroes()) do

local QPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),1500,250,1025,90,false,false)              
               
               if CanUseSpell(myHero, _Q) == READY and YasuoMenu.Killsteal.Q:Value() and QPred.HitChance == 1 and GoS:ValidTarget(enemy,GetCastRange(myHero,_Q)) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (20*GetCastLevel(myHero,_Q) + 0 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))) then 
        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)

                 elseif CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy, GetCastRange(myHero,_R)) and YasuoMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 100 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))) then
                 CastSpell(_R)
    end
 
if YasuoMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if YasuoMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if YasuoMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


end

end)
