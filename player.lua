Player = Entity:extend()
require "animation"

local idle_image = love.graphics.newImage("assets/IDLE.png")
local running_image = love.graphics.newImage("assets/RUN.png")
local attack_image = love.graphics.newImage("assets/ATTACK.png")

-- Animation(image, frames_number, fps, flipped, scale)

local animations = {
  idle_right = Animation(idle_image, 10, 10, false, 3),
  idle_left = Animation(idle_image, 10, 10, true, 3),

  running_right = Animation(running_image, 16, 15, false, 3),
  running_left = Animation(running_image, 16, 15, true, 3),

  attack_right = Animation(attack_image, 7, 10, false, 3),
  attack_left = Animation(attack_image, 7, 10, true, 3)
}

function Player:new(x, y)
  Player.super.new(self, x, y)
  self.speed = 300
  self.state = "idle"
  self.direction = "right"
end

function Player:update(dt)
  self:move(dt)
  
  self.animation = animations[self.state .. "_" .. self.direction]
  self.animation:update(dt)
end

function Player:move(dt)

  if love.keyboard.isDown("left") then
    self.direction = "left"
    self.state = "running"
    self.x = self.x - self.speed * dt

  elseif love.keyboard.isDown("right") then
    self.direction = "right"
    self.state = "running"
    self.x = self.x + self.speed * dt
  else
    self.state = "idle"
  end

end

function Player:draw()
  self.animation:draw(self.x, self.y)
end
