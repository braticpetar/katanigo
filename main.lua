function love.load()
  Object = require "classes/classic"
  require "classes/entity"
  require "classes/player"
  require "classes/topdown"

  player = Player(1, 100)
  topdown = Topdown(1, 100)
end

function love.update(dt)
 -- player:update(dt)
  topdown:update(dt)
end

function love.draw()
--  player:draw()
  topdown:draw()
end
