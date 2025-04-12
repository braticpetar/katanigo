BoundedStack = Object:extend()

function BoundedStack:new()
  self.items = {}
  self.max_size = 5
end

function BoundedStack:push(item)
  if #self.items >= self.max_size then
    table.remove(self.items, 1)
  end

 table.insert(self.items, item) 
end

function BoundedStack:pop()
  return table.remove(self.items)
end

function BoundedStack:peek()
  return self.items[#self.items]
end

function BoundedStack:isEmpty()
  return self.items == 0
end

function BoundedStack:size()
  return #self.items
end

function BoundedStack:get(index)
  return self.items[index]
end
