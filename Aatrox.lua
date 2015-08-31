Config = scriptConfig("Aatrox", "Aatrox:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)

 
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
local target = GetCurrentTarget()
 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_PHYSICAL)
                if ValidTarget(target, 1000) then
				
				        local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),2000,670,650,250,false,true)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                         if CanUseSpell(myHero, _W) == READY and ValidTarget(target, 700) and Config.W then
                        if GotBuff(myHero, "aatroxwlife") == 1 and (GetCurrentHP(myHero)/GetMaxHP(myHero))>0.5 and IsObjectAlive(myHero) then
                        CastSpell(_W)
                        elseif GotBuff(myHero, "aatroxwpower") == 1 and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.5 and IsObjectAlive(myHero) then
                        CastSpell(_W)
                        end
                        end
						local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1250,300,1075,35,false,true)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						if CanUseSpell(myHero, _R) == READY and ValidTarget(target, GetCastRange(myHero,_R)) and Config.R then
                         if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.3 then 
						CastSpell(_R)
						end
                        end
                end
        end


        if ValidTarget(target, 2000) and Config.DMG then
  if CanUseSpell(myHero,_Q) == READY then 
local trueDMG = CalcDamage(myHero, target, 0, (45*GetCastLevel(myHero,_Q) + 25 + 0.6*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff00ff00)
    end

if CanUseSpell(myHero,_E) == READY then 
local trueDMG = CalcDamage(myHero, target, 0, (35*GetCastLevel(myHero,_E) + 40 + 0.6*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_R) == READY then 
local trueDMG = CalcDamage(myHero, target, 0, (100*GetCastLevel(myHero,_R) + 100 + 1.0*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end
    
end



end)

 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00fc000) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00fc000) end
end
