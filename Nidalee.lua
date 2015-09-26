NidaleeMenu = Menu("Nidalee", "Nidalee")
NidaleeMenu:SubMenu("Combo", "Combo")
NidaleeMenu.Combo:Boolean("Q", "Use Q", true)
NidaleeMenu.Combo:Boolean("SE", "Use self E", false)
NidaleeMenu.Combo:Boolean("AE", "Use ally E", false)

NidaleeMenu:SubMenu("Drawings", "Drawings")
NidaleeMenu.Drawings:Boolean("Q", "Draw Q Range", true)
NidaleeMenu.Drawings:Boolean("E", "Draw E Range", false)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
                        local ally = GetCurrentTarget()
                local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1300,250,1500,40,true,false)

                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1500) and NidaleeMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                     if CanUseSpell(myHero, _E) == READY and NidaleeMenu.Combo.SE:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 then
                        CastTargetSpell(myHero, _E)
                    end
                    for _, ally in pairs(GoS:GetAllyHeroes()) do    

                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 1500) and GoS:GetDistance(myHero, ally) <= 600 and (GetCurrentHP(ally)/GetMaxHP(ally))<0.5 then
                        CastTargetSpell(ally, _E)
                        end
                    end
end




if NidaleeMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1500,3,100,0xff00ff00) end
if NidaleeMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end


end)

