Config = scriptConfig("Karthus", "Karthus:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSR", "Killsteal with R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)

 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
Killsteal()
 
        if IWalkConfig.Combo then
              local target = GetTarget(900, DAMAGE_MAGIC)
                if ValidTarget(target, 900) then
                       
					    local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),0,670,875,160,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						if GotBuff(myHero, "KarthusDefile") ~= 1 then
						if CanUseSpell(myHero, _E) == READY and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSpell(_E)
						end
						end
                end
        end
end)
 
function Killsteal()
	for i,enemy in pairs(GetEnemyHeroes()) do
                 if CanUseSpell(myHero, _R) == READY and ValidTarget(enemy, GetCastRange(myHero,_R)) and KSConfig.KSR and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (150*GetCastLevel(myHero,_R) + 60 + 0.60*GetBonusAP(myHero))) then
				 waitTickCount = GetTickCount() + 3000
                 CastSpell(_R)
            end
      end
end
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
end
