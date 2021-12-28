Player1 = Class{}

math.randomseed(os.time())

local KNIGHT = {200, 1, 1.5, 1, love.graphics.newImage('sexy singh.png')}
local ASSASSIN = {100, 2.2, 0.8, 1.5, love.graphics.newImage('sexy singh.png')}
local WITCH = {100, 1, 0.75, 2, love.graphics.newImage('sexy singh.png')}
local GOLEM = {75, 1.13, 2, 0.82, love.graphics.newImage('sexy singh.png')}
local WIZARD = {83, 2, 0.82, 1, love.graphics.newImage('sexy singh.png')}
local VAMPIRE = {180, 1.2, 0.9, 0.85, love.graphics.newImage('sexy singh.png')}
local PRIEST = {100, 1, 1, 1, love.graphics.newImage('sexy singh.png')}

function Player1:init(player1)
    if player1 == 1 then
        self.player1stats = KNIGHT
    elseif player1 == 2 then
        self.player1stats = ASSASSIN
    elseif player1 == 3 then
        self.player1stats = WITCH
    elseif player1 == 4 then
        self.player1stats = GOLEM
    elseif player1 == 5 then
        self.player1stats = WIZARD
    elseif player1 == 6 then
        self.player1stats = VAMPIRE
    else
        self.player1stats = PRIEST
    end
end
    
function Player1:calculateDamage(pAttack, eDefense)
    if pAttack == 1 then
        damage = (math.random(10) + 20)
    else 
        damage = (math.random(10) + 40)
    end

    damage = (damage * self.player1stats[2])/eDefense

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

function Player1:checkGameOver(pHealth)
    if pHealth > 0 then
        return false
    end
    return true
end

function Player1:render()
    love.graphics.draw(self.player1stats[5], 100, 80)
end