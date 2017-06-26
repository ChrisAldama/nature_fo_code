require "vector"
Car = {}
Car.__index = Car

function Car:new(x, y)
  local instance = {}
  setmetatable(instance, Car)
  instance.position= Vector:new(x, y)
  instance.accel = Vector:new(0, 0)
  instance.vel = Vector:new(0, 0)
  instance.image = love.graphics.newImage("car.png")
  instance.top_speed = 5
  instance.direction = math.random() * 2
  return instance
end

function Car:limit_vel()
  self.vel:limit(self.top_speed)
end

function Car:update_direction()
  x= self.vel.x + self.accel.x
  y= self.vel.y + self.accel.y
  direction = Vector:new(x, y)
  return direction:angle(Vector:new(1, 0))
end

function Car:move()
  self.vel:add(self.accel)
  self:limit_vel()
  self.position:add(self.vel)
  self.position.x = self.position.x % love.graphics.getWidth()
  self.position.y = self.position.y % love.graphics.getHeight()
  self.direction = self:update_direction()
end

function Car:apply_accel(accel_vector)
  accel_vector:sub(self.position)
  accel_vector:normalize()
  accel_vector:mult(0.1)
  self.accel = accel_vector
end

function Car:draw()
  love.graphics.draw(
    self.image,
    self.position.x,
    self.position.y,
    self.direction - 1.5,
    1, 1,
    18, 32)
end
