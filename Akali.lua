AkaliMenu = Menu("Akali", "Akali")
AkaliMenu:SubMenu("Combo", "Combo")
AkaliMenu.Combo:Boolean("Q", "Use Q", true)
AkaliMenu.Combo:Boolean("W", "Use W", true)
AkaliMenu.Combo:Boolean("E", "Use E", true)
AkaliMenu.Combo:Boolean("R", "Use R", true)

AkaliMenu:SubMenu("Drawings", "Drawings")
AkaliMenu.Drawings:Boolean("Q", "Draw Q Range", true)
AkaliMenu.Drawings:Boolean("W", "Draw W Range", true)
AkaliMenu.Drawings:Boolean("E", "Draw E Range", true)
AkaliMenu.Drawings:Boolean("R", "Draw R Range", true)

AkaliMenu:SubMenu("Killsteal", "Killsteal")
AkaliMenu.Killsteal:Boolean("R", "Killsteal with R", true)
AkaliMenu.Killsteal:Boolean("E", "Killsteal with E", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                        local target = GetCurrentTarget()
				local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,250,700,400,false,true)

                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and AkaliMenu.Combo.Q:Value() then
                        CastTargetSpell(target, _Q)
                        end                
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and AkaliMenu.Combo.W:Value() then
                            if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 then 
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
                    end
						           if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and AkaliMenu.Combo.E:Value() then
                        CastSpell(_E)
						           end
						            if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and AkaliMenu.Combo.R:Value() then
                            if GotBuff(target, "AkaliMota") == 1 then
                        CastTargetSpell(target, _R)
						            end
                    end
        end  

 
for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local target = GetCurrentTarget()


if CanUseSpell(myHero, _R) == READY and AkaliMenu.Killsteal.R:Value() and GoS:ValidTarget(enemy,GetCastRange(myHero,_R)) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0,(75*GetCastLevel(myHero,_R) + 25 + 0.5*GetBonusAP(myHero))) then 
    CastTargetSpell(enemy, _R)
    
elseif CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(enemy, GetCastRange(myHero,_E)) and AkaliMenu.Killsteal.E:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy , 0,(25*GetCastLevel(myHero,_E) + 5 + 0.4*(GetBonusAP(myHero) + 0.6*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))) then
               CastSpell(_E) 
    
end        
end

if AkaliMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if AkaliMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if AkaliMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if AkaliMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1000,3,100,0xff00ff00) end

 
end)
