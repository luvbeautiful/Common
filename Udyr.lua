Config = scriptConfig("Udyr", "Udyr:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)

 
myIAC = IAC()
 
OnLoop(function(myHero)

 
        if IWalkConfig.Combo then
              local target = GetTarget(500, DAMAGE_PHYSICAL)
                if ValidTarget(target, 500) then
                       
					    if CanUseSpell(myHero, _Q) == READY and IsInDistance(target, 450) and Config.Q then
                        CastSpell(_Q)
						end
                        if CanUseSpell(myHero, _W) == READY and IsInDistance(target, 450) and Config.W then
                        CastSpell(_W)
                        end
						if CanUseSpell(myHero, _E) == READY and IsInDistance(target, 450) and Config.E then
                        CastSpell(_E)
						end
						if CanUseSpell(myHero, _R) == READY and IsInDistance(target, 450) and Config.R then
                        CastSpell(_R)
						end
                end
        end
end)
