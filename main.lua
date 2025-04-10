function love.load()
  Object = require "classic"
  require "entity"
  require "player"

  player = Player(10, 10)
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  player:draw()
  love.graphics.circle("fill", 1, 1, 10)
end
