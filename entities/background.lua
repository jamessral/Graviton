local init = function(self)
  self.image = love.graphics.newImage('assets/images/background-filler.png')
end

local draw = function(self)
  love.graphics.draw(self.image, 0, 0)
end

local background = {
  width = 800,
  height = 640,
  image = nil,
  ceilingY = 100,
  floorY = 540,
  draw = draw,
  init = init
}

return background
