require "car"

number_of_cars = 20

function random_pos()
  return {
    x= math.random() * love.graphics.getWidth(),
    y= math.random() * love.graphics.getHeight()
  }
end

function get_force_from_mouse(car)
  if love.mouse.isDown(1) then
    car:apply_accel(
      Vector:new(
        love.mouse.getX(),
        love.mouse.getY()))
  end
end

function love.load()
  cars = {}
  for i = 1, number_of_cars do
    pos = random_pos()
    cars[i] = Car:new(pos.x, pos.y)
  end
end

function love.update(dt)
  for i = 1, number_of_cars do
    cars[i]:move()
    get_force_from_mouse(cars[i])
  end
end

function love.draw()
  for i = 1, number_of_cars do
    cars[i]:draw()
  end
end
