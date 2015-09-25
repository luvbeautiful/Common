ShyvanaMenu = Menu("Shyvana", "Shyvana")
ShyvanaMenu:SubMenu("Combo", "Combo")
ShyvanaMenu.Combo:Boolean("HQ", "Use Human Q", true)
ShyvanaMenu.Combo:Boolean("HW", "Use Human W", true)
ShyvanaMenu.Combo:Boolean("HE", "Use Human E", true)
ShyvanaMenu.Combo:Boolean("R", "Use R", true)
ShyvanaMenu.Combo:Boolean("DQ", "Use Dragon Q", true)
ShyvanaMenu.Combo:Boolean("DW", "Use Dragon W", true)
ShyvanaMenu.Combo:Boolean("DE", "Use Dragon E", true)


ShyvanaMenu:SubMenu("Drawings", "Drawings:")
ShyvanaMenu.Drawings:Boolean("HW", "Draw Human W", true)
ShyvanaMenu.Drawings:Boolean("HE", "Draw Human E", true)
ShyvanaMenu.Drawings:Boolean("DW", "Draw Dragon W", true)
ShyvanaMenu.Drawings:Boolean("DE", "Draw Dragon E", true)
ShyvanaMenu.Drawings:Boolean("R", "Draw R", true)


ShyvanaMenu:SubMenu("DMG", "Draw DMG")
ShyvanaMenu.DMG:Boolean("E", "Draw E Dmg", true)
ShyvanaMenu.DMG:Boolean("W", "Draw W Dmg", true)
ShyvanaMenu.DMG:Boolean("R", "Draw R Dmg", true)


 
 
 
 
OnLoop(function(myHero)

  


           if  IOW:Mode() == "Combo" then
                     local target = GetCurrentTarget()
				
				        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "ShyvanaDoubleAttack" and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 200 and ShyvanaMenu.Combo.HQ:Value() then
                        CastSpell(_Q)
						end
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "shyvanadoubleattackdragon" and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 200 and ShyvanaMenu.Combo.DQ:Value() then
                        CastSpell(_Q)
                        end   
						if CanUseSpell(myHero, _W) == READY and GetCastName(myHero, _W) == "ShyvanaImmolationAura" and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 325 and ShyvanaMenu.Combo.HW:Value() then
                        CastSpell(_W)
						end
                        if CanUseSpell(myHero, _W) == READY and GetCastName(myHero, _W) == "shyvanaimmolatedragon" and GoS:ValidTarget(target, 2000) and GoS:GetDistance(myHero, target) <= 325 and ShyvanaMenu.Combo.DW:Value() then
                        CastSpell(_W)
                        end
						local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,250,950,60,false,false)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GetCastName(myHero, _E) == "ShyvanaFireball" and GoS:ValidTarget(target, 1300) and GoS:GetDistance(myHero, target) <= 950 and ShyvanaMenu.Combo.HE:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,333,750,300,false,false)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GetCastName(myHero, _E) == "shyvanafireballdragon2" and GoS:ValidTarget(target, 1300) and GoS:GetDistance(myHero, target) <= 750 and ShyvanaMenu.Combo.DE:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                        end
						local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),700,250,1200,450,false,false)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GetCastName(myHero, _R) == "ShyvanaTransformCast" and GoS:ValidTarget(target, 1300) and GoS:GetDistance(myHero, target) <= 1200 and ShyvanaMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
	                    end
        end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do

    if GoS:ValidTarget(target, 2000) and CanUseSpell(myHero,_W) == READY and ShyvanaMenu.DMG.W:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, (39*GetCastLevel(myHero,_W) - 21 + 0.6*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    elseif CanUseSpell(myHero,_E) == READY and ShyvanaMenu.DMG.E:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_E) - 20 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    elseif CanUseSpell(myHero,_R) == READY and ShyvanaMenu.DMG.R:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (125*GetCastLevel(myHero,_R) + 50 + 0.7*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)

 end
 
end
 
if ShyvanaMenu.Drawings.HE:Value() and GetCastName(myHero, _E) == "ShyvanaFireball" then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,950,3,100,0xff00ff00) end
if ShyvanaMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1200,3,100,0xff00ff00) end
if ShyvanaMenu.Drawings.HW:Value() and GetCastName(myHero, _W) == "ShyvanaImmolationAura" then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,325,3,100,0xff00ff00) end
if ShyvanaMenu.Drawings.DE:Value() and GetCastName(myHero, _E) == "shyvanafireballdragon2" then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,750,3,100,0xff00ff00) end
if ShyvanaMenu.Drawings.DW:Value() and GetCastName(myHero, _W) == "shyvanaimmolatedragon" then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,325,3,100,0xff00ff00) end

end)
