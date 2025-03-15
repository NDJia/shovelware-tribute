local scene = {}
local timer = 0

function scene.load()
  video = love.graphics.newVideo("assets/turn.ogv")
  img = nil
  local choose = math.floor(love.math.random(3))
  
  if choose == 1 then img = love.graphics.newImage("assets/truck_amazing.png")
  elseif choose == 2 then img = love.graphics.newImage("assets/truck_fedexcellent.png")
  else img = love.graphics.newImage("assets/truck_urock.png")
  end

  video:play()
end

function scene.update(dt)
  if timer <= 2 then timer = timer + dt end
end

function scene.draw()
  love.graphics.draw(video, 0, 0)
  if timer > 1 then love.graphics.draw(img, 100, 100) end
end




return scene