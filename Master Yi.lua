Config = scriptConfig("Master Yi", "Master Yi:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawR","Draw R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
local target = GetCurrentTarget()

 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_PHYSICAL)
                       
					    if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastTargetSpell(target, _Q)
                        end
                        if CanUseSpell(myHero, _R) == READY and ValidTarget(target, 1000) and Config.R then
                        CastSpell(_R)
                      end
						if CanUseSpell(myHero, _E) == READY and ValidTarget(target, 800) and Config.E then
                        CastSpell(_E)
						end
                end
         if ValidTarget(target, 2000) and Config.DMG then
  if CanUseSpell(myHero,_Q) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (35*GetCastLevel(myHero,_Q) - 10 + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff00ff00)
    end

 end
 

end)


 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _R) == READY and DrawingsConfig.DrawR then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,1000,3,100,0xff00ff00) end
end
