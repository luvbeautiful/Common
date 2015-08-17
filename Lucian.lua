Config = scriptConfig("Lucian", "Lucian:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E To Mouse", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)

 
 
 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
 
 
        if IWalkConfig.Combo then
              local target = GetTarget(1300, DAMAGE_PHYSICAL)
 local mousePos = GetMousePos()
                if ValidTarget(target, 1300) then
            if Config.Q then          
  if IsInDistance(target, GetCastRange(myHero, _Q)) and GotBuff(myHero, "lucianpassivebuff") == 0
    then CastTargetSpell(target, _Q)
elseif GotBuff(myHero, "lucianpassivebuff") > 1 then
        Attacktarget(target)
end
end
if Config.W then
local WPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1600,300,GetCastRange(myHero, _W),80,true,true)
if IsInDistance(target, GetCastRange(myHero, _W)) and GetDistance(myHero, enemy) < 700 and GotBuff(myHero, "lucianpassivebuff") == 0
    then CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
elseif GotBuff(myHero, "lucianpassivebuff") > 1 then
        Attacktarget(target)
        if Config.W then
end
end
local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),0,0,425,80,false,false)
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_E)) and Config.E then
                        CastSkillShot(_E, mousePos.x, mousePos.y, mousePos.z)
                        end
                end
        end
    end
end)
 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ffc0) end
end
