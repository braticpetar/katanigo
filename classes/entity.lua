-- Entity class, inherited by player and enemy

Entity = Object:extend()

function Entity:new(x, y)
  self.x = x
  self.y = y
end
