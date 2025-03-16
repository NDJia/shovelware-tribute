local scene = {}

function scene.load()
  
end

function scene.update(dt)
  
end

function scene.draw()
  love.graphics.rectangle("fill", 0, 0, width, height)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "return" then
    SSM.remove("credits")
  end
  
  
end



return scene