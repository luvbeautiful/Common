BrandMenu = Menu("Brand", "Brand")
BrandMenu:SubMenu("Combo", "Combo")
BrandMenu.Combo:Boolean("SQ", "Use Q When Stun", true)
BrandMenu.Combo:Boolean("EQ", "Use Q Everytime", false)
BrandMenu.Combo:Boolean("W", "Use W", true)
BrandMenu.Combo:Boolean("E", "Use E", true)
BrandMenu.Combo:Boolean("R", "Use R", false)


BrandMenu:SubMenu("Harass", "Harass")
BrandMenu.Harass:Boolean("W", "Use W Harass", true)


BrandMenu:SubMenu("Lasthit", "Lasthit")
BrandMenu.Lasthit:Boolean("Q", "Lasthit with Q", true)

BrandMenu:SubMenu("LaneClear", "LaneClear")
BrandMenu.LaneClear:Boolean("W", "LaneClear with W", true)

BrandMenu:SubMenu("JungleClear", "JungleClear")
BrandMenu.JungleClear:Boolean("Q", "JungleClear with Q", true)
BrandMenu.JungleClear:Boolean("W", "JungleClear with W", true)
BrandMenu.JungleClear:Boolean("E", "JungleClear with E", true)

BrandMenu:SubMenu("Drawings", "Drawings")
BrandMenu.Drawings:Boolean("Q", "Draw Q Range", true)
BrandMenu.Drawings:Boolean("W", "Draw W Range", false)
BrandMenu.Drawings:Boolean("E", "Draw E Range", false)
BrandMenu.Drawings:Boolean("R", "Draw R Range", false)


BrandMenu:SubMenu("DMG", "Draw DMG")
BrandMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
BrandMenu.DMG:Boolean("R", "Draw R Dmg", true)
BrandMenu.DMG:Boolean("E", "Draw E Dmg", true)
BrandMenu.DMG:Boolean("W", "Draw W Dmg", true)

BrandMenu:SubMenu("Killsteal", "Killsteal")
BrandMenu.Killsteal:Boolean("R", "Killsteal with R", true)
BrandMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,250,1150,80,true,false)
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,850,1100,240,false,false)



                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and GotBuff(target, "brandablaze") == 1 and BrandMenu.Combo.SQ:Value() then                        
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and BrandMenu.Combo.EQ:Value() then                        
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
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

                      

                        if IOW:Mode() == "LaneClear" then
                        for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do

                        local junglePos = GetOrigin(jungle)
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),1200,250,1150,80,true,false)
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),20,850,1100,240,false,false)

                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 1150) and BrandMenu.JungleClear.Q:Value() then                        
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(jungle, 1100) and BrandMenu.JungleClear.W:Value() then
                        CastSkillShot(_W,junglePos.x, junglePos.y, junglePos.z)
                        end
                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(jungle, GetCastRange(myHero,_E)) and BrandMenu.JungleClear.E:Value() then
                        CastTargetSpell(jungle, _E)
                        end
         end
end




if IOW:Mode() == "LastHit" then
for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do
                local minionPos = GetOrigin(minion) 
                 local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),1200,250,1150,80,true,false)

        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 1300) and BrandMenu.Lasthit.Q:Value() and GetCurrentHP(minion) < GoS:CalcDamage(myHero, minion, 0, (40*GetCastLevel(myHero,_Q) + 40 + 0.65*(GetBonusAP(myHero)))) then                        
        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
        end
    end
end

if IOW:Mode() == "LaneClear" then
                        for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do

                        local minionPos = GetOrigin(minion)
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),0,850,1100,240,false,false)

                       
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(minion, 1100) and BrandMenu.LaneClear.W:Value() then
                        CastSkillShot(_W,minionPos.x, minionPos.y, minionPos.z)
                        end
         end
end


if IOW:Mode() == "Harass" then
      local target = GetCurrentTarget()
      local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,850,1100,240,false,false)

      if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 1300) and GoS:GetDistance(myHero, target) <= 1000 and BrandMenu.Harass.W:Value() then
     CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
      end
      
end


for i,enemy in pairs(GoS:GetEnemyHeroes()) do
    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and BrandMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_Q) + 40 + 0.65*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_E) == READY and GOS:ValidTarget(enemy, 2000) and BrandMenu.DMG.E:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (35*GetCastLevel(myHero,_E) + 35 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_W) == READY and GOS:ValidTarget(enemy, 2000) and BrandMenu.DMG.W:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (45*GetCastLevel(myHero,_W) + 30 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_R) == READY and GOS:ValidTarget(enemy, 2000) and BrandMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 50 + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
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
end

if BrandMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if BrandMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if BrandMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if BrandMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end



end)

