KhaZixMenu = Menu("Kha'Zix", "Kha'Zix")
KhaZixMenu:SubMenu("Combo", "Combo")
KhaZixMenu.Combo:Boolean("Q", "Use Q", true)
KhaZixMenu.Combo:Boolean("W", "Use W", true)
KhaZixMenu.Combo:Boolean("E", "Use E", true)
KhaZixMenu.Combo:Boolean("R", "Use R", true)


KhaZixMenu:SubMenu("Drawings", "Drawings:")
KhaZixMenu.Drawings:Boolean("Q","Draw Q", true)
KhaZixMenu.Drawings:Boolean("W","Draw W", true)
KhaZixMenu.Drawings:Boolean("E","Draw E", true)
 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1700,250,1025,73,true,false)
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,250,600,300,false,false)




                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and KhaZixMenu.Combo.Q:Value() then
                        CastTargetSpell(target, _Q)
                        end
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and KhaZixMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and KhaZixMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 300) and KhaZixMenu.Combo.R:Value() then
                            if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 then 
						CastSpell(_R)
						end
                    end
end




if KhaZixMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if KhaZixMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if KhaZixMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end


    end)
        
