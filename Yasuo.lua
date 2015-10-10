YasuoMenu = Menu("Yasuo", "Yasuo")
YasuoMenu:SubMenu("Combo", "Combo")
YasuoMenu.Combo:Boolean("Q", "Use Q", true)
YasuoMenu.Combo:Boolean("E", "Use E", false)
YasuoMenu.Combo:Boolean("R", "Use R", false)

YasuoMenu:SubMenu("Harass", "Harass")
YasuoMenu.Harass:Boolean("Q", "Use Q ", true)

YasuoMenu:SubMenu("AutoQ", "AutoQ")
YasuoMenu.AutoQ:Boolean("AQ", "Use Q ", false)

YasuoMenu:SubMenu("DMG", "Draw DMG")
YasuoMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
YasuoMenu.DMG:Boolean("E", "Draw E Dmg", true)
YasuoMenu.DMG:Boolean("R", "Draw R Dmg", true)

YasuoMenu:SubMenu("LaneClear", "LaneClear")
YasuoMenu.LaneClear:Boolean("LQ", "LaneClear with Q", true)
YasuoMenu.LaneClear:Boolean("LE", "LaneClear with E", false)

YasuoMenu:SubMenu("JungleClear", "JungleClear")
YasuoMenu.JungleClear:Boolean("JQ", "JungleClear with Q", true)
YasuoMenu.JungleClear:Boolean("JE", "JungleClear with E", true)

YasuoMenu:SubMenu("Lasthit", "Lasthit")
YasuoMenu.Lasthit:Boolean("Q", "Lasthit with Q", true)

YasuoMenu.Lasthit:Boolean("E", "Lasthit with E", false)

YasuoMenu:SubMenu("Misc", "Misc")
YasuoMenu.Misc:Key("MJE", "Jump on minion/jungle", string.byte("T"))

YasuoMenu:SubMenu("Killsteal", "Killsteal")
YasuoMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)
YasuoMenu.Killsteal:Boolean("E", "Killsteal with E", true)
YasuoMenu.Killsteal:Boolean("R", "Killsteal with R", true)

YasuoMenu:SubMenu("Drawings", "Drawings")
YasuoMenu.Drawings:Boolean("Q", "Draw Q Range", true)
YasuoMenu.Drawings:Boolean("EQ", "Draw EQ Range", false)
YasuoMenu.Drawings:Boolean("E", "Draw E Range", false)
YasuoMenu.Drawings:Boolean("R", "Draw R Range", false)
YasuoMenu.Drawings:Boolean("Mouse", "Draw Mouse E Range", false)

YasuoMenu:SubMenu("Wall", "Wall")
YasuoMenu.Wall:Boolean("W", "Use W", true)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                       local mousePos = GetMousePos()
                        local target = GetCurrentTarget()
                         
                        

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 470) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 0 and GoS:GetDistance(myHero, target) <= 450 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 470) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 1 and GoS:GetDistance(myHero, target) <= 300  and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 470) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 0 and GoS:GetDistance(myHero, target) <= 450 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 470) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 0 and GoS:GetDistance(myHero, target) <= 300 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and QPred.HitChance == 1 and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 950 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 1000) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 1 and GoS:GetDistance(myHero, target) <= 300 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 475) and GoS:GetDistance(target ,mousePos) <= 100 and YasuoMenu.Combo.E:Value() then
                        CastTargetSpell(target, _E)
                        end

                        if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 1300) and YasuoMenu.Combo.R:Value() then
                        CastSpell(_R)
                        end


        end
WALL_SPELLS = { -- Yea boiz and grillz its all right here.......
    ["Fizz"]                      = {_R},
    ["Aatrox"]                      = {_E},
    ["Ahri"]                      = {_Q,_W,_E,_R},
    ["Anivia"]                      = {_Q,_E},
    ["Annie"]                      = {_Q},
    ["Ashe"]                      = {_W,_R},
    ["Amumu"]                      = {_Q},
    ["Blitzcrank"]                      = {_Q},
    ["Brand"]                      = {_Q,_R},
    ["Braum"]                      = {_Q,_R},
    ["Caitlyn"]                      = {_Q,_E,_R},
    ["Cassiopiea"]                      = {_W,_E},
    ["Corki"]                      = {_Q,_R},
    ["Diana"]                      = {_Q},
    ["DrMundo"]                      = {_Q},
    ["Draven"]                      = {_Q,_E,_R},
    ["Elise"]                      = {_Q,_E},
    ["Evelynn"]                      = {_Q},
    ["Ezreal"]                      = {_Q,_W,_R},
    ["Galio"]                      = {_Q,_E},
    ["Gangplank"]                      = {_Q},
    ["Gnar"]                      = {_Q},
    ["Graves"]                      = {_Q,_R},
    ["Heimerdinger"]                      = {_W},
    ["Irelia"]                      = {_R},
    ["Janna"]                      = {_Q},
    ["Jayce"]                      = {_Q},
    ["Jinx"]                      = {_W,_R},
    ["Kalista"]                      = {_Q},
    ["Karma"]                      = {_Q},
    ["Kassidan"]                      = {_Q},
    ["Katarina"]                      = {_R},
    ["Leblanc"]                      = {_Q,_E},
    ["Irelia"]                      = {_R},
    ["Leesin"]                      = {_Q},
    ["Irelia"]                      = {_R},
   	["Leona"]                      = {_E},
   	["Lissandra"]                      = {_E},
   	["Lucian"]                      = {_R}, 
   	["Lux"]                      = {_Q,_E},
   	["Missfortune"]                      = {_R},
   	["Morgana"]                      = {_Q},
   	["Nami"]                      = {_R},
   	["Nocturne"]                      = {_Q},
   	["Pantheon"]                      = {_Q},
   	["Quinn"]                      = {_Q},
   	["Rengar"]                      = {_E},
   	["Riven"]                      = {_R},
   	["Ryze"]                      = {_Q,_E},
   	["Sejuani"]                      = {_R},
   	["Sivir"]                      = {_Q,_E},
   	["Skarner"]                      = {_E},
   	["Sona"]                      = {_R},
   	["Swain"]                      = {_Q,_R},
   	["Irelia"]                      = {_R},
   	["Syndra"]                      = {_E,_R},
   	["Talon"]                      = {_W,_R},
   	["Teemo"]                      = {_Q},
   	["Thresh"]                      = {_Q},
   	["Tristana"]                      = {_R},
   	["Varus"]                      = {_Q,_R},
   	["Vayne"]                      = {_E},
   	["Veigar"]                      = {_R},
   	["Twistedfate"]                      = {_Q},
   	["Velkoz"]                      = {_Q,_W},
   	["Viktor"]                      = {_E},
   	["Xerath"]                      = {_Q},
   	["Zed"]                      = {_Q},
   	["Ziggs"]                      = {_Q, _R},
   	["Zyra"]                      = {_E}
}

OnProcessSpell(function(unit, spell)
myHero = GetMyHero()
if Yasuo.Wall.W:Value() then
if unit and GetTeam(unit) ~= GetTeam(myHero) and GetObjectType(unit) == GetObjectType(myHero) and GoS:GetDistance(unit) < 1500 then
local unispells = WALL_SPELLS[GetObjectName(unit)]
if myHero == spell.target and unispells and GetRange(unit) >= 450 and GoS:CalcDamage(unit, myHero, GetBonusDmg(unit)+GetBaseDamage(unit))/GetCurrentHP(myHero) > 0.1337 and not spell.name:lower():find("attack") then
local wPos = GetOrigin(unit)
CastSkillShot(_W, wPos.x, wPos.y, wPos.z)
elseif spell.endPos and not spell.name:lower():find("attack") then
local makeUpPos = GenerateSpellPos(GetOrigin(unit), spell.endPos, GoS:GetDistance(unit, myHero))
if GoS:GetDistanceSqr(makeUpPos) < (GetHitBox(myHero)*3)^2 or GoS:GetDistanceSqr(spell.endPos) < (GetHitBox(myHero)*3)^2 then
local wPos = GetOrigin(unit)
CastSkillShot(_W, wPos.x, wPos.y, wPos.z)
end
end
end
end
end)

for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do

if IOW:Mode() == "LaneClear" then
local mousePos = GetMousePos()
    local minionPos = GetOrigin(minion)

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),1500,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 520) and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and oS:GetDistance(myHero, minion) <= 300 and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end
        
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),1500,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 520) and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and oS:GetDistance(myHero, minion) <= 300 and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),1500,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and GoS:ValidTarget(minion, 1000) and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and oS:GetDistance(myHero, minion) <= 300 and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end
                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(minion, 475) and GoS:GetDistance(minion ,mousePos) <= 100 and YasuoMenu.LaneClear.LE:Value() then
                        CastTargetSpell(minion, _E)

        end
    end
end


for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do


if IOW:Mode() == "LaneClear" then
local mousePos = GetMousePos()
local junglePos = GetOrigin(jungle)

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),1500,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 520) and YasuoMenu.JungleClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and oS:GetDistance(myHero, jungle) <= 300 and YasuoMenu.LaneClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        end
        
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),1500,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 520) and YasuoMenu.JungleClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and oS:GetDistance(myHero, jungle) <= 300 and YasuoMenu.LaneClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        end

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),1500,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and GoS:ValidTarget(jungle, 1000) and YasuoMenu.JungleClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and oS:GetDistance(myHero, jungle) <= 300 and YasuoMenu.LaneClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        end

                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(jungle, 475) and GoS:GetDistance(jungle ,mousePos) <= 100 and YasuoMenu.JungleClear.JE:Value() then
                        CastTargetSpell(jungle, _E)

       
        end
    
    end

end



for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do

if IOW:Mode() == "LastHit" then
local mousePos = GetMousePos()
local minionPos = GetOrigin(minion)

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),1500,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 520) and YasuoMenu.Lasthit.Q:Value() and GetCurrentHP(minion) < GoS:CalcDamage(myHero, minion, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),1500,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 520) and YasuoMenu.Lasthit.Q:Value()and GetCurrentHP(minion) < GoS:CalcDamage(myHero, minion, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),1500,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and GoS:ValidTarget(minion, 1000) and YasuoMenu.Lasthit.Q:Value() and GetCurrentHP(minion) < GoS:CalcDamage(myHero, minion, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end

                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(minion, 475) and YasuoMenu.Lasthit.E:Value() and GoS:GetDistance(minion ,mousePos) <= 100 and GetCurrentHP(minion) < GoS:CalcDamage(myHero, minion, 0, (30*GetCastLevel(myHero,_E) + 40 + 0.6*(GetBonusAP(myHero)))) then
                        CastTargetSpell(minion, _E)

        end
   
    end

end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do

    if CanUseSpell(myHero,_Q) == READY and GOS:ValidTarget(enemy, 2000) and YasuoMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end

    if CanUseSpell(myHero,_E) == READY and GOS:ValidTarget(enemy, 2000) and YasuoMenu.DMG.E:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (30*GetCastLevel(myHero,_E) + 40 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end

    if GOS:ValidTarget(enemy, 2000) and YasuoMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, (100*GetCastLevel(myHero,_R) + 100 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end


local target = GetCurrentTarget()

                       local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,250,520,15,false,false)
                       if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 520) and GoS:GetDistance(myHero, target) <= 400 and YasuoMenu.AutoQ.AQ:Value() then
                       CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                       end

                       local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,271,520,15,false,false)
                       if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 520) and GoS:GetDistance(myHero, target) <= 400 and YasuoMenu.AutoQ.AQ:Value() then
                       CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                       end

                       local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,250,1100,55,false,false)
                       if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and GoS:ValidTarget(target, 1100) and GoS:GetDistance(myHero, target) <= 1000 and YasuoMenu.AutoQ.AQ:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                   
                    end
 
for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local QPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),1500,250,GetCastRange(myHero,_Q),90,false,false)              
               
                if CanUseSpell(myHero, _Q) == READY and YasuoMenu.Killsteal.Q:Value() and QPred.HitChance == 1 and GoS:ValidTarget(enemy,GetCastRange(myHero,_Q)) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then 
                 CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                 end

                 if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy, 1300) and YasuoMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 100 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
                 CastSpell(_R)
                 end

                 if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(enemy, 475) and YasuoMenu.Killsteal.E:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (30*GetCastLevel(myHero,_E) + 40 + 0.6*(GetBonusAP(myHero)))) then
                        CastTargetSpell(enemy, _E)
                        end
end


 if IOW:Mode() == "Harass" then
                       
                        local target = GetCurrentTarget()

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:GetDistance(myHero, target) <= 400 and QPred.HitChance == 1 and GoS:ValidTarget(target, 470) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:GetDistance(myHero, target) <= 400 and GoS:ValidTarget(target, 470) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and QPred.HitChance == 1 and GoS:GetDistance(myHero, target) <= 1000 and GoS:ValidTarget(target, 950) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        
                        end

        end                

local mousePos = GetMousePos()

 for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do

 for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do

                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(minion, 475) and GoS:GetDistance(minion ,mousePos) <= 100 and YasuoMenu.Misc.MJE:Value() then
                        CastTargetSpell(minion, _E)
                        end

                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(jungle, 475) and GoS:GetDistance(jungle ,mousePos) <= 100 and YasuoMenu.Misc.MJE:Value() then
                        CastTargetSpell(jungle, _E)
                        end

                
                end

end

if YasuoMenu.Drawings.Q:Value() and GetCastName(myHero, _Q) == "YasuoQW" then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,475,1,100,0xffffff00) end

if YasuoMenu.Drawings.Q:Value() and GetCastName(myHero, _Q) == "yasuoq2w" then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,475,1,100,0xffffff00) end

if YasuoMenu.Drawings.Q:Value() and GetCastName(myHero, _Q) == "yasuoq3w" then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1000,1,100,0xffffff00) end

if YasuoMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,475,3,100,0xffffff00) end

if YasuoMenu.Drawings.EQ:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,300,3,100,0xffffff00) end

if YasuoMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1200,3,100,0xffffff00) end

if YasuoMenu.Drawings.Mouse:Value() then DrawCircle(mousePos.x, mousePos.y, mousePos.z,100,3,100,0xffffff00) end


end)
