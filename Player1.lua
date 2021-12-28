Player1 = Class{}

math.randomseed(os.time())

function Player1:init(player1)
    if player1 == 1 then
        self.health = 200
        self.attack = 1
        self.defense = 1.5
        self.sprite = love.graphics.newImage('p1knight.png')
    elseif player1 == 2 then
        self.health = 100
        self.attack = 2.2
        self.defense = 0.8
        self.sprite = love.graphics.newImage('sexy singh.png')
    elseif player1 == 3 then
        self.health = 100
        self.attack = 1
        self.defense = 0.75
        self.sprite = love.graphics.newImage('p1witch.png')
    elseif player1 == 4 then
        self.health = 75
        self.attack = 1.13
        self.defense = 2
        self.sprite = love.graphics.newImage('p1golem.png')
    elseif player1 == 5 then
        self.health = 83
        self.attack = 2
        self.defense = 0.82
        self.sprite = love.graphics.newImage('p1wizard.png')
    elseif player1 == 6 then
        self.health = 180
        self.attack = 1.2
        self.defense = 0.9
        self.sprite = love.graphics.newImage('p1vampire.png')
    elseif player1 == 7 then
        self.health = 100
        self.attack = 1
        self.defense = 1
        self.sprite = love.graphics.newImage('p1priest.png')
    end
    self.char = player1
end
