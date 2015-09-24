RenektonMenu = Menu("Renekton", "Renekton")
RenektonMenu:SubMenu("Combo", "Combo")
RenektonMenu.Combo:Boolean("Q", "Use Q", true)
RenektonMenu.Combo:Boolean("W", "Use W", true)
RenektonMenu.Combo:Boolean("E", "Use E", true)
RenektonMenu.Combo:Boolean("R", "Use R", true)

RenektonMenu:SubMenu("Drawings", "Drawings:")
RenektonMenu.Drawings:Boolean("Q", "Draw Q", true)
RenektonMenu.Drawings:Boolean("W", "Draw W", true)
RenektonMenu.Drawings:Boolean("E", "Draw E", true)
RenektonMenu.Drawings:Boolean("R", "Draw R", true)


RenektonMenu:SubMenu("DMG", "Draw DMG")
RenektonMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
RenektonMenu.DMG:Boolean("W", "Draw W Dmg", true)
RenektonMenu.DMG:Boolean("E", "Draw E Dmg", true)

 
OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()


					    if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 325) and RenektonMenu.Combo.Q:Value() then
                        CastSpell(_Q)
						end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 400) and RenektonMenu.Combo.W:Value() then
                        CastSpell(_W)
                        end
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,250,450,50,false,false)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GetCastName(myHero, _E) == "RenektonSliceAndDice" and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and RenektonMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,250,450,50,false,false)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GetCastName(myHero, _E) == "renektondice" and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and RenektonMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                        end
						if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, enemy) <= 300 and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.65 and RenektonMenu.Combo.R:Value() then
                        CastSpell(_R)
                        end
                end


for i,enemy in pairs(GoS:GetEnemyHeroes()) do
if GoS:ValidTarget(enemy, 2000) and RenektonMenu.DMG.Q:Value() and CanUseSpell(myHero,_Q) == READY then
local trueDMG = GoS:CalcDamage(myHero, enemy, (30*GetCastLevel(myHero,_Q) - 30 + 0.8*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
elseif GoS:ValidTarget(enemy, 2000) and RenektonMenu.DMG.W:Value() and CanUseSpell(myHero,_W) == READY then
local trueDMG = GoS:CalcDamage(myHero, enemy, (10*GetCastLevel(myHero,_W) + 5 + 0.8*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
elseif GoS:ValidTarget(enemy, 2000) and RenektonMenu.DMG.E:Value() and CanUseSpell(myHero,_E) == READY then
local trueDMG = GoS:CalcDamage(myHero, enemy, (30*GetCastLevel(myHero,_E) - 30 + 0.8*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
end

end

if RenektonMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,325,3,100,0xff00ff00) end
if RenektonMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,400,3,100,0xff00ff00) end
if RenektonMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,450,3,100,0xff00ff00) end
if RenektonMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,210,3,100,0xff00ff00) end

 end)
 
