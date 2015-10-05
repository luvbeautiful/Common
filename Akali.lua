AkaliMenu = Menu("Akali", "Akali")
AkaliMenu:SubMenu("Combo", "Combo")
AkaliMenu.Combo:Boolean("Q", "Use Q", true)
AkaliMenu.Combo:Boolean("W", "Use W", true)
AkaliMenu.Combo:Boolean("E", "Use E", true)
AkaliMenu.Combo:Boolean("HR", "Use when above 32%hp R", true)
AkaliMenu.Combo:Boolean("R", "Use  R Normal", false)

AkaliMenu:SubMenu("Harass", "Harass")
AkaliMenu.Harass:Boolean("EQ", "Use Q Enemy", true)
AkaliMenu.Harass:Boolean("LQ", "Use Q Lasthit Minion", true)


AkaliMenu:SubMenu("Drawings", "Drawings")
AkaliMenu.Drawings:Boolean("Q", "Draw Q Range", true)
AkaliMenu.Drawings:Boolean("W", "Draw W Range", false)
AkaliMenu.Drawings:Boolean("E", "Draw E Range", false)
AkaliMenu.Drawings:Boolean("R", "Draw R Range", false)

AkaliMenu:SubMenu("DMG", "Draw DMG")
AkaliMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
AkaliMenu.DMG:Boolean("R", "Draw R Dmg", true)
AkaliMenu.DMG:Boolean("E", "Draw E Dmg", true)

AkaliMenu:SubMenu("Killsteal", "Killsteal")
AkaliMenu.Killsteal:Boolean("R", "Killsteal with R", true)
AkaliMenu.Killsteal:Boolean("E", "Killsteal with E", true)

AkaliMenu:SubMenu("LaneClear", "LaneClear")
AkaliMenu.LaneClear:Boolean("Q", "LaneClear with Q", true)
AkaliMenu.LaneClear:Boolean("E", "LaneClear with E", true)

AkaliMenu:SubMenu("Lasthit", "Lasthit")
AkaliMenu.Lasthit:Boolean("Q", "Lasthit with Q", true)
AkaliMenu.Lasthit:Boolean("E", "Lasthit with E", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                        local target = GetCurrentTarget()
				local WPred = GetPredictionForPlayer(GoS:myHeroPos(),myHero,GetMoveSpeed(myHero),0,250,700,390,false,true)
 
                        
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 600) and AkaliMenu.Combo.Q:Value() then
                        CastTargetSpell(target, _Q)
                        end                
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 700) and AkaliMenu.Combo.W:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 then 
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 325) and GoS:GetDistance(myHero, target) <= 280 and AkaliMenu.Combo.E:Value() then
                        CastSpell(_E)
						end
						if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 800) and GoS:GetDistance(myHero, target) <= 715 and (GetCurrentHP(myHero)/GetMaxHP(myHero))>=0.32 and AkaliMenu.Combo.HR:Value() and GotBuff(target, "AkaliMota") == 1 then
                        CastTargetSpell(target, _R)
						end
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 800) and GoS:GetDistance(myHero, target) <= 715 and AkaliMenu.Combo.R:Value() and GotBuff(target, "AkaliMota") == 1 then
                        CastTargetSpell(target, _R)
                        end
        end  
for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do
if IOW:Mode() == "LaneClear" then
        if CanUseSpell(myHero, _Q) == READY and AkaliMenu.LaneClear.Q:Value() and GoS:ValidTarget(minion, 600) then
        CastTargetSpell(minion, _Q)
        end
        
        if CanUseSpell(myHero, _E) == READY and AkaliMenu.LaneClear.E:Value() and GoS:ValidTarget(minion, 280) then
        CastSpell(_E)
        end
    end
end

for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do
if IOW:Mode() == "LastHit" then
        if CanUseSpell(myHero, _Q) == READY and AkaliMenu.Lasthit.Q:Value() and GoS:ValidTarget(minion, 600) and GetCurrentHP(minion) < GoS:CalcDamage(myHero, minion, 0, (20*GetCastLevel(myHero,_Q) + 15 + 0.4*(GetBonusAP(myHero)))) then
        CastTargetSpell(minion, _Q)
        end
        
        if CanUseSpell(myHero, _E) == READY and AkaliMenu.Lasthit.E:Value() and GoS:ValidTarget(minion, 280) and GetCurrentHP(minion) < GoS:CalcDamage(myHero, minion, 0, (25*GetCastLevel(myHero,_E) + 5 + 0.4*(GetBonusAP(myHero) + 0.6*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))),0) then
        CastSpell(_E)
        end
    end
end


if IOW:Mode() == "Harass" then
      local target = GetCurrentTarget()
      for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do

      if CanUseSpell(myHero, _Q) == READY and AkaliMenu.Harass.EQ:Value() and GoS:ValidTarget(target, 600) then
      CastTargetSpell(target, _Q)
      end
      if CanUseSpell(myHero, _Q) == READY and AkaliMenu.Harass.LQ:Value() and GoS:ValidTarget(minion, 600) and GetCurrentHP(minion) < GoS:CalcDamage(myHero, minion, 0, (20*GetCastLevel(myHero,_Q) + 15 + 0.4*(GetBonusAP(myHero)))) then
      CastTargetSpell(minion, _Q)
      end
      end
end

   for i,enemy in pairs(GoS:GetEnemyHeroes()) do
    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and AkaliMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (20*GetCastLevel(myHero,_Q) + 15 + 0.4*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_E) == READY and GOS:ValidTarget(enemy, 2000) and AkaliMenu.DMG.E:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (25*GetCastLevel(myHero,_E) + 5 + 0.4*(GetBonusAP(myHero) + 0.6*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_R) == READY and GOS:ValidTarget(enemy, 2000) and AkaliMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (75*GetCastLevel(myHero,_R) + 25 + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end
 
for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local target = GetCurrentTarget()


if CanUseSpell(myHero, _R) == READY and AkaliMenu.Killsteal.R:Value() and GoS:ValidTarget(enemy, 715) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0,(75*GetCastLevel(myHero,_R) + 25 + 0.5*GetBonusAP(myHero))) then 
    CastTargetSpell(enemy, _R)
    
elseif CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(enemy, 300) and AkaliMenu.Killsteal.E:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy , 0,(25*GetCastLevel(myHero,_E) + 5 + 0.4*(GetBonusAP(myHero) + 0.6*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))) then
               CastSpell(_E) 
    
end        
end

if AkaliMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xffffff00) end
if AkaliMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,700,3,100,0xffffff00) end
if AkaliMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,325,3,100,0xffffff00) end
if AkaliMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,715,3,100,0xffffff00) end

 
end)