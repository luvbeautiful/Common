HeimerdingerMenu = Menu("Heimerdinger", "Heimerdinger")
HeimerdingerMenu:SubMenu("Combo", "Combo")
HeimerdingerMenu.Combo:Boolean("Q", "Use Q", true)
HeimerdingerMenu.Combo:Boolean("W", "Use W", true)
HeimerdingerMenu.Combo:Boolean("E", "Use E", true)
HeimerdingerMenu.Combo:Boolean("R", "Use R", true)


HeimerdingerMenu:SubMenu("Drawings", "Drawings:")
HeimerdingerMenu.Drawings:Boolean("E","Draw E", true)
HeimerdingerMenu.Drawings:Boolean("R","Draw R", true)
HeimerdingerMenu.Drawings:Boolean("Q","Draw Q", true)
HeimerdingerMenu.Drawings:Boolean("W","Draw W", true)


OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then



local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,100,450,500,false,true)
local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,1500,70,true,false)
local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1750,325,925,135,false,false)

                       
					    
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 600) and HeimerdingerMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                        
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and HeimerdingerMenu.Combo.W:Value() then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
						
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and HeimerdingerMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						if CanUseSpell(myHero,_R) == READY and GoS:ValidTarget(target, 600) and HeimerdingerMenu.Combo.R:Value() then
		                 CastSpell(_R)
						end
end
 
 
if HeimerdingerMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,GetCastRange(myHero,_W),3,100,0xff00ff00) end
if HeimerdingerMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xff00ff00) end
if HeimerdingerMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
if HeimerdingerMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,650,3,100,0xff00ff00) end


end)
