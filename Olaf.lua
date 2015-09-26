OlafMenu = Menu("Olaf", "Olaf")
OlafMenu:SubMenu("Combo", "Combo")
OlafMenu.Combo:Boolean("Q", "Use Q", true)
OlafMenu.Combo:Boolean("W", "Use W", true)
OlafMenu.Combo:Boolean("E", "Use E", true)

OlafMenu:SubMenu("Drawings", "Drawings")
OlafMenu.Drawings:Boolean("Q","Draw Q", true)
OlafMenu.Drawings:Boolean("E","Draw E", true)

OlafMenu:SubMenu("DMG", "Draw DMG")
OlafMenu.DMG:Boolean("Q", "Q", true)
OlafMenu.DMG:Boolean("E", "E", true)


 
 
OnLoop(function(myHero)



if IOW:Mode() == "Combo" then

               local target = GetCurrentTarget()
 
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1600,250,1000,90,false,false)



                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and OlafMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						if CanUseSpell(myHero, _W) == READY and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.8 and GoS:ValidTarget(target, 300) and OlafMenu.Combo.Q:Value() then     
                        CastSpell(_W)
						end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 400) and OlafMenu.Combo.Q:Value() then
						CastTargetSpell(target, _E)
						end
                        if CanUseSpell(myHero, _R) == READY and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, enemy) <=1000 and OlafMenu.Combo.Q:Value() then 
                        CastSpell(_R)
                        end
        end
for i,enemy in pairs(GoS:GetEnemyHeroes()) do

 if CanUseSpell(myHero,_Q) == READY and OlafMenu.DMG.Q:Value() and GoS:ValidTarget(enemy, 2000) then
      local trueDMG = GoS:CalcDamage(myHero, enemy, (45*GetCastLevel(myHero,_Q) + 25 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
     DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
    end
 if CanUseSpell(myHero,_E) == READY and OlafMenu.DMG.E:Value() and GoS:ValidTarget(enemy, 2000) then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (45*GetCastLevel(myHero,_E) + 25 + 0.4*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xff0cff00)
     end
end
 

if OlafMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1000,3,100,0xff00ff00) end
if OlafMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,400,3,100,0xff00ff00) end


end)