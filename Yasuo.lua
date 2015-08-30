Config = scriptConfig("Yasuo", "Yasuo:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSR", "Killsteal with R", SCRIPT_PARAM_ONOFF, true)
KSConfig.addParam("KSQ", "Killsteal with Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
Killsteal()
local target = GetCurrentTarget()
 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_PHYSICAL)
                if ValidTarget(target, 1000) then
                       
					    
						local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1500,300,1025,90,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q and GetDistance(myHero, enemy) < 1025 then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						if CanUseSpell(myHero, _E) == READY and IsInDistance(target, 475) and Config.E then
                        CastTargetSpell(target, _E)
						end
						if CanUseSpell(myHero, _R) == READY and IsInDistance(target, 1200) and Config.R then
                        CastSpell(_R)
						end
                end
        end

        if ValidTarget(target, 2000) and Config.DMG then
  if CanUseSpell(myHero,_Q) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (20*GetCastLevel(myHero,_Q) + 0 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    end

    if CanUseSpell(myHero,_E) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (20*GetCastLevel(myHero,_E) + 50 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_R) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (100*GetCastLevel(myHero,_R) + 100 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
 
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

 end
 

end)

function Killsteal()
	      for i,enemy in pairs(GetEnemyHeroes()) do
		       local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),2000,670,650,250,false,true)

		       if CanUseSpell(myHero,_R) and ValidTarget(enemy, GetCastRange(myHero,_R)) and KSConfig.KSR and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 100 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))) then
                 CastSpell(_R)

			   elseif CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(enemy,GetCastRange(myHero,_Q)) and KSConfig.KSQ and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (20*GetCastLevel(myHero,_Q) + 0 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))) then 
		CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)

		end
    end	 
end
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
end
