PlayState = Class{__includes = BaseState}

require "Player1"
require "Player2"

math.randomseed(os.time())

function PlayState:init(p1class, p2class)
    self.player1 = Player1(p1class)
    self.player2 = Player2(p2class)
    rocks = {0, 0}
    status = {"", ""}
    buff = {"", ""}
    maxhealth = {player1.health, player2.health}
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
        else 
            damage = (math.random(10) + 40)
        end
    
        damage = damage * self.player1.attack
        damage = damage/self.player2.defense
    
        if math.random(5) == 1 then
            damage = damage * 1.5
        end
    
        damage = math.floor(damage + 0.5)
    
        if atkType == 2 then
            if math.random(5) == 1 then
                damage = 0
            end
        end 
        self.player2.health = self.player2.health - damage
        if self.player2.health <= 0 then
            gStateMachine:change('game over', "Player 1 Wins!")
        end

        if self.player1.char == 3 then
            status = {status[1], "poisoned"}
        end

        if self.player1.char == 4 then 
            rocks = {rocks[1] + 1, rocks[2]}
        end

        if self.player1.char == 5 then
            if attack == 1 then
                status = {status[1], "burn"}
            elseif attack == 2 then
                status = {status[1], "shock"}
            end
        end
                
        if self.player1.char == 6 then
            self.player1.health = self.player1.health + math.floor(damage/2)
        end

        if self.player1.char == 7 then
            if math.random(2) then
                self.player1.attack = self.player1.attack + 0.5
            else 
                self.player1.defense = self.player1.defense + 0.5
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
        else 
            damage = (math.random(10) + 40)
        end
    
        damage = damage * self.player2.attack
        damage = damage/self.player1.defense
    
        if math.random(5) == 1 then
            damage = damage * 1.5
        end
    
        damage = math.floor(damage + 0.5)
    
        if atkType == 2 then
            if math.random(5) == 1 then
                damage = 0
            end
        end 
        self.player1.health = self.player1.health - damage
        if self.player1.health <= 0 then
            gStateMachine:change('game over', "Player 2 Wins!")
        end

        if self.player2.char == 3 then
            status = {"poisoned", status[2]}
        end

        if self.player2.char == 4 then 
            rocks = {rocks[1], rocks[2] + 1}
        end

        if self.player2.char == 5 then
            if attack == 1 then
                status = {"burn", status[1]}
            elseif attack == 2 then
                status = {"shock", status[1]}
            end
        end
                
        if self.player2.char == 6 then
            self.player2.health = self.player2.health + math.floor(damage/2 + 0.5)
        end
        
        if self.player2.char == 7 then
            if math.random(2) then
                self.player2.attack = self.player2.attack + 0.5
            else 
                self.player2.defense = self.player2.defense + 0.5
            end
        end    
    else
        status = {status[1], ""}
    end 

    self.player1.health = self.player1.health - (math.floor(rocks[1]* 3))

    if self.player1.health <= 0 then
        gStateMachine:change('game over', "Player 2 Wins!")
    end

    self.player2.health = self.player2.health - (math.floor(rocks[2]* 3))

    if self.player2.health <= 0 then
        gStateMachine:change('game over', "Player 1 Wins!")
    end


    if status[1] == "poison" then
        self.player1.health = self.player1.health - (math.floor(max_health[1]/100 * 15))
    elseif status[1] == "burn" then
        self.player1.health = self.player1.health - (math.floor(self.player1.health/100 * 35))
    end

    if self.player1.health <= 0 then
        gStateMachine:change('game over', "Player 2 Wins!")
    end

    if status[2] == "poison" then
        self.player2.health = self.player2.health - (math.floor(max_health[2]/100 * 15))
    elseif status[2] == "burn" then
        self.player2.health = self.player2.health - (math.floor(self.player2.health/100 * 35))
    end

    if self.player2.health <= 0 then
        gStateMachine:change('game over', "Player 1 Wins!")
    end
end 

function PlayState:render()
    love.graphics.draw(love.graphics.newImage('background.png'), 0, 0)
    love.graphics.draw(self.player1.sprite, 100, 150)
    love.graphics.draw(self.player1.sprite, 300, 150)
end