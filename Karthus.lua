Config = scriptConfig("Karthus", "Karthus:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSR", "Killsteal with R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
Killsteal()
local target = GetCurrentTarget()

        if IWalkConfig.Combo then
              local target = GetTarget(900, DAMAGE_MAGIC)
                       
					    local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),0,900,875,190,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, 875) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						if CanUseSpell(myHero,_E) == READY and GotBuff(myHero,"KarthusDefile") ~= 1 and ValidTarget(target, 550) and Config.E then
						CastSpell(_E)
						elseif CanUseSpell(myHero,_E) == READY and GotBuff(myHero,"KarthusDefile") == 1 and not ValidTarget(target, 550) and Config.E then
						CastSpell(_E)
						end
                end

        if ValidTarget(target, 2000) and Config.DMG then
  if CanUseSpell(myHero,_Q) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (20*GetCastLevel(myHero,_Q) + 20 + 0.3*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_E) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (20*GetCastLevel(myHero,_E) + 10 + 0.2*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_R) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (150*GetCastLevel(myHero,_R) + 100 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end


 end
 

end)
 
function Killsteal()
	for i,enemy in pairs(GetEnemyHeroes()) do
                 if CanUseSpell(myHero, _R) == READY and ValidTarget(enemy, GetCastRange(myHero,_R)) and KSConfig.KSR and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (150*GetCastLevel(myHero,_R) + 100 + 0.6*GetBonusAP(myHero))) then
				 waitTickCount = GetTickCount() + 3000
                 CastSpell(_R)
            end
      end
end
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,550,3,100,0xff00ff00) end
end
