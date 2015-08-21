Config = scriptConfig("Master Yi", "Master Yi:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()

 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_PHYSICAL)
                if ValidTarget(target, 1000) then
                       
					    if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, GetCastRange(myHero,_Q)) and IsInDistance(target, 600) and Config.Q then
                        CastTargetSpell(target, _Q)
                        end
                        if CanUseSpell(myHero, _R) == READY and IsInDistance(target, 400) and Config.R then
                        CastSpell(_R)
                        end
						if CanUseSpell(myHero, _E) == READY and IsInDistance(target, 200) and Config.E then
                        CastSpell(_E)
						end
                end
        end
end)


 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
end
