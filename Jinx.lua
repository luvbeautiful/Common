Config = scriptConfig("Jinx", "Jinx:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E ", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSR", "Killsteal with R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawW","Draw W", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawR","Draw R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("DMG", "DMG", SCRIPT_PARAM_ONOFF, true)
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
Killsteal()
local target = GetCurrentTarget()
 
        if IWalkConfig.Combo then
              local target = GetTarget(1600, DAMAGE_PHYSICAL)
			  if ValidTarget(target, 1150) then
			  
					    if CanUseSpell(myHero, _Q) == READY and Config.Q and ValidTarget(target, 700) then
                        if GetDistance(myHero, target) > 525 and GotBuff(myHero, "jinxqicon") > 0 then
                        CastSpell(_Q)
                        elseif GetDistance(myHero, target) < 570 and GotBuff(myHero, "JinxQ") > 0 then
                        CastSpell(_Q)
						end
						end
                        local WPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),3300,600,1500,60,true,false)
                        if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_W)) and Config.W then
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
						local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),0,300,900,50,false,true)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1700,600,2000,140,false,true)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_R)) and Config.R then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
                end
        end

        if ValidTarget(target, 2000) and Config.DMG then
    if CanUseSpell(myHero,_W) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (50*GetCastLevel(myHero,_W) + 40 + 1.4*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

    if CanUseSpell(myHero,_E) == READY then
local trueDMG = CalcDamage(myHero, target, 0, (55*GetCastLevel(myHero,_E) + 25 + 1.0*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(target,GetCurrentHP(target),trueDMG,0,0xff0cff00)
    end

 end
 

end)

function Killsteal()
	      for i,enemy in pairs(GetEnemyHeroes()) do
		       local RPred = GetPredictionForPlayer(GetMyHeroPos(),enemy,GetMoveSpeed(enemy),1700,600,2000,140,false,true)
               if CanUseSpell(myHero, _R) and RPred.HitChance == 1 and ValidTarget(enemy, GetCastRange(myHero, _R)) and KSConfig.KSR and RPred.HitChance == 1 and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, (GetMaxHP(enemy)-GetCurrentHP(enemy))*(0.2+0.05*GetCastLevel(myHero, _R))+(150+100*GetCastLevel(myHero, _R)+GetBonusDmg(myHero))*math.max(0.1, math.min(1, GetDistance(enemy)/1700))) and GetDistance(myHero, enemy) < 5000 then  
               CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			   end
		end
end	 
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _W) == READY and DrawingsConfig.DrawW then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_W),3,100,0xff00ff00) end
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
if CanUseSpell(myHero, _R) == READY and DrawingsConfig.DrawR then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_R),3,100,0xff00ff00) end
end
