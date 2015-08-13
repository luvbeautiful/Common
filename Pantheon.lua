Config = scriptConfig("Pantheon", "Pantheon:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSQ", "Killsteal with Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)


 
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
Killsteal()
 
        if IWalkConfig.Combo then
              local target = GetTarget(600, DAMAGE_PHYSICAL)
                if ValidTarget(target, 600) then
				
				        if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, GetCastRange(myHero,_Q)) and IsInDistance(target, 600) and Config.Q then
                        CastTargetSpell(target, _Q)
                        end
						if CanUseSpell(myHero, _W) == READY and ValidTarget(target, GetCastRange(myHero,_W)) and IsInDistance(target, 598) and Config.W then
                        CastTargetSpell(target, _W)
						end
                end
        end
end)

function Killsteal()
	for i,enemy in pairs(GetEnemyHeroes()) do
                 if CanUseSpell(myHero,_Q) and ValidTarget(enemy, GetCastRange(myHero,_Q)) and KSConfig.KSQ and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_Q) + 0.90*GetBonusDmg(myHero))) then
                 CastTargetSpell(enemy, _Q)
            end
      end
end
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
end
