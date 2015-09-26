Config = scriptConfig("XinZhao", "XinZhao:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Auto R", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSR", "Killsteal with R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawR","Draw R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)

 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
Killsteal()
local target = GetCurrentTarget()
 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_PHYSICAL)
                       
                        if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 700) and GetDistance(myHero, target) < 300 and Config.Q then
                        CastSpell(_Q)
                        end
						if CanUseSpell(myHero, _W) == READY and ValidTarget(target, 300) and GetDistance(myHero, target) < 300 and Config.W then
                        CastSpell(_W)
						end
						if CanUseSpell(myHero, _E) == READY and ValidTarget(target, GetCastRange(myHero,_E)) and IsInDistance(target, 650) and Config.E then
						CastTargetSpell(target, _E)
						end
						if CanUseSpell(myHero, _R) == READY and ValidTarget(enemy,GetCastRange(myHero,_R))  and Config.R then
                             if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 then 
						CastSpell(_R)
						end
                    end
        end

        if ValidTarget(target, 2000) and Config.DMG then
    if CanUseSpell(myHero,_Q) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (15*GetCastLevel(myHero,_Q) + 0 + 0.2*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

if CanUseSpell(myHero,_E) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (40*GetCastLevel(myHero,_E) + 30 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_R) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (100*GetCastLevel(myHero,_R) - 25 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

 end
 

end)

function Killsteal()
          for i,enemy in pairs(GetEnemyHeroes()) do
               if CanUseSpell(myHero, _R) and ValidTarget(enemy,GetCastRange(myHero,_R)) and KSConfig.KSR and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0,(100*GetCastLevel(myHero,_R) - 25 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero) + 0.15*GetCurrentHP(enemy)))) then  
               CastSpell(_R)
               end
        end
end  
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
if CanUseSpell(myHero, _R) == READY and DrawingsConfig.DrawR then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_R),3,100,0xff00ff00) end
end