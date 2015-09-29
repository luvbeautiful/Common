EzrealMenu = Menu("Ezrael", "Ezrael")
EzrealMenu:SubMenu("Combo", "Combo")
EzrealMenu.Combo:Boolean("Q", "Use Q", true)
EzrealMenu.Combo:Boolean("W", "Use W", true)
EzrealMenu.Combo:Boolean("E", "Use E", true)
EzrealMenu.Combo:Boolean("R", "Use R", true)

EzrealMenu:SubMenu("Killsteal", "Killsteal:")
EzrealMenu.Killsteal:Boolean("R", "Killsteal with R", true)


EzrealMenu:SubMenu("Drawings", "Drawings:")
EzrealMenu.Drawings:Boolean("E","Draw E", true)
EzrealMenu.Drawings:Boolean("W","Draw W", true)
EzrealMenu.Drawings:Boolean("R","Draw R", true)
EzrealMenu.Drawings:Boolean("Q","Draw Q", true)
 
OnLoop(function(myHero)

local target = GetCurrentTarget()
local mousePos = GetMousePos()

if IOW:Mode() == "Combo" then
			  local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,250,1200,60,true,false)
             local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1600,250,1050,80,false,false)          
			local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,100,475,750,false,true)		    
            local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,1000,20000,160,false,false)



                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1200) and GoS:GetDistance(myHero, target) <= 1100 and EzrealMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                        
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 1050) and GoS:GetDistance(myHero, target) <= 1000 and EzrealMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
						
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 500 and EzrealMenu.Combo.E:Value() then
                        CastSkillShot(_E, mousePos.x, mousePos.y, mousePos.z) 
						end
						
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, 20000) and GoS:GetDistance(myHero, target) <= 5000 and EzrealMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
    end


	      for i,enemy in pairs(GoS:GetEnemyHeroes()) do

            local RPred = GetPredictionForPlayer(Gos:myHeroPos(),enemy,GetMoveSpeed(enemy),2000,1000,20000,160,false,false)
		       
               if CanUseSpell(myHero, _R) and RPred.HitChance == 1 and GoS:ValidTarget(enemy, GetCastRange(myHero, _R)) and GoS:GetDistance(myHero, enemy) <= 5000 and EzrealMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (150*GetCastLevel(myHero,_R) + 100 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero) + 0.90*(GetBonusAP(myHero)))),0) then  
               CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			   end
end


if EzrealMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1200,3,100,0xff00ff00) end
if EzrealMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1050,3,100,0xff00ff00) end
if EzrealMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,500,3,100,0xff00ff00) end
if EzrealMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,5000,3,100,0xff00ff00) end


    end)