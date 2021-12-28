Player2 = Class{}

math.randomseed(os.time())

function Player2:init(player2)
    if player2 == 1 then
        self.health = 200
        self.attack = 1
        self.defense = 1.5
        self.sprite = love.graphics.newImage('p1knight.png')
    elseif player2 == 2 then
        self.health = 100
        self.attack = 2.2
        self.defense = 0.8
        self.sprite = love.graphics.newImage('sexy singh.png')
    elseif player2 == 3 then
        self.health = 100
        self.attack = 1
        self.defense = 0.75
        self.sprite = love.graphics.newImage('p2witch.png')
    elseif player2 == 4 then
        self.health = 75
        self.attack = 1.13
        self.defense = 2
        self.sprite = love.graphics.newImage('p2golem.png')
    elseif player2 == 5 then
        self.health = 83
        self.attack = 2
        self.defense = 0.82
        self.sprite = love.graphics.newImage('p2wizard.png')
    elseif player2 == 6 then
        self.health = 180
        self.attack = 1.2
        self.defense = 0.9
        self.sprite = love.graphics.newImage('p2vampire.png')
    elseif player2 == 7 then
        self.health = 100
        self.attack = 1
        self.defense = 1
        self.sprite = love.graphics.newImage('p2priest.png')
    end
    self.char = player2
end
 