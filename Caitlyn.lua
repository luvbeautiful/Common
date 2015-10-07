CaitlynMenu = Menu("Caitlyn", "Caitlyn")
CaitlynMenu:SubMenu("Combo", "Combo")
CaitlynMenu.Combo:Boolean("Q", "Use Q", true)
CaitlynMenu.Combo:Boolean("W", "Use W", false)
CaitlynMenu.Combo:Boolean("E", "Use E", true)

CaitlynMenu:SubMenu("Harass", "Harass")
CaitlynMenu.Harass:Boolean("Q", "Use Q ", true)


CaitlynMenu:SubMenu("DMG", "Draw DMG")
CaitlynMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
CaitlynMenu.DMG:Boolean("R", "Draw R Dmg", true)
CaitlynMenu.DMG:Boolean("E", "Draw E Dmg", true)

CaitlynMenu:SubMenu("JungleClear", "JungleClear")
CaitlynMenu.JungleClear:Boolean("JQ", "JungleClear with Q", true)


CaitlynMenu:SubMenu("Drawings", "Drawings")
CaitlynMenu.Drawings:Boolean("Q", "Draw Q Range", true)
CaitlynMenu.Drawings:Boolean("W", "Draw W Range", false)
CaitlynMenu.Drawings:Boolean("E", "Draw E Range", false)
CaitlynMenu.Drawings:Boolean("R", "Draw R Range", false)

CaitlynMenu:SubMenu("Killsteal", "Killsteal")
CaitlynMenu.Killsteal:Boolean("E", "Killsteal with E", true)
CaitlynMenu.Killsteal:Boolean("R", "Killsteal with R", true)


OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then

                        local target = GetCurrentTarget()
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2200,625,1250,90,false,false)
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,250,800,70,false,false)
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,250,950,80,false,false)

                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1300) and GoS:GetDistance(myHero, target) <= 1100 and CaitlynMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                       
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 800) and CaitlynMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
                        
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and CaitlynMenu.Combo.E:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.3 then
                        CastSkillShot(_E,WPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                        end
  end

if IOW:Mode() == "Harass" then
      local target = GetCurrentTarget()
      local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2200,625,1250,90,false,false)

      if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1300) and GoS:GetDistance(myHero, target) <= 1100 and CaitlynMenu.Harass.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                    end 

for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do
if IOW:Mode() == "LaneClear" then
    local junglePos = GetOrigin(jungle)
    local QPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),2200,625,1250,90,false,false)

	if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 1250) and CaitlynMenu.JungleClear.JQ:Value() then
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                    end
                end
            end


for i,enemy in pairs(GoS:GetEnemyHeroes()) do
    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and CaitlynMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, (40*GetCastLevel(myHero,_Q) - 20 + 1.3*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_E) == READY and GOS:ValidTarget(enemy, 2000) and CaitlynMenu.DMG.E:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_E) + 30 + 0.8*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)

    elseif CanUseSpell(myHero,_R) == READY and GOS:ValidTarget(enemy, GetCastRange(myHero,_R)) and CaitlynMenu.DMG.R:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, (225*GetCastLevel(myHero,_R) - 25 + 2.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local target = GetCurrentTarget()

local EPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),2000,250,950,80,true,false)

if CanUseSpell(myHero, _E) == READY and CaitlynMenu.Killsteal.E:Value() and EPred.HitChance == 1 and GoS:ValidTarget(enemy,GetCastRange(myHero, 1000)) and GoS:GetDistance(myHero, enemy) <= 900 and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_E) + 30 + 0.8*(GetBonusAP(myHero)))) then 
CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
elseif CanUseSpell(myHero, _R) and GoS:ValidTarget(enemy, GetCastRange(myHero,_R)) and CaitlynMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, (225*GetCastLevel(myHero,_R) - 25 + 2.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
CastTargetSpell(enemy, _R)
end
end

if CaitlynMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1250,3,100,0xff00ff00) end
if CaitlynMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,800,3,100,0xff00ff00) end
if CaitlynMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,950,3,100,0xff00ff00) end
if CaitlynMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end

end)