SonaMenu = Menu("Sona", "Sona")
SonaMenu:SubMenu("Combo", "Combo")

SonaMenu.Combo:Boolean("Q", "Use Q", true)
SonaMenu.Combo:Boolean("AW", "Use Ally W", true)
SonaMenu.Combo:Boolean("SW", "Use Self W", true)
SonaMenu.Combo:Boolean("E", "Use E", true)
SonaMenu.Combo:Boolean("R", "Use R", false)

SonaMenu:SubMenu("Killsteal", "Killsteal")
SonaMenu.Killsteal:Boolean("R", "Killsteal with R", true)

SonaMenu:SubMenu("Drawings", "Drawings:")
SonaMenu.Drawings:Boolean("Q", "Draw Q", true)
SonaMenu.Drawings:Boolean("W", "Draw W", false)
SonaMenu.Drawings:Boolean("E", "Draw E", false)
SonaMenu.Drawings:Boolean("R", "Draw R", false)


SonaMenu:SubMenu("DMG", "Draw DMG")
SonaMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
SonaMenu.DMG:Boolean("R", "Draw R Dmg", true)

OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2400,250,900,140,false,false)


                       
					    if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 850) and SonaMenu.Combo.Q:Value() then
                        CastSpell(_Q)
						end
                        for _, ally in pairs(GoS:GetAllyHeroes()) do  
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, ally) <= 1000 and (GetCurrentHP(ally)/GetMaxHP(ally))<0.5 and SonaMenu.Combo.AW:Value() then 
                        CastSpell(_W)
						end
                        end
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 1000) and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.4 and SonaMenu.Combo.SW:Value() then
                        CastSpell(_W)
                        end
						if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero,ally) <= 360 and SonaMenu.Combo.E:Value() then
                        CastSpell(_E)
						end
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(target, 900) and SonaMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
        end

for _, enemy in pairs (GoS:GetEnemyHeroes()) do 
        
        if GoS:ValidTarget(enemy, 2000) and CanUseSpell(myHero,_Q) == READY and SonaMenu.DMG.Q:Value() then
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_Q) + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00) 
    elseif CanUseSpell(myHero,_R) == READY and SonaMenu.DMG.R:Value() then 
local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) - 50 + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end




for _, enemy in pairs (GoS:GetEnemyHeroes()) do

            local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2400,250,900,140,false,false)

            if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GoS:ValidTarget(enemy, 900) and SonaMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) - 50 + 0.5*(GetBonusAP(myHero)))) then
            CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
            end
        end
 
 

if SonaMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,850,3,100,0xffffff00) end
if SonaMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,360,3,100,0xffffff00) end
if SonaMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,900,3,100,0xffffff00) end
if SonaMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1000,3,100,0xffffff00) end

end)

