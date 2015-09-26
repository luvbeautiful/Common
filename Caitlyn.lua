CaitlynMenu = Menu("Caitlyn", "Caitlyn")
CaitlynMenu:SubMenu("Combo", "Combo")
CaitlynMenu.Combo:Boolean("Q", "Use Q", true)
CaitlynMenu.Combo:Boolean("W", "Use W", true)
CaitlynMenu.Combo:Boolean("E", "Use E", true)

CaitlynMenu:SubMenu("Drawings", "Drawings")
CaitlynMenu.Drawings:Boolean("Q", "Draw Q Range", true)
CaitlynMenu.Drawings:Boolean("W", "Draw W Range", true)
CaitlynMenu.Drawings:Boolean("E", "Draw E Range", true)
CaitlynMenu.Drawings:Boolean("R", "Draw R Range", true)


CaitlynMenu:SubMenu("Killsteal", "Killsteal")
CaitlynMenu.Killsteal:Boolean("E", "Killsteal with E", true)
CaitlynMenu.Killsteal:Boolean("R", "Killsteal with R", true)


OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then

                        local target = GetCurrentTarget()
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2200,625,1300,90,false,false)
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,100,800,70,false,false)
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,200,1000,80,false,false)

                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1300) and CaitlynMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                         end
                       
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 800) and CaitlynMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
                        
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and CaitlynMenu.Combo.E:Value() then
                          if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.3 then
                        CastSkillShot(_E,WPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                      end
  end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local target = GetCurrentTarget()
  local EPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),2000,200,1000,80,true,false)

                 if CanUseSpell(myHero,_R) and GoS:ValidTarget(enemy, GetCastRange(myHero,_R)) and CaitlynMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, (225*GetCastLevel(myHero,_R) + 25 + 2.00*(GetBonusDmg(myHero))),0) then
                 CastTargetSpell(enemy, _R)
                 elseif CanUseSpell(myHero,_E) == READY and GoS:ValidTarget(enemy, GetCastRange(myHero,_E)) and CaitlynMenu.Killsteal.E:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_E) + 30 + 0.8*(GetBonusAP(myHero)))) then
               CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
            end
 end

if CaitlynMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if CaitlynMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if CaitlynMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if CaitlynMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end
end


end)