NidaleeiMenu = Menu("Nidalee", "Nidalee")
NidaleeiMenu:SubMenu("Combo", "Combo")
NidaleeiMenu.Combo:Boolean("Q", "Use Q", true)
NidaleeiMenu.Combo:Boolean("E", "Use E", true)

NidaleeiMenu:SubMenu("Drawings", "Drawings")
NidaleeiMenu.Drawings:Boolean("Q", "Draw Q Range", true)
NidaleeiMenu.Drawings:Boolean("E", "Draw E Range", true)

 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
                local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1300,250,1500,60,true,false)

                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and NidaleeiMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                     if CanUseSpell(myHero, _E) == READY and NidaleeiMenu.Combo.E:Value() then
                     if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 then
                        CastTargetSpell(myHero, _E)
                    end
                end
end

if NidaleeiMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if NidaleeiMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end


end

end)

