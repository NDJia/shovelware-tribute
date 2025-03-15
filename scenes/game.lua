local scene = {}
local vanishing = {x = width/2, y = 300}

local roadSideRight = math.pi/3.41
local roadSideLeft = math.pi - math.pi/3.41

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
   e:update() 
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
    vanishing.x - 200, vanishing.y,
    vanishing.x + 200, vanishing.y,
    vanishing.x + 800, height,
    vanishing.x - 800, height
  }
  love.graphics.polygon("fill", roadPoints)
  
  love.graphics.pop("all")
end

return scene