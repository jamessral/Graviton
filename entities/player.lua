local init = function(self)
  self.image = love.graphics.newImage('assets/images/player-filler.png')
end

local move = function(self, dt)
  local left, right, flip = false
  left = love.keyboard.isDown('left', 'a')
  right = love.keyboard.isDown('right', 'd')
  flip = love.keyboard.isDown('w', 'space')

  if left and right then left, right = false end

  if left then
    self.x = self.x - self.moveSpeed * dt
  end

  if right then
    self.x = self.x + self.moveSpeed * dt
  end

  if not self.grounded then
    if self.gravityFlipped then
      self.y = self.y - self.gravitySpeed * dt
    else
      self.y = self.y + self.gravitySpeed * dt
    end
  end

  if flip and self.grounded then
    self.gravityFlipped = not self.gravityFlipped
    self.grounded = false
  end
end

local draw = function(self)
  love.graphics.draw(self.image, self.x, self.y)
end

local player = {
  x = 10,
  y = 400,
  moveSpeed = 200,
  image = nil,
  gravityFlipped = false,
  gravitySpeed = 600,
  grounded = false,
  draw = draw,
  move = move,
  init = init
}

return player
