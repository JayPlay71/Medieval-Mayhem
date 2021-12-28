WINDOW_WIDTH = 400
WINDOW_HEIGHT = 300

Class = require 'class'
push = require 'push'
require "Player1"
require "Player2"
require "StateMachine"
require "BaseState"
require "TitleScreenState"
require "Player1SelectState"
require "Player2SelectState"
require "PlayState"
require "GameOverState"

player1 = Player1()
player2 = Player2()

love.graphics.setDefaultFilter('nearest', 'nearest')


function love.load()

    love.graphics.setFont(love.graphics.newFont('font.ttf', 8))

    push:setupScreen(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false
    })

    love.window.setTitle('Medieval Mayhem')

    gStateMachine = StateMachine {
        ['title'] = function() return TitleScreenState() end,
        ['player1 select'] = function() return Player1SelectState() end,
        ['player2 select'] = function() return Player2SelectState() end,
        ['play'] = function() return PlayState() end,
        ['game over'] = function() return GameOverState() end
        }
    gStateMachine:change('title')

    love.keyboard.keysPressed = {}
    love.keyboard.keysReleased = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end

    if key == 'p' then
        pause = -pause
    end

end

function love.mousepressed(x, y, button)
    love.mouse.buttonsPressed[button] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.mouse.wasPressed(button)
    return love.mouse.buttonsPressed[button]
end

function love.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}
end

function love.draw()
    push:apply('start')

    love.graphics.clear(108/255, 140/255, 255/255, 255/255)

    gStateMachine:render()

    push:apply('end')
end
