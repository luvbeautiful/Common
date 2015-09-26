MasterYiMenu = Menu("Master Yi", "Master Yi")
MasterYiMenu:SubMenu("Combo", "Combo")
MasterYiMenu.Combo:Boolean("Q", "Use Q", true)
MasterYiMenu.Combo:Boolean("E", "Use E", true)
MasterYiMenu.Combo:Boolean("W", "Use W as AA reset", true)
MasterYiMenu.Combo:Boolean("R", "Use R", true)

MasterYiMenu:SubMenu("Drawings", "Drawings:")
MasterYiMenu.Drawings:Boolean("Q","Draw Q", true)
MasterYiMenu.Drawings:Boolean("R","Draw R", true)

MasterYiMenu:SubMenu("DMG", "Draw DMG")
MasterYiMenu.DMG:Boolean("Q", "Draw Q Dmg", true)

OnLoop(function(myHero)




if IOW:Mode() == "Combo" then
                      local target = GetCurrentTarget()
                       
					    if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 1050) and MasterYiMenu.Combo.Q:Value() then
                        CastTargetSpell(target, _Q)
                        end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 500) and MasterYiMenu.Combo.W:Value() and GotBuff(myHero, "doublestrike") >= 1 then
                        CastSpell(_W) 
                    end
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 850) and MasterYiMenu.Combo.R:Value() then
                        CastSpell(_R)
                      end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 500) and MasterYiMenu.Combo.E:Value() then
                        CastSpell(_E)
						end
    end





for i,enemy in pairs(GoS:GetEnemyHeroes()) do
        
  if CanUseSpell(myHero,_Q) == READY and MasterYiMenu.DMG.Q:Value() and GoS:ValidTarget(enemy, 2000) then
local trueDMG = GoS:CalcDamage(myHero, enemy, (35*GetCastLevel(myHero,_Q) - 10 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    end


 end
 

 


if MasterYiMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if MasterYiMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,850,3,100,0xff00ff00) end


end)