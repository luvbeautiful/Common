KogMawMenu = Menu("KogMaw", "KogMaw")
KogMawMenu:SubMenu("Combo", "Combo")
KogMawMenu.Combo:Boolean("Q", "Use Q", true)
KogMawMenu.Combo:Boolean("W", "Use W", true)
KogMawMenu.Combo:Boolean("E", "Use E", true)
KogMawMenu.Combo:Boolean("R", "Use R", true)

KogMawMenu:SubMenu("Killsteal", "Killsteal:")
KogMawMenu.Killsteal:Boolean("R", "Killsteal with R", true)


KogMawMenu:SubMenu("Drawings", "Drawings:")
KogMawMenu.Drawings:Boolean("Q","Draw Q", true)
KogMawMenu.Drawings:Boolean("W","Draw W", true)
KogMawMenu.Drawings:Boolean("E","Draw E", true)
KogMawMenu.Drawings:Boolean("R","Draw R", true)

 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1650,250,1125,70,true,false)
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1400,250,1360,120,false,false)
                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,1100,2200,235,false,false)






                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and KogMawMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 720) and KogMawMenu.Combo.W:Value() then
			        CastSpell(_W)
                        end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and KogMawMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and KogMawMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
                end
      
        for i,enemy in pairs(GoS:GetEnemyHeroes()) do
		       local RPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),0,1250,1800,150,false,true)

               if CanUseSpell(myHero, _R) and GoS:ValidTarget(enemy, GetCastRange(myHero, _R)) and KogMawMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_R) + 40 + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero) + 0.3*(GetBonusAP(myHero))))) then  
               CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			   end
		end


if KogMawMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if KogMawMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,720,3,100,0xff00ff00) end
if KogMawMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if KogMawMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


    end)
