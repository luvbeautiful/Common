TeemoMenu = Menu("Teemo", "Teemo")
TeemoMenu:SubMenu("Combo", "Combo")
TeemoMenu.Combo:Boolean("Q", "Use Q", true)

TeemoMenu:SubMenu("Killsteal", "Killsteal:")
TeemoMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)
 
TeemoMenu:SubMenu("Drawings", "Drawings:")
TeemoMenu.Drawings:Boolean("Q","Draw Q", true)

 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                       
                     
						if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and TeemoMenu.Combo.Q:Value() then
                        CastTargetSpell(target, _Q)
						end
                end

          for i,enemy in pairs(GoS:GetEnemyHeroes()) do
               if CanUseSpell(myHero, _Q) and GoS:ValidTarget(enemy, GetCastRange(myHero, _Q)) and TeemoMenu.Killsteal.Q:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (45*GetCastLevel(myHero,_Q) + 35 + 0.8*(GetBonusAP(myHero)))) then
               CastTargetSpell(enemy, _Q)
               end
        end


if TeemoMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end

end)