GalioMenu = Menu("Galio", "Galio")
GalioMenu:SubMenu("Combo", "Combo")
GalioMenu.Combo:Boolean("Q", "Use Q", true)
GalioMenu.Combo:Boolean("W", "Use W", true)
GalioMenu.Combo:Boolean("E", "Use E", true)

GalioMenu:SubMenu("Drawings", "Drawings:")
GalioMenu.Drawings:Boolean("Q","Draw Q", true)
GalioMenu.Drawings:Boolean("W","Draw W", true)
GalioMenu.Drawings:Boolean("E","Draw E", true)
 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                       local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1300,300,900,200,false,false)
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1200,300,1200,120,false,false)



                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and GalioMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                         for _, ally in pairs(GoS:GetAllyHeroes()) do
                      if  CanUseSpell(myHero, _W) == READY and GoS:IsInDistance(ally, (GetCastRange(myHero,_W))) and (GetCurrentHP(ally)/GetMaxHP(ally))<0.7 and GalioMenu.Combo.W:Value() then
                        CastTargetSpell(ally ,_W)
                    elseif  CanUseSpell(myHero, _W) == READY and GoS:IsInDistance(myHero, (GetCastRange(myHero,_W))) and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.7 then
                        CastTargetSpell(myHero ,_W)
						end
						end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and GalioMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
        end



if GalioMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if GalioMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if GalioMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end


    end)
