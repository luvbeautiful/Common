Config = scriptConfig("Lulu", "Lulu:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("SE", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawW","Draw W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
local target = GetCurrentTarget() 
 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_MAGICAL)
                if ValidTarget(target, 1000) then
                       
					    local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1450,250,925,80,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                        if CanUseSpell(myHero, _W) == READY and ValidTarget(target, GetCastRange(myHero,_W)) and Config.W then
                        CastTargetSpell(target, _W)
                        end
                        for _, ally in pairs(GetAllyHeroes()) do
						if CanUseSpell(myHero, _E) == READY and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastTargetSpell(target, _E)
                    elseif CanUseSpell(myHero, _E) == READY and ValidTarget(ally, GetCastRange(myHero,_E)) and (GetCurrentHP(ally)/GetMaxHP(ally))<0.3 and Config.SE then
                        CastTargetSpell(ally, _E)
						end
                        if Config.R then
                        if (GetCurrentHP(ally)/GetMaxHP(ally))<0.3 and
                        CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) then
                        CastTargetSpell(ally, _R)
                        end
                        end
                    end
                end
        end

        if ValidTarget(target, 2000) and Config.DMG then
  if CanUseSpell(myHero,_Q) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (45*GetCastLevel(myHero,_Q) + 35 + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_E) == READY then 
local trueDMG = CalcDamage(myHero, target, 0, (30*GetCastLevel(myHero,_E) + 50 + 0.4*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
  end
    
end


     
end)
 

 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
if CanUseSpell(myHero, _W) == READY and DrawingsConfig.DrawW then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_W),3,100,0xff00ff00) end
end
