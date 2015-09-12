CorkiMenu = Menu("Corki", "Corki")
CorkiMenu:SubMenu("Combo", "Combo")
CorkiMenu.Combo:Boolean("Q", "Use Q", true)
CorkiMenu.Combo:Boolean("E", "Use E", true)
CorkiMenu.Combo:Boolean("R", "Use R", true)

CorkiMenu:SubMenu("Drawings", "Drawings")
CorkiMenu.Drawings:Boolean("Q", "Draw Q Range", true)
CorkiMenu.Drawings:Boolean("W", "Draw W Range", true)
CorkiMenu.Drawings:Boolean("E", "Draw E Range", true)
CorkiMenu.Drawings:Boolean("R", "Draw R Range", true)
 
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                        local target = GetCurrentTarget()

                     local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1125,500,825,270,false,false)
                      local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,0,600,350,false,false)
                      local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,175,1300,40,true,true)



					    
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 825) and CorkiMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 600) and CorkiMenu.Combo.E:Value() then
						CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_R)) and CorkiMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
  end                      
if CorkiMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if CorkiMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xff00ff00) end
if CorkiMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end
if CorkiMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end
end)
