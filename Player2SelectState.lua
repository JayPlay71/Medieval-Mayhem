Player2SelectState = Class{__includes = BaseState}

require "Player2"

local SPRITES = {love.graphics.newImage('p2knight.png'), love.graphics.newImage('sexy singh.png'), love.graphics.newImage('sexy singh.png'), love.graphics.newImage('p2golem.png'), love.graphics.newImage('p2wizard.png'), love.graphics.newImage('p2vampire.png'), love.graphics.newImage('p2priest.png')}

function Player2SelectState:init(p1class)
    self.player1 = p1class
    self.currentChar = 1
end

function Player2SelectState:update(dt)
    if love.keyboard.wasPressed('left') then
        -- if self.currentChar == 1 then
            --gSounds['no-select']:play()
        -- else
            --gSounds['select']:play()
            -- self.currentChar = self.currentChar - 1
        -- end
        if not(self.currentChar == 1) then
            self.currentChar = self.currentChar - 1
        end
    elseif love.keyboard.wasPressed('right') then
        -- if self.currentchar == 7 then
            --gSounds['no-select']:play()
        -- else
            --gSounds['select']:play()
            --self.currentChar = self.currentChar + 1
        -- end
        if not(self.currentChar == 7) then
            self.currentChar = self.currentChar + 1
        end
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play', self.player1, self.currentChar)
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function Player2SelectState:render()
    love.graphics.draw(love.graphics.newImage('background.png'), 0, 0)

    love.graphics.setFont(love.graphics.newFont('font.ttf', 24))
    love.graphics.printf("Select your character with left and right!", 0, 50,
        400, 'center')
    love.graphics.setFont(love.graphics.newFont('font.ttf', 8))
    love.graphics.printf("(Press Enter to continue!)", 0, 100,
        400, 'center')
    
    love.graphics.draw(love.graphics.newImage('left.png'), 76, 200)
    
    love.graphics.draw(love.graphics.newImage('right.png'), 300, 200)

    love.graphics.draw(SPRITES[self.currentChar], 168, 200)
end
