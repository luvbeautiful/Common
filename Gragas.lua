GragasMenu = Menu("Gragas", "Gragas")
GragasMenu:SubMenu("Combo", "Combo")
GragasMenu.Combo:Boolean("Q", "Use Q", true)
GragasMenu.Combo:Boolean("W", "Use W", true)
GragasMenu.Combo:Boolean("E", "Use E", true)
GragasMenu.Combo:Boolean("R", "Use R", true)

GragasMenu:SubMenu("Killsteal", "Killsteal:")
GragasMenu.Killsteal:Boolean("R", "Killsteal with R", true)


GragasMenu:SubMenu("Drawings", "Drawings:")
GragasMenu.Drawings:Boolean("Q","Draw Q", true)
GragasMenu.Drawings:Boolean("W","Draw W", true)
GragasMenu.Drawings:Boolean("E","Draw E", true)
GragasMenu.Drawings:Boolean("R","Draw R", true)
 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                     local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1000,300,1100,275,false,true)
                      local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,0,950,200,true,true)
                       local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1750,250,1050,350,false,true)





                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and GragasMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
						if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 300) and GragasMenu.Combo.W:Value() then
                        CastSpell(_W)
						end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and GragasMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						
                        if CanUseSpell(myHero, _R) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1050) and GragasMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
        end

        for i,enemy in pairs(GoS:GetEnemyHeroes()) do

local RPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),1750,250,1050,350,false,true)

	           
  	           if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(enemy,GetCastRange(myHero,_R)) and GragasMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero,  enemy, 0, (100*GetCastLevel(myHero,_R) + 100 + 0.7*(GetBonusAP(myHero)))) then 
              CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
             end
      end



if GragasMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if GragasMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,300,3,100,0xff00ff00) end
if GragasMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if GragasMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1050,3,100,0xff00ff00) end


    end)
