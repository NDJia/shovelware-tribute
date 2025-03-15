local scene = {}

-- define the vanishing point, game objects are defined relative to these coordinates
local vanishing = {x = width/2, y = 300}

-- constant angles; use these angles for objects moving from the right or left
roadSideRight = math.pi/3.41
roadSideLeft = math.pi - math.pi/3.41


-- set speed movement
speed = 1
-- set lines
line_width = 20
line_height = 80
line_space = 40
line_start = vanishing.y - line_height

function scene.load()
local b = Building:new(vanishing.x + 250, vanishing.y, 0, roadSideRight)
local b2 = Building:new(vanishing.x - 350, vanishing.y, 0, roadSideLeft)
decor = {b, b2}

local obstacle1 = Obstacle:new(vanishing.x + 100, vanishing.y, 0, roadSideRight, 0)
local obstacle2 = Obstacle:new(vanishing.x - 250, vanishing.y, 0, roadSideLeft, 2)
enemies = {obstacle1, obstacle2}
end

function scene.update(dt)
  for i, thing in pairs(decor) do
   thing:update() 
  end
  
  for i, e in pairs(enemies) do
   e:update() -- updates positioning/states of object
   -- check if object is colliding with player:
   -- it is true if object is at or above a certain y position, and it has the same lane as the player
   local _, enemyY = polarToPixel(e.centreX, e.centreY, e.r, e.angle)
   
   if enemyY > 800 and e.lane == player.lane then
     player.health = player.health - 1
     removeObstacle(i)
   end
   
   if enemyY > 1000 then removeObstacle(i) end
   
  end
  if line_start <= vanishing.y + line_space then
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
  
  love.graphics.print(tostring(player.health), 10, 10)
  love.graphics.print(tostring(player.lane), 10, 30)
  
  -- draw truck console
  drawTruckConsole()
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
  love.graphics.setColor(1,1,1,1)

  index = line_start

  if index <= vanishing.y then
    love.graphics.rectangle("fill", vanishing.x - line_width/2, vanishing.y, line_width, line_height - vanishing.y + index)
  elseif index <= vanishing.y + line_space then
    love.graphics.rectangle("fill", vanishing.x - line_width/2, index, line_width, line_height)
  end
  index = index - line_height * 2 - 10

  repeat
    love.graphics.rectangle("fill", vanishing.x - line_width/2, vanishing.y + index, line_width, line_height)
    index  = index + line_height + line_space
  until index >= height
  
  love.graphics.pop("all")
end

-- input
function love.keypressed(key, scancode, isrepeat)
  if key == "right" and vanishing.x > width/2 - 500 then
    vanishing.x = vanishing.x - 500
    player.lane = player.lane + 1
    
    for _, thing in pairs(decor) do
     changeCentreX(thing, -500)
    end
    
    for _, e in pairs(enemies) do
     changeCentreX(e, -500)
    end
  elseif key == "left" and vanishing.x < width/2 + 500 then
    vanishing.x = vanishing.x + 500
    player.lane = player.lane -1
    
    for _, thing in pairs(decor) do
     changeCentreX(thing, 500)
    end
    
    for _, e in pairs(enemies) do
     changeCentreX(e, 500)
    end


  end
end


function drawTruckConsole()
  
end


return scene