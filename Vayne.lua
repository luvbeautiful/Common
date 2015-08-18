Config = scriptConfig("Vayne", "Vayne:") 
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)


 
myIAC = IAC()
 
OnLoop(function(myHero)
Drawings()
 
        if IWalkConfig.Combo then
              local target = GetTarget(1000, DAMAGE_PHYSICAL)
			  local mousePos = GetMousePos()
                if ValidTarget(target, 1000) then
                    if Config.Q then          
   if IsInDistance(target, GetCastRange(myHero, _Q)) and GotBuff(myHero, "vaynetumblebonus") == 0
    then CastSkillShot(_Q, mousePos.x, mousePos.y, mousePos.z)
elseif GotBuff(myHero, "vaynetumblebonus") > 1 then
        Attacktarget(target)
end
end
                end
        end
end)


 
function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
end
