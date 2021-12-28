Player2 = Class{}

math.randomseed(os.time())

local KNIGHT = {200, 1, 1.5, 1, love.graphics.newImage('sexy singh.png')}
local ASSASSIN = {100, 2.2, 0.8, 1.5, love.graphics.newImage('sexy singh.png')}
local WITCH = {100, 1, 0.75, 2, love.graphics.newImage('sexy singh.png')}
local GOLEM = {75, 1.13, 2, 0.82, love.graphics.newImage('sexy singh.png')}
local WIZARD = {83, 2, 0.82, 1, love.graphics.newImage('sexy singh.png')}
local VAMPIRE = {180, 1.2, 0.9, 0.85, love.graphics.newImage('sexy singh.png')}
local PRIEST = {100, 1, 1, 1, love.graphics.newImage('sexy singh.png')}

function Player2:init(player2)
    if player2 == 1 then
        self.player2stats = KNIGHT
    elseif player2 == 2 then
        self.player2stats = ASSASSIN
    elseif player2 == 3 then
        self.player2stats = WITCH
    elseif player2 == 4 then
        self.player2stats = GOLEM
    elseif player2 == 5 then
        self.player2stats = WIZARD
    elseif player2 == 6 then
        self.player2stats = VAMPIRE
    else
        self.player2stats = PRIEST
    end

end
    
function Player2:calculateDamage(pAttack, eDefense)
    if pAttack == 1 then
        damage = (math.random(10) + 20)
    else 
        damage = (math.random(10) + 40)
    end

    damage = (damage * self.player2stats[2])/eDefense

    if math.random(5) == 1 then
        damage = damage * 1.5
    end

    damage = math.floor(damage + 0.5)

    if pAttack == 2 then
        if math.random(5) == 1 then
            damage = 0
        end
    end

    return damage
end

function Player2:checkGameOver(pHealth)
    if pHealth > 0 then
        return false
    end
    return true
end

function Player2:render()
    love.graphics.draw(self.player2stats[5], 300, 80)
end