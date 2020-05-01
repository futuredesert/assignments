--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}
 
 -- added the imagines for rewards 
local GOLD_MEDAL = love.graphics.newImage('goldmedal.png')
local SILVER_MEDAL = love.graphics.newImage('silvermedal.png')
local BRONZE_MEDAL = love.graphics.newImage('bronzemedal.png')
local SKULL_BONE = love.graphics.newImage('skullbone.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You Died!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 125, VIRTUAL_WIDTH, 'center')

-- set what the player needs to score in order to get a prize 
    if self.score >= 10 then
        love.graphics.draw(GOLD_MEDAL, VIRTUAL_WIDTH / 2 - GOLD_MEDAL:getWidth() / 2, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 2) 
    elseif self.score >= 5 then
        love.graphics.draw(SILVER_MEDAL, VIRTUAL_WIDTH / 2 - SILVER_MEDAL:getWidth() / 2, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 2) 
    elseif self.score >= 2 then
        love.graphics.draw(BRONZE_MEDAL, VIRTUAL_WIDTH / 2 - BRONZE_MEDAL:getWidth() / 2, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 2)
    elseif self.score >= 0 then
        love.graphics.draw(SKULL_BONE, VIRTUAL_WIDTH / 2 - SKULL_BONE:getWidth() / 2, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 2)
    end 
end