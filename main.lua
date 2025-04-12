function love.load()
  Object = require "classes/classic"
  require "classes/entity"
  require "classes/player"

  player = Player(1, 100)
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  player:draw()
end
