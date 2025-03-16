local scene = {}
cutsceneTimer = 0

function scene.load()
  video = love.graphics.newVideo("assets/turn.ogv")
  img = nil
  local choose = math.floor(love.math.random(3))
  --local choose = 2
  
  if choose == 1 then img = love.graphics.newImage("assets/truck_amazing.png")
  elseif choose == 2 then img = love.graphics.newImage("assets/truck_fedexcellent.png")
  else img = love.graphics.newImage("assets/truck_urock.png")
  end

  video:play()
end

function scene.update(dt)
  sceneTimer = sceneTimer + dt
  if sceneTimer > 5 then
    SSM.setFrozen("game", false)
  end
  
end

function scene.draw()
  love.graphics.draw(video, 0, 0)
  
  if sceneTimer > 1 then love.graphics.draw(img, 100, 100, 0, 0.7, 0.7) end
end





return scene