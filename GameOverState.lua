GameOverState = Class{__includes = BaseState}

function GameOverState:init(message)
    self.winnerMessage = message
end

function GameOverState:render()
    love.graphics.setFont(love.graphics.newFont('font.ttf', 32))
    love.graphics.printf("winner", 0, 50, 400, 'center')
end