Config = scriptConfig("Gragas", "Gragas:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawR","Draw R", SCRIPT_PARAM_ONOFF, true)

 
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()

 
        if IWalkConfig.Combo then
              local target = GetTarget(1300, DAMAGE_MAGIC)
                if ValidTarget(target, 1300) then
                       
                        local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1300,300,1100,275,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
						if CanUseSpell(myHero, _W) == READY and IsInDistance(target, 500) and Config.W then
                        CastSpell(_W)
						end
						local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1200,0,950,200,true,true)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1800,300,1050,375,false,false)
                        if CanUseSpell(myHero, _R) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_R)) and Config.R then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
                end
        end
end)
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ffc0) end
if CanUseSpell(myHero, _R) == READY and DrawingsConfig.DrawR then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_R),3,100,0xff00ffd0) end
end
