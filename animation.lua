Animation = Object:extend()

function Animation:new(image, frames_number, fps, flipped, scale)
  self.image = image
  self.frames_number = frames_number
  self.fps = fps 
  self.flipped = flipped
  self.scale = scale
  self.current_frame = 1
  self.frames = self:makeAnimation()
end

function Animation:makeAnimation()
  local frames = {}
  local frame_width = self.image:getWidth() / self.frames_number
  local frame_height = self.image:getHeight()

  for i=0, self.frames_number - 1 do
    table.insert(frames, love.graphics.newQuad(i * frame_width, 0, frame_width, frame_height, self.image:getWidth(), self.image:getHeight()))
  end

  return frames
end

function Animation:update(dt)
  self.current_frame = self.current_frame + self.fps * dt
  if self.current_frame > self.frames_number then
    self.current_frame = 1
  end
end

function Animation:draw(x, y)
  if self.flipped == false then
    love.graphics.draw(self.image, self.frames[math.floor(self.current_frame)], x, y, 0, self.scale, self.scale)
  elseif self.flipped == true then
    love.graphics.draw(self.image, self.frames[math.floor(self.current_frame)], x + self.image:getWidth()/self.frames_number * self.scale, y, 0, self.scale * -1, self.scale * 1)
  end
end
