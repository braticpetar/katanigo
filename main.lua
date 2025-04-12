function love.load()
  Object = require "classic"
  require "entity"
  require "player"

  player = Player(1, 100)
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  player:draw()
end
