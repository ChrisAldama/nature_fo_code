Vector = {}
Vector.__index = Vector

function Vector:new(x, y)
  local instance = {}
  setmetatable(instance, Vector)
  instance.x = x
  instance.y = y
  return instance
end

function Vector:add(other)
  self.x = self.x + other.x
  self.y = self.y + other.y
end

function Vector:sub(other)
  self.x = self.x - other.x
  self.y = self.y - other.y
end

function Vector:mult(scalar)
  self.x = self.x * scalar
  self.y = self.y * scalar
end

function Vector:div(scalar)
  self.x = self.x / scalar
  self.y = self.y / scalar
end

function Vector:len()
  return math.sqrt(self.x*self.x + self.y*self.y)
end

function Vector:normalize()
  return self:div(self:len())
end

function Vector:dot(other)
  return self.x*other.x + self.y*other.y
end

function Vector:angle(other)
  cos = self:dot(other)/(self:len()*other:len())
  angle = math.acos(cos)
  if angle ~= angle then
    return 0
  end
  return angle
end

function Vector:limit(limit)
  len = self:len()
  if len > limit then
    ratio = limit/len
    self.x = self.x * ratio
    self.y = self.y * ratio
  end
end
