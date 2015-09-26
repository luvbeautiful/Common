JinxMenu = Menu("Jinx", "Jinx")
JinxMenu:SubMenu("Combo", "Combo")
JinxMenu.Combo:Boolean("Q", "Use Q", true)
JinxMenu.Combo:Boolean("W", "Use W", true)
JinxMenu.Combo:Boolean("E", "Use E", true)
JinxMenu.Combo:Boolean("R", "Use R", true)

JinxMenu:SubMenu("Killsteal", "Killsteal:")
JinxMenu.Killsteal:Boolean("R", "Killsteal with R", true)

JinxMenu:SubMenu("Drawings", "Drawings:")
JinxMenu.Drawings:Boolean("E","Draw E", true)
JinxMenu.Drawings:Boolean("R","Draw R", true)
JinxMenu.Drawings:Boolean("Q","Draw Q", true)
JinxMenu.Drawings:Boolean("W","Draw W", true)
 
OnLoop(function(myHero)



    local target = GetCurrentTarget()
 
        if IOW:Mode() == "Combo" then
                       
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),3300,600,1500,60,true,false)
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1000,250,900,50,false,false)
                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1700,600,2000,140,false,true)



			  
					    if CanUseSpell(myHero, _Q) == READY and JinxMenu.Combo.Q:Value() and GoS:ValidTarget(target, 700) then
                        if GoS:GetDistance(myHero, target) > 525 and GotBuff(myHero, "jinxqicon") > 0 then
                        CastSpell(_Q)
                        elseif GoS:GetDistance(myHero, target) < 570 and GotBuff(myHero, "JinxQ") > 0 then
                        CastSpell(_Q)
						end
						end
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and JinxMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and JinxMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and JinxMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
                end



          for i,enemy in pairs(GoS:GetEnemyHeroes()) do
               local RPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),1700,600,2000,140,false,true)



               if CanUseSpell(myHero, _R) and RPred.HitChance == 1 and GoS:ValidTarget(enemy, GetCastRange(myHero, _R)) and JinxMenu.Killsteal.R:Value() and RPred.HitChance == 1 and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, (GetMaxHP(enemy)-GetCurrentHP(enemy))*(0.2+0.05*GetCastLevel(myHero, _R))+(150+100*GetCastLevel(myHero, _R)+GetBonusDmg(myHero))*math.max(0.1, math.min(1, GoS:GetDistance(enemy)/1700))) and GoS:GetDistance(myHero, enemy) < 5000 then  
               CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			   end
		end


if JinxMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if JinxMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,700,3,100,0xff00ff00) end
if JinxMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if JinxMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end

end)