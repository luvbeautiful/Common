AlistarMenu = Menu("Alistar", "Alistar")
AlistarMenu:SubMenu("Combo", "Combo")
AlistarMenu.Combo:Boolean("Q", "Use Q", true)
AlistarMenu.Combo:Boolean("W", "Use W", true)
AlistarMenu.Combo:Boolean("E", "Use E", true)
AlistarMenu.Combo:Boolean("R", "Use R", true)

AlistarMenu:SubMenu("Drawings", "Drawings")
AlistarMenu.Drawings:Boolean("Q", "Draw Q Range", false)
AlistarMenu.Drawings:Boolean("W", "Draw W Range", false)
AlistarMenu.Drawings:Boolean("E", "Draw E Range", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                        local target = GetCurrentTarget()
                       
                       if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_Q)) and GoS:IsInDistance(target, 360) and AlistarMenu.Combo.Q:Value() then
                        CastSpell(_Q)
                        end
						if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, GetCastRange(myHero,_W)) and GoS:IsInDistance(target, 650) and AlistarMenu.Combo.W:Value() then
                        CastTargetSpell(target, _W)
						end
                        for _, ally in pairs(GoS:GetAllyHeroes()) do
                        if AlistarMenu.Combo.E:Value() then
                        if (GetCurrentHP(ally)/GetMaxHP(ally))<0.7 and 
                        CanUseSpell(myHero, _E) == READY and GoS:IsInDistance(ally, 575) then
                        CastSpell(_E)
                        elseif  CanUseSpell(myHero, _E) == READY and (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.7 then
                            CastSpell(_E)
                        end
                        end
                        end
                        if CanUseSpell(myHero, _R) == READY and AlistarMenu.Combo.R:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero)) <=0.4 then
                        CastSpell(_R)   
                    end
                
                end

if AlistarMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_Q)),3,100,0xffffff00) end
if AlistarMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_W)),3,100,0xffffff00) end
if AlistarMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xffffff00) end


end)