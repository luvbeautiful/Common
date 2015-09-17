LeeSinMenu = Menu("LeeSin", "LeeSin")
LeeSinMenu:SubMenu("Combo", "Combo")
LeeSinMenu.Combo:Boolean("Q", "Use Q", true)
LeeSinMenu.Combo:Boolean("W", "Use W", true)
LeeSinMenu.Combo:Boolean("E", "Use E", true)

LeeSinMenu:SubMenu("Killsteal", "Killsteal:")
LeeSinMenu.Killsteal:Boolean("R", "Killsteal with R", true)



LeeSinMenu:SubMenu("Drawings", "Drawings:")
LeeSinMenu.Drawings:Boolean("Q","Draw Q", true)
LeeSinMenu.Drawings:Boolean("W","Draw W", true)
LeeSinMenu.Drawings:Boolean("E","Draw E", true)
LeeSinMenu.Drawings:Boolean("R","Draw R", true)

 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                            local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,1100,60,true,false)


                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and LeeSinMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and GoS:GetDistance(myHero, target) < 300 and LeeSinMenu.Combo.W:Value() then
                            if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 then
                        CastSpell(_W)
                    end
                        end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 350) and LeeSinMenu.Combo.E:Value() then
                        CastSpell(_E)
						end
        end


        for i,enemy in pairs(GoS:GetEnemyHeroes()) do
            if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy,GetCastRange(myHero,_R)) and LeeSinMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, (200*GetCastLevel(myHero,_R) + 2.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
            CastTargetSpell(enemy, _R)
            end
      end
 

if LeeSinMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if LeeSinMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if LeeSinMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,350,3,100,0xff00ff00) end
if LeeSinMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


    end)
