ThreshiMenu = Menu("Thresh", "Thresh")
ThreshiMenu:SubMenu("Combo", "Combo")
ThreshiMenu.Combo:Boolean("Q", "Use Q", true)
ThreshiMenu.Combo:Boolean("W", "Use W", true)
ThreshiMenu.Combo:Boolean("E", "Use E", true)
ThreshiMenu.Combo:Boolean("R", "Use R", true)

ThreshiMenu:SubMenu("Drawings", "Drawings")
ThreshiMenu.Drawings:Boolean("Q", "Draw Q Range", true)
ThreshiMenu.Drawings:Boolean("W", "Draw W Range", true)
ThreshiMenu.Drawings:Boolean("E", "Draw E Range", true)
ThreshiMenu.Drawings:Boolean("R", "Draw R Range", true)


OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
				local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1900,500,1100,70,true,false)
				 local WPred = GetPredictionForPlayer(GoS:myHeroPos(),ally,GetMoveSpeed(ally),1900,500,950,70,false,false) 
				 local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,0,400,110,false,true)


                       
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1100) and ThreshiMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end 
						for _, ally in pairs(GoS:GetAllyHeroes()) do
						if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(ally, 950) and ThreshiMenu.Combo.W:Value() and (GetCurrentHP(ally)/GetMaxHP(ally))<0.9  then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
		                end
		                end
						if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and ThreshiMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						if CanUseSpell(myHero, _R) == READY and  GoS:ValidTarget(target, 450) and ThreshiMenu.Combo.R:Value() then
                        CastSpell(_R)
						end
        end
if ThreshiMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1100,3,100,0xff00ff00) end
if ThreshiMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,950,3,100,0xff00ff00) end
if ThreshiMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
if ThreshiMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,450,3,100,0xff00ff00) end

end)

 

