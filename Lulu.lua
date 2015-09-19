LuluMenu = Menu("Lulu", "Lulu:")
LuluMenu:SubMenu("Combo", "Combo")
LuluMenu.Combo:Boolean("Q", "Use Q", true)
LuluMenu.Combo:Boolean("W", "Use W", true)
LuluMenu.Combo:Boolean("EE", "Use Enemy E", false)
LuluMenu.Combo:Boolean("AE", "Use Ally E", true)
LuluMenu.Combo:Boolean("ME", "Use Me E", true)
LuluMenu.Combo:Boolean("AR", "Use Allies R", true)
LuluMenu.Combo:Boolean("MR", "Use Me R", true)


LuluMenu:SubMenu("Drawings", "Drawings:")
LuluMenu.Drawings:Boolean("Q", "Draw Q", true)
LuluMenu.Drawings:Boolean("W", "Draw W", true)
LuluMenu.Drawings:Boolean("E", "Draw E", true)
LuluMenu.Drawings:Boolean("R", "Draw R", true)

LuluMenu:SubMenu("DMG", "Draw DMG")
LuluMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
LuluMenu.DMG:Boolean("E", "Draw E Dmg", false)
 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
 local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1450,250,925,80,false,false)


                       
					   
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and LuluMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and LuluMenu.Combo.W:Value() then
                        CastTargetSpell(target, _W)
                        end
                        for _, ally in pairs(GoS:GetAllyHeroes()) do
					if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_E)) and LuluMenu.Combo.EE:Value() then
                     CastTargetSpell(target, _E)
                       elseif CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 1000) and (GetCurrentHP(ally)/GetMaxHP(ally))<0.3 and LuluMenu.Combo.AE:Value() then
                      CastTargetSpell(ally, _E)
                       elseif CanUseSpell(myHero,_E) == READY and GoS:ValidTarget(target, 1000) and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.15 and LuluMenu.Combo.ME:Value() then
                         CastTargetSpell(myHero, _E)   
						end  
                        end
                        end 
                        for _, ally in pairs(GoS:GetAllyHeroes()) do
                        if LuluMenu.Combo.AR:Value() and GoS:ValidTarget(target, 1000) and (GetCurrentHP(ally)/GetMaxHP(ally))<0.3 and CanUseSpell(myHero, _R) == READY then
                        CastTargetSpell(ally, _R)
                        elseif LuluMenu.Combo.MR:Value() and GoS:ValidTarget(target, 1000) and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.3 and CanUseSpell(myHero, _R) == READY then
                        CastTargetSpell(myHero, _R)
                        end

        end


for i,enemy in pairs(GoS:GetEnemyHeroes()) do

  if CanUseSpell(myHero,_Q) == READY and LuluMenu.DMG.Q:Value() then
local trueDMG = GoS:CalcDamage(myHero, target, 0, (45*GetCastLevel(myHero,_Q) + 35 + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)

elseif CanUseSpell(myHero,_E) == READY and LuluMenu.DMG.E:Value() then 
local trueDMG = GoS:CalcDamage(myHero, target, 0, (30*GetCastLevel(myHero,_E) + 50 + 0.4*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
  end
    
end


     
 

 
if LuluMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if LuluMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
if LuluMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,GetCastRange(myHero,_W),3,100,0xff00ff00) end

end)
