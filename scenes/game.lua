local scene = {}

-- define the vanishing point, game objects are defined relative to these coordinates
local vanishing = {x = width/2, y = 300}

-- constant angles; use these angles for objects moving from the right or left
roadSideRight = math.pi/3.41
roadSideLeft = math.pi - math.pi/3.41


-- set speed movement
speed = 3
-- set lines
line_width = 20
line_height = 80
line_space = 80
line_start = vanishing.y - line_height

function scene.load()
local b = Building:new(vanishing.x + 250, vanishing.y, 0, roadSideRight)
local b2 = Building:new(vanishing.x - 350, vanishing.y, 0, math.pi - roadSideRight)
decor = {b, b2}
end

function scene.update(dt)
  for _, thing in pairs(decor) do
   thing:update() 
  end
  
  for _, e in pairs(enemies) do
   e:update() 
  end
  if line_start <= vanishing.y then
    line_start = line_start + speed
  else
    line_start = vanishing.y - line_height
  end
--  b:update()
end

function scene.draw()
  drawBackground()
  --love.graphics.rectangle("fill", 0, 0, 200, 200)
--  b:draw()
  
  for _, thing in pairs(decor) do
   thing:draw() 
  end
  
  for _, e in pairs(enemies) do
   e:draw() 
  end
end


-- utility functions
function drawBackground()
  love.graphics.push("all")
  
  -- sky
  love.graphics.setColor(0.573, 0.914, 0.961, 1)
  love.graphics.rectangle("fill", 0, 0, width, height)
  
  -- ground
  love.graphics.setColor(0.592, 0.859, 0.271, 1)
  love.graphics.rectangle("fill", 0, vanishing.y, width, height)
  
  -- road
  love.graphics.setColor(0.502, 0.322, 0.098, 1)
  local roadPoints = {
    vanishing.x - 350, vanishing.y,
    vanishing.x + 350, vanishing.y,
    vanishing.x + 950, height,
    vanishing.x - 950, height
  }
  love.graphics.polygon("fill", roadPoints)
  -- lines draw the first line if need, then draw the rest
  live.graphics.setcolor(1,1,1,1)
  if line_start <= vanishing.y then
    love.graphics.rectangle("fill", vanishing.x - line_width/2, vanishing.y, line_width, line_height - vanishing.y + line_start)
  end
  repeat
  love.graphics.rectangle("fill", vanishing.x - line_width/2, vanishing.y + line_start, line_width, line_height)
  line_start  = line_start + line_height + line_space
  until line_start >= height
  love.graphics.pop("all")
end

-- input
function love.keypressed(key, scancode, isrepeat)
  if key == "right" and vanishing.x > width/2 - 500 then
    vanishing.x = vanishing.x - 500
    
    for _, thing in pairs(decor) do
     changeCentreX(thing, -500)
    end
    
    for _, e in pairs(enemies) do
     changeCentreX(e, -500)
    end
  elseif key == "left" and vanishing.x < width/2 + 500 then
    vanishing.x = vanishing.x + 500
    
    for _, thing in pairs(decor) do
     changeCentreX(thing, 500)
    end
    
    for _, e in pairs(enemies) do
     changeCentreX(e, 500)
    end
  end
end


return scene