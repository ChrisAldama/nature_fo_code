function love.load()
  image = love.graphics.newImage("car.png")
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  car = {
    image= image,
    pos= {x= width/2.0, y= height/2.0},
    vel = {x= 0, y= 0},
    direction= 0,
    accel= 0
  }
end

function vector_add(v1, v2)
  return {x= v1.x + v2.x, y= v1.y + v2.y}
end

function update_direction(angle)
  delta = 0.1
  if love.keyboard.isDown("left") then
    return angle - delta
  elseif love.keyboard.isDown("right") then
    return angle + delta
  end
  return angle
end

function update_accel(accel)
  delta = 0.1
  top_accel = 20
  if love.keyboard.isDown("up") then
    accel = accel + delta
  elseif love.keyboard.isDown("down") then
    accel = accel - delta
  end
  if accel > top_accel then
    accel = top_accel
  elseif accel < -top_accel then
    accel = -top_accel
  end
  return accel
end

function update_vel(car)
  return {
    y= math.sin(car.direction)*car.accel,
    x= math.cos(car.direction)*car.accel
  }
end

function update_pos(car)
  delta = vector_add(car.pos, car.vel)
  return {
    x= delta.x % love.graphics.getWidth(),
    y= delta.y % love.graphics.getHeight()
  }
end

function love.update(dt)
  car.direction = update_direction(car.direction)
  car.accel = update_accel(car.accel)
  car.vel = update_vel(car)
  car.pos = update_pos(car)
end

function love.draw()
  love.graphics.draw(
    car.image,
    car.pos.x,
    car.pos.y,
    car.direction - 1.5,
    1,1,
    18,32)
end
