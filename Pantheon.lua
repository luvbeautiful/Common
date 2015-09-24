PantheonMenu = Menu("Pantheon", "Pantheon")
PantheonMenu:SubMenu("Combo", "Combo")
PantheonMenu.Combo:Boolean("Q", "Use Q", true)
PantheonMenu.Combo:Boolean("W", "Use W", true)

PantheonMenu:SubMenu("Killsteal", "Killsteal")
PantheonMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)

PantheonMenu:SubMenu("Drawings", "Drawings:")
PantheonMenu.Drawings:Boolean("Q", "Draw Q", true)


PantheonMenu:SubMenu("DMG", "Draw DMG")
PantheonMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
PantheonMenu.DMG:Boolean("W", "Draw W Dmg", true)


 
 
OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()
				
				        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 600) and PantheonMenu.Combo.Q:Value() then
                        CastTargetSpell(target, _Q)
                        end
						if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 600) and PantheonMenu.Combo.W:Value() then
                        CastTargetSpell(target, _W)
						end
        end


for i,enemy in pairs(GoS:GetEnemyHeroes()) do
        if GoS:ValidTarget(enemy, 2000) and PantheonMenu.DMG.Q:Value() and CanUseSpell(myHero,_Q) == READY then
local trueDMG = GoS:CalcDamage(myHero, enemy, (40*GetCastLevel(myHero,_Q) - 25 + 1.4*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    end
    if CanUseSpell(myHero,_W) == READY and PantheonMenu.DMG.W:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (25*GetCastLevel(myHero,_W) + 25 + 1.0*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    end

 end
      for i,enemy in pairs(GoS:GetEnemyHeroes()) do

        
                 if CanUseSpell(myHero,_Q) and GoS:ValidTarget(enemy, 600) and PantheonMenu.Killsteal.Q:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, (40*GetCastLevel(myHero,_Q) + 25 + 1.4*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
                 CastTargetSpell(enemy, _Q)
            end
      end

if PantheonMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end

end)
