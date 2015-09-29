SorakaMenu = Menu("Soraka", "Soraka")
SorakaMenu:SubMenu("Combo", "Combo")
SorakaMenu.Combo:Boolean("Q", "Use Q", true)
SorakaMenu.Combo:Boolean("W", "Use W", true)
SorakaMenu.Combo:Boolean("E", "Use E", true)
SorakaMenu.Combo:Boolean("R", "Use R", true)


SorakaMenu:SubMenu("Drawings", "Drawings:")
SorakaMenu.Drawings:Boolean("Q", "Draw Q", true)
SorakaMenu.Drawings:Boolean("E", "Draw E", false)



OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()
                       
					    local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1750,250,1100,210,false,true)


                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1100) and SorakaMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						for _, ally in pairs(GoS:GetAllyHeroes()) do
			            if (GetCurrentHP(ally)/GetMaxHP(ally))<=0.65 and CanUseSpell(myHero, _W) == READY and GoS:GetDistance(myHero, ally) <= 550 and SorakaMenu.Combo.W:Value() then   
			            CastTargetSpell(ally, _W)
		                end
		                end
		                for i,enemy in pairs(GoS:GetEnemyHeroes()) do
		                local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,250,925,250,false,true)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and  GoS:EnemiesAround(EPred.PredPos, 250) >= 2 or (GetCurrentHP(myHero)/GetMaxHP(myHero))<=0.30 and GoS:ValidTarget(target, 925) and SorakaMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
					end
				 		 for i,enemy in pairs(GoS:GetEnemyHeroes()) do
				 		 	local EPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),0,250,925,250,false,true)
                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(enemy, 925) and SorakaMenu.Combo.E:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_E) + 30 + 0.4*GetBonusAP(myHero))) then
                 CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
             end
         end
						for _, ally in pairs(GoS:GetAllyHeroes()) do 
			            if (GetCurrentHP(ally)/GetMaxHP(ally))<=0.15 and CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) and SorakaMenu.Combo.R:Value() then
			            CastSpell(_R)
						end
						end
end

 
if SorakaMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1300,3,100,0xffffff00) end
if SorakaMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,925,3,100,0xffffff00) end

end)
