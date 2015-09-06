Config = scriptConfig("Orianna", "Orianna:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)
 
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
local target = GetCurrentTarget()
 
        if IWalkConfig.Combo then
              local target = GetTarget(900, DAMAGE_MAGIC)
                       
                        local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1200,0,2000,80,false,true)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, 2000) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
			
        end

        if ValidTarget(target, 2000) and Config.DMG then
  if CanUseSpell(myHero,_Q) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (30*GetCastLevel(myHero,_Q) + 30 + 0.5*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

end

end)		
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
end
