TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('player1 select')
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function TitleScreenState:render()
    love.graphics.draw(love.graphics.newImage('background.png'), 0, 0)

    love.graphics.setFont(love.graphics.newFont('font.ttf', 32))
    love.graphics.printf('Medieval Mayhem', 0, 64, 400, 'center')

    love.graphics.setFont(love.graphics.newFont('font.ttf', 16))
    love.graphics.printf('Press Enter', 0, 100, 400, 'center')
end