Config = scriptConfig("Sion", "Sion:")
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
 
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()

          if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_MAGIC)
                if ValidTarget(target, 1000) then
				        
						
				        
                        local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),2000,500,GetCastRange(myHero,_R),120,true,true)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_R)) and Config.R then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                        end
                        local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1800,250,GetCastRange(myHero,_E),80,true,true)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),300,250,GetCastRange(myHero,_Q),600,true,true)
                        if CanUseSpell(myHero, _Q) == READY and EPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
                end
        end
end)

function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00fc00) end
end		
