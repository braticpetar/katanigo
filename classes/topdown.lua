Topdown = Entity:extend()
require "classes/animation"

local idle_down_image = love.graphics.newImage("testing/idle-down.png")
local idle_side_image = love.graphics.newImage("testing/idle-side.png")
local idle_up_image = love.graphics.newImage("testing/idle-up.png")

local walk_down_image =love.graphics.newImage("testing/walk-down.png")
local walk_side_image = love.graphics.newImage("testing/walk-side.png")
local walk_up_image = love.graphics.newImage("testing/walk-up.png")

-- Animation(image, frames_number, fps, flipped, scale)
local animations = {
  idle_right = Animation(idle_side_image, 2, 10, false, 5),
  idle_left = Animation(idle_side_image, 2, 10, true, 5),
  idle_up = Animation(idle_up_image, 2, 10, false, 5),
  idle_down = Animation(idle_down_image, 2, 10, false, 5),

  running_right = Animation(walk_side_image, 4, 10, false, 5), 
  running_left = Animation(walk_side_image, 4, 10, true, 5),

  running_up = Animation(walk_up_image, 4, 10, false, 5),
  running_down = Animation(walk_down_image, 4, 10, false, 5)
}

function Topdown:new(x, y)
  Topdown.super.new(self, x, y)
  self.speed = 300
  self.state = "idle"
  self.direction = "right"
end

function Topdown:update(dt)
  self:move(dt)

  self.animation = animations[self.state .. "_" .. self.direction]
  self.animation:update(dt)
end

function Topdown:move(dt)
  local moveX = 0
  local moveY = 0

  if love.keyboard.isDown("up", "w") then
    self.direction = "up"
    self.state = "running"
    moveY = moveY - 1
  elseif love.keyboard.isDown("down") then
    self.direction = "down"
    self.state = "running"
    moveY = moveY + 1
  end

  if love.keyboard.isDown("left") then
    self.direction = "left"
    self.state = "running"
    moveX = moveX - 1
  elseif love.keyboard.isDown("right") then
    self.direction = "right"
    self.state = "running"
    moveX = moveX + 1
  end

  if love.keyboard.isDown("left", "right", "up", "down") == false then
    self.state = "idle"
  end

  local length = math.sqrt(moveX^2+moveY^2)
  if length > 0 then
    moveX = moveX / length
    moveY = moveY / length
  end

  self.x = self.x + moveX * self.speed * dt
  self.y = self.y + moveY * self.speed * dt
end

function Topdown:draw()
  self.animation:draw(self.x, self.y)
end
