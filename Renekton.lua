Config = scriptConfig("Renekton", "Renekton:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawW","Draw W", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawR","Draw R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
local target = GetCurrentTarget()
 
        if IWalkConfig.Combo then
              local target = GetTarget(500, DAMAGE_PHYSICAL)
                if ValidTarget(target, 500) then
                       
					    if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 325) and Config.Q then
                        CastSpell(_Q)
						end
                        if CanUseSpell(myHero, _W) == READY and ValidTarget(target, 400) and Config.W then
                        CastSpell(_W)
                        end
						local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),450,100,GetCastRange(myHero,_E),100,false,false)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						if CanUseSpell(myHero, _R) == READY and ValidTarget(target, 225) and Config.R then
                         if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.75 then 
                        CastSpell(_R)
						end
                        end
                end
        end

        if ValidTarget(target, 2000) and Config.DMG then
  if CanUseSpell(myHero,_Q) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (30*GetCastLevel(myHero,_Q) + 30 + 0.8*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_W) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (20*GetCastLevel(myHero,_W) + 10 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_E) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (30*GetCastLevel(myHero,_E) + 30 + 0.9*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

 end
 

end)
 
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _W) == READY and DrawingsConfig.DrawW then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,400,3,100,0xff00ff00) end
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,325,3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,450,3,100,0xff00ff00) end
if CanUseSpell(myHero, _R) == READY and DrawingsConfig.DrawR then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,225,3,100,0xff00ff00) end
end
