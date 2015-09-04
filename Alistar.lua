Config = scriptConfig("Alistar", "Alistar:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawW","Draw W", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_MAGIC)
                       
                       if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, GetCastRange(myHero,_Q)) and IsInDistance(target, 360) and Config.Q then
                        CastSpell(_Q)
                        end
						if CanUseSpell(myHero, _W) == READY and ValidTarget(target, GetCastRange(myHero,_W)) and IsInDistance(target, 650) and Config.W then
                        CastTargetSpell(target, _W)
						end
                        for _, ally in pairs(GetAllyHeroes()) do
                        if Config.E then
                        if (GetCurrentHP(ally)/GetMaxHP(ally))<0.7 and 
                        CanUseSpell(myHero, _E) == READY and IsInDistance(ally, 575) then
                        CastSpell(_E)
                        elseif  CanUseSpell(myHero, _E) == READY and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.7 then
                            CastSpell(_E)
                        end
                        end
                        end
                        if CanUseSpell(myHero, _R) == READY and Config.R then
                        if (GetCurrentHP(myHero)/GetMaxHP(myHero))>0.4 then
                        CastSpell(_R)   
                    end
                end
                end
end)
 

 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _W) == READY and DrawingsConfig.DrawW then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_W),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
end
