YasuoiMenu = Menu("Yasuo", "Yasuo")
YasuoiMenu:SubMenu("Combo", "Combo")
YasuoiMenu.Combo:Boolean("Q", "Use Q", true)
YasuoiMenu.Combo:Boolean("E", "Use E", true)
YasuoiMenu.Combo:Boolean("R", "Use R", true)

YasuoiMenu:SubMenu("Killsteal", "Killsteal")
YasuoiMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)
YasuoiMenu.Killsteal:Boolean("R", "Killsteal with R", true)

YasuoiMenu:SubMenu("Drawings", "Drawings")
YasuoiMenu.Drawings:Boolean("Q", "Draw Q Range", true)
YasuoiMenu.Drawings:Boolean("E", "Draw E Range", true)
YasuoiMenu.Drawings:Boolean("R", "Draw R Range", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
					    local target = GetCurrentTarget()
						 local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,250,1025,90,false,false)
                        


                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and YasuoiMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end

						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and YasuoiMenu.Combo.E:Value() then
                        CastTargetSpell(target, _E)
						end

						if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and YasuoiMenu.Combo.R:Value() then
                        CastSpell(_R)
						end


        end

 
for i,enemy in pairs(GoS:GetEnemyHeroes()) do

local QPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),1500,250,1025,90,false,false)	          
               
		       if CanUseSpell(myHero, _Q) == READY and YasuoiMenu.Killsteal.Q:Value() and QPred.HitChance == 1 and GoS:ValidTarget(enemy,GetCastRange(myHero,_Q)) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (20*GetCastLevel(myHero,_Q) + 0 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))) then 
        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)

                 elseif CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy, GetCastRange(myHero,_R)) and YasuoiMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 100 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))) then
                 CastSpell(_R)
    end
 
if YasuoiMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if YasuoiMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if YasuoiMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


end

end)

