points = {}
width = love.graphics.getWidth();
height = love.graphics.getHeight();
index = 2
step = 8

function draw_line(p1, p2)
  love.graphics.line(p1.x, p1.y, p2.x, p2.y)
end

function random_walk(prev)
  return prev + random(step * 2) - step
end

function random(max)
  return math.random() * max
end

function random_point()
  return {x = random(width), y = random(height)}
end

function update_walk()
  prev = points[index - 1]
  points[index] = {x = random_walk(prev.x), y = random_walk(prev.y)}
end

function draw_points()
  for i=1, index - 1 do
    draw_line(points[i], points[i+1])
  end
end

function love.draw()
  update_walk()
  draw_points()
  index = index + 1
end

points[1] = random_point()
