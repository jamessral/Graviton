-- Libs Go Here
Anim8 = require('libs/anim8')
Bump = require('libs/bump')
Camera = require('libs/hump/camera')
Timer = require('libs/hump/timer')
Vector = require('libs/hump/vector')

-- Globals Go Here
local player = require('entities/player')
local background = require('entities/background')

local gameWidth, gameHeight
function love.load()
  love.graphics.setDefaultFilter('nearest')
  gameWidth = love.graphics.getWidth()
  gameHeight = love.graphics.getHeight()

  -- Initialize background
  background:init()
  background.width = gameWidth
  background.height = gameHeight
  background.floorY = gameHeight - 100

  -- Initialize player
  player:init()
end

local function checkGrounded(player, background)
  if player.y >= background.floorY then
    player.y = background.floorY
    player.grounded = true
  elseif player.y <= background.ceilingY then
    player.y = background.ceilingY
    player.grounded = true
  end
end

function love.update(dt)
  checkGrounded(player, background)
  player:move(dt)
end

function love.draw()
  background:draw()
  player:draw()

  -- Uncomment for debugging stuff
  love.graphics.print(string.format("%s", player.grounded), 100, 100)
end
