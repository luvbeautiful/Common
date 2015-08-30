Config = scriptConfig("Lee Sin", "Lee Sin:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSR", "Killsteal with R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawW","Draw W", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawR","Draw R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)

 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
Killsteal()
local target = GetCurrentTarget()
 
        if IWalkConfig.Combo then
              local target = GetTarget(1150, DAMAGE_PHYSICAL)
                if ValidTarget(target, 1150) then
                       
					    local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1800,250,1100,60,true,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _W) == READY and IsInDistance(target, 250) and Config.W then
                        CastSpell(_W)
                        end
						if CanUseSpell(myHero, _E) == READY and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSpell(_E)
						end
						if CanUseSpell(myHero, _R) == READY and ValidTarget(target, GetCastRange(myHero,_R)) and Config.R then
                        CastTargetSpell(target, _R)
						end
                end
        end

        if ValidTarget(target, 2000) and Config.DMG then
  if CanUseSpell(myHero,_Q) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (30*GetCastLevel(myHero,_Q) + 20 + 0.9*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    end

    if CanUseSpell(myHero,_E) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (35*GetCastLevel(myHero,_E) + 25 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_R) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (200*GetCastLevel(myHero,_R) + 0 + 2.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
 
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

 end
 

end)

 function Killsteal()
        for i,enemy in pairs(GetEnemyHeroes()) do
            if CanUseSpell(myHero, _R) == READY and ValidTarget(enemy,GetCastRange(myHero,_R)) and KSConfig.KSR and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (200*GetCastLevel(myHero,_R) + 0 + 2.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))) then
            CastTargetSpell(enemy, _R)
            end
      end
end 
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _W) == READY and DrawingsConfig.DrawW then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_W),3,100,0xff00ff00) end
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
if CanUseSpell(myHero, _R) == READY and DrawingsConfig.DrawR then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_R),3,100,0xff00ff00) end
end
