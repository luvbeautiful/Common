ChoGathMenu = Menu("Cho'Gath", "Cho'Gath")
ChoGathMenu:SubMenu("Combo", "Combo")
ChoGathMenu.Combo:Boolean("Q", "Use Q", true)
ChoGathMenu.Combo:Boolean("W", "Use W", true)

ChoGathMenu:SubMenu("Drawings", "Drawings")
ChoGathMenu.Drawings:Boolean("Q", "Draw Q Range", true)
ChoGathMenu.Drawings:Boolean("W", "Draw W Range", true)
ChoGathMenu.Drawings:Boolean("R", "Draw R Range", true)


ChoGathMenu:SubMenu("Killsteal", "Killsteal")
ChoGathMenu.Killsteal:Boolean("R", "Killsteal with R", true)


OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then

                        local target = GetCurrentTarget()
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,1200,950,250,false,false)
                       local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,250,700,300,false,false)
                       
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 950) and ChoGathMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
						
						if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 650) and ChoGathMenu.Combo.W:Value() then
						CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
						end
                end

        for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local target = GetCurrentTarget()
            if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy, 300) and ChoGathMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (175*GetCastLevel(myHero,_R) + 125 + 0.7*(GetBonusAP(myHero)))) then
            CastTargetSpell(enemy, _R)
            end
      end
 
if ChoGathMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xff00ff00) end
if ChoGathMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,650,3,100,0xff00ff00) end
if ChoGathMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,300,3,100,0xff00ff00) end


end)
