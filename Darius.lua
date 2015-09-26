DariusMenu = Menu ("Darius", "Darius")
DariusMenu:SubMenu("Combo", "Combo")
DariusMenu.Combo:Boolean("Q", "Use Q", true)
DariusMenu.Combo:Boolean("W", "Use W", true)
DariusMenu.Combo:Boolean("E", "Use E", true)
DariusMenu.Combo:Boolean("R", "Use R", true)

DariusMenu:SubMenu("Killsteal", "Killsteal:")
DariusMenu.Killsteal:Boolean("R","Killsteal with R", true)





OnLoop(function(myHero)



         if IOW:Mode() == "Combo" then



                               local target = GetCurrentTarget()
                                   local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,320,570,300,false,true)
                                                                                                                                           

      

                                if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 425) and DariusMenu.Combo.Q:Value() then
                                CastSpell(_Q)  
                                end 
                                if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 300) and DariusMenu.Combo.W:Value() then
                                CastSpell(_W)
                                end
                            if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 570) and DariusMenu.Combo.E:Value() then 
                                CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                                end 
end

                                for i,enemy in pairs(GoS:GetEnemyHeroes()) do                 
                            if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy, 500) and DariusMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 0.75*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
                            CastTargetSpell(enemy, _R)
                          end                            
end

        end)              