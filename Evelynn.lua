EvelynnMenu = Menu("Evelynn", "Evelynn")
EvelynnMenu:SubMenu("Combo", "Combo")
EvelynnMenu.Combo:Boolean("Q", "Use Q", true)
EvelynnMenu.Combo:Boolean("W", "Use W", true)
EvelynnMenu.Combo:Boolean("E", "Use E", true)
EvelynnMenu.Combo:Boolean("R", "Use R", true)

EvelynnMenu:SubMenu("Drawings", "Drawings:")
EvelynnMenu.Drawings:Boolean("E","Draw E", true)
EvelynnMenu.Drawings:Boolean("W","Draw W", true)
EvelynnMenu.Drawings:Boolean("R","Draw R", true)
EvelynnMenu.Drawings:Boolean("Q","Draw Q", true)
 
OnLoop(function(myHero)

local target = GetCurrentTarget()

if IOW:Mode() == "Combo" then
                       local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,250,650,350,false,false)
                       
					    if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 500) and EvelynnMenu.Combo.Q:Value() then
                        CastSpell(_Q)
						end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 600) and GoS:GetDistance(myHero, target) < 700 and EvelynnMenu.Combo.W:Value() then
                        CastSpell(_W)
                        end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 300) and EvelynnMenu.Combo.E:Value() then
                        CastTargetSpell(target, _E)
						end
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, 625) and EvelynnMenu.Combo.R:Value() then
                            if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.4 then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
                end
        end

if EvelynnMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,500,3,100,0xff00ff00) end
if EvelynnMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end
if EvelynnMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,300,3,100,0xff00ff00) end
if EvelynnMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,625,3,100,0xff00ff00) end


    end)
 

