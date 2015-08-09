menu = scriptConfig("Rengar", "Rengar")
menu.addParam("Q", "EMP Q", SCRIPT_PARAM_ONOFF, true)
menu.addParam("E", "EMP E", SCRIPT_PARAM_ONOFF, false)
menu.addParam("W", "EMP W", SCRIPT_PARAM_ONOFF, false)

PrintChat("Rengar")
OnLoop(function(myHero)
  taa = GetTarget(210)
  tQ = GetTarget(250)
  tW = GetTarget(400)
  tE = GetTarget(1000)
  renpos = GetOrigin(myHero)
  textpos = WorldToScreen(1, renpos.x, renpos.y, renpos.z)
  if menu.Q and (not menu.W and not menu.E) then
    DrawText("Q", 20, textpos.x, textpos.y, 0xffffffff)
  end
  if menu.W and (not menu.Q and not menu.E) then
    DrawText("W", 20, textpos.x, textpos.y, 0xffffffff)
  end
  if menu.E and (not menu.Q and not menu.W) then
    DrawText("E", 20, textpos.x, textpos.y, 0xffffffff)
  end
  if GetCurrentHP(myHero) < 500 and GetCurrentMana(myHero) == 5 then
    CastSpell(_W)
  end
  if KeyIsDown(0x20) then
    if GotBuff(myHero, "rengarpassivebuff") == 0 then
      if GetCurrentHP(myHero) > 700 then
        if (CanUseSpell(myHero, _Q) == 0 or CanUseSpell(myHero, _W) == 0 or CanUseSpell(myHero, _E) == 0) then
          atake(taa)
        end
      end
      if GetCurrentMana(myHero) <= 4 then
        if GotBuff(myHero, "rengarqbase") == 1 or GotBuff(myHero, "rengarqemp") == 1 then
          atake(tQ)
        end
        if CanUseSpell(myHero, _E) == 0 then
          CastE(tE)
        end
        if CanUseSpell(myHero, _W) == 0 then
          CastW(tW)
        end
        if CanUseSpell(myHero, _Q) == 0 then
          CastQ(tQ)
        end
      end
      if GetCurrentMana(myHero) == 5 then
        if GetCurrentHP(myHero) >= 500 then
          if menu.Q then
            CastQ(tQ)
          end
          if menu.E then
            CastEE(tE)
          end
        end
        if menu.W then
          CastW(tW)
        end
      end
    end
    if GotBuff(myHero, "rengarpassivebuff") == 1 then
      if GetCurrentMana(myHero) <= 4 then
        if CanUseSpell(myHero, _Q) == 0 then
          CastQQ(tE)
        end
      end
      if GetCurrentMana(myHero) == 5 then
        if menu.Q then
          CastQQ(tE)
        end
      end
    end
  end
end)

function CastQ(unit)
  if ValidTarget(unit, 250) then
    CastSpell(_Q)
  end
end

function CastQQ(unit)
  if ValidTarget(unit, 950) then
    CastSpell(_Q)
  end
end

function CastW(unit)
  if ValidTarget(unit, 400) then
    CastSpell(_W)
  end
end

function CastE(unit)
  if ValidTarget(unit, 1000) then
    local pe = GetPredictionForPlayer(GetOrigin(GetMyHero()), unit, GetMoveSpeed(unit), 2000, 300, 1000, 80, false, true)
    if pe.HitChance == 1 then
      CastSkillShot(_E, pe.PredPos.x, pe.PredPos.y, pe.PredPos.z)
    end
  end
end

function CastEE(unit)
  if ValidTarget(unit, 1000) then
    local pe = GetPredictionForPlayer(GetOrigin(GetMyHero()), unit, GetMoveSpeed(unit), 2000, 300, 1000, 80, true, true)
    if pe.HitChance == 1 then
      CastSkillShot(_E, pe.PredPos.x, pe.PredPos.y, pe.PredPos.z)
    end
  end
end

function atake(unit)
  AttackUnit(unit)
end
