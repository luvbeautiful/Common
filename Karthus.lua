KarthusMenu = Menu("Karthus", "Karthus")
KarthusMenu:SubMenu("Combo", "Combo")
KarthusMenu.Combo:Boolean("Q", "Use Q", true)
KarthusMenu.Combo:Boolean("E", "Use E", true)

KarthusMenu:SubMenu("Killsteal", "Killsteal:")
KarthusMenu.Killsteal:Boolean("R", "Killsteal with R", true)

KarthusMenu:SubMenu("Drawings", "Drawings:")
KarthusMenu.Drawings:Boolean("E","Draw E", true)
KarthusMenu.Drawings:Boolean("Q","Draw Q", true)
 
 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                       
					                 local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,900,875,190,false,false)

             



                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 875) and KarthusMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						if CanUseSpell(myHero,_E) == READY and GotBuff(myHero,"KarthusDefile") ~= 1 and GoS:ValidTarget(target, 550) and KarthusMenu.Combo.E:Value() then
						CastSpell(_E)
						elseif CanUseSpell(myHero,_E) == READY and GotBuff(myHero,"KarthusDefile") == 1 and not GoS:ValidTarget(target, 550) and KarthusMenu.Combo.E:Value() then
						CastSpell(_E)
						end
                end


 for i,enemy in pairs(GoS:GetEnemyHeroes()) do

                 if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy, GetCastRange(myHero,_R)) and KarthusMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (150*GetCastLevel(myHero,_R) + 100 + 0.6*GetBonusAP(myHero))) then
                 CastSpell(_R)
            end
      end
 
if KarthusMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if KarthusMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,550,3,100,0xff00ff00) end


    end)
