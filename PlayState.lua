PlayState = Class{__includes = BaseState}

require "Player1"
require "Player2"

math.randomseed(os.time())

function PlayState:init(params)
    self.player1 = params.player1class
    self.player2 = params.player2class
    -- self.player1 = Player1(p1class)
    -- self.player2 = Player2(p2class)
    if self.player1 == 1 then
        self.p1health = 200
        self.p1attack = 1
        self.p1defense = 1.5
        self.p1sprite = love.graphics.newImage('p1knight.png')
    elseif self.player1 == 2 then
        self.p1health = 100
        self.p1attack = 2.2
        self.p1defense = 0.8
        self.p1sprite = love.graphics.newImage('sexy singh.png')
    elseif self.player1 == 3 then
        self.p1health = 100
        self.p1attack = 1
        self.p1defense = 0.75
        self.p1sprite = love.graphics.newImage('p1witch.png')
    elseif self.player1 == 4 then
        self.p1health = 75
        self.p1attack = 1.13
        self.p1defense = 2
        self.p1sprite = love.graphics.newImage('p1golem.png')
    elseif self.player1 == 5 then
        self.p1health = 83
        self.p1attack = 2
        self.p1defense = 0.82
        self.p1sprite = love.graphics.newImage('p1wizard.png')
    elseif self.player1 == 6 then
        self.p1health = 180
        self.p1attack = 1.2
        self.p1defense = 0.9
        self.p1sprite = love.graphics.newImage('p1vampire.png')
    elseif self.player1 == 7 then
        self.p1health = 100
        self.p1attack = 1
        self.p1defense = 1
        self.p1sprite = love.graphics.newImage('p1priest.png')
    end
    self.p1char = self.player1

    if self.player2 == 1 then
        self.p2health = 200
        self.p2attack = 1
        self.p2defense = 1.5
        self.p2sprite = love.graphics.newImage('p1knight.png')
    elseif self.player2 == 2 then
        self.p2health = 100
        self.p2attack = 2.2
        self.p2defense = 0.8
        self.p2sprite = love.graphics.newImage('sexy singh.png')
    elseif self.player2 == 3 then
        self.p2health = 100
        self.p2attack = 1
        self.p2defense = 0.75
        self.p2sprite = love.graphics.newImage('p2witch.png')
    elseif self.player2 == 4 then
        self.p2health = 75
        self.p2attack = 1.13
        self.p2defense = 2
        self.p2sprite = love.graphics.newImage('p2golem.png')
    elseif self.player2 == 5 then
        self.p2health = 83
        self.p2attack = 2
        self.p2defense = 0.82
        self.p2sprite = love.graphics.newImage('p2wizard.png')
    elseif self.player2 == 6 then
        self.p2health = 180
        self.p2attack = 1.2
        self.p2defense = 0.9
        self.p2sprite = love.graphics.newImage('p2vampire.png')
    elseif self.player2 == 7 then
        self.p2health = 100
        self.p2attack = 1
        self.p2defense = 1
        self.p2sprite = love.graphics.newImage('p2priest.png')
    end
    self.p2char = self.player2


    rocks = {0, 0}
    status = {"", ""}
    buff = {"", ""}
end 

function PlayState:update(dt)
    if not(status[1] == "shock") then
        if love.keyboard.wasPressed('a') then
            attack = 1
        elseif love.keyboard.wasPressed('s') then
            attack = 2
        end
        
        if attack == 1 then
            damage = (math.random(10) + 20)
        elseif attack == 2 then
            damage = (math.random(10) + 40)
        end
    
        damage = damage * self.p1attack
        damage = damage/self.p2defense
    
        if math.random(5) == 1 then
            damage = damage * 1.5
        end
    
        damage = math.floor(damage + 0.5)
    
        if atkType == 2 then
            if math.random(5) == 1 then
                damage = 0
            end
        end 
        self.p2health = self.p2health - damage
        if self.p2health <= 0 then
            gStateMachine:change('game over', "Player 1 Wins!")
        end

        if self.p1char == 3 then
            status = {status[1], "poisoned"}
        end

        if self.p1char == 4 then 
            rocks = {rocks[1] + 1, rocks[2]}
        end

        if self.p1char == 5 then
            if attack == 1 then
                status = {status[1], "burn"}
            elseif attack == 2 then
                status = {status[1], "shock"}
            end
        end
                
        if self.p1char == 6 then
            self.p1health = self.p1health + math.floor(damage/2)
        end

        if self.p1char == 7 then
            if math.random(2) then
                self.p1attack = self.p1attack + 0.5
            else 
                self.p1defense = self.p1defense + 0.5
            end
        end    
    else
        status = {"", status[2]}
    end

    if not(status[2] == "shock") then
        if love.keyboard.wasPressed('a') then
            attack = 1
        elseif love.keyboard.wasPressed('s') then
            attack = 2
        end

        if attack == 1 then
            damage = (math.random(10) + 20)
        elseif attack == 2 then
            damage = (math.random(10) + 40)
        end
    
        damage = damage * self.p2attack
        damage = damage/self.p1defense
    
        if math.random(5) == 1 then
            damage = damage * 1.5
        end
    
        damage = math.floor(damage + 0.5)
    
        if atkType == 2 then
            if math.random(5) == 1 then
                damage = 0
            end
        end 
        self.p1health = self.p1health - damage
        if self.p1health <= 0 then
            gStateMachine:change('game over', "Player 2 Wins!")
        end

        if self.p2char == 3 then
            status = {"poisoned", status[2]}
        end

        if self.p2char == 4 then 
            rocks = {rocks[1], rocks[2] + 1}
        end

        if self.p2char == 5 then
            if attack == 1 then
                status = {"burn", status[1]}
            elseif attack == 2 then
                status = {"shock", status[1]}
            end
        end
                
        if self.player2.char == 6 then
            self.p2health = self.p2health + math.floor(damage/2 + 0.5)
        end
        
        if self.p2char == 7 then
            if math.random(2) then
                self.p2attack = self.p2attack + 0.5
            else 
                self.p2defense = self.p2defense + 0.5
            end
        end    
    else
        status = {status[1], ""}
    end 

    self.p1health = self.p1health - (math.floor(rocks[1]* 3))

    if self.p1health <= 0 then
        gStateMachine:change('game over', "Player 2 Wins!")
    end

    self.p2health = self.p2health - (math.floor(rocks[2]* 3))

    if self.p2health <= 0 then
        gStateMachine:change('game over', "Player 1 Wins!")
    end


    if status[1] == "poison" then
        self.p1health = self.p1health - (math.floor(max_health[1]/100 * 15))
    elseif status[1] == "burn" then
        self.p1health = self.p1health - (math.floor(self.p1health/100 * 35))
    end

    if self.player1.health <= 0 then
        gStateMachine:change('game over', "Player 2 Wins!")
    end

    if status[2] == "poison" then
        self.p2health = self.p2health - (math.floor(max_health[2]/100 * 15))
    elseif status[2] == "burn" then
        self.p2health = self.p2health - (math.floor(self.p2health/100 * 35))
    end

    if self.p2health <= 0 then
        gStateMachine:change('game over', "Player 1 Wins!")
    end
end 

function PlayState:render()
    love.graphics.draw(love.graphics.newImage('background.png'), 0, 0)
    love.graphics.draw(self.p1sprite, 100, 150)
    love.graphics.draw(self.p2sprite, 300, 150)
end