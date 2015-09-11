AatroxMenu = Menu("Aatrox", "Aatrox")
AatroxMenu:SubMenu("Combo", "Combo")
AatroxMenu.Combo:Boolean("Q", "Use Q", true)
AatroxMenu.Combo:Boolean("W", "Use W", true)
AatroxMenu.Combo:Boolean("E", "Use E", true)
AatroxMenu.Combo:Boolean("R", "Use R", true)

AatroxMenu:SubMenu("Drawings", "Drawings")
AatroxMenu.Drawings:Boolean("Q", "Draw Q Range", true)
AatroxMenu.Drawings:Boolean("E", "Draw E Range", true)

 
 
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
				 local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,670,650,250,false,true)
				 local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1250,300,1075,35,false,false)    




                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 650) and AatroxMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                         if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 700) and AatroxMenu.Combo.W:Value() then
                        if GotBuff(myHero, "aatroxwlife") == 1 and (GetCurrentHP(myHero)/GetMaxHP(myHero))>0.5  then
                        CastSpell(_W)
                        elseif GotBuff(myHero, "aatroxwpower") == 1 and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 then
                        CastSpell(_W)
                        end
                        end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1075) and AatroxMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 700)  and AatroxMenu.Combo.R:Value() then
                         if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.3 then 
						CastSpell(_R)
						end
        end


if AatroxMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,650,3,100,0xff00ff00) end
if AatroxMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end


end

end)

 

