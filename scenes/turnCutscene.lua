local scene = {}

function scene.load()
  video = love.graphics.newVideo("assets/turn.ogv")
  img = nil
  local choose = RandomGenerator:random(3)
  
  if choose == 1 then img = love.graphics.newImage("assets/truck_amazing.png")
  elseif choose == 2 then img = love.graphics.newImage("assets/truck_fedexcellent.png")
  else img = love.graphics.newImage("assets/truck_urock.png")
  end

  video:play()
end

function scene.update(dt)
  
end

function scene.draw()
  love.graphics.draw(video, 0, 0)
end




return scene