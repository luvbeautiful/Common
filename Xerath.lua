XerathMenu = Menu("Xerath", "Xerath")
XerathMenu:SubMenu("Combo", "Combo")
XerathMenu.Combo:Boolean("Q", "Use Q", true)
XerathMenu.Combo:Boolean("W", "Use W", true)
XerathMenu.Combo:Boolean("E", "Use E", true)

XerathMenu:SubMenu("Killsteal", "Killsteal")
XerathMenu.Killsteal:Boolean("R", "Killsteal with R", true)

XerathMenu:SubMenu("Drawings", "Drawings:")
XerathMenu.Drawings:Boolean("Q", "Draw Q", true)
XerathMenu.Drawings:Boolean("W", "Draw W", true)
XerathMenu.Drawings:Boolean("E", "Draw E", true)
XerathMenu.Drawings:Boolean("R", "Draw R", true)

XerathMenu:SubMenu("DMG", "Draw DMG")
XerathMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
XerathMenu.DMG:Boolean("W", "Draw W Dmg", true)
XerathMenu.DMG:Boolean("E", "Draw E Dmg", true)
XerathMenu.DMG:Boolean("R", "Draw R Dmg", true)


 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()


                         
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),500,750,1525,100,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 1525) and GoS:GetDistance(myHero, target) <= 1500 and XerathMenu.Combo.Q:Value() then
                        local myHeroPos = GoS:myHeroPos()
                        CastSkillShot(_Q, myHeroPos.x, myHeroPos.y, myHeroPos.z)
                                                  for i=250, 1500, 250 do
                            GoS:DelayAction(function()
                            local _Qrange = 750 + math.min(750, i/2)
                            local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,600,_Qrange,100,false,true)
                            if QPred.HitChance == 1 then
                            CastSkillShot2(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
                            end
                          end, i)  

                          end 
                        end

                                                local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,500,1100,200,false,false)
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 1250) and GoS:GetDistance(myHero, target) <= 1100 and XerathMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                                                end
                                               
                                                local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1600,500,1050,70,true,false)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1050) and GoS:GetDistance(myHero, target) <= 950 and XerathMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                                                end
        end

         for i,enemy in pairs(GoS:GetEnemyHeroes()) do
    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and XerathMenu.DMG.Q:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_Q) + 40 + 0.75*(GetBonusAP(myHero))))
DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    if CanUseSpell(myHero,_W) == READY and GOS:ValidTarget(enemy, 2000) and XerathMenu.DMG.W:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (30*GetCastLevel(myHero,_W) + 30 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
  end
  if CanUseSpell(myHero,_E) == READY and GOS:ValidTarget(enemy, 2000) and XerathMenu.DMG.E:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (30*GetCastLevel(myHero,_E) + 50 + 0.45*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
  end
    if CanUseSpell(myHero,_R) == READY and GOS:ValidTarget(enemy, (3200 + GetCastLevel(myHero, _R) * 800)) and XerathMenu.DMG.R:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (82*GetCastLevel(myHero,_R) + 202 + 0.649*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end

 end
 
 
 
for i,enemy in pairs(GoS:GetEnemyHeroes()) do
  if GotBuff(myHero, "xerathrshots") > 0 then
    IOW:DisableOrbwalking()
    elseif GotBuff(myHero, "xerathrshots") < 1 then
    IOW:EnableOrbwalking()

                         local RPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),0,750,5600,200,false,false)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(enemy, 3200 + GetCastLevel(myHero, _R) * 800) and XerathMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (82*GetCastLevel(myHero,_R) + 202 + 0.649*(GetBonusAP(myHero)))) then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                           end
                end
              end
 
 
if XerathMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1525,3,100,0xffffff00) end
if XerathMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1050,3,100,0xffffff00) end
if XerathMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(3200 + GetCastLevel(myHero, _R) * 800),3,100,0xffffff00) end
if XerathMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1100,3,100,0xffffff00) end

end)
