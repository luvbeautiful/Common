DravenMenu = Menu("Draven", "Draven")
DravenMenu:SubMenu("Combo", "Combo")
DravenMenu.Combo:Boolean("Q", "Use Q", true)
DravenMenu.Combo:Boolean("W", "Use W", true)
DravenMenu.Combo:Boolean("E", "Use E", true)
DravenMenu.Combo:Boolean("R", "Use R", true)

DravenMenu:SubMenu("Killsteal", "Killsteal:")
DravenMenu.Killsteal:Boolean("R", "Killsteal with R", true)

DravenMenu:SubMenu("Drawings", "Drawings:")
DravenMenu.Drawings:Boolean("E","Draw E", true)
DravenMenu.Drawings:Boolean("R","Draw R", true)
DravenMenu.Drawings:Boolean("Q","Draw Q", true)
DravenMenu.Drawings:Boolean("W","Draw W", true)
 
 
OnLoop(function(myHero)

local target = GetCurrentTarget()

if IOW:Mode() == "Combo" then
                       local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1400,300,1100,1300,false,false)

                       
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 600) and DravenMenu.Combo.Q:Value() then
                        CastSpell(_Q)
                        end
						if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 600) and DravenMenu.Combo.W:Value() then
                        CastSpell(_W)
						end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and DravenMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
        end


	      for i,enemy in pairs(GoS:GetEnemyHeroes()) do

		       local RPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),2000,500,2000,160,false,false)

               if CanUseSpell(myHero, _R) and RPred.HitChance == 1 and GoS:ValidTarget(enemy, GetCastRange(myHero, _R)) and DravenMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, (100*GetCastLevel(myHero,_R) + 75 + 1.10*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) and GoS:GetDistance(myHero, enemy) < 5000 then  
               CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			   end
		end

if DravenMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end
if DravenMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end
if DravenMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if DravenMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(mtHero,_R)),3,100,0xff00ff00) end


    end)
