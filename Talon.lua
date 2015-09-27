TalonMenu = Menu("Talon", "Talon")
TalonMenu:SubMenu("Combo", "Combo")
TalonMenu.Combo:Boolean("Q", "Use Q", true)
TalonMenu.Combo:Boolean("W", "Use W", true)
TalonMenu.Combo:Boolean("E", "Use E", true)
TalonMenu.Combo:Boolean("R", "Use R", true)

TalonMenu:SubMenu("Drawings", "Drawings:")
TalonMenu.Drawings:Boolean("W", "Draw W", true)
TalonMenu.Drawings:Boolean("E", "Draw E", false)
TalonMenu.Drawings:Boolean("R", "Draw R", false)


TalonMenu:SubMenu("DMG", "Draw DMG")
TalonMenu.DMG:Boolean("W", "Draw W Dmg", true)
TalonMenu.DMG:Boolean("R", "Draw R Dmg", true)


 
 
OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()
                     local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,250,600,200,false,true)
				
				        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 300) and TalonMenu.Combo.Q:Value() then
                        CastSpell(_Q)
                        end
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 600 and TalonMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
						end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 600) and TalonMenu.Combo.E:Value() then
                        CastTargetSpell(target, _E)
						end
                        for i,enemy in pairs(GoS:GetEnemyHeroes()) do
						if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 680 and GoS:EnemiesAround(GoS:myHeroPos(), 680) >=2 or (GetCurrentHP(myHero)/GetMaxHP(myHero))<=0.40  and TalonMenu.Combo.R:Value() then
                        CastSpell(_R)
						end
                        end
                        for i,enemy in pairs(GoS:GetEnemyHeroes()) do
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy, 1000) and GoS:GetDistance(myHero, enemy) <= 680 and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, (50*GetCastLevel(myHero,_R) + 70 + 0.75*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) and TalonMenu.Combo.R:Value() then
                        CastSpell(_R)
                        end
                        end
        end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do
 if CanUseSpell(myHero,_W) == READY and GoS:ValidTarget(enemy, 2000) and TalonMenu.DMG.W:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, (25*GetCastLevel(myHero,_W) + 5 + 0.6*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff00ffff)
     elseif CanUseSpell(myHero,_R) == READY and TalonMenu.DMG.R:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, (50*GetCastLevel(myHero,_R) + 70 + 0.75*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff00ffff)
    end

 end
 

 
if TalonMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end
if TalonMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end
if TalonMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,650,3,100,0xff00ff00) end

end)
