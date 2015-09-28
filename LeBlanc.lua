LeBlancMenu = Menu("LeBlanc", "LeBlanc")
LeBlancMenu:SubMenu("Combo", "Combo")
LeBlancMenu.Combo:Boolean("Q", "Use Q", true)
LeBlancMenu.Combo:Boolean("W", "Use W", true)
LeBlancMenu.Combo:Boolean("E", "Use E", true)
LeBlancMenu.Combo:Boolean("ER", "Use ER", true)
LeBlancMenu.Combo:Boolean("WR", "Use WR", true)
LeBlancMenu.Combo:Boolean("QR", "Use QR", true)

LeBlancMenu:SubMenu("WR", "WR")
LeBlancMenu.WR:Boolean("W", "W To Mouse", true)
LeBlancMenu.WR:Boolean("R", "R To Mouse", true)


LeBlancMenu:SubMenu("DMG", "Draw DMG")
LeBlancMenu.DMG:Boolean("W", "Draw W Dmg", true)
LeBlancMenu.DMG:Boolean("R", "Draw R Dmg", true)

LeBlancMenu:SubMenu("Drawings", "Drawings")
LeBlancMenu.Drawings:Boolean("Q", "Draw Q Range", true)
LeBlancMenu.Drawings:Boolean("E", "Draw E Range", false)
LeBlancMenu.Drawings:Boolean("R", "Draw R Range", false)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       
                        local target = GetCurrentTarget()
                         
                        

                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "LeblancChaosOrb" and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 700 and LeBlancMenu.Combo.Q:Value() then 
                        CastTargetSpell(target, _Q)
                        end
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,250,600,220,false,false)
                        if CanUseSpell(myHero, _W) == READY and GetCastName(myHero, _W) == "LeblancSlide" and WPred.HitChance == 1 and GoS:GetDistance(myHero, target) <= 600 and GoS:ValidTarget(target, 1000) and LeBlancMenu.Combo.W:Value() then 
                        CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                        end
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1600,250,925,55,true,false)
                        if CanUseSpell(myHero, _E) == READY and GetCastName(myHero, _E) == "LeblancSoulShackle" and GoS:GetDistance(myHero, target) <= 920 and EPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and LeBlancMenu.Combo.E:Value() then 
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                        end
                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1600,250,925,55,true,false)
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 1000) and GetCastName(myHero, _R) == "LeblancSoulShackleM" and GoS:GetDistance(myHero, target) <= 920 and LeBlancMenu.Combo.ER:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                        end
                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,250,600,220,false,false)
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 600 and GetCastName(myHero, _R) == "LeblancSlideM" and LeBlancMenu.Combo.WR:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                         end
                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 700 and GetCastName(myHero, _R) == "LeblancChaosOrbM" and LeBlancMenu.Combo.QR:Value() then
                        CastTargetSpell(target, _R)
                        end


        end

end)
