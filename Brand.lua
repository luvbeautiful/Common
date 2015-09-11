BrandMenu = Menu("Brand", "Brand")
BrandMenu:SubMenu("Combo", "Combo")
BrandMenu.Combo:Boolean("Q", "Use Q", true)
BrandMenu.Combo:Boolean("W", "Use W", true)
BrandMenu.Combo:Boolean("E", "Use E", true)
BrandMenu.Combo:Boolean("R", "Use R", true)

BrandMenu:SubMenu("Drawings", "Drawings")
BrandMenu.Drawings:Boolean("Q", "Draw Q Range", true)
BrandMenu.Drawings:Boolean("W", "Draw W Range", true)
BrandMenu.Drawings:Boolean("E", "Draw E Range", true)
BrandMenu.Drawings:Boolean("R", "Draw R Range", true)


BrandMenu:SubMenu("Killsteal", "Killsteal")
BrandMenu.Killsteal:Boolean("R", "Killsteal with R", true)
BrandMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
                local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,250,1100,60,true,false)
                 local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,850,1100,250,false,false)



                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and BrandMenu.Combo.Q:Value() then
                            if GotBuff(target, "brandablaze") == 1 then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                    end
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and BrandMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
						end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and BrandMenu.Combo.E:Value() then
                        CastTargetSpell(target, _E)
						end
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and BrandMenu.Combo.R:Value() then
                        CastTargetSpell(target, _R)
                        end
        end

 
for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local target = GetCurrentTarget()
local QPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),2000,250,1100,60,true,false)


if CanUseSpell(myHero, _Q) == READY and BrandMenu.Killsteal.Q:Value() and QPred.HitChance == 1 and GoS:ValidTarget(enemy,GetCastRange(myHero,_Q)) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_Q) + 40 + 0.65*GetBonusAP(myHero))) then 
    CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
 

elseif CanUseSpell(myHero, _R) and GoS:ValidTarget(enemy, GetCastRange(myHero,_R)) and BrandMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 50 + 0.5*GetBonusAP(myHero))) then
                 CastTargetSpell(enemy, _R)
end

if BrandMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if BrandMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if BrandMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if BrandMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


end

end)

