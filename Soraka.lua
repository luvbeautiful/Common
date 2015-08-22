Config = scriptConfig("Soraka", "Soraka:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)


 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()

 
        if IWalkConfig.Combo then
              local target = GetTarget(1150, DAMAGE_MAGIC)
                if ValidTarget(target, 1150) then
                       
					    local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1100,300,970,260,false,true)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
						for _, ally in pairs(GetAllyHeroes()) do
			            if Config.W then
			            if (GetCurrentHP(ally)/GetMaxHP(ally))<0.8 and
	            	    CanUseSpell(myHero, _W) == READY and IsInDistance(ally, 600) then
			            CastTargetSpell(ally, _W)
		                end
						end
						end
						local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),0,300,925,275,false,true)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						end
						for _, ally in pairs(GetAllyHeroes()) do
			            if Config.R then
			            if (GetCurrentHP(ally)/GetMaxHP(ally))<0.3 and
	            	    CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) then
			            CastSpell(_R)
						end
						end
						end
                end
        end
end)

 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ff00) end
end
