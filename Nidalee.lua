Config = scriptConfig("Nidalee", "Nidalee:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)


 
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()

 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_MAGIC)
                if ValidTarget(target, 1000) then
                       
                        local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1500,500,GetCastRange(myHero,_Q),40,true,true)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
                end
        end
end)
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
end
