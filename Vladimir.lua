VladimirMenu = Menu("Vladimir", "Vladimir")
VladimirMenu:SubMenu("Combo", "Combo")
VladimirMenu.Combo:Boolean("Q", "Use Q", true)
VladimirMenu.Combo:Boolean("E", "Use E", true)
VladimirMenu.Combo:Boolean("R", "Use R on 3 or your hp below 40%", true)

VladimirMenu:SubMenu("Killsteal", "Killsteal")
VladimirMenu.Killsteal:Boolean("R", "Killsteal with R", true)

VladimirMenu:SubMenu("Drawings", "Drawings:")
VladimirMenu.Drawings:Boolean("Q", "Draw Q", true)
VladimirMenu.Drawings:Boolean("W", "Draw W", false)
VladimirMenu.Drawings:Boolean("E", "Draw E", false)
VladimirMenu.Drawings:Boolean("R", "Draw R", false)


VladimirMenu:SubMenu("DMG", "Draw DMG")
VladimirMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
VladimirMenu.DMG:Boolean("E", "Draw E Dmg", true)
VladimirMenu.DMG:Boolean("R", "Draw R Dmg", true)

VladimirMenu:SubMenu("AutoW", "AutoW")
VladimirMenu.AutoW:Boolean("HW", "Use auto W when low Hp", true)


OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()
                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,389,875,375,false,false)
					    
						if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 600 and VladimirMenu.Combo.Q:Value() then
                        CastTargetSpell(target, _Q)
						end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 610 and VladimirMenu.Combo.Q:Value() then
                        CastSpell(_E)
						end
						if CanUseSpell(myHero, _R) and RPred.HitChance == 1 and GoS:ValidTarget(target, 875) and GoS:EnemiesAround(RPred.PredPos, 375) >= 3 or (GetCurrentHP(myHero)/GetMaxHP(myHero))<=0.40 and VladimirMenu.Combo.Q:Value() then
                 CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			   end
        end

                        for i,enemy in pairs(GoS:GetEnemyHeroes()) do
    if CanUseSpell(myHero,_Q) == READY and GoS:ValidTarget(enemy, 2000) and VladimirMenu.DMG.Q:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (35*GetCastLevel(myHero,_Q) + 55 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
  elseif CanUseSpell(myHero,_E) == READY and GoS:ValidTarget(enemy, 2000) and VladimirMenu.DMG.E:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (25*GetCastLevel(myHero,_E) + 35 + 0.45*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    elseif CanUseSpell(myHero,_R) == READY and GoS:ValidTarget(enemy, 2000) and VladimirMenu.DMG.R:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (112*GetCastLevel(myHero,_R) + 56 + 0.784*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
end

						if CanUseSpell(myHero, _W) == READY and (GetCurrentHP(myHero)/GetMaxHP(myHero))<=0.31 and VladimirMenu.AutoW.HW:Value() then
                        CastSpell(_W)
                        end


	                       for i,enemy in pairs(GoS:GetEnemyHeroes()) do
	                       	 local RPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),0,389,875,375,false,false)
		       
		       if CanUseSpell(myHero, _R) and RPred.HitChance == 1 and GoS:ValidTarget(enemy, GetCastRange(myHero, _R)) and VladimirMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (112*GetCastLevel(myHero,_R) + 56 + 0.784*(GetBonusAP(myHero)))) then
                 CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			   end
		end
 
if VladimirMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xffffff00) end
if VladimirMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,610,3,100,0xffffff00) end
if VladimirMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,875,3,100,0xffffff00) end
if VladimirMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,350,3,100,0xffffff00) end

end)