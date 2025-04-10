Player = Entity:extend()

function Player:new(x, y)
  Player.super.new(self, x, y)
  self.speed = 100
  
  -- asset handling
  -- idle animation
  idle_image = love.graphics.newImage("assets/IDLE.png")
  idle_frames = {}
  local idle_frame_width = idle_image:getWidth() / 10
  local idle_frame_height = idle_image:getHeight()

  for i=0, 9 do
    table.insert(idle_frames, love.graphics.newQuad(i * idle_frame_width, 0, idle_frame_width, idle_frame_height, idle_image:getWidth(), idle_image:getHeight()))
  end

  idle_currentFrame = 1
  -- end of idle animation

  -- running animation
  running_image = love.graphics.newImage("assets/RUN.png")
  running_frames = {}
  running_frame_width = running_image:getWidth() / 16
  running_frame_height = running_image:getHeight()

  for i=0, 15 do
    table.insert(running_frames, love.graphics.newQuad(i * running_frame_width, 0, running_frame_width, running_frame_height, running_image:getWidth(), running_image:getHeight()))
  end
  
  running_currentFrame = 1
  -- end of running animation

  -- attack animation
  attack_image = love.graphics.newImage("assets/ATTACK.png")
  attack_frames = {}
  attack_frame_width = attack_image:getWidth() / 7
  attack_frame_height = attack_image:getHeight()

  for i=0, 6 do
    table.insert(attack_frames, love.graphics.newQuad(i * attack_frame_width, 0, attack_frame_width, attack_frame_height, attack_image:getWidth(), attack_image:getHeight()))
  end

  -- end of attack animation
  idle = true
  left = false
  right = false
end

function Player:update(dt)
  if idle == true then
    idle_currentFrame = idle_currentFrame + 10 * dt
    if idle_currentFrame > 10 then
      idle_currentFrame = 1
    end 
  elseif left == true or right == true then
    running_currentFrame = running_currentFrame + 10 * dt
    if running_currentFrame > 16 then
      running_currentFrame = 1
    end
  end

  if love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
    left = true
    idle = false
    right = false
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
    right = true 
    left = false
    idle = false
  else
    idle = true 
    left = false
    right = false
  end

  if love.keyboard.isDown('a') then
    attack = true
    idle = false
  end

  attack = false
end

function Player:draw()
  love.graphics.push()
  love.graphics.scale(3, 3)

  if right == true then
    love.graphics.draw(running_image, running_frames[math.floor(running_currentFrame)], self.x, self.y)
  elseif left == true then
    love.graphics.draw(running_image, running_frames[math.floor(running_currentFrame)], self.x+running_frame_width, self.y, 0, -1, 1)
  elseif idle == true then
    love.graphics.draw(idle_image, idle_frames[math.floor(idle_currentFrame)], self.x, self.y)
  elseif attack == true then
    for i = 1, 7, 1 do
      love.graphics.draw(attack_image, attack_frames[i], self.x, self.y)
    end
  end
  love.graphics.pop()
end
