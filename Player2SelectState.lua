Player2SelectState = Class{__includes = BaseState}

require "Player2"

local SPRITES = {love.graphics.newImage('sexy singh.png'), love.graphics.newImage('sexy singh.png'), love.graphics.newImage('sexy singh.png'), love.graphics.newImage('sexy singh.png'), love.graphics.newImage('sexy singh.png'), love.graphics.newImage('sexy singh.png'), love.graphics.newImage('sexy singh.png')}

function Player2SelectState:init()
    self.currentChar = 1
end

function Player2SelectState:update(dt)
    if love.keyboard.wasPressed('left') then
        -- if self.currentChar == 1 then
            --gSounds['no-select']:play()
        -- else
            --gSounds['select']:play()
        self.currentChar = self.currentChar - 1
        -- end
    elseif love.keyboard.wasPressed('right') then
        -- if self.currentchar == 7 then
            --gSounds['no-select']:play()
        -- else
            --gSounds['select']:play()
        self.currentChar = self.currentChar + 1
        -- end
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        player2 = Player2(self.currentChar)
        gStateMachine:change('play')
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function Player2SelectState:render()
    love.graphics.setFont(love.graphics.newFont('font.ttf', 24))
    love.graphics.printf("Select your character with left and right!", 0, 50,
        400, 'center')
    love.graphics.setFont(love.graphics.newFont('font.ttf', 8))
    love.graphics.printf("(Press Enter to continue!)", 0, 100,
        400, 'center')
        
    if self.currentChar == 1 then
        love.graphics.setColor(40, 40, 40, 128)
    end
    
    --love.graphics.draw(gTextures['arrows'], gFrames['arrows'][1], 76,
        --200)
   
    --love.graphics.setColor(255, 255, 255, 255)

    if self.currentPaddle == 7 then
        love.graphics.setColor(40, 40, 40, 128)
    end
    
    --love.graphics.draw(gTextures['arrows'], gFrames['arrows'][2], VIRTUAL_WIDTH - VIRTUAL_WIDTH / 4,
        --VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 3)
    
    --love.graphics.setColor(255, 255, 255, 255)

    love.graphics.draw(love.graphics.newImage('sexy singh.png'), 168, 200)
end
